using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using atechworld.Models;

namespace atechworld.Controllers
{
    public class NguoiDungController : Controller
    {
        // Đối tượng quản lý CSDL
        dbAtechworldDataContext db = new dbAtechworldDataContext();
        // GET: NguoiDung
        public ActionResult Index()
        {
            return View();
        }
        // GET: NguoiDung
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection Collection, KhachHang kh)
        {
            var hoten = Collection["HotenKH"];
            var tendn = Collection["TenDN"];
            var matkhau = Collection["MatKhau"];
            var xnmatkhau = Collection["XNMatKhau"];
            var email = Collection["Email"];
            var dienthoai = Collection["DienThoai"];
            var diachi = Collection["DiaChi"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", Collection["NgaySinh"]);
            // các điều kiện kiểm tra nhập có hợp lệ hay không
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["loi1"] = "Ho Ten khong duoc de trong";
            }
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["loi2"] = "Ten Dang Nhap khong duoc de trong";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi3"] = "Mat Khau khong duoc de trong";
            }
            if (String.IsNullOrEmpty(xnmatkhau))
            {
                ViewData["loi4"] = "Xac Nhan Mat Khau khong duoc de trong";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["loi5"] = "Email khong duoc de trong";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["loi6"] = "Dien Thoai khong duoc de trong";
            }
            if (String.IsNullOrEmpty(diachi))
            {
                ViewData["loi7"] = "Dia Chi khong duoc de trong";
            }
            else
            {
                // Gán dữ liệu vào database
                kh.HoTen = hoten;
                kh.TaiKhoan = tendn;
                kh.MatKhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienThoaiKH = dienthoai;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection Collection)
        {
            var tendn = Collection["TenDN"];
            var matkhau = Collection["MatKhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["loi1"] = "Tên Đăng Nhập đang trống";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi2"] = "Mật Khẩu đang để trống";
            }
            else
            {
                KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (kh != null)
                {
                    ViewBag.thongbao = "Đăng Nhập thành công!";
                    Session["Taikhoan"] = kh;
                    return RedirectToAction("tbdientu", "atechworld");
                }
                else
                {
                    ViewBag.thongbao = "Tên Đăng Nhập hoặc Mật Khẩu không chính xác";
                }
            }
            return View();
        }
    }
}