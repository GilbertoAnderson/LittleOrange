using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Data;
using System.Data.Entity;
using System.Net;
using TheLittleOrangeChannel.Models;
using System.Net.Http;
using TheLittleOrangeChannel.Controllers.Shared;

namespace TheLittleOrangeChannel.Controllers
{
    public class ParcelasController : Controller
    {

        private TheLittleOrangeEntities db = new TheLittleOrangeEntities();

        // GET: Parcelas
        public ActionResult Index(string strCriterio)
        {

            DateTime _dtLimite = DateTime.Now.AddDays(10);

            var tblParcelas = db.tblParcelas.Include(t => t.tblPrestador).Include(t => t.tblAssinaturas).Include(t => t.tblStatus);
            if (!String.IsNullOrEmpty(strCriterio))
            {
                tblParcelas = tblParcelas.Where(h => h.Rastreador.Contains(strCriterio.ToString())
                                            || h.tblPrestador.Empresa.Contains(strCriterio.ToString())
                                            || h.tblStatus.Descricao.Contains(strCriterio.ToString())

                                            );
            }

            ViewBag.FiltroStatus = strCriterio;
            return View(tblParcelas.ToList());

        }

        public ActionResult ParcelasemAberto(string strCriterio)
        {
            // .......... mostra somente as parcelas em aberto para os proximos 10 dias
            // com isto evita de dar baixa em parcelas dos proximos meses

            DateTime _dtLimite = DateTime.Now.AddDays(10);
            tblStatus _tblStatus = db.tblStatus.Where(x => x.Objeto == "PARCELA" && x.Descricao == "ABERTA").FirstOrDefault();

            var tblParcelas = db.tblParcelas.Include(t => t.tblPrestador).Include(t => t.tblAssinaturas).Include(t => t.tblStatus);

            tblParcelas = tblParcelas.Where(h => h.idStatus == _tblStatus.idStatus && h.dataVencimento <= _dtLimite);                           

            if (!String.IsNullOrEmpty(strCriterio))
            {
                tblParcelas = tblParcelas.Where(h=>h.Rastreador.Contains(strCriterio.ToString())
                                              || h.tblPrestador.Empresa.Contains(strCriterio.ToString())
                                            );
            }

            ViewBag.FiltroStatus = strCriterio;
            return View(tblParcelas.ToList());

        }

        public ActionResult BaixaManual(int? id, decimal valor, int operador)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            tblParcelas tblParcela = db.tblParcelas.Find(id);
            if (tblParcela == null)
            {
                return HttpNotFound();
            }
            //.................... valida parcela

            baixaParcela(id, valor, operador);


            return RedirectToAction("Index", new { strCriterio = "ABERTA" });

        }

        private void baixaParcela(int? id, decimal valor, int operador)
        {
            tblUsuario _tblOperador = db.tblUsuario.Where(x => x.idUsuario == operador).FirstOrDefault();
            var _log = _tblOperador.Nome + " - " + DateTime.Now.AddDays(2).ToString();
            //....................... atualiza a Parcela
            tblStatus _tblStatus = db.tblStatus.Where(x => x.Objeto == "PARCELA" && x.Descricao == "PAGA").FirstOrDefault();
            tblParcelas _tblParcela = db.tblParcelas.Find(id);

            _tblParcela.dataPagamento = DateTime.Now;
            _tblParcela.idStatus = _tblStatus.idStatus;
            _tblParcela.valorPago = valor;
            _tblParcela.Log = _tblParcela.Log + "chr(13)" + _log;

            //....................... renova a Assinatura
            tblStatus _tblStatusAssinatura = db.tblStatus.Where(x => x.Objeto == "ASSINATURA" && x.Descricao == "ATIVA").FirstOrDefault();
            tblAssinaturas _tblAssinatura = db.tblAssinaturas.Where(x => x.idAssinatura == _tblParcela.idAssinatura).FirstOrDefault();

            // ............ calcula data de termino
            string plano = _tblAssinatura.Rastreador.Substring(4, 2);
            tblDominios _tblDuracao = db.tblDominios.Where(x => x.Objeto == "PRAZOPLANO" && x.Codigo == plano).FirstOrDefault();
            int qtdeMeses = Int32.Parse(_tblDuracao.Descricao);
            DateTime _novoVencto = (DateTime)_tblAssinatura.dtTermino;
            _novoVencto = _novoVencto.AddMonths(qtdeMeses);

            _tblAssinatura.idStatus = _tblStatusAssinatura.idStatus;
            _tblAssinatura.dtTermino = _novoVencto;
            _tblAssinatura.Log = _tblAssinatura.Log + "chr(13)" + _log + " novo vencto: " + _novoVencto.ToString();



            //....................... atualiza a Abrangencia no Prestador
            tblPrestador _tblPrestador = db.tblPrestador.Where(x =>x.idPrestador == _tblAssinatura.idPrestador).FirstOrDefault();
            tblStatus _tblStatusPrestador = db.tblStatus.Where(x => x.Objeto == "PRESTADOR" && x.Descricao == "ATIVO").FirstOrDefault();

            _tblPrestador.idAbrangencia = _tblAssinatura.idAbrangencia;
            _tblPrestador.idStatus = _tblStatusPrestador.idStatus;

            db.SaveChanges();

            //....................... cria nova parcela
            PrestadoresController _prestadores = new PrestadoresController();
            _prestadores.CriarParcela(_tblAssinatura.idAssinatura);

            //........................ TODO lancamento contas a RECEBER

            //........................ TODO lancamento conta Comissao


        }




    }
}
