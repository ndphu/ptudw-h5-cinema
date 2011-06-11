using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyDataBind();
            }
        }

        public void MyDataBind()
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            List<SuatChieu> _dsSuatChieu = (from _sc in dt.SuatChieus
                                           where _sc.LichChieuPhim.NgayChieu.Date >= DateTime.Now.Date
                                            orderby _sc.MaPhim ascending
                                           select _sc).ToList();
            if (_dsSuatChieu.Count == 0)
                return;

            List<SuatChieu> _dsSuatChieuTheoPhim = new List<SuatChieu>();
            int _currentPhim = -1;
            for (int i = 0; i < _dsSuatChieu.Count; i++)
            {
                if (_dsSuatChieu[i].MaPhim != _currentPhim)
                {
                    _dsSuatChieuTheoPhim.Add(_dsSuatChieu[i]);
                    _currentPhim = _dsSuatChieu[i].MaPhim;
                }
            }

            //DataList _temp = (DataList)Panel1.FindControl("dtl_DanhSachPhim");
            ((DataList)Panel1.FindControl("dtl_DanhSachPhim")).DataSource = _dsSuatChieuTheoPhim;
            ((DataList)Panel1.FindControl("dtl_DanhSachPhim")).DataBind();
            //dtl_DanhSachPhim.DataSource = _dsSuatChieuTheoPhim;
            //dtl_DanhSachPhim.DataBind();
        }
    }
}