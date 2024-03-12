using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using atechworld.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace atechworld.Controllers
{
    public class AdminController : Controller
    {
        // quản lý database
        dbAtechworldDataContext db = new dbAtechworldDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Sanpham(int ?page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            return View(db.DTs.ToList().OrderBy(n => n.MaDT).ToPagedList(pageNumber,pageSize));
        }

        public ActionResult login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult login(FormCollection Collection)
        {
            var tendn = Collection["username"];
            var matkhau = Collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["loi1"] = "Tên Đăng Nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi2"] = "Mật Khẩu";
            }
            else
            {
                Admin admin = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (admin != null)
                {
                    ViewBag.thongbao = "Đăng Nhập thành công!";
                    Session["Taikhoan"] = admin;
                    return RedirectToAction("index", "Admin");
                }
                else
                {
                    ViewBag.thongbao = "Tên Đăng Nhập hoặc Mật Khẩu không chính xác!";
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult ThemmoiSanpham()
        {
            ViewBag.MaCD = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiSanpham(DT sanpham, HttpPostedFileBase fileupload)
        {
            ViewBag.MaCD = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Chọn hình ảnh";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // lưu tên file
                    var fileName = Path.GetFileName(fileupload.FileName);
                    //lưu đường dẫn
                    var path = Path.Combine(Server.MapPath("~/product_img"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình Ảnh Đã Tồn Tại";
                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    sanpham.AnhBia = fileName;
                    //lưu file vào CSDL
                    db.DTs.InsertOnSubmit(sanpham);
                    db.SubmitChanges();
                }
                return RedirectToAction("Sanpham");
            }
        }

        [HttpGet]
        public ActionResult Xoasanpham(int id)
        {
            //lấy đối tượng cần xóa
            DT sanpham = db.DTs.SingleOrDefault(n => n.MaDT == id);
            ViewBag.MaDT = sanpham.MaDT;
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanpham);
        }

        [HttpPost, ActionName("Xoasanpham")]
        public ActionResult Xacnhanxoa(int id)
        {
            //lấy đối tượng cần xóa
            DT sanpham = db.DTs.SingleOrDefault(n => n.MaDT == id);
            ViewBag.MaDT = sanpham.MaDT;
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.DTs.DeleteOnSubmit(sanpham);
            db.SubmitChanges();
            return RedirectToAction("Sanpham");
        }

        [HttpGet]
        public ActionResult Suasanpham(int id)
        {
            //lấy đối tượng cần sửa
            DT sanpham = db.DTs.SingleOrDefault(n => n.MaDT == id);
            ViewBag.MaDT = sanpham.MaDT;
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaCD = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude", sanpham.MaCD);
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX", sanpham.MaNSX);
            return View(sanpham);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasanpham(DT sanpham, HttpPostedFileBase fileupload)
        {
            ViewBag.MaCD = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Chọn hình ảnh";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // lưu tên file
                    var fileName = Path.GetFileName(fileupload.FileName);
                    //lưu đường dẫn
                    var path = Path.Combine(Server.MapPath("~/product_img"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình Ảnh Đã Tồn Tại";
                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    sanpham.AnhBia = fileName;
                    //lưu vào CSDL
                    UpdateModel(sanpham);
                    db.SubmitChanges();
                }
                return RedirectToAction("Sanpham");
            }
        }
    }
}