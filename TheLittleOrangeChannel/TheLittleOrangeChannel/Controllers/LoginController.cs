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

namespace TheLittleOrangeChannel.Controllers
{

    public class LoginController : Controller
    {
        private TheLittleOrangeEntities db = new TheLittleOrangeEntities();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        // GET: Login
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }


            tblStatus _tblStatus = new tblStatus();
            _tblStatus = db.tblStatus.Where(x => x.Objeto == "USUARIO"
                                              && x.Descricao == "ATIVO").FirstOrDefault();

            tblUsuario _tblUsuario = new tblUsuario();
            tblPerfil _tblPerfil = new tblPerfil();


            var _tblUsuarioValido = db.tblUsuarioPerfil.Include(t => t.tblUsuario).Include(t => t.tblPerfil).Include(t => t.tblStatus);


            var _tblUsuarioAdm = _tblUsuarioValido.Where(x => x.tblUsuario.Email == model.Email
                                                && x.tblUsuario.Senha == model.Senha
                                                && x.tblPerfil.Descricao== "ADM").FirstOrDefault();
            var _tblUsuarioCanal = _tblUsuarioValido.Where(x => x.tblUsuario.Email == model.Email
                                                && x.tblUsuario.Senha == model.Senha
                                                && x.tblPerfil.Descricao == "CANAL").FirstOrDefault();

            //........................... se for adm considerareste o perfil
            if ( _tblUsuarioAdm != null)
            {
                _tblUsuario = db.tblUsuario.Where(x => x.idUsuario == _tblUsuarioAdm.idUsuario).FirstOrDefault();
                _tblPerfil  = db.tblPerfil.Where(x => x.idPerfil == _tblUsuarioAdm.idPerfil).FirstOrDefault(); 
            }
            else
            {
                if (_tblUsuarioCanal != null)
                {
                    _tblUsuario = db.tblUsuario.Where(x => x.idUsuario == _tblUsuarioCanal.idUsuario).FirstOrDefault();
                    _tblPerfil = db.tblPerfil.Where(x => x.idPerfil == _tblUsuarioCanal.idPerfil).FirstOrDefault();
                }
            }


            if (_tblUsuarioValido == null)
            {
                return HttpNotFound("Usuário não encontrado!!");
            }
            else
            {

                if ((_tblUsuario.idStatus != _tblStatus.idStatus))
                {
                    // ............... em caso de não estar ativo
                    Session["Logado"] = false;
                    return View("Lockout");
                }




                //..................... busca o perfil do usuario


                if (_tblPerfil == null)
                {
                    Session["Logado"] = false;
                    return HttpNotFound("Perfil não encontrado!!");
                }
                else
                {

                    Session["idUsuario"] = _tblUsuario.idUsuario;
                    Session["Nome"] = _tblUsuario.Nome;
                    Session["Email"] = _tblUsuario.Email;
                    Session["Perfil"] = _tblPerfil.Descricao;
                    Session["Logado"] = true;

                    Session["ADM"] = false;
                    Session["Canal"] = false;

                    if (_tblPerfil.Descricao == "ADM") { Session["ADM"] = true; }
                    if (_tblPerfil.Descricao == "CANAL") { Session["Canal"] = true; }

                    SessionProfile session = new SessionProfile();


                    if (SessionProfile.ADM)
                    {
                        return RedirectToAction("Menu", "Prestadores");
                    }


                    if (SessionProfile.Canal)
                    {
                        return RedirectToAction("Menu", "Prestadores");
                    }

                }

            }


            return RedirectToLocal(returnUrl);

        }

        [AllowAnonymous]
        public ActionResult LogOff()
        {
            Session["Logado"] = false;
            Session["ADM"] = false;
            Session["Canal"] = false;

            if (SessionProfile.ADM)
            {
            }

            if (SessionProfile.Canal)
            {
            }


            return RedirectToAction("Login", "Login");
        }



        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }






    }
}