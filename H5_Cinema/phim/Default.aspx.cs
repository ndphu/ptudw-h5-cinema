using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = from film in dt.Films
                        select film;
            List<MyFilm> dsFilm = new List<MyFilm>();
            foreach (Film f in query)
            {
                dsFilm.Add(new MyFilm
                {
                    TenFilm = f.Name,
                    DaoDien = f.Director,
                    DienVien = f.LeadActors,
                    TheLoai = f.Type,
                    NoiDung = f.BriefStory,
                    ThoiLuong = f.Length.Value,
                });                
            }
            Th_DsFilm.DataSource = dsFilm;
            Th_DsFilm.DataBind();*/

        }
        class MyFilm
        {
            string tenFilm;

            public string TenFilm
            {
                get { return tenFilm; }
                set { tenFilm = value; }
            }
            string theLoai;

            public string TheLoai
            {
                get { return theLoai; }
                set { theLoai = value; }
            }
            string daoDien;

            public string DaoDien
            {
                get { return daoDien; }
                set { daoDien = value; }
            }
            string dienVien;

            public string DienVien
            {
                get { return dienVien; }
                set { dienVien = value; }
            }
            string noiDung;

            public string NoiDung
            {
                get { return noiDung; }
                set { noiDung = value; }
            }
            int thoiLuong;

            public int ThoiLuong
            {
                get { return thoiLuong; }
                set { thoiLuong = value; }
            }
        }

        protected void Th_DsFilm_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Th_DsFilm_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ChiTiet_Click(object sender, EventArgs e)
        {
            Session["SelectedFilmID"] = ((Button)sender).CommandName;
            Response.Redirect("../phim/ChiTietFilm.aspx");
        }
    }
}