using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        

        protected void Th_DsFilm_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Th_DsFilm_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ChiTiet_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            Session["CurrentPhim"] = (from phim in dt.Phims
                                      where phim.MaPhim == int.Parse(((Button)sender).CommandName)
                                      select phim).Single();
            Response.Redirect("../phim/ChiTietPhim.aspx");
        }

        protected void ChinhSua_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            Session["CurrentPhim"] = (from phim in dt.Phims
                                      where phim.MaPhim == int.Parse(((Button)sender).CommandName)
                                      select phim).Single();
            Response.Redirect("../phim/ChinhSuaPhim.aspx");
        }

        protected void Xl_ThemPhimMoi_Click(object sender, EventArgs e)
        {
            Response.Redirect("../phim/ThemPhimMoi.aspx");
        }
    }
}