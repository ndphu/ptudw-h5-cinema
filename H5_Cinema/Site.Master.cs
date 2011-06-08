using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Xl_DangNhap_Click(object sender, EventArgs e)
        {
            Response.Redirect("/thanhvien/dangnhap.aspx");
        }

        protected void Xl_DangXuat_Click(object sender, EventArgs e)
        {
            Session["NguoiDung"] = null;
            Response.Redirect("/thanhvien/dangxuat.aspx");
        }

        protected void Xl_DangKy_Click(object sender, EventArgs e)
        {
            Response.Redirect("/thanhvien/DangKyTaiKhoan.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/thanhvien/thaydoithongtintaikhoan.aspx");
        }
    }
}
