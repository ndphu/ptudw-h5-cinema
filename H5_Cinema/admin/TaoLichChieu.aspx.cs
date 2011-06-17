using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace H5_Cinema
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdatePanel1_PreRender(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            if (cbb_ChonPhim.SelectedIndex == -1 || cbb_ChonNgay.SelectedIndex == -1 || cbb_Phong.SelectedIndex == -1)
                return;
            List<DateTime> dsNgayChieu = new List<DateTime>();
            for (int i = 0; i < int.Parse(cbb_ChonNgay.SelectedItem.Value); ++i)
                dsNgayChieu.Add(DateTime.Today.AddDays(i + 1));
            var dsLichChieu = from _lichChieu in dt.LichChieuPhims
                        where dsNgayChieu.Contains(_lichChieu.NgayChieu)
                        select _lichChieu;
            dl_DsLichChieu.DataSource = dsLichChieu;
            dl_DsLichChieu.DataBind();

            int count = 0;
            foreach (LichChieuPhim _lichchieu in dsLichChieu)
            {
                Label lb_NgayChieu = (Label)dl_DsLichChieu.Items[count].FindControl("lb_NgayChieu");
                lb_NgayChieu.Text = _lichchieu.NgayChieu.ToShortDateString();
                DataList dl_SuatChieu = (DataList)dl_DsLichChieu.Items[count].FindControl("dl_SuatChieu");
                var dsSuatChieu = (from _suatchieu in dt.SuatChieus
                                  where _suatchieu.MaLichChieu == _lichchieu.MaLichChieuPhim && _suatchieu.MaPhong == int.Parse(cbb_Phong.SelectedItem.Value) && _suatchieu.MaPhim == int.Parse(cbb_ChonPhim.SelectedItem.Value)
                                  select _suatchieu).OrderBy(_suatchieu => _suatchieu.DanhMucSuatChieu.ThoiGianBatDau);
                dsSuatChieu.OrderBy(_suatchieu => _suatchieu.DanhMucSuatChieu.ThoiGianBatDau);
                dl_SuatChieu.DataSource = dsSuatChieu;
                dl_SuatChieu.DataBind();

                int _count = 0;
                foreach (SuatChieu _suatchieu in dsSuatChieu)
                {
                    Label lb_ThoiGian = (Label)dl_SuatChieu.Items[_count].FindControl("lb_ThoiGian");
                    lb_ThoiGian.Text = _suatchieu.DanhMucSuatChieu.ThoiGianBatDau.ToShortTimeString();
                    Label lb_Phong = (Label)dl_SuatChieu.Items[_count].FindControl("lb_Phong");
                    lb_Phong.Text = _suatchieu.PhongChieuPhim.TenPhongChieuPhim;
                    Label lb_Phim = (Label)dl_SuatChieu.Items[_count].FindControl("lb_Phim");
                    lb_Phim.Text = _suatchieu.Phim.TenPhim;
                    Label lb_TinhTrang = (Label)dl_SuatChieu.Items[_count].FindControl("lb_TinhTrang");
                    var dsSuatChieuCungGio = from __suatchieu in dt.SuatChieus
                                             where __suatchieu.MaPhong == _suatchieu.MaPhong && __suatchieu.MaDanhMucSuatChieu == _suatchieu.MaDanhMucSuatChieu && __suatchieu.MaSuatChieu != _suatchieu.MaSuatChieu && __suatchieu.MaLichChieu == _suatchieu.MaLichChieu
                                             || (((__suatchieu.DanhMucSuatChieu.ThoiGianBatDau.CompareTo(_suatchieu.DanhMucSuatChieu.ThoiGianBatDau) > 0 && __suatchieu.DanhMucSuatChieu.ThoiGianBatDau.CompareTo(_suatchieu.DanhMucSuatChieu.ThoiGianBatDau.AddMinutes(_suatchieu.Phim.ThoiLuong)) <= 0)
                                             || (_suatchieu.DanhMucSuatChieu.ThoiGianBatDau.CompareTo(__suatchieu.DanhMucSuatChieu.ThoiGianBatDau) > 0 && _suatchieu.DanhMucSuatChieu.ThoiGianBatDau.CompareTo(__suatchieu.DanhMucSuatChieu.ThoiGianBatDau.AddMinutes(__suatchieu.Phim.ThoiLuong)) <= 0))
                                             && __suatchieu.DanhMucSuatChieu.SuatChieus.Count<SuatChieu>(___suatchieu => ___suatchieu.MaLichChieu == _suatchieu.MaLichChieu) != 0)
                                             select __suatchieu;

                    ((LinkButton)dl_SuatChieu.Items[_count].FindControl("btn_ThayDoi")).Text = "Xóa";
                    Session["DungDo"] = false;
                    if (dsSuatChieuCungGio.Count<SuatChieu>() != 0)
                    {
                        lb_TinhTrang.Text = "Đụng độ";
                        lb_TinhTrang.ForeColor = Color.Red;
                        Session["DungDo"] = true;
                    }
                    ++_count;
                }
                ++count;
            }
                        
        }
        protected void btn_PhatSinh_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            for (int i = 0; i < int.Parse(cbb_ChonNgay.SelectedItem.Value); ++i)
            {
                var query = from _lichchieu in dt.LichChieuPhims
                                where _lichchieu.NgayChieu.CompareTo(DateTime.Today.AddDays(i + 1)) == 0
                                select _lichchieu;
                LichChieuPhim lichchieu = null;
                if (query.Count<LichChieuPhim>() == 0)
                {
                    lichchieu = new LichChieuPhim();
                    lichchieu.NgayChieu = DateTime.Today.AddDays(i + 1);
                    lichchieu.TinhTrang = true;
                    dt.LichChieuPhims.InsertOnSubmit(lichchieu);
                    dt.SubmitChanges();
                }
                else
                {
                    lichchieu = query.Single();
                }

                var dmSuatChieu = from _dmsc in dt.DanhMucSuatChieus
                                  where _dmsc.TinhTrang == true
                                  select _dmsc;
                foreach (DanhMucSuatChieu dmsc in dmSuatChieu)
                {
                    var suatchieu = from _suatchieu in dt.SuatChieus
                                    where _suatchieu.MaLichChieu == lichchieu.MaLichChieuPhim && _suatchieu.MaPhim == int.Parse(cbb_ChonPhim.SelectedItem.Value) && _suatchieu.MaPhong == int.Parse(cbb_Phong.SelectedItem.Value) && _suatchieu.MaDanhMucSuatChieu == dmsc.MaDanhMucSuatChieu
                                    select _suatchieu;
                    if (suatchieu.Count<SuatChieu>() == 0)
                    {
                        SuatChieu sc = new SuatChieu();
                        sc.MaLichChieu = lichchieu.MaLichChieuPhim;
                        sc.MaPhim = int.Parse(cbb_ChonPhim.SelectedItem.Value);
                        sc.MaPhong = int.Parse(cbb_Phong.SelectedItem.Value);
                        sc.MaDanhMucSuatChieu = dmsc.MaDanhMucSuatChieu;
                        sc.TinhTrang = false;
                        dt.SuatChieus.InsertOnSubmit(sc);
                        dt.SubmitChanges();
                    }
                }
            }
        }

        protected void btn_ThayDoi_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var suatchieu = from _suatchieu in dt.SuatChieus
                            where _suatchieu.MaSuatChieu == int.Parse(((LinkButton)sender).CommandArgument)
                            select _suatchieu;
            dt.SuatChieus.DeleteAllOnSubmit(suatchieu);
            dt.SubmitChanges();
        }

        protected void btn_XacNhan_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            if (Session["DungDo"] != null && (bool)Session["DungDo"] == true)
                lb_ThongBao.Text = "Vẫn còn đụng độ trên lịch chiếu - Thêm mới thất bại";
            else
            {
                for (int i = 0; i < int.Parse(cbb_ChonNgay.SelectedItem.Value); ++i)
                {
                    var query = from _lichchieu in dt.LichChieuPhims
                                where _lichchieu.NgayChieu.CompareTo(DateTime.Today.AddDays(i + 1)) == 0
                                select _lichchieu;
                    LichChieuPhim lichchieu = null;
                    if (query.Count<LichChieuPhim>() == 0)
                    {
                        lichchieu = new LichChieuPhim();
                        lichchieu.NgayChieu = DateTime.Today.AddDays(i + 1);
                        lichchieu.TinhTrang = true;
                        dt.LichChieuPhims.InsertOnSubmit(lichchieu);
                        dt.SubmitChanges();
                    }
                    else
                    {
                        lichchieu = query.Single();
                    }
                    var dsSuatChieu = from _suatchieu in dt.SuatChieus
                                      where _suatchieu.MaLichChieu == lichchieu.MaLichChieuPhim && _suatchieu.MaPhim == int.Parse(cbb_ChonPhim.SelectedItem.Value) && _suatchieu.MaPhong == int.Parse(cbb_Phong.SelectedItem.Value) && _suatchieu.TinhTrang == false
                                      select _suatchieu;
                    foreach (SuatChieu _suatchieu in dsSuatChieu)
                    {
                        _suatchieu.TinhTrang = true;
                        dt.SubmitChanges();
                    }
                    var dsSuatChieuTam = from _suatchieu in dt.SuatChieus
                                         where _suatchieu.TinhTrang == false
                                         select _suatchieu;
                    dt.SuatChieus.DeleteAllOnSubmit(dsSuatChieuTam);
                    dt.SubmitChanges();
                }
            }
        }
    }
}