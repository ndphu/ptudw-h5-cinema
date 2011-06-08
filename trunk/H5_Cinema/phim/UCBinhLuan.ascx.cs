using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema.phim
{
    public partial class UCBinhLuan : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void LoadBinhLuan(BinhLuan _binhLuan)
        {
            if (_binhLuan != null)
            {
                Th_TenNguoiDung.Text = _binhLuan.NguoiDung.TenNguoiDung;
                Th_NoiDungBinhLuan.Text = _binhLuan.NoiDungBinhLuan;
                if (((NguoiDung)Session["NguoiDung"]) != null && ((NguoiDung)Session["NguoiDung"]).MaDanhMucNguoiDung == 1)
                {
                    Xl_Sua.CommandName = _binhLuan.MaBinhLuan.ToString();
                    Xl_Sua.Visible = true;
                    Xl_Sua.Click += new EventHandler(Xl_Sua_Click);
                    Xl_Xoa.CommandName = _binhLuan.MaBinhLuan.ToString();
                    Xl_Xoa.Visible = true;
                    Xl_Xoa.Click += new EventHandler(Xl_Xoa_Click);
                }

            }
        }

        protected void Xl_Xoa_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = (from binhLuan in dt.BinhLuans
                         where binhLuan.MaBinhLuan == int.Parse(((Button)sender).CommandName)
                         select binhLuan).Single();
            query.TinhTrang = 1;
            dt.SubmitChanges();
            Response.Redirect("/phim/chitietphim.aspx");
        }

        protected void Xl_Sua_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = (from binhLuan in dt.BinhLuans
                         where binhLuan.MaBinhLuan == int.Parse(((Button)sender).CommandName)
                         select binhLuan).Single();
            query.NoiDungBinhLuan = Th_NoiDungBinhLuan.Text;
            dt.SubmitChanges();
            Response.Redirect("/phim/chitietphim.aspx");
        }
    }
}