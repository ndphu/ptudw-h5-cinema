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
    public partial class ThemTaiKhoanMoi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NguoiDung"] == null)
                Response.Redirect("/thanhvien/YeuCauDangNhap.aspx");
            else
                if (((NguoiDung)Session["NguoiDung"]).MaDanhMucNguoiDung != 1)
                    Response.Redirect("/thanhvien/YeuCauQuyenAdmin.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();

                var query = from nguoiDung in dt.NguoiDungs
                            where nguoiDung.TenNguoiDung.CompareTo(Th_TenTaiKhoan.Text) == 0
                            select nguoiDung;
                if (query.Count<NguoiDung>() == 0)
                {

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
                    nd.MaDanhMucNguoiDung = int.Parse(DropDownList2.SelectedItem.Value);
                    nd.TinhTrang = 1;
                    dt.NguoiDungs.InsertOnSubmit(nd);

                    dt.SubmitChanges();
                    Response.Redirect("TaoTaiKhoanThanhCong.aspx");
                }
                else
                {
                    Label2.Text = "Tên tài khoản đã tồn tại";
                    Label2.Visible = true;
                }
            }
            catch
            {

            }
        }
    }
}