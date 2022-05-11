using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TheLittleOrangeChannel.Models;
using System.Net.Http;

namespace TheLittleOrangeChannel.Controllers
{
    public class PrestadoresController : Controller
    {
        private TheLittleOrangeEntities db = new TheLittleOrangeEntities();


        // GET: Prestadores
        public ActionResult Menu()
        {
            return View();
        }

            // GET: Prestadores
        public ActionResult Index()
        {

            var tblStatusGroup = new StatusGroup();

            var tblPrestador = db.tblPrestador.Include(t => t.tblCondominio).Include(t => t.tblStatus);


            var tblPrestadorGroup = tblPrestador.GroupBy(x => x.tblStatus.Descricao).ToList();
            foreach (var group in tblPrestadorGroup)
            { 
            
            
            }
           
            return View(tblPrestador.ToList());
        }




        public class StatusGroup
        {
        
            public string Descricao { get; set; }
            public int qtde { get; set; }

        }





        // GET: Prestadores
        public ActionResult Prestadores(string strCriterio)
        {
            var tblPrestador = db.tblPrestador.Include(t => t.tblCondominio).Include(t => t.tblDominios).Include(t => t.tblUsuario).Include(t => t.tblStatus);
            if (!String.IsNullOrEmpty(strCriterio))
            {
                tblPrestador = tblPrestador.Where(h => h.Cidade.Contains(strCriterio.ToString())
                                            || h.Empresa.Contains(strCriterio.ToString())
                                            || h.UF.Contains(strCriterio.ToString())
                                            || h.tblCondominio.Nome.Contains(strCriterio.ToString())
                                            || h.tblStatus.Descricao.Contains(strCriterio.ToString())
                                            );
            }

            ViewBag.FiltroStatus = strCriterio;
            return View(tblPrestador.ToList());

        }





        // GET: Prestadores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }
            //.................. novos viewsbags

            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;


            //.....................................

            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }





        // GET: Prestadores/Edit/5
        public ActionResult Empresa(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }

            //.................. novos viewsbags

            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;


            //.....................................

            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }


        // GET: Prestadores/Abrangencia/5
        public ActionResult Abrangencia(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }
            //.................. novos viewsbags

            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;
            ViewBag.Cidade = _tblCondominio.Cidade;
            ViewBag.Estado = _tblCondominio.UF;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;

            var _tblAbrangencia = db.tblDominios.Where(x => x.idDominio == tblPrestador.idAbrangencia).FirstOrDefault();
            ViewBag.Abrangencia = _tblAbrangencia.Descricao;
            ViewBag.id = id;         
            
            return View(tblPrestador);
        }




        // GET: Prestadores/Planos/5
        public ActionResult Planos(int? id, string tipoAbrangencia)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }
            //.................. novos viewsbags
            
            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;
            ViewBag.Cidade = _tblCondominio.Cidade;
            ViewBag.Estado = _tblCondominio.UF;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;

            // ............... codigo dos planos
            var _tblPlanoMensal = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == "MENSAL").FirstOrDefault();
            var _tblPlanoAnual = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == "1 ANO").FirstOrDefault();
            var _tblPlano3Anos = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == "3 ANOS").FirstOrDefault();

            var codPlanoMensal = _tblPlanoMensal.Codigo;
            var codPlanoAnual = _tblPlanoAnual.Codigo;
            var codPlano3Anos = _tblPlano3Anos.Codigo;

            var _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == tipoAbrangencia).FirstOrDefault();
            var _tblValorPlano  = db.tblDominios.Where(x => x.Objeto == "VALORPLANO"  && x.Codigo == _tblAbrangencia.Codigo).FirstOrDefault();
            var _tblDescontoAno = db.tblDominios.Where(x => x.Objeto == "DESCONTO" && x.Codigo == codPlanoAnual).FirstOrDefault();
            var _tblDesconto3Ano = db.tblDominios.Where(x => x.Objeto == "DESCONTO" && x.Codigo == codPlano3Anos).FirstOrDefault();
            
            double _vlrPlanoMensal = Convert.ToDouble(_tblValorPlano.Descricao);
            double _percDescontoAno = Convert.ToDouble(_tblDescontoAno.Descricao);
            double _percDesconto3Anos = Convert.ToDouble(_tblDesconto3Ano.Descricao);
            double _vlrPlanoAnual = ((_vlrPlanoMensal * 12) - ((_vlrPlanoMensal * 12) * (_percDescontoAno / 100)));
            double _vlrPlano3Anos = ((_vlrPlanoMensal * 36) - ((_vlrPlanoMensal * 36) * (_percDesconto3Anos / 100)));

            ViewBag.codPlanoMensal = codPlanoMensal;
            ViewBag.codPlanoAnual = codPlanoAnual;
            ViewBag.codPlano3Anos = codPlano3Anos;

            ViewBag.Abrangencia = _tblAbrangencia.Descricao;              
            ViewBag.ValorPlanoMensal = String.Format("{0:C2}", _vlrPlanoMensal);
            ViewBag.ValorPlanoAnual = String.Format("{0:C2}",_vlrPlanoAnual);
            ViewBag.ValorPlano3Anos = String.Format("{0:C2}", _vlrPlano3Anos) ;

            ViewBag.vlPlanoMensal = _vlrPlanoMensal;
            ViewBag.vlPlanoAnual =  _vlrPlanoAnual;
            ViewBag.vlPlano3Anos =  _vlrPlano3Anos;

            ViewBag.id = id;
            var celular = tblPrestador.Celular;
            celular = celular.Replace(" ","");
            celular = celular.Replace("(", "");
            celular = celular.Replace(")", "");
            celular = celular.Replace("-", "");
            ViewBag.Celular = celular;
            ViewBag.Empresa = tblPrestador.Empresa;

            return View(tblPrestador);
        }


        // GET: Prestadores/FormaPagto/5
        public ActionResult FormaPagto(int? id, string tipoAbrangencia, string tipoPlano)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }
            //.................. novos viewsbags

            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;
            ViewBag.Cidade = _tblCondominio.Cidade;
            ViewBag.Estado = _tblCondominio.UF;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;


            var _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == tipoAbrangencia).FirstOrDefault();
            var _tblValorPlano = db.tblDominios.Where(x => x.Objeto == "VALORPLANO" && x.Codigo == _tblAbrangencia.Codigo).FirstOrDefault();

            var _tblPlano = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == tipoPlano).FirstOrDefault();
            var _tblDesconto = db.tblDominios.Where(x => x.Objeto == "DESCONTO" && x.Codigo == _tblPlano.Codigo).FirstOrDefault();

            double _vlrPlanoMensal = Convert.ToDouble(_tblValorPlano.Descricao);
            double _percDesconto = Convert.ToDouble(_tblDesconto.Descricao);
            double _vlrPlano = _vlrPlanoMensal ;
            if (tipoPlano == "1 Ano") {
                _vlrPlano = ((_vlrPlanoMensal * 12) - ((_vlrPlanoMensal * 12) * (_percDesconto / 100)));
            }

            if (tipoPlano == "3 Anos")
            {
                _vlrPlano = ((_vlrPlanoMensal * 36) - ((_vlrPlanoMensal * 36) * (_percDesconto / 100)));
            }

            ViewBag.Abrangencia = _tblAbrangencia.Descricao;
            ViewBag.ValorPlanoMensal = String.Format("{0:C2}", _vlrPlanoMensal);
            ViewBag.ValorPlanoTotal  = String.Format("{0:C2}", _vlrPlano );
            ViewBag.ValorPlano = _vlrPlano;
            ViewBag.id = id;
            ViewBag.Plano = tipoPlano;

            return View(tblPrestador);
        }

        // GET: Prestadores/FormaPagto/5
        public ActionResult Pagamento(int? id, string tipoAbrangencia, string tipoPlano, double valor, string formaPagto)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }


            //.................. atualiza os dados do plano
            var _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == tipoAbrangencia).FirstOrDefault();
            var _tblPlano = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == tipoPlano).FirstOrDefault();
            var _tblFormaPagto = db.tblDominios.Where(x => x.Objeto == "FORMAPAGTO" && x.Descricao == formaPagto).FirstOrDefault();

            tblPrestador.idAbrangencia = _tblAbrangencia.idDominio;
            tblPrestador.idPlano = _tblPlano.idDominio;
            tblPrestador.idFormaPagto = _tblFormaPagto.idDominio;

            //............... todo calcular o proximo vencimento


            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;
            ViewBag.Cidade = _tblCondominio.Cidade;
            ViewBag.Estado = _tblCondominio.UF;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;


            var _tblValorPlano = db.tblDominios.Where(x => x.Objeto == "VALORPLANO" && x.Codigo == _tblAbrangencia.Codigo).FirstOrDefault();

            var _tblDesconto = db.tblDominios.Where(x => x.Objeto == "DESCONTO" && x.Codigo == _tblPlano.Codigo).FirstOrDefault();

            double _vlrPlanoMensal = Convert.ToDouble(_tblValorPlano.Descricao);
            double _percDesconto = Convert.ToDouble(_tblDesconto.Descricao);
            double _vlrPlano = _vlrPlanoMensal;

            if (tipoPlano == "1 Ano")
            {
                _vlrPlano = ((_vlrPlanoMensal * 12) - ((_vlrPlanoMensal * 12) * (_percDesconto / 100)));
            }

            if (tipoPlano == "3 Anos")
            {
                _vlrPlano = ((_vlrPlanoMensal * 36) - ((_vlrPlanoMensal * 36) * (_percDesconto / 100)));
            }

            ViewBag.Abrangencia = _tblAbrangencia.Descricao;
            ViewBag.ValorPlanoMensal = String.Format("{0:C2}", _vlrPlanoMensal);
            ViewBag.ValorPlanoTotal = String.Format("{0:C2}", _vlrPlano);
            ViewBag.id = id;
            ViewBag.Plano = tipoPlano;
            ViewBag.ValorPlano = _vlrPlano;
            ViewBag.formaPagto = formaPagto;

            return View(tblPrestador);
        }




        // GET: Prestadores/FormaPagto/5
        public ActionResult EnvioPagSeguro(int? id, string tipoAbrangencia, string tipoPlano, double valor, string formaPagto)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }

            //.................. envio dos dados para o PagSeguro
            var msg = "";
            var envioPagSeguro = true;
            if (envioPagSeguro)
            {
                //.................. atualiza os dados do plano
                var _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == tipoAbrangencia).FirstOrDefault();
                var _tblPlano = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == tipoPlano).FirstOrDefault();
                var _tblFormaPagto = db.tblDominios.Where(x => x.Objeto == "FORMAPAGTO" && x.Descricao == formaPagto).FirstOrDefault();

                tblPrestador.idAbrangencia = _tblAbrangencia.idDominio;
                tblPrestador.idPlano = _tblPlano.idDominio;
                tblPrestador.idFormaPagto = _tblFormaPagto.idDominio;

                db.SaveChanges();
                msg = "Seu pagamento foi enviado com sucesso!";
            }
            else
            {
                msg = "Ago deu errado no seu pagamento!";

            }


            //............... todo calcular o proximo vencimento
            ViewBag.msg = msg;
            return View(tblPrestador);
        }





        // GET: Prestadores/Edit/5
        public ActionResult Historico(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }

            //.................. novos viewsbags

            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;


            //.....................................

            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }

        // GET: Prestadores/Edit/5
        public ActionResult Parcelas(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestador tblPrestador = db.tblPrestador.Find(id);
            if (tblPrestador == null)
            {
                return HttpNotFound();
            }

            //.................. novos viewsbags

            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestador.idCondominio).FirstOrDefault();
            ViewBag.Condominio = _tblCondominio.Nome;

            var _tblIndicacao = db.tblUsuario.Where(x => x.idUsuario == tblPrestador.idCanal).FirstOrDefault();
            ViewBag.IndicadoPor = _tblIndicacao.Nome;


            //.....................................

            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }












        //POST: Prestadores/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar.
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPrestador,idCondominio,idCanal,idAbrangencia,Empresa,Endereco,Complemento,Bairro,Cidade,UF,Pais,CEP,CodigoIBGE,Email,Celular,CPF_CNPJ,Fone,Latitude,Longitude,QtdeAvaliacao,NotaAvaliacao,idStatus,Numero")] tblPrestador tblPrestador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestador).State = (System.Data.Entity.EntityState)System.Data.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }

        //POST: Prestadores/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar.
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Empresa([Bind(Include = "idPrestador,idCondominio,idCanal,idAbrangencia,Empresa,Endereco,Complemento,Bairro,Cidade,UF,Pais,CEP,CodigoIBGE,Email,Celular,CPF_CNPJ,Fone,Latitude,Longitude,QtdeAvaliacao,NotaAvaliacao,idStatus,Numero")] tblPrestador tblPrestador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestador).State = (System.Data.Entity.EntityState)System.Data.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }


        //POST: Prestadores/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar.
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Planos([Bind(Include = "idPrestador,idCondominio,idCanal,idAbrangencia,Empresa,Endereco,Complemento,Bairro,Cidade,UF,Pais,CEP,CodigoIBGE,Email,Celular,CPF_CNPJ,Fone,Latitude,Longitude,QtdeAvaliacao,NotaAvaliacao,idStatus,Numero")] tblPrestador tblPrestador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestador).State = (System.Data.Entity.EntityState)System.Data.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }


        //POST: Prestadores/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar.
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Historico([Bind(Include = "idPrestador,idCondominio,idCanal,idAbrangencia,Empresa,Endereco,Complemento,Bairro,Cidade,UF,Pais,CEP,CodigoIBGE,Email,Celular,CPF_CNPJ,Fone,Latitude,Longitude,QtdeAvaliacao,NotaAvaliacao,idStatus,Numero")] tblPrestador tblPrestador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestador).State = (System.Data.Entity.EntityState)System.Data.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }


        //POST: Prestadores/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar.
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Parcelas([Bind(Include = "idPrestador,idCondominio,idCanal,idAbrangencia,Empresa,Endereco,Complemento,Bairro,Cidade,UF,Pais,CEP,CodigoIBGE,Email,Celular,CPF_CNPJ,Fone,Latitude,Longitude,QtdeAvaliacao,NotaAvaliacao,idStatus,Numero")] tblPrestador tblPrestador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestador).State = (System.Data.Entity.EntityState)System.Data.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestador.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestador.idStatus);
            return View(tblPrestador);
        }




        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }




        public ActionResult EnviaMsgTrafego()
        {
            var msg_result = "Foram enviadas {1} mensagens com sucesso!";
            //................. busca status Trafego
            var _tblTrafegoStatus = db.tblStatus.Where(x => x.Objeto == "PRESTADOR" && x.Descricao == "Trafego").FirstOrDefault();
            var _tblProspectadoStatus = db.tblStatus.Where(x => x.Objeto == "PRESTADOR" && x.Descricao == "Prospectado").FirstOrDefault();

            //................. busca valor do plano
            var _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == "CIDADE").FirstOrDefault();
            var _tblValorPlano = db.tblDominios.Where(x => x.Objeto == "VALORPLANO" && x.Codigo == _tblAbrangencia.Codigo).FirstOrDefault();

            //................. seleciona os prestadores novos com status Trafego
            var _tblPrestador = db.tblPrestador.Include(t => t.tblCondominio).Include(t => t.tblDominios).Include(t => t.tblUsuario).Include(t => t.tblStatus);
            _tblPrestador = _tblPrestador.Where(x => x.idStatus == _tblTrafegoStatus.idStatus);

            foreach (var _prestador in _tblPrestador)
            {
                string _celular = _prestador.Celular;
                string _empresa = _prestador.Empresa;
                string _condominio = _prestador.tblCondominio.Nome;
                string _cidade = _prestador.tblCondominio.Cidade;
                string _valorPlano = _tblValorPlano.Descricao;

                string _msg = "Olá " + _empresa + "/n";
                _msg = _msg + _empresa + " foi cadastrado em The Little Orange,/n";
                _msg = _msg + " pelo(a), " + " do " + _condominio + "/n";
                _msg = _msg + "da cidade de " + _cidade + "/n/n";
                _msg = _msg + "Trabalhamos com a divulgação de prestadores de serviços. /n";
                _msg = _msg + "Conheça nossos planos e aumentar sua lista de clientes /n";
                _msg = _msg + "Com R$" + _valorPlano + " por mês, sua empresa será vista na cidade toda /n";


                _celular = "55" + _celular.Replace(" ", "");
                string url = "https://api.whatsapp.com/send?phone={0}&text={1}&lang=pt_br";
                url = String.Format(url, _celular, _msg);

                //............................. envia a msg
                //EnviaWhatsApp(_celular, _msg, _empresa);

                //............................. altera o status para Prospectado
                _prestador.idStatus = _tblProspectadoStatus.idStatus;
               // db.SaveChanges();
            }

            ViewBag.msg = msg_result;

            return View();

        }



        public ActionResult AtualizaStatus(int idPrestador,  string Status)
        {
            tblStatus _tblStatus = db.tblStatus.Where(x=>x.Objeto== "PRESTADOR" && x.Descricao == Status).FirstOrDefault();
            tblPrestador _tblPrestador = db.tblPrestador.Where(x=>x.idPrestador == idPrestador).FirstOrDefault();

            _tblPrestador.idStatus = _tblStatus.idStatus;
            db.SaveChanges();
            //return RedirectToAction("Menu","Prestadores") ;

            return View();
        }






        //public ActionResult CriarAssinatura(int idPrestador, string abrangencia, string plano, decimal valor, string rastreador, int canal)
        public ActionResult CriarAssinatura(int idPrestador, string abrangencia, string plano, decimal valor, string rastreador, int canal)
        {
            tblPrestador _tblPrestador = db.tblPrestador.Where(x => x.idPrestador == idPrestador).FirstOrDefault();

            //............................. cria assinatura se não houver
            tblAssinaturas _tblAssinaturafind = db.tblAssinaturas.Where(x => x.idPrestador == idPrestador && x.Rastreador == rastreador).FirstOrDefault();
            tblStatus _tblStatusAssinatura = db.tblStatus.Where(x => x.Objeto == "ASSINATURA" && x.Descricao == "EM NEGOCIACAO").FirstOrDefault();
            tblDominios _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == abrangencia).FirstOrDefault();
            tblDominios _tblPlano = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == plano).FirstOrDefault();


            if (_tblAssinaturafind == null)
            {

                string _dia = DateTime.Now.AddDays(2).ToString("dd");
                //'string _ano = DateTime.Now.AddDays(2).ToString("AA");
                //'string _prestador = idPrestador.ToString("000000");
                //'string _Plano = _tblPlano.Codigo;
                //'string _codAssinatura = _ano + _prestador + _Plano + _dia;

                tblAssinaturas _tblAssinatura = new tblAssinaturas();
                _tblAssinatura.idPrestador = idPrestador;
                _tblAssinatura.idCanal = canal;
                _tblAssinatura.idAbrangencia = _tblAbrangencia.idDominio;
                _tblAssinatura.idStatus = _tblStatusAssinatura.idStatus;
                _tblAssinatura.Rastreador = rastreador;
                _tblAssinatura.dtInicio = DateTime.Now;
                _tblAssinatura.dtTermino = (DateTime.Now).AddDays(2);
                _tblAssinatura.ValorContrato = valor;
                _tblAssinatura.DiaPagamento = Int32.Parse(_dia);
                _tblAssinatura.Log = "Criado pelo aplicativo Canal";

                db.tblAssinaturas.Add(_tblAssinatura);
                db.SaveChanges();
            }
            else
            {
                //.................. se for renovacao atuala os dados
                string _log = _tblAssinaturafind.Log;
                _log = _log + " /n /n Atualizado em " + DateTime.Now.ToString("dd/MM/AAAA") + " por " + canal.ToString() + " Valores Anteriores";
                _log = _log + "idCanal = " + _tblAssinaturafind.idCanal.ToString();
                _log = _log + "idAbrangencia = " + _tblAssinaturafind.idAbrangencia.ToString();
                _log = _log + "idStatus = " + _tblAssinaturafind.idStatus.ToString();
                _log = _log + "dtInicio = " + _tblAssinaturafind.dtInicio.ToString();
                _log = _log + "dtTermino = " + _tblAssinaturafind.dtTermino.ToString();
                _log = _log + "ValorContrato = " + _tblAssinaturafind.ValorContrato.ToString();
                _log = _log + "DiaPagamento = " + _tblAssinaturafind.DiaPagamento.ToString();
                _tblAssinaturafind.idCanal = canal;
                _tblAssinaturafind.idAbrangencia = _tblAbrangencia.idDominio;
                _tblAssinaturafind.idStatus = _tblStatusAssinatura.idStatus;
                _tblAssinaturafind.dtInicio = DateTime.Now;
                _tblAssinaturafind.dtTermino = (DateTime.Now).AddDays(2);
                _tblAssinaturafind.ValorContrato = valor;
                _tblAssinaturafind.Log = _log;
                db.SaveChanges();


            }

            tblAssinaturas _tblAssinaturaLast = db.tblAssinaturas.Where(x => x.idPrestador == idPrestador).FirstOrDefault();

            // ............................. cria a parcela
            CriarParcela(_tblAssinaturaLast.idAssinatura);

            //.............................. cria a cota do canal


            // ............................. atualiza o status 
            tblStatus _tblStatus = db.tblStatus.Where(x => x.Objeto == "PRESTADOR" && x.Descricao == "Pagamento").FirstOrDefault();
            _tblPrestador.idStatus = _tblStatus.idStatus;
            db.SaveChanges();

            return View();

        }



        public void CriarParcela(int _idAssinatura)
        {

            tblStatus _tblStatus = db.tblStatus.Where(x => x.Objeto == "PARCELA" && x.Descricao == "ABERTA").FirstOrDefault();
            tblAssinaturas _tblAssinatura = db.tblAssinaturas.Where(x => x.idAssinatura == _idAssinatura).FirstOrDefault();
            tblParcelas _tblParcelaFind = db.tblParcelas.Where(x => x.idAssinatura == _idAssinatura && x.idStatus == _tblStatus.idStatus).FirstOrDefault();

            //.................................... somente cria uma nova se não existir nenhum em aberto
            if (_tblParcelaFind == null)
            {
                tblParcelas _tblParcela = new tblParcelas();
                _tblParcela.idAssinatura = _tblAssinatura.idAssinatura;
                _tblParcela.idPrestador = _tblAssinatura.idPrestador;
                _tblParcela.dataVencimento = (DateTime)_tblAssinatura.dtTermino;
                decimal? valorContrato = _tblAssinatura.ValorContrato;
                _tblParcela.valorDevido = (decimal)valorContrato;
                _tblParcela.Rastreador = _tblAssinatura.Rastreador;
                _tblParcela.idStatus = _tblStatus.idStatus;

                db.tblParcelas.Add(_tblParcela);
                db.SaveChanges();
            }

        }

        //private static AsyncController EnviaWhatsApp(string to, string msg, string empresa)        
        //{
        //    to = "55" + to.Replace(" ", "");
        //    string url = "https://api.whatsapp.com/send?phone={0}&text={1}&lang=pt_br";
        //    url = String.Format(url, to, msg);

        //    var httpClient = new HttpClient();
        //    var htm = await httpClient.GetStringAsync(url);

        //}

        //static void EnviaWhatsApp(string to, string msg, string empresa)
        //{
        //    to = "55" + to.Replace(" ", "");
        //    string url = "https://api.whatsapp.com/send?phone={0}&text={1}&lang=pt_br";
        //    url = String.Format(url, to, msg);


        //    try
        //    {
        //        System.Diagnostics.Process.Start(url);
        //    }
        //    catch (System.ComponentModel.Win32Exception noBrowser)
        //    {
        //        if (noBrowser.ErrorCode == -2147467259)
        //            Console.WriteLine(noBrowser.Message);
        //    }
        //    catch (System.Exception other)
        //    {
        //        Console.WriteLine(other.Message);
        //    }


        //}

        //  private static void EnviaWhatsApp()
        //    public ActionResult EnviaWhatsApp2()
        //{

        //     //https://api.whatsapp.com/send?phone={SE_NUMERO_CELULAR}&text=SUA MENSAGEM&lang=pt_br ,

        //    string nickname = "Test";
        //    string sender = "551191141115";
        //    //My Phone Number tryed with 049xxxxxxxxxxxx, 0049xxxxxxxxxxxxxx, 49xxxxxxxxxxxxxxx, xxxxxxxxxxxxxx
        //    string imei = "867325042898455";//My IMEI 
        //    WhatsApp me = new WhatsApp(sender, imei, nickname, true);
        //    me.Connect();
        //    //me.Login(null);
        //    Console.WriteLine(me.ConnectionStatus);// I get a Connection!
        //    Console.ReadLine();
        //    me.SendMessage("5511982581115", "This is a Test!");// Send Message
        //                                                       //No Message received :(
        //    me.Disconnect();
        //    Console.WriteLine(me.ConnectionStatus);
        //    Console.ReadLine();

        //    WhatsApp wa = new WhatsApp("551191141115", "G1b4@dbrasil01", "pankaj", false, false);
        //    wa.OnConnectSuccess += () =>
        //    {
        //        Console.WriteLine("connect");
        //        wa.OnLoginSuccess += (phno, data) =>
        //        {
        //            wa.SendMessage("5511982581115", "msg deu certo");
        //        };

        //        wa.OnLoginFailed += (data) =>
        //        {
        //            Console.WriteLine("login failed" + data);
        //        };
        //        wa.Login();
        //    };
        //    wa.OnConnectFailed += (ex) =>
        //    {
        //        Console.WriteLine("connection failed");
        //    };


        //    ViewBag.msg = "";
        //    return View();

        //}

    }
}
