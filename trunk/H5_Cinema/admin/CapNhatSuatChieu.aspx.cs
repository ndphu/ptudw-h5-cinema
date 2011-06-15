using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dl_SuatChieuHienTai_PreRender(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            var dsSuatChieu = from dmsc in dt.DanhMucSuatChieus
                              where dmsc.TinhTrang == true
                              select dmsc;
            dl_SuatChieuHienTai.DataSource = dsSuatChieu;
            dl_SuatChieuHienTai.DataBind();
        }
    }
}