using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using final_Portfolio.DAL;

namespace final_Portfolio.Controllers
{
    public class P_InformationController : Controller
    {
        private PortfolioContext db = new PortfolioContext();

        // GET: P_Information
        public ActionResult Index()
        {
            var p_Information = db.P_Information.Include(p => p.P_Information1);
            return View(p_Information.ToList());
        }

        // GET: P_Information/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            P_Information p_Information = db.P_Information.Find(id);
            if (p_Information == null)
            {
                return HttpNotFound();
            }
            return View(p_Information);
        }

        // GET: P_Information/Create
        public ActionResult Create()
        {
            ViewBag.studentID = new SelectList(db.P_Information, "studentID", "name");
            return View();
        }

        // POST: P_Information/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "studentID,name,age,phonenum,university,major,url")] P_Information p_Information)
        {
            if (ModelState.IsValid)
            {
                db.P_Information.Add(p_Information);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.studentID = new SelectList(db.P_Information, "studentID", "name", p_Information.studentID);
            return View(p_Information);
        }

        // GET: P_Information/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            P_Information p_Information = db.P_Information.Find(id);
            if (p_Information == null)
            {
                return HttpNotFound();
            }
            ViewBag.studentID = new SelectList(db.P_Information, "studentID", "name", p_Information.studentID);
            return View(p_Information);
        }

        // POST: P_Information/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "studentID,name,age,phonenum,university,major,url")] P_Information p_Information)
        {
            if (ModelState.IsValid)
            {
                db.Entry(p_Information).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.studentID = new SelectList(db.P_Information, "studentID", "name", p_Information.studentID);
            return View(p_Information);
        }

        // GET: P_Information/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            P_Information p_Information = db.P_Information.Find(id);
            if (p_Information == null)
            {
                return HttpNotFound();
            }
            return View(p_Information);
        }

        // POST: P_Information/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            P_Information p_Information = db.P_Information.Find(id);
            db.P_Information.Remove(p_Information);
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
