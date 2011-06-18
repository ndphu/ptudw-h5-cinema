using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema.lichchieu
{
    public partial class CapNhatLichChieu : System.Web.UI.Page
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
            int _maLichChieu = int.Parse(Session["CNLC-MaLichChieuDuocChon"].ToString());
            int _maPhim = int.Parse(Session["CNLC-MaPhimDuocChon"].ToString());

            List<SuatChieu> _dsSuatChieu = (from sc in dt.SuatChieus
                                           where sc.MaLichChieu == _maLichChieu && sc.MaPhim == _maPhim
                                           orderby sc.DanhMucSuatChieu.ThoiGianBatDau ascending
                                           select sc).ToList();

            Phim _phim = (from ph in dt.Phims
                          where ph.MaPhim == _maPhim
                          select ph).Single();

            LichChieuPhim _lichChieuPhim = (from lc in dt.LichChieuPhims
                                            where lc.MaLichChieuPhim == _maLichChieu
                                            select lc).Single();

            lb_Phim.Text += _phim.TenPhim;
            lb_NgayChieu.Text += _lichChieuPhim.NgayChieu.Date.ToString("dd/MM/yyyy");

            DataList1.DataSource = _dsSuatChieu;
            DataList1.DataBind();

            int _count = 0;
            foreach (SuatChieu sc in _dsSuatChieu)
            {
                ((Label)DataList1.Items[_count].FindControl("lb_Suat")).Text = sc.DanhMucSuatChieu.ThoiGianBatDau.ToString("HH:mm");
                ((LinkButton)DataList1.Items[_count].FindControl("lbt_CapNhat")).CommandArgument = _count.ToString();

                LinkButton _lbtXoa = (LinkButton)DataList1.Items[_count].FindControl("lbt_Xoa");
                
                List<DatVe> _dsVeDatTrongSuat = (from _dt in dt.DatVes
                                                where _dt.MaSuatChieu == sc.MaSuatChieu
                                                select _dt).ToList();
                if (_dsVeDatTrongSuat.Count == 0)
                    _lbtXoa.Visible = true;
                else
                    _lbtXoa.Visible = false;
                _count++;
            }
        }

        protected void bt_CapNhat_Click(object sender, EventArgs e)
        {
            
            if (Session["NguoiDung"] == null)
            {
                Response.Redirect("/thanhvien/DangNhap.aspx");
                return;
            }
            
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            Button _sender = (Button)sender;
            int _maSuatChieu = int.Parse(_sender.CommandArgument);

            SuatChieu _suatChieuCapNhat = (from _sc in dt.SuatChieus
                                           where _sc.MaSuatChieu == _maSuatChieu
                                           select _sc).Single();

            TimeSpan _toQuery = TimeSpan.Parse(Session["CNLC-SuatChieuMoi"].ToString());

            DanhMucSuatChieu _scToUpdate = (from _dmsc in dt.DanhMucSuatChieus
                                            where _dmsc.ThoiGianBatDau.TimeOfDay == _toQuery
                                            select _dmsc).Single();

            _suatChieuCapNhat.MaDanhMucSuatChieu = _scToUpdate.MaDanhMucSuatChieu;
            dt.SubmitChanges();
            MyDataBind();
        }

        protected void ddl_dsSuat_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList _sender = (DropDownList)sender;
            Session["CNLC-SuatChieuMoi"] = _sender.Items[_sender.SelectedIndex].Text;
        }

        protected void UpdatePanel2_PreRender(object sender, EventArgs e)
        {
            
        }
    }
}
