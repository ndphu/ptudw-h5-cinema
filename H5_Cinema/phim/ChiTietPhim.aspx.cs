using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Th_HinhAnh.ImageUrl = ((Phim)Session["CurrentPhim"]).AnhPhim;
                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                var query = from binhLuan in dt.BinhLuans
                            where binhLuan.MaPhim == ((Phim)Session["CurrentPhim"]).MaPhim && binhLuan.TinhTrang == 3
                            select binhLuan;
                foreach (BinhLuan binhLuan in query)
                {
                    Control ucbl = LoadControl("UCBinhLuan.ascx");
                    ((H5_Cinema.phim.UCBinhLuan)ucbl).LoadBinhLuan(binhLuan);
                    Panel1.Controls.Add(ucbl);
                    Panel1.Controls.Add(new LiteralControl("</br>"));
                } 
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Xl_ThemBinhLuan_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();

                BinhLuan bl = new BinhLuan();
                bl.MaPhim = ((Phim)Session["CurrentPhim"]).MaPhim;
                bl.NoiDungBinhLuan = Th_BinhLuanMoi.Text;
                bl.MaNguoiDung = ((NguoiDung)Session["NguoiDung"]).MaNguoiDung;
                bl.TinhTrang = 3;

                dt.BinhLuans.InsertOnSubmit(bl);

                dt.SubmitChanges();
                Response.Redirect("/phim/chitietphim.aspx");
            }
            catch
            {
                Response.Redirect("/phim/chitietphim.aspx");
            }
        }

        protected void Xl_ChinhSua_Click(object sender, EventArgs e)
        {            
            Response.Redirect("ChinhSuaPhim.aspx");            
        }

    }
}