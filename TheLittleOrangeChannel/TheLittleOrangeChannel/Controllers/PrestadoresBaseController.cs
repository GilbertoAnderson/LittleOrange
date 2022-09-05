using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TheLittleOrangeChannel.Models;
//using EntityState = System.Data.EntityState;
//using System.Data.EntityState
//using Microsoft.EntityFrameworkCore

namespace TheLittleOrangeChannel.Controllers
{
    public class PrestadoresBaseController : Controller
    {
        private TheLittleOrangeEntities db = new TheLittleOrangeEntities();

        // GET: PrestadoresBase
        public ActionResult Index(string strCriterio)
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
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome");
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome");
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto");
            return View();
        }

        // POST: PrestadoresBase/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idStatus,dtCriacao")] tblPrestadorBase tblPrestadorBase)
        {
            if (ModelState.IsValid)
            {
                db.tblPrestadorBase.Add(tblPrestadorBase);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
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
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);
            return View(tblPrestadorBase);
        }

        // POST: PrestadoresBase/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idStatus,dtCriacao")] tblPrestadorBase tblPrestadorBase)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestadorBase).State = System.Data.Entity.EntityState.Modified;
               // db.Entry(tblPrestadorBase).State =  EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome", tblPrestadorBase.idCondominio);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);
            return View(tblPrestadorBase);
        }

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
