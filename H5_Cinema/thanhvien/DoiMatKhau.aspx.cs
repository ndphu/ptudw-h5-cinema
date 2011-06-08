using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace H5_Cinema.thanhvien
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NguoiDung"]==null)
                Response.Redirect("/thanhvien/YeuCauDangNhap.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MD5 md5Hasher = MD5.Create();
                byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(Th_MatKhauCu.Text));

                StringBuilder sBuilder = new StringBuilder();
                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
                string strPassword = sBuilder.ToString();
                if (strPassword.CompareTo(((NguoiDung)Session["NguoiDung"]).MatKhau) == 0)
                {
                    CinemaLINQDataContext dt = new CinemaLINQDataContext();
                    var query = (from nd in dt.NguoiDungs
                                 where nd.MaNguoiDung == ((NguoiDung)Session["NguoiDung"]).MaNguoiDung
                                 select nd).Single();
                    MD5 md5Hasher1 = MD5.Create();
                    byte[] data1 = md5Hasher1.ComputeHash(Encoding.Default.GetBytes(Th_MatKhauMoi.Text));

                    StringBuilder sBuilder1 = new StringBuilder();
                    for (int i = 0; i < data1.Length; i++)
                    {
                        sBuilder1.Append(data1[i].ToString("x2"));
                    }
                    string strPassword1 = sBuilder1.ToString();
                    query.MatKhau = strPassword1;

                    dt.SubmitChanges();
                    Response.Redirect("/thanhvien/DoiMatKhauThanhCong.aspx");
                }
                else
                {
                    Label2.Text = "Mật khẩu cũ không chính xác";
                    Label2.Visible = true;
                }
            }
            catch
            {

            }
        }
    }
}