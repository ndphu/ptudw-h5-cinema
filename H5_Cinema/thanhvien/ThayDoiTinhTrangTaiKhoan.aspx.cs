using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace H5_Cinema.thanhvien
{
    public partial class ThayDoiTinhTrangTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NguoiDung"] == null)
                Response.Redirect("/thanhvien/YeuCauDangNhap.aspx");
            else
                if (((NguoiDung)Session["NguoiDung"]).MaDanhMucNguoiDung != 1)
                    Response.Redirect("/thanhvien/YeuCauQuyenAdmin.aspx");
        }

        protected void Xl_CapNhatThayDoi_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                var query = from nd in dt.NguoiDungs
                             where nd.TenNguoiDung == Th_TenTaiKhoan.Text
                             select nd;
                if (query.Count<NguoiDung>() == 0)
                {
                    Label3.Text = "Tài khoản không tồn tại";
                    Label3.ForeColor = Color.Red;
                    Label3.Visible = true;
                }
                else
                {
                    query.Single().TinhTrang = int.Parse(DropDownList2.SelectedItem.Value);
                    dt.SubmitChanges();

                    Response.Redirect("ThayDoiThongTinTaiKhoanThanhCong.aspx");
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
                Label3.Text = "Tài khoản không tồn tại";
                Label3.ForeColor = Color.Red;
                Label3.Visible = true;
            }
            else
            {
                //Label3.Text = "Hiển thị thông tin thành công";
                //Label3.ForeColor = Color.Green;
                //Label3.Visible = true;
                Xl_CapNhatThayDoi.Enabled = true;
                var query1 = (from nd in dt.NguoiDungs
                              where nd.TenNguoiDung == Th_TenTaiKhoan.Text
                              select nd).Single();
                //ChinhSuaThongTinTaiKhoan.nd = query1;
                DropDownList2.SelectedIndex = DropDownList2.Items.IndexOf(DropDownList2.Items.FindByValue(query1.TinhTrang.ToString()));

            }
        }
    }
}