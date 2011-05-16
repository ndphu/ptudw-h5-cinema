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
            var query = from f in dt.Films
                        where f.ID == Session["SelectedFilmID"].ToString()
                        select f;
            foreach (Film f in query)
            {
                Th_TenPhim.Text = f.Name;
                Th_ThoiLuong.Text = f.Length.ToString() + " phút";
                Th_DaoDien.Text = f.Director;
                Th_Diem.Text = f.Rate.ToString();
                Th_TheLoai.Text = f.Type;
                Th_DienVien.Text = f.LeadActors;
                Th_HinhAnh.ImageUrl = f.PlaybillAdd;
                Th_TomTat.Text = f.BriefStory;
            }
        }

        protected void Xl_ThemBinhLuan_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            Comment cm = new Comment();
            cm.ID_Film = Session["SelectedFilmID"].ToString();
            cm.Comment1 = Th_BinhLuanMoi.Text;
            cm.ID_User = "US001";

            dt.Comments.InsertOnSubmit(cm);

            dt.SubmitChanges();
        }
    }
}