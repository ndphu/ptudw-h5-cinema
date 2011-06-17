using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            NguoiDung nd = (NguoiDung)Session["NguoiDung"];
            if (nd == null || nd.DanhMucNguoiDung.TenDanhMucNguoiDung != "Admin")
                Response.Redirect("/thanhvien/yeucauquyenadmin.aspx");
        }
    }
}