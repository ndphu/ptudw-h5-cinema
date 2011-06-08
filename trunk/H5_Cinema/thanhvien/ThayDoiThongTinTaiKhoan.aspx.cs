using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema.thanhvien
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NguoiDung"] == null)
                Response.Redirect("/thanhvien/YeuCauDangNhap.aspx");
            else
            {
                try
                {
                    if (Lb_TenTaiKhoan.Text == null || Lb_TenTaiKhoan.Text.Trim().Length == 0)
                    {
                        CinemaLINQDataContext dt = new CinemaLINQDataContext();
                        Lb_TenTaiKhoan.Text = ((NguoiDung)Session["NguoiDung"]).TenNguoiDung;
                        Th_Email.Text = ((NguoiDung)Session["NguoiDung"]).Email.Trim();
                        Th_DiaChi.Text = ((NguoiDung)Session["NguoiDung"]).DiaChi;
                    }
                }
                catch
                {

                }
            }
        }

        protected void Xl_CapNhatThayDoi_Click(object sender, EventArgs e)
        {
            try
            {

                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                var query = (from nd in dt.NguoiDungs
                             where nd.MaNguoiDung == ((NguoiDung)Session["NguoiDung"]).MaNguoiDung
                             select nd).Single();

                query.Email = Th_Email.Text;
                query.DiaChi = Th_DiaChi.Text;

                dt.SubmitChanges();
                Label2.Text = "Cập nhật thông tin tài khoản thành công";
                Label2.Visible = true;
                Session["NguoiDung"] = query;
            }
            catch
            {

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoiMatKhau.aspx");
        }
    }
}