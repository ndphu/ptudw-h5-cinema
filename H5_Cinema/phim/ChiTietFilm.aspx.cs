using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SelectedFilmID"] == null)
                return;
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = from f in dt.Phims
                        where f.MaPhim == int.Parse(Session["SelectedFilmID"].ToString())
                        select f;
            foreach (Phim f in query)
            {
                Th_TenPhim.Text = f.TenPhim;
                Th_ThoiLuong.Text = f.ThoiLuong.ToString() + " phút";
                Th_DaoDien.Text = f.DaoDien;
                Th_Diem.Text = f.DiemDanhGia.ToString();
                //Th_TheLoai.Text = f.TheLoai;
                Th_TheLoai.Text = f.DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim;
                Th_DienVien.Text = f.DienVienThamGia;
                Th_HinhAnh.ImageUrl = f.AnhPhim;
                Th_TomTat.Text = f.NoiDung;
            }
        }

        protected void Xl_ThemBinhLuan_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            BinhLuan bl = new BinhLuan();
            bl.MaPhim = int.Parse(Session["SelectedFilmID"].ToString());
            bl.NoiDungBinhLuan = Th_BinhLuanMoi.Text;
            bl.MaNguoiDung = 3;
            bl.TinhTrang = 3;

            dt.BinhLuans.InsertOnSubmit(bl);

            dt.SubmitChanges();
        }

        
    }
}