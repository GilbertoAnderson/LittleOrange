using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TheLittleOrangeChannel.Models;
using TheLittleOrangeChannel.Controllers.Shared;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;

//using EntityState = System.Data.EntityState;
//using System.Data.EntityState
//using Microsoft.EntityFrameworkCore

namespace TheLittleOrangeChannel.Controllers
{
    public class PrestadoresBaseController : Controller
    {
        private TheLittleOrangeEntities db = new TheLittleOrangeEntities();

        // GET: PrestadoresBase
        public ActionResult Index(string strCriterio, string strStatus)
        {
            var tblPrestadorBase = db.tblPrestadorBase.Include(t => t.tblCondominio).Include(t => t.tblEspecialidade).Include(t => t.tblUsuario).Include(t => t.tblStatus);
            if (!String.IsNullOrEmpty(strCriterio))
            {
                tblPrestadorBase = tblPrestadorBase.Where(h => h.Empresa.Contains(strCriterio.ToString())
                                            || h.Celular.Contains(strCriterio.ToString())
                                            || h.tblStatus.Descricao.Contains(strCriterio.ToString())
                                            || h.tblEspecialidade.Descricao.Contains(strCriterio.ToString())

                                            );
            }

            if (strStatus == null || strStatus == "") 
            {
                strStatus = "Cadastrado";
            }
            ViewBag.TipoPesquisado = strStatus;
            var _Status = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == strStatus).FirstOrDefault();
            tblPrestadorBase = tblPrestadorBase.Where(h => h.idCanal == SessionProfile.idUsuario
                                                     && h.idStatus == _Status.idStatus
            );

            return View(tblPrestadorBase.ToList());

        }





