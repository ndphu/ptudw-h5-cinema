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
            Session["SelectedFilmID"] = ((Button)sender).CommandName;
            Response.Redirect("../phim/ChiTietFilm.aspx");
        }

        protected void ChinhSua_Click(object sender, EventArgs e)
        {
            Session["SelectedFilmID"] = ((Button)sender).CommandName;
            Response.Redirect("../phim/ChinhSuaFilm.aspx");
        }
    }
}