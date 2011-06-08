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
                bl.MaNguoiDung = 3;
                bl.TinhTrang = 3;

                dt.BinhLuans.InsertOnSubmit(bl);

                dt.SubmitChanges();
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Xl_ChinhSua_Click(object sender, EventArgs e)
        {            
            Response.Redirect("ChinhSuaPhim.aspx");            
        }

        
    }
}