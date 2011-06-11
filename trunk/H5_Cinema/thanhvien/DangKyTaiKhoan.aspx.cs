using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Drawing;

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
                    nd.MaDanhMucNguoiDung = dt.DanhMucNguoiDungs.Where(dmnd => dmnd.TenDanhMucNguoiDung.CompareTo("Member") == 0).Select(dmnd => dmnd.MaDanhMucNguoiDung).Single();
                    nd.TinhTrang = dt.DanhMucTinhTrangNguoiDungs.Where(ttnd => ttnd.TenDanhMucTinhTrangNguoiDung.CompareTo("Bình thường") == 0).Select(ttnd => ttnd.MaDanhMucTinhTrangNguoiDung).Single();
                    dt.NguoiDungs.InsertOnSubmit(nd);

                    dt.SubmitChanges();
                    Response.Redirect("TaoTaiKhoanThanhCong.aspx");
                }
                else
                {
                    Label3.Text = "Tên tài khoản đã tồn tại";
                    Label3.ForeColor = Color.Red;
                    Label3.Visible = true;
                }
            }
            catch
            {

            }
        }

        protected void Check_Click(object sender, EventArgs e)
        {
             CinemaLINQDataContext dt = new CinemaLINQDataContext();

                var query = from nguoiDung in dt.NguoiDungs
                            where nguoiDung.TenNguoiDung.CompareTo(Th_TenTaiKhoan.Text) == 0
                            select nguoiDung;
                if (query.Count<NguoiDung>() == 0)
                {
                    Label3.Text = "Bạn có thể sử dụng tên này";
                    Label3.ForeColor = Color.Green;
                    Label3.Visible = true;
                }
                else
                {
                    Label3.Text = "Tên tài khoản đã tồn tại";
                    Label3.ForeColor = Color.Red;
                    Label3.Visible = true;
                }
        }
    }
}