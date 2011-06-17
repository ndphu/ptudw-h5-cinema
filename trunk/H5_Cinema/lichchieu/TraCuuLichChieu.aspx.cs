using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema.lichchieu
{
    public partial class TraCuuLichChieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingData();
            }
        }

        public void BindingData()
        {
            DateTime _dateSelected = (DateTime)Session["ThoiGianTimKiem"];

            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            List<LichChieuPhim> _dsLichChieu = (from _lichChieu in dt.LichChieuPhims
                                                where _lichChieu.NgayChieu == _dateSelected
                                                select _lichChieu).ToList();

            if (_dsLichChieu.Count == 0)
            {
                lb_KetQuaTraCuu.Text = "Chưa có lịch chiếu cho ngày " + _dateSelected.Day.ToString() + "/" + _dateSelected.Month.ToString() + "/" + _dateSelected.Year.ToString();
                return;
            }



            lb_KetQuaTraCuu.Text = "Lịch chiếu ngày " + _dateSelected.Day.ToString() + "/" + _dateSelected.Month.ToString() + "/" + _dateSelected.Year.ToString();
            List<SuatChieu> _dsSuatChieu = (from _suatChieu in dt.SuatChieus
                                            where _suatChieu.MaLichChieu == _dsLichChieu[0].MaLichChieuPhim && _suatChieu.TinhTrang == true
                                            orderby _suatChieu.MaPhim ascending
                                            select _suatChieu).ToList();

            if (_dsSuatChieu.Count == 0)
            {
                lb_KetQuaTraCuu.Text = "Chưa có lịch chiếu cho ngày " + _dateSelected.Day.ToString() + "/" + _dateSelected.Month.ToString() + "/" + _dateSelected.Year.ToString();
                return;
            }

            List<SuatChieu> _dsSuatChieuTheoPhim = new List<SuatChieu>();
            int _currentPhim = -1;

            for (int i = 0; i < _dsSuatChieu.Count; i++)
            {
                if (_currentPhim != _dsSuatChieu[i].MaPhim)
                {
                    _dsSuatChieuTheoPhim.Add(_dsSuatChieu[i]);
                    _currentPhim = _dsSuatChieu[i].MaPhim;
                }
            }

            dtl_DanhSachPhim.DataSource = _dsSuatChieuTheoPhim;
            dtl_DanhSachPhim.DataBind();
        }
    }
}