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
            if (!IsPostBack)
            {
                ddl_LoaiTimKiem.Items.Add("Tên phim");
                ddl_LoaiTimKiem.Items.Add("Lịch chiếu");
                ddl_LoaiTimKiem.Items.Add("Suất chiếu");

                lb_NhapTenPhim.Visible = true;
                tb_TenPhim.Visible = true;
                bt_TimKiemPhim.Visible = true;

                lb_NgayChieu.Visible = false;
                cld_Lich.Visible = false;

                lb_SuatChieu.Visible = false;
                dtl_SuatChieu.Visible = false;
                bt_TimKiemSuatChieu.Visible = false;
            }
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

        protected void bt_TimKiem_Click(object sender, EventArgs e)
        {
            Session["TenPhimTimKiem"] = tb_TenPhim.Text;
            Response.Redirect("/phim/TraCuuPhim.aspx");
        }

        protected void ddl_LoaiTimKiem_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddl_LoaiTimKiem.Text)
            {
                case "Tên phim":
                    {
                        lb_NhapTenPhim.Visible = true;
                        tb_TenPhim.Visible = true;
                        bt_TimKiemPhim.Visible = true;

                        lb_NgayChieu.Visible = false;
                        cld_Lich.Visible = false;

                        lb_SuatChieu.Visible = false;
                        dtl_SuatChieu.Visible = false;
                        bt_TimKiemSuatChieu.Visible = false;
                        break;
                    }
                case "Lịch chiếu":
                    {
                        lb_NhapTenPhim.Visible = false;
                        tb_TenPhim.Visible = false;
                        bt_TimKiemPhim.Visible = false;

                        lb_NgayChieu.Visible = true;
                        cld_Lich.Visible = true;

                        lb_SuatChieu.Visible = false;
                        dtl_SuatChieu.Visible = false;
                        bt_TimKiemSuatChieu.Visible = false;
                        break;
                    }
                case "Suất chiếu":
                    {
                        lb_NhapTenPhim.Visible = false;
                        tb_TenPhim.Visible = false;
                        bt_TimKiemPhim.Visible = false;

                        lb_NgayChieu.Visible = false;
                        cld_Lich.Visible = false;

                        lb_SuatChieu.Visible = true;
                        dtl_SuatChieu.Visible = true;
                        bt_TimKiemSuatChieu.Visible = true;
                        break;
                    }
            }
        }
    }
}
