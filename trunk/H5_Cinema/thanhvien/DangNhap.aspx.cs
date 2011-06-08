using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace H5_Cinema
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Xl_DangNhap_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();

                string tenDangNhap = Th_TenDangNhap.Text;
                string matKhau = Th_MatKhau.Text;
                MD5 md5Hasher = MD5.Create();
                byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(matKhau));

                StringBuilder sBuilder = new StringBuilder();
                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
                string strPassword = sBuilder.ToString();

                var query = (from nguoiDung in dt.NguoiDungs
                             where tenDangNhap.CompareTo(nguoiDung.TenNguoiDung) == 0 && strPassword.CompareTo(nguoiDung.MatKhau) == 0
                             select nguoiDung).Single();
                Session["NguoiDung"] = query;
                Response.Redirect("dangnhapthanhcong.aspx");
            }
            catch
            {
                Label2.Text = "Sai tên đăng nhập hoặc mật khẩu";
                Label2.Visible = true;
            }
        }
    }
}