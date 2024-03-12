using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using atechworld.Models;

namespace atechworld.Controllers
{
    public class GioHangController : Controller
    {
        dbAtechworldDataContext data = new dbAtechworldDataContext();
        // GET: GioHang
        public List<Giohang> LayGiohang()
        {
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<Giohang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGiohang (int iMadt, string strURL)
        {
            // lấy giỏ hàng ra
            List<Giohang> lstGiohang = LayGiohang();
            // kiểm tra đã chọn hàng và thêm vào giỏ hàng hay chưa
            Giohang sanpham = lstGiohang.Find(n => n.iMadt == iMadt);
            if (sanpham == null)
            {
                sanpham = new Giohang(iMadt);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            } 
            else
            {
                sanpham.iSoluong++;
                return Redirect(strURL);
            }
        }
        // tính tổng số lượng trong giỏ hàng
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            }
            return iTongSoLuong;
        }
        // Tính tiền
        private double TongTien()
        {
            double iTongTien = 0;
            List < Giohang > lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhtien);
            }
            return iTongTien;
        }
        public ActionResult Giohang()
        {
            List<Giohang> lstGiohang = LayGiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("tbdientu", "atechworld");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }
        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }
        // xóa sản phẩm trong giỏ hàng
        public ActionResult XoaGiohang(int iMaSP)
        {
            List<Giohang> lstGiohang = LayGiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.iMadt == iMaSP);
            if(lstGiohang != null)
            {
                lstGiohang.RemoveAll(n => n.iMadt == iMaSP);
                return RedirectToAction("Giohang");
            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("tbdientu", "atechworld");
            }
            return RedirectToAction("Giohang");
        }
        // update giỏ hàng
        public ActionResult CapnhatGiohang(int iMaSP, FormCollection f)
        {
            List<Giohang> lstGiohang = LayGiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.iMadt == iMaSP);
            if (sanpham != null)
            {
                sanpham.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("Giohang");
        }
        [HttpGet]
        public ActionResult Dathang()
        {
            // kiểm tra đăng nhập
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "Nguoidung");
            }
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("tbdientu", "atechworld");
            }
            List<Giohang> lstGiohang = LayGiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }
        public ActionResult Dathang(FormCollection collection)
        {
            //Thêm đơn hàng
            DonDatHang ddh = new DonDatHang();
            KhachHang kh = (KhachHang)Session["Taikhoan"];
            List<Giohang> gh = LayGiohang();
            ddh.MaKH = kh.MaKH;
            ddh.NgayDH = DateTime.Now;
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["ngaygiao"]);
            ddh.NgayGiao = DateTime.Parse(ngaygiao);
            ddh.TinhTrangGiaoHang = false;
            ddh.DaThanhToan = false;
            data.DonDatHangs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            // thêm chi tiết đơn hàng
            foreach (var item in gh)
            {
                ChiTietDatHang ctdh = new ChiTietDatHang();
                ctdh.SoDH = ddh.SoDH;
                ctdh.MaDT = item.iMadt;
                ctdh.SoLuong = item.iSoluong;
                ctdh.DonGia = (decimal) item.dDongia;
                data.ChiTietDatHangs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "Giohang");
        }
        //xác nhận đơn hàng
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}