        // GET: PrestadoresBase/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestadorBase tblPrestadorBase = db.tblPrestadorBase.Find(id);
            if (tblPrestadorBase == null)
            {
                return HttpNotFound();
            }
            return View(tblPrestadorBase);
        }

        // GET: PrestadoresBase/Create
        public ActionResult Create()
        {

            var _StatusCondominio = db.tblStatus.Where(x => x.Objeto == "CONDOMINIO" && x.Descricao == "ATIVO").FirstOrDefault();
            var _StatusEspecialidade = db.tblStatus.Where(x => x.Objeto == "ESPECIALIDADE" && x.Descricao == "ATIVO").FirstOrDefault();

            var _StatusPrestador= db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Cadastrado").FirstOrDefault();
            var _Condominios = db.tblCondominio.Where(x => x.idStatus == _StatusCondominio.idStatus);
            var _Especialidade = db.tblEspecialidade.Where(x => x.idStatus == _StatusEspecialidade.idStatus).OrderBy(x=>x.Descricao);

            ViewBag.idEspecialidade = new SelectList(_Especialidade, "idEspecialidade", "Descricao");
            ViewBag.idCondominio = new SelectList(_Condominios, "idCondominio", "Nome");
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", SessionProfile.idUsuario); 

            //ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome");
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto");
            ViewBag.idPlano = new SelectList(db.tblDominios, "idDominio", "Objeto");
            ViewBag.idFormaPagto = new SelectList(db.tblDominios, "idDominio", "Objeto");
            ViewBag.idAbrangencia= new SelectList(db.tblDominios, "idDominio", "Descricao");


            //ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestador.idAbrangencia);
            //ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestador.idCanal);
            //ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", _StatusPrestador.idStatus);
            //ViewBag.idStatus =  _StatusPrestador.idStatus;


            return View();
        }

       



        // POST: PrestadoresBase/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idEspecialidade,idStatus,dtCriacao,idPlano,idAbrangencia,diasPromocao,idFormaPagto")] tblPrestadorBase tblPrestadorBase)
        {
            tblPrestadorBase.diasPromocao = 0;
            tblPrestadorBase.dtCriacao = DateTime.Now;

            var celular = tblPrestadorBase.Celular;
            celular = celular.Replace(" ", "");
            celular = celular.Replace("(", "");
            celular = celular.Replace(")", "");
            celular = celular.Replace("-", "");
            celular = celular.Replace("/", "");
            tblPrestadorBase.Celular = celular;

            var _StatusCadastrado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Cadastrado").FirstOrDefault();
            var _Plano = db.tblDominios.Where(x => x.Objeto == "PLANO" && x.Descricao == "NOVO").FirstOrDefault();
            var _FormaPagto = db.tblDominios.Where(x => x.Objeto == "FORMAPAGTO" && x.Descricao == "NOVO").FirstOrDefault();
            var _Abrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == "CONDOMINIO").FirstOrDefault();

            tblPrestadorBase.idCanal = SessionProfile.idUsuario;
            tblPrestadorBase.idStatus = _StatusCadastrado.idStatus;
            tblPrestadorBase.idPlano = _Plano.idDominio;
            tblPrestadorBase.idAbrangencia = _Abrangencia.idDominio;
            tblPrestadorBase.idFormaPagto = _FormaPagto.idDominio;

            if (ModelState.IsValid)
            {
                db.tblPrestadorBase.Add(tblPrestadorBase);
                db.SaveChanges();
                int _prestador = tblPrestadorBase.idPrestador;

                return RedirectToAction("Edit", new { id = _prestador });
            }

            return RedirectToAction("Index");
            //var _Abrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA");

            //ViewBag.idAbrangencia = new SelectList(_Abrangencia, "idDominio", "Descricao");
            //ViewBag.idEspecialidade = new SelectList(db.tblEspecialidade, "idEspecialidade", "Descricao");
            //ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
            //ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            //ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);
            //return View(tblPrestadorBase);
        }


        // POST: tblPrestadorBases/Create
        // Para se proteger de mais ataques, habilite as propriedades específicas às quais você quer se associar. Para 
        // obter mais detalhes, veja https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult xCreate([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idEspecialidade,idStatus,dtCriacao,idPlano,idAbrangencia,diasPromocao,idFormaPagto")] tblPrestadorBase tblPrestadorBase)
        {
            if (ModelState.IsValid)
            {
                db.tblPrestadorBase.Add(tblPrestadorBase);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestadorBase.idAbrangencia);
            ViewBag.idFormaPagto = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestadorBase.idFormaPagto);
            ViewBag.idPlano = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestadorBase.idPlano);
            ViewBag.idEspecialidade = new SelectList(db.tblEspecialidade, "idEspecialidade", "Area", tblPrestadorBase.idEspecialidade);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);
            return View(tblPrestadorBase);
        }


        // GET: PrestadoresBase/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestadorBase tblPrestadorBase = db.tblPrestadorBase.Find(id);
            if (tblPrestadorBase == null)
            {
                return HttpNotFound();
            }

            var _StatusCadastrado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Cadastrado").FirstOrDefault();
            var _StatusIndicado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Indicado").FirstOrDefault();
            
            var _tblespecialidade = db.tblEspecialidade.Where(x => x.idEspecialidade == tblPrestadorBase.idEspecialidade).FirstOrDefault();
            var _tblCondominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestadorBase.idCondominio).FirstOrDefault();

            var _Abrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA");
            ViewBag.StatusCadastrado = _StatusCadastrado.idStatus;
            ViewBag.StatusIndicado = _StatusIndicado.idStatus;
            ViewBag.StatusAtual = tblPrestadorBase.idStatus;
            ViewBag.idAbrangencia = new SelectList(_Abrangencia, "idDominio", "Descricao", tblPrestadorBase.idAbrangencia);
            ViewBag.idEspecialidade = new SelectList(db.tblEspecialidade, "idEspecialidade", "Descricao", tblPrestadorBase.idEspecialidade);
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);

            //................................. define link e texto
            ViewBag.idEspecialidade = new SelectList(db.tblEspecialidade, "idEspecialidade", "Descricao", tblPrestadorBase.idEspecialidade);
            ViewBag.Celular = tblPrestadorBase.Celular;
            ViewBag.Empresa = tblPrestadorBase.Empresa;
            ViewBag.Condominio = _tblCondominio.Nome;
            ViewBag.Especialidade = _tblespecialidade.Descricao;
            ViewBag.Email = tblPrestadorBase.Email;
            ViewBag.id = tblPrestadorBase.idPrestador;


            var celular = tblPrestadorBase.Celular;
            celular = celular.Replace(" ", "");
            celular = celular.Replace("(", "");
            celular = celular.Replace(")", "");
            celular = celular.Replace("-", "");
            celular = celular.Replace("/", "");
            ViewBag.ShortCelular = celular;

            ViewBag.link = "https://api.whatsapp.com/send?phone=55" + tblPrestadorBase.Celular.Replace(" ","") + "&text=Olá " + tblPrestadorBase.Empresa + ",";

            string msg = "";

            msg = msg + "você foi indicado como prestador de serviços no grupo de Whatsapp do condominio <b>" + _tblCondominio.Nome + "</b>. \r\n\r\n";
            msg = msg + "Criamos uma plataforma onde os moradores podem pesquisar por prestadores de serviços indicados por outros moradores, ele se chama The Little Orange!\r\n";
            msg = msg + "Como você foi indicado no grupo, gostaríamos de saber se você quer ser cadastrado gratuitamente no nosso aplicativo,\r\n";
            msg = msg + "desta forma você poderá ser encontrado por todos os moradores deste condomínio sem custo algum.\r\n\r\n";
            msg = msg + "Preencha os dados que faltam, ou altere a informação que está errada e faremos seu cadastro.\r\n\r\n";
            msg = msg + "Em breve você receberá um e-mail e poderá acessar o nosso aplicativo\r\n\r\n";
            msg = msg + "- - - - - - - - - - - - - - - - -\r\n";
            msg = msg + "P R E S T A D O R\r\n";
            msg = msg + "- - - - - - - - - - - - - - - - -\r\n";
            msg = msg + "Condomínio: " + _tblCondominio.Nome + "\r\n";
            msg = msg + "Empresa: " + tblPrestadorBase.Empresa + "\r\n";
            msg = msg + "Especialidade: " + _tblespecialidade.Descricao + "\r\n";
            msg = msg + "Celular: " + tblPrestadorBase.Celular + "\r\n";
            msg = msg + "E-mail: " + tblPrestadorBase.Email + "\r\n";
            msg = msg + "CPF/CNPJ:   \r\n\r\n ";
            msg = msg + "https://thelittleorange.app";

            ViewBag.texto = msg;

            return View(tblPrestadorBase);
        }




        // POST: PrestadoresBase/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idEspecialidade,idStatus,dtCriacao,idPlano,idAbrangencia,diasPromocao,idFormaPagto")] tblPrestadorBase tblPrestadorBase)
        {
            tblPrestadorBase.dtCriacao = DateTime.Now;
            string cpfCnpj = tblPrestadorBase.CPF_CNPJ;

            if (cpfCnpj != "" && cpfCnpj != null) 
            {
                cpfCnpj = cpfCnpj.Replace(" ", "");
                cpfCnpj = cpfCnpj.Replace("(", "");
                cpfCnpj = cpfCnpj.Replace(")", "");
                cpfCnpj = cpfCnpj.Replace("-", "");
                cpfCnpj = cpfCnpj.Replace(".", "");
                cpfCnpj = cpfCnpj.Replace("/", "");

            }
            tblPrestadorBase.CPF_CNPJ = cpfCnpj;


            if (ModelState.IsValid)
            {
                db.Entry(tblPrestadorBase).State = EntityState.Modified;        


                db.SaveChanges();

                //.......................................... valida email e celular antes de efetivar prestador
                string preenchido_cpf = "não";
                string preenchido_email = "não";

                if (tblPrestadorBase.CPF_CNPJ != "" && tblPrestadorBase.CPF_CNPJ != null)
                {
                    if (Helper.IsValid(cpfCnpj))
                    {
                        preenchido_cpf = "sim";
                    }
                }

                if (tblPrestadorBase.Email != "" && tblPrestadorBase.Email !=  null)
                {
                    tblPrestadorBase.Email = tblPrestadorBase.Email.Trim();

                    if (Helper.IsValidEmail(tblPrestadorBase.Email))
                    {
                        preenchido_email = "sim";
                    }
                }

                //............................................................grava o prestador na tabela oficial
                if (preenchido_email == "sim" & preenchido_cpf == "sim")
                {
                    var _tblTrafegoStatus = db.tblStatus.Where(x => x.Objeto == "PRESTADOR" && x.Descricao == "Prospectado").FirstOrDefault();
                    var _tblStatusAtivo = db.tblStatus.Where(x => x.Objeto == "PRESTADOR" && x.Descricao == "ATIVO").FirstOrDefault();
                    var _tblAbrangencia = db.tblDominios.Where(x => x.Objeto == "ABRANGENCIA" && x.Descricao == "CONDOMINIO").FirstOrDefault();

                    tblPrestador novoPrestador = new tblPrestador();
                    novoPrestador.idCondominio = tblPrestadorBase.idCondominio;
                    novoPrestador.idCanal = tblPrestadorBase.idCanal;
                    novoPrestador.Empresa = tblPrestadorBase.Empresa;
                    novoPrestador.Email = tblPrestadorBase.Email;
                    novoPrestador.Celular = tblPrestadorBase.Celular;
                    novoPrestador.CPF_CNPJ = cpfCnpj;
                    novoPrestador.idStatus = _tblTrafegoStatus.idStatus;
                    novoPrestador.idAbrangencia = tblPrestadorBase.idAbrangencia;
                    novoPrestador.idFormaPagto = tblPrestadorBase.idFormaPagto;
                    novoPrestador.idPlano = tblPrestadorBase.idPlano;
                    // novoPrestador.idUsuario = tblPrestadorBase.idCanal;

                    // .........quando o prestador recebe periodo gratuito de abrangencia
                    if (tblPrestadorBase.idAbrangencia != _tblAbrangencia.idDominio)
                    {
                        novoPrestador.idStatus = _tblStatusAtivo.idStatus;
                    }

                    //......... valores default
                    int idEspecialidade = tblPrestadorBase.idEspecialidade;


                    // ................................................grava na tblPrestador
                    var _apiGravaPrestador = PostGravaPrestador(novoPrestador); 
                    int _idPrestador = _apiGravaPrestador.Result.idPrestador;
                    int _idMorador = Convert.ToInt32(_apiGravaPrestador.Result.idUsuario);


                    //................................................. grava o ibge e o estado do condominio no prestador
                    var _condominio = db.tblCondominio.Where(x => x.idCondominio == tblPrestadorBase.idCondominio).FirstOrDefault();
                    tblPrestador _prestador = db.tblPrestador.Where(x => x.idPrestador == _idPrestador).FirstOrDefault();
                    _prestador.CodigoIBGE = _condominio.CodigoIBGE;
                    _prestador.UF = _condominio.UF;
                    db.SaveChanges();



                    //............................. grava a especialidade do prestador
                    var _tblEspecialidadeStatus = db.tblStatus.Where(x => x.Objeto == "PRESTADOR_ESPECIALIDADE" && x.Descricao == "ATIVO").FirstOrDefault();

                    tblPrestadorEspecialidade novoPrestadorEspecialidade = new tblPrestadorEspecialidade();
                    novoPrestadorEspecialidade.idPrestador = _idPrestador;
                    novoPrestadorEspecialidade.idEspecialidade = idEspecialidade;
                    novoPrestadorEspecialidade.idStatus  = _tblEspecialidadeStatus.idStatus;
                    novoPrestadorEspecialidade.dtValidade = (DateTime.Now).AddDays(365);

                    var _apiGravaPrestadorEspecialidade = PostGravaPrestadorEspecialidade(novoPrestadorEspecialidade);

                    //............................ cria usuariocondominio
                    var _tblUsuarioCondominioStatus = db.tblStatus.Where(x => x.Objeto == "USUARIO_CONDOMINIO" && x.Descricao == "ATIVO").FirstOrDefault();

                    var _tblUsuarioCondominioCheck = db.tblUsuarioCondominio.Where(x => x.idCondominio == tblPrestadorBase.idCondominio && x.idUsuario == _idMorador).FirstOrDefault();
                    if(_tblUsuarioCondominioCheck == null) { 
                        tblUsuarioCondominio _tblUsuarioCondominio = new tblUsuarioCondominio();
                        _tblUsuarioCondominio.idCondominio = tblPrestadorBase.idCondominio;
                        _tblUsuarioCondominio.idUsuario = _idMorador;
                        _tblUsuarioCondominio.idStatus = _tblUsuarioCondominioStatus.idStatus;
                        db.tblUsuarioCondominio.Add(_tblUsuarioCondominio);
                        db.SaveChanges();
                    }
                    // ............................... altera o status para 
                    var _StatusEnviado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Enviado").FirstOrDefault();
                    tblPrestadorBase.idStatus = _StatusEnviado.idStatus;
                    db.SaveChanges();

                    //.............................. se abrangencia diferente de Condominio criar uma assinatura
                    if (tblPrestadorBase.idAbrangencia != _tblAbrangencia.idDominio) 
                    {

                        string _dia = DateTime.Now.AddDays(2).ToString("dd");
                        double qtdeDias = Convert.ToDouble(tblPrestadorBase.diasPromocao);
                        var _tblAssinaturaStatus = db.tblStatus.Where(x => x.Objeto == "ASSINATURA" && x.Descricao == "ATIVA").FirstOrDefault();

                        tblAssinaturas _tblAssinaturas = new tblAssinaturas();
                        _tblAssinaturas.idPrestador = _idPrestador;
                        _tblAssinaturas.idCanal = tblPrestadorBase.idCanal;
                        _tblAssinaturas.idAbrangencia = tblPrestadorBase.idAbrangencia;
                        _tblAssinaturas.idStatus = _tblAssinaturaStatus.idStatus;
                        _tblAssinaturas.Rastreador = "PROMOCAO";
                        _tblAssinaturas.dtInicio = DateTime.Now;
                        _tblAssinaturas.dtTermino = (DateTime.Now).AddDays(qtdeDias);
                        _tblAssinaturas.DiaPagamento = Int32.Parse(_dia);
                        _tblAssinaturas.ValorContrato = 0;
                        _tblAssinaturas.Log = "PROMOCAO NOVO CADASTRO PELO CANAL";
                        db.tblAssinaturas.Add(_tblAssinaturas);
                        db.SaveChanges();


                    }

                    return RedirectToAction("Index");
                }
                

            }


            //ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
            //ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            //ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);

            //var _StatusIndicado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Indicado").FirstOrDefault();
            //tblPrestadorBase.idStatus = _StatusIndicado.idStatus;
            //db.SaveChanges();

            return RedirectToAction("Index");
            //return RedirectToAction("Edit", tblPrestadorBase.idPrestador);
            //return View(tblPrestadorBase);

        }



        public ActionResult Indicadox(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestadorBase tblPrestadorBase = db.tblPrestadorBase.Find(id);
            if (tblPrestadorBase == null)
            {
                return HttpNotFound();
            }

            var _StatusIndicado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Indicado").FirstOrDefault();

            if (ModelState.IsValid)
            {
                tblPrestadorBase.idStatus = _StatusIndicado.idStatus;
                db.Entry(tblPrestadorBase).State = EntityState.Modified;
                var num = db.SaveChanges();
                return RedirectToAction("Index");
            }
          
            return RedirectToAction("Edit", tblPrestadorBase.idPrestador);
        }

        public ActionResult Indicado(int id)
        {

            tblPrestadorBase tblPrestadorBase = db.tblPrestadorBase.Find(id);

            db.Entry(tblPrestadorBase).State = EntityState.Modified;
            //----------------------------------- atualiza o status da solicitação
            var _StatusIndicado = db.tblStatus.Where(x => x.Objeto == "PRESTADORBASE" && x.Descricao == "Indicado").FirstOrDefault();
            tblPrestadorBase.idStatus = _StatusIndicado.idStatus;
            db.SaveChanges();

            return RedirectToAction("Index");

        }



        public static async Task<tblPrestador> PostGravaPrestador(tblPrestador novoPrestador)
        {

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://api.thelittleorange.app/");
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", SessionProfile.token);
                var postTask = client.PostAsJsonAsync<tblPrestador>("api/prestador/CriarOutroPrestador/", novoPrestador);
                postTask.Wait();
                var result = postTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    string responseBody = await result.Content.ReadAsStringAsync();
                    return JsonConvert.DeserializeObject<tblPrestador>(responseBody);
                }
            }

            return null;

        }


        public static async Task<tblPrestadorEspecialidade> PostGravaPrestadorEspecialidade(tblPrestadorEspecialidade novoPrestadorEspecialidade)
        {

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://api.thelittleorange.app/");
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", SessionProfile.token);
                var postTask = client.PostAsJsonAsync<tblPrestadorEspecialidade>("api/PrestadorEspecialidade/", novoPrestadorEspecialidade);
                postTask.Wait();
                var result = postTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    string responseBody = await result.Content.ReadAsStringAsync();
                    return JsonConvert.DeserializeObject<tblPrestadorEspecialidade>(responseBody);
                }
            }

            return null;

        }




        //public async Task<int> EnviaPrestador(tblPrestador() novoPrestador)
        //{

        //    string baseUrl = "https://api.thelittleorange.app/api/";
        //    HttpClient client = new HttpClient();

        //    client.BaseAddress = new Uri(baseUrl);
        //    client.DefaultRequestHeaders.Accept.Clear();
        //    client.DefaultRequestHeaders.Accept.Add(
        //        new MediaTypeWithQualityHeaderValue("application/json"));



        //    var jsonContent = JsonConvert.SerializeObject(novoPrestador);
        //    var contentString = new StringContent(jsonContent, Encoding.UTF8, "application/json");
        //    contentString.Headers.ContentType = new
        //    MediaTypeHeaderValue("application/json");
        //    contentString.Headers.Add("Session-Token", session_token);


        //    HttpResponseMessage response = await client.PostAsync("api/prestador/CriarOutroPrestador/", contentString);


        //}




        // GET: PrestadoresBase/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPrestadorBase tblPrestadorBase = db.tblPrestadorBase.Find(id);
            if (tblPrestadorBase == null)
            {
                return HttpNotFound();
            }
            return View(tblPrestadorBase);
        }

        // POST: PrestadoresBase/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblPrestadorBase tblPrestadorBase = db.tblPrestadorBase.Find(id);
            db.tblPrestadorBase.Remove(tblPrestadorBase);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }




    }
}
