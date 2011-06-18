using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema.lichchieu
{
    public partial class XemLichChieuTheoPhim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyDataBind();
            }
        }

        void MyDataBind()
        {
            if (Session["XLC-MaPhim"] == null)
                return;
            int _maPhim = int.Parse(Session["XLC-MaPhim"].ToString());

            CinemaLINQDataContext dt = new CinemaLINQDataContext ();

            List<LichChieuPhim> _dsNgayChieu = (from _lc in dt.LichChieuPhims
                                                where _lc.NgayChieu >= DateTime.Now.Date && _lc.SuatChieus.Where(_sc => _sc.MaPhim == _maPhim).Count() > 0
                                                orderby _lc.NgayChieu.Date ascending
                                                select _lc).ToList();

            Phim _phim = (from _ph in dt.Phims
                          where _ph.MaPhim == _maPhim
                          select _ph).Single();

            Label6.Text = _phim.TenPhim;
            dtl_dsNgayChieu.DataSource = _dsNgayChieu;
            dtl_dsNgayChieu.DataBind();

            for (int i = 0; i < _dsNgayChieu.Count; i++)
            {
                ((LinkButton)dtl_dsNgayChieu.Items[i].FindControl("lbt_NgayChieu")).Text = _dsNgayChieu[i].NgayChieu.ToString("dd/MM/yyyy");
            }
        }
    }
}