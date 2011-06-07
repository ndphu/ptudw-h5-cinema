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
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            string posterName = "/phim/poster/" + Th_TenPhim.Text + Th_Trailer.FileName;
            Th_AnhPhim.SaveAs(Server.MapPath("/phim/poster/") + Th_TenPhim.Text + Th_AnhPhim.FileName);
            string trailerName = "/phim/trailer/" +Th_TenPhim.Text + Th_Trailer.FileName;
            Th_Trailer.SaveAs(Server.MapPath("/phim/trailer/") + Th_TenPhim.Text + Th_Trailer.FileName);

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

            dt.Phims.InsertOnSubmit(phim);

            dt.SubmitChanges();
        }
    }
}