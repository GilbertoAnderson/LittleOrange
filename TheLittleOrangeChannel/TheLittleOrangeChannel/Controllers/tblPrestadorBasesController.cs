using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TheLittleOrangeChannel.Models;

namespace TheLittleOrangeChannel.Controllers
{
    public class tblPrestadorBasesController : Controller
    {
        private TheLittleOrangeEntities db = new TheLittleOrangeEntities();

        // GET: tblPrestadorBases
        public ActionResult Index()
        {
            var tblPrestadorBase = db.tblPrestadorBase.Include(t => t.tblCondominio).Include(t => t.tblDominios).Include(t => t.tblDominios1).Include(t => t.tblDominios2).Include(t => t.tblEspecialidade).Include(t => t.tblUsuario).Include(t => t.tblStatus);
            return View(tblPrestadorBase.ToList());
        }

        // GET: tblPrestadorBases/Details/5
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

        // GET: tblPrestadorBases/Create
        public ActionResult Create()
        {
            ViewBag.idCondominio = new SelectList(db.tblCondominio, "idCondominio", "Nome");
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto");
            ViewBag.idFormaPagto = new SelectList(db.tblDominios, "idDominio", "Objeto");
            ViewBag.idPlano = new SelectList(db.tblDominios, "idDominio", "Objeto");
            ViewBag.idEspecialidade = new SelectList(db.tblEspecialidade, "idEspecialidade", "Area");
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome");
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto");
            return View();
        }

        // POST: tblPrestadorBases/Create
        // Para se proteger de mais ataques, habilite as propriedades específicas às quais você quer se associar. Para 
        // obter mais detalhes, veja https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idEspecialidade,idStatus,dtCriacao,idPlano,idAbrangencia,diasPromocao,idFormaPagto")] tblPrestadorBase tblPrestadorBase)
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

        // GET: tblPrestadorBases/Edit/5
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
            ViewBag.idAbrangencia = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestadorBase.idAbrangencia);
            ViewBag.idFormaPagto = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestadorBase.idFormaPagto);
            ViewBag.idPlano = new SelectList(db.tblDominios, "idDominio", "Objeto", tblPrestadorBase.idPlano);
            ViewBag.idEspecialidade = new SelectList(db.tblEspecialidade, "idEspecialidade", "Area", tblPrestadorBase.idEspecialidade);
            ViewBag.idCanal = new SelectList(db.tblUsuario, "idUsuario", "Nome", tblPrestadorBase.idCanal);
            ViewBag.idStatus = new SelectList(db.tblStatus, "idStatus", "Objeto", tblPrestadorBase.idStatus);
            return View(tblPrestadorBase);
        }

        // POST: tblPrestadorBases/Edit/5
        // Para se proteger de mais ataques, habilite as propriedades específicas às quais você quer se associar. Para 
        // obter mais detalhes, veja https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPrestador,idCondominio,idCanal,Empresa,Email,Celular,CPF_CNPJ,idEspecialidade,idStatus,dtCriacao,idPlano,idAbrangencia,diasPromocao,idFormaPagto")] tblPrestadorBase tblPrestadorBase)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPrestadorBase).State = EntityState.Modified;
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

        // GET: tblPrestadorBases/Delete/5
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

        // POST: tblPrestadorBases/Delete/5
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
