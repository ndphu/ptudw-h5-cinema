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
    public partial class DangKiTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                NguoiDung nd = new NguoiDung();

                MD5 md5Hasher = MD5.Create();
                byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(Th_MatKhau.Text));

                StringBuilder sBuilder = new StringBuilder();
                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
                string strPassword = sBuilder.ToString();

                nd.TenNguoiDung = Th_TenTaiKhoan.Text;
                nd.MatKhau = strPassword;
                nd.Email = Th_Email.Text;
                nd.DiaChi = Th_DiaChi.Text;
                nd.MaDanhMucNguoiDung = 3;
                nd.TinhTrang = 1;
                dt.NguoiDungs.InsertOnSubmit(nd);

                dt.SubmitChanges();
                Response.Redirect("TaoTaiKhoanThanhCong.aspx");
            }
            catch
            {

            }
        }
    }
}