using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

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

                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                List<DanhMucSuatChieu> _dsDMSC = (from _dmsc in dt.DanhMucSuatChieus
                                                 orderby _dmsc.ThoiGianBatDau ascending
                                                 select _dmsc).ToList();

                dtl_SuatChieu.DataSource = _dsDMSC;
                dtl_SuatChieu.DataBind();

                if (_dsDMSC.Count > 0)
                {
                    int _count = 0;
                    foreach (DanhMucSuatChieu _dmsc in _dsDMSC)
                    {
                        ((LinkButton)dtl_SuatChieu.Items[_count].FindControl("lbt_SuatChieu")).Text = _dsDMSC[_count].ThoiGianBatDau.ToString("HH:mm");
                        _count++;
                    }
                }

                if (Session["SearchMode"] == null)
                    Session["SearchMode"] = "Tên phim";
                Display_SearchMode(Session["SearchMode"].ToString());

                NguoiDung nd = (NguoiDung)Session["NguoiDung"];

                if (nd == null)
                {
                    panel_DangNhap.Visible = true;
                    panel_NguoiDung.Visible = false;
                }
                else
                {
                    panel_DangNhap.Visible = false;
                    panel_NguoiDung.Visible = true;
                    lb_TenNguoiDung.Text = nd.TenNguoiDung;
                }

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
            Display_SearchMode(ddl_LoaiTimKiem.Text);
        }

        public void Display_SearchMode(string _searchMode)
        {
            switch (_searchMode)
            {
                case "Tên phim":
                    {
                        Session["SearchMode"] = "Tên phim";
                        lb_NhapTenPhim.Visible = true;
                        tb_TenPhim.Visible = true;
                        bt_TimKiemPhim.Visible = true;

                        lb_NgayChieu.Visible = false;
                        cld_Lich.Visible = false;

                        lb_SuatChieu.Visible = false;
                        dtl_SuatChieu.Visible = false;

                        ddl_LoaiTimKiem.SelectedIndex = 0;
                        break;
                    }
                case "Lịch chiếu":
                    {
                        Session["SearchMode"] = "Lịch chiếu";
                        lb_NhapTenPhim.Visible = false;
                        tb_TenPhim.Visible = false;
                        bt_TimKiemPhim.Visible = false;

                        lb_NgayChieu.Visible = true;
                        cld_Lich.Visible = true;

                        lb_SuatChieu.Visible = false;
                        dtl_SuatChieu.Visible = false;

                        ddl_LoaiTimKiem.SelectedIndex = 1;
                        break;
                    }
                case "Suất chiếu":
                    {
                        Session["SearchMode"] = "Suất chiếu";
                        lb_NhapTenPhim.Visible = false;
                        tb_TenPhim.Visible = false;
                        bt_TimKiemPhim.Visible = false;

                        lb_NgayChieu.Visible = false;
                        cld_Lich.Visible = false;

                        lb_SuatChieu.Visible = true;
                        dtl_SuatChieu.Visible = true;

                        ddl_LoaiTimKiem.SelectedIndex = 2;
                        break;
                    }
            }
        }

        public void cld_Lich_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["SearchMode"].ToString() == "Lịch chiếu")
            {
                Session["ThoiGianTimKiem"] = cld_Lich.SelectedDate;
                Response.Redirect("/lichchieu/TraCuuLichChieu.aspx");
            }
        }

        protected void Xl_DangNhap__Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();
                Session["PreviousUrl"] = Request.Url.AbsolutePath;
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
                if (query.TinhTrang == dt.DanhMucTinhTrangNguoiDungs.Where(ttnd => ttnd.TenDanhMucTinhTrangNguoiDung.CompareTo("Tạm khóa") == 0).Select(ttnd => ttnd.MaDanhMucTinhTrangNguoiDung).Single())
                {
                    Th_ThongBaoDangNhap.Text = "Tài khoản đã bị khóa, vui lòng kiểm tra lại";
                    Th_ThongBaoDangNhap.Visible = true;
                }
                else
                {
                    Session["NguoiDung"] = query;
                    Response.Redirect(Request.Url.AbsolutePath);
                }
            }
            catch
            {
                Th_ThongBaoDangNhap.Text = "Sai tên đăng nhập hoặc mật khẩu";
                Th_ThongBaoDangNhap.Visible = true;
            }
        }

        protected void Xl_DangXuat__Click(object sender, EventArgs e)
        {
            Session["NguoiDung"] = null;
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}
