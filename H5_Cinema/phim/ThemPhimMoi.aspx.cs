using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                int maxMaPhim = -1;
                try
                {
                    maxMaPhim = (from film in dt.Phims select film.MaPhim).Max();
                }
                catch
                {
                    maxMaPhim = 1;
                }
                string posterFileName =  (maxMaPhim + 1).ToString() + Th_AnhPhim.FileName.Substring(Th_AnhPhim.FileName.Length - 4);
                string posterName = "/phim/poster/" + posterFileName;
                Th_AnhPhim.SaveAs(Server.MapPath("/phim/poster/") + posterFileName);
                string trailerFileName = (maxMaPhim + 1).ToString() + Th_Trailer.FileName.Substring(Th_Trailer.FileName.Length - 4);
                string trailerName = "/phim/trailer/" + trailerFileName;
                Th_Trailer.SaveAs(Server.MapPath("/phim/trailer/") + trailerFileName);

                Phim phim = new Phim();
                phim.TenPhim = Th_TenPhim.Text;
                phim.TheLoai = int.Parse(DropDownList1.SelectedItem.Value);
                phim.DaoDien = Th_DaoDien.Text;
                phim.DienVienThamGia = Th_DienVien.Text;
                phim.NoiDung = Th_NoiDung.Text;
                phim.NgonNgu = Th_NgonNgu.Text;
                phim.ThoiLuong = int.Parse(Th_ThoiLuong.Text);
                phim.DiemDanhGia = 0;
                phim.TinhTrang = true;
                phim.AnhPhim = posterName;
                phim.TrailerPhim = trailerName;
                phim.LoaiPhim = int.Parse(DropDownList2.SelectedItem.Value);

                dt.Phims.InsertOnSubmit(phim);

                dt.SubmitChanges();
                Session["SelectedFilmID"] = phim.MaPhim;
                Response.Redirect("ThemPhimThanhCong.aspx");
            }
            catch
            {

            }
        }
    }
}