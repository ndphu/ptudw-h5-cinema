using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Th_TenPhim.Text == null || Th_TenPhim.Text.Trim().Length == 0)
                {
                    CinemaLINQDataContext dt = new CinemaLINQDataContext();

                    Th_TenPhim.Text = ((Phim)Session["CurrentPhim"]).TenPhim;
                    Th_DaoDien.Text = ((Phim)Session["CurrentPhim"]).DaoDien;
                    Th_DienVien.Text = ((Phim)Session["CurrentPhim"]).DienVienThamGia;
                    Th_NgonNgu.Text = ((Phim)Session["CurrentPhim"]).NgonNgu;
                    Th_NoiDung.Text = ((Phim)Session["CurrentPhim"]).NoiDung;
                    Th_ThoiLuong.Text = ((Phim)Session["CurrentPhim"]).ThoiLuong.ToString();

                    Image1.ImageUrl = ((Phim)Session["CurrentPhim"]).AnhPhim;
                }
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }
        
        protected void Xl_CapNhatThayDoi_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            var query = (from phim in dt.Phims
                         where phim.MaPhim == ((Phim)Session["CurrentPhim"]).MaPhim
                         select phim).Single();

            query.TenPhim = Th_TenPhim.Text;
            query.NoiDung = Th_NoiDung.Text;
            query.TheLoai = int.Parse(DropDownList1.SelectedItem.Value);
            query.LoaiPhim = int.Parse(DropDownList2.SelectedItem.Value);
            query.ThoiLuong = int.Parse(Th_ThoiLuong.Text);
            query.DienVienThamGia = Th_DienVien.Text;
            query.DaoDien = Th_DaoDien.Text;
            query.NgonNgu = Th_NgonNgu.Text;
            if (Th_AnhPhim.FileName != null && Th_AnhPhim.FileName.Trim().Length != 0)
            {
                string posterFileName = query.MaPhim.ToString() + Th_AnhPhim.FileName.Substring(Th_AnhPhim.FileName.Length - 4);
                string posterName = "/phim/poster/" + posterFileName;
                Th_AnhPhim.SaveAs(Server.MapPath("/phim/poster/") + posterFileName);
                query.AnhPhim = posterName;
            }

            if (Th_Trailer.FileName != null && Th_Trailer.FileName.Trim().Length != 0)
            {
                string trailerFileName = query.MaPhim.ToString() + Th_Trailer.FileName.Substring(Th_Trailer.FileName.Length - 4);
                string trailerName = "/phim/trailer/" + trailerFileName;
                Th_Trailer.SaveAs(Server.MapPath("/phim/trailer/") + trailerFileName);
                query.TrailerPhim = trailerName;
            }
            
            dt.SubmitChanges();
            Session["CurrentPhim"] = query;
            Response.Redirect("default.aspx");
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.SelectedIndex = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByValue(((Phim)Session["CurrentPhim"]).TheLoai.ToString()));
        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {
            DropDownList2.SelectedIndex = DropDownList2.Items.IndexOf(DropDownList2.Items.FindByValue(((Phim)Session["CurrentPhim"]).LoaiPhim.ToString()));
        }
    }
}