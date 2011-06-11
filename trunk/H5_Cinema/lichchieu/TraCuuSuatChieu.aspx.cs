using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema.lichchieu
{
    public partial class TraCuuSuatChieu : System.Web.UI.Page
    {
        bool _choiceADate = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        public void BindingData()
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            _choiceADate = true;
        }

        protected void UpdatePanel2_Load(object sender, EventArgs e)
        {
            
        }

        protected void UpdatePanel2_PreRender(object sender, EventArgs e)
        {
            DateTime _selectionDate = Calendar1.SelectedDate;
            DanhMucSuatChieu _loaiSuatChieu;
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            if (Session["SuatChieuTimKiem"] == null)
                return;
            else
            {
                int _maSuatChieuTimKiem = int.Parse(Session["SuatChieuTimKiem"].ToString());
                _loaiSuatChieu = (from _dmsc in dt.DanhMucSuatChieus
                                  where _dmsc.MaDanhMucSuatChieu == _maSuatChieuTimKiem
                                  select _dmsc).Single();

                lb_SuatChieuChon.Text = "Suất chiếu chọn tra cứu: " + _loaiSuatChieu.ThoiGianBatDau.ToString("HH:mm");
                if (_selectionDate == DateTime.MinValue)
                    return;
            }

            List<SuatChieu> _dsSuatChieu = (from _sc in dt.SuatChieus
                                           where _sc.LichChieuPhim.NgayChieu == _selectionDate && _sc.MaDanhMucSuatChieu == int.Parse(Session["SuatChieuTimKiem"].ToString())
                                           orderby _sc.MaPhim
                                           select _sc).ToList();

            if (_dsSuatChieu.Count == 0)
            {
                lb_DanhSachPhimChieu.Visible = true;
                lb_DanhSachPhimChieu.Text = "Hiện tại chưa có phim nào được chiếu vào ngày " +
                    _selectionDate.Day.ToString() + "/" + _selectionDate.Month.ToString() + "/" + _selectionDate.Year.ToString() +
                    ", suất: " + _loaiSuatChieu.ThoiGianBatDau.ToString("HH:mm");
                List<SuatChieu> _dsSuatChieuRong = new List<SuatChieu>();
                DataList1.DataSource = _dsSuatChieuRong;
                DataList1.DataBind();
                return;
            }
            lb_DanhSachPhimChieu.Visible = true;
            lb_DanhSachPhimChieu.Text = "Danh sách phim chiếu vào ngày " +
                    _selectionDate.Day.ToString() + "/" + _selectionDate.Month.ToString() + "/" + _selectionDate.Year.ToString() +
                    ", suất: " + _loaiSuatChieu.ThoiGianBatDau.ToString("HH:mm");

            List<SuatChieu> _dsSuatChieuTheoPhim = new List<SuatChieu>();
            int _currentPhim = -1;
            for (int i = 0; i < _dsSuatChieu.Count; i++)
            {
                if (_currentPhim != _dsSuatChieu[i].Phim.MaPhim)
                {
                    _dsSuatChieuTheoPhim.Add(_dsSuatChieu[i]);
                    _currentPhim = _dsSuatChieu[i].Phim.MaPhim;
                }
            }

            DataList1.DataSource = _dsSuatChieuTheoPhim;
            DataList1.DataBind();
        }
    }
}