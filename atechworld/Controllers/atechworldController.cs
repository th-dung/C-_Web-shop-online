using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using atechworld.Models;
using PagedList;
using PagedList.Mvc;

namespace atechworld.Controllers
{
    public class atechworldController : Controller
    {
        // Đối tượng quản lý CSDL
        dbAtechworldDataContext data = new dbAtechworldDataContext();
        private List<DT> Laysanphammoi(int count)
        {
            return data.DTs.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        // GET: atechworld
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult tbdientu(int ? page)
        {
            // Quy định số lượng sản phẩm trên 1 trang
            int pageSize = 6;
            // Tạo biến số trang
            int pageNum = (page ?? 1);
            var spmoi = Laysanphammoi(7);
            return View(spmoi.ToPagedList(pageNum,pageSize));
        }
        public ActionResult mba()
        {
            return View();
        }
        public ActionResult web()
        {
            return View();
        }
        public ActionResult services()
        {
            return View();
        }
        public ActionResult import()
        {
            return View();
        }
        public ActionResult Chude()
        {
            var chude = from cd in data.ChuDes select cd;
            return PartialView(chude);
        }
        public ActionResult NhaSanXuat()
        {
            var NhaSanXuat = from cd in data.NhaSanXuats select cd;
            return PartialView(NhaSanXuat);
        }
        public ActionResult SPTheochude(int id)
        {
            var sanpham = from s in data.DTs where s.MaCD == id select s;
            return PartialView(sanpham);
        }
        public ActionResult SPTheonsx(int id)
        {
            var sanpham = from s in data.DTs where s.MaNSX == id select s;
            return PartialView(sanpham);
        }
        public ActionResult Details(int id)
        {
            var sanpham = from s in data.DTs where s.MaDT == id select s;
            return PartialView(sanpham.Single());
        }
    }
}