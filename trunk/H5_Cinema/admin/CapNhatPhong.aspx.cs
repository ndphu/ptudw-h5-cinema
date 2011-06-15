using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdatePanel1_PreRender(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            if (cbb_Phong.SelectedIndex != -1)
            {
                var phong = (from _phong in dt.PhongChieuPhims
                             where _phong.MaPhongChieuPhim == int.Parse(cbb_Phong.SelectedItem.Value)
                             select _phong).Single();
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
            }
            else
            {

            }
        }

        protected void btn_Chuyen_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var phong = (from _phong in dt.PhongChieuPhims
                         where _phong.MaPhongChieuPhim == int.Parse(cbb_Phong.SelectedItem.Value)
                         select _phong).Single();

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

        protected void btn_CapNhatHoanTat_Click(object sender, EventArgs e)
        {
            Session["Phong"] = null;
            Response.Redirect("/admin/default.aspx");
        }

    }
}