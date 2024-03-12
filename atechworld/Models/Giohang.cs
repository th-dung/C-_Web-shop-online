using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace atechworld.Models
{
    public class Giohang
    {
        // Đối tượng quản lý CSDL
        dbAtechworldDataContext data = new dbAtechworldDataContext();
        public int iMadt { set; get; }
        public string sTendt { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }
        public Giohang(int Madt)
        {
            iMadt = Madt;
            DT dt = data.DTs.Single(n => n.MaDT == iMadt);
            sTendt = dt.TenDT;
            sAnhbia = dt.AnhBia;
            dDongia = double.Parse(dt.GiaBan.ToString());
            iSoluong = 1;
        }
    }
}