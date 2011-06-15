using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Xl_XemSoDoGhe_Click(object sender, EventArgs e)
        {
            int soHang = int.Parse(tb_SoHangGhe.Text);
            int soGheTrenHang = int.Parse(tb_SoGheTrenHang.Text);
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            PhongChieuPhim phong = new PhongChieuPhim();
            phong.MaRapChieuPhim = int.Parse(cbb_RapPhim.SelectedItem.Value);
            phong.TenPhongChieuPhim = tb_TenPhong.Text;
            phong.TongSoLuongGhe = soGheTrenHang * soHang;
            phong.TinhTrang = false;
            phong.SoHang = soHang;
            phong.SoGheTrenHang = soGheTrenHang;
            dt.PhongChieuPhims.InsertOnSubmit(phong);

            dt.SubmitChanges();

            for (int i = 0; i < soHang; ++i)
            {
                for (int j = 0; j < soGheTrenHang; ++j)
                {
                    Ghe ghe = new Ghe();
                    ghe.MaPhongChieuPhim = phong.MaPhongChieuPhim;
                    ghe.TenGhe = "Ghe";
                    ghe.MaDanhMucGhe = dt.DanhMucGhes.Where(dmg => dmg.TenDanhMucGhe.CompareTo("Thường") == 0).Select(dmg => dmg.MaDanhMucGhe).Single();
                    ghe.Hang = i;                    
                    ghe.SoThuTu = j;
                    ghe.TinhTrang = -1;
                    dt.Ghes.InsertOnSubmit(ghe);
                    dt.SubmitChanges();
                }
            }

            Session["Phong"] = (PhongChieuPhim)phong;
        }

        void btn_Ghe_Click(object sender, ImageClickEventArgs e)
        {
            ((ImageButton)sender).ImageUrl = "/Img/ghevip.jpg";
        }

        protected void UpdatePanel1_PreRender(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            PhongChieuPhim phong = (PhongChieuPhim)Session["Phong"];
            if (phong != null)
            {
                var query = from ghe in dt.Ghes
                            where ghe.MaPhongChieuPhim == phong.MaPhongChieuPhim
                            select ghe;
                dl_SoDoGhe.DataSource = query;
                dl_SoDoGhe.DataBind();
                dl_SoDoGhe.RepeatColumns = phong.SoGheTrenHang;
                int _count = 0;
                foreach (Ghe ghe in query)
                {
                    ImageButton imgbtn = (ImageButton)dl_SoDoGhe.Items[_count].FindControl("btn_Chuyen");
                    imgbtn.ToolTip = (char)(ghe.Hang + 65) + (ghe.SoThuTu + 1).ToString() + " - Ghế " + ghe.DanhMucGhe.TenDanhMucGhe;
                    if (ghe.DanhMucGhe.TenDanhMucGhe.CompareTo("Thường") == 0)
                        imgbtn.ImageUrl = "/Img/ghethuong.jpg";
                    else
                        imgbtn.ImageUrl = "/Img/ghevip.jpg";
                    _count++;
                }
            }
            else
            {
                Response.Redirect("/admin/default.aspx");
            }
        }

        protected void btn_Chuyen_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            if (Session["Phong"] == null)
                Response.Redirect("/admin/default.aspx");

            Ghe ghe = dt.Ghes.Where(_ghe => _ghe.MaGhe == int.Parse(((ImageButton)sender).CommandArgument)).Select(_ghe => _ghe).Single();

            if (ghe.MaDanhMucGhe == dt.DanhMucGhes.Where(dmg => dmg.TenDanhMucGhe.CompareTo("Thường") == 0).Select(dmg => dmg.MaDanhMucGhe).Single())
            {
                ghe.MaDanhMucGhe = dt.DanhMucGhes.Where(dmg => dmg.TenDanhMucGhe.CompareTo("Vip") == 0).Select(dmg => dmg.MaDanhMucGhe).Single();
            }
            else
            {
                ghe.MaDanhMucGhe = dt.DanhMucGhes.Where(dmg => dmg.TenDanhMucGhe.CompareTo("Thường") == 0).Select(dmg => dmg.MaDanhMucGhe).Single();
            }

            dt.SubmitChanges();
        }

        protected void btn_ThemPhongMoi_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            PhongChieuPhim phong = (PhongChieuPhim)Session["Phong"];
            if (phong == null)
                Response.Redirect("/admin/default.aspx");
            var __phong = (from _phong in dt.PhongChieuPhims
                         where _phong.MaPhongChieuPhim == phong.MaPhongChieuPhim
                         select _phong).Single();

            __phong.TinhTrang = true;
            dt.SubmitChanges();
           
            var dsGhe = from _ghe in dt.Ghes
                        where _ghe.MaPhongChieuPhim == __phong.MaPhongChieuPhim
                        select _ghe;
            foreach (Ghe _ghe in dsGhe)
            {
                _ghe.TinhTrang = 1;
            }
            dt.SubmitChanges();

            var dsGheTam = from _ghe in dt.Ghes
                           where _ghe.TinhTrang == -1
                           select _ghe;

            dt.Ghes.DeleteAllOnSubmit(dsGheTam);
            dt.SubmitChanges();

            var dsPhongTam = from _phong in dt.PhongChieuPhims
                             where _phong.TinhTrang == false
                             select _phong;

            dt.PhongChieuPhims.DeleteAllOnSubmit(dsPhongTam);
            dt.SubmitChanges();

            Session["Phong"] = null;
            Response.Redirect("/admin/ThemPhongThanhCong.aspx");            
        }
    }
}