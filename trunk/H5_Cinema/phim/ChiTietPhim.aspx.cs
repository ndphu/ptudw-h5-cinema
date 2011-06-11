using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace H5_Cinema
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
                    
            
            KiemTraQuyenBinhLuan(dt);
            LoadThongTinPhim(dt, ((Phim)Session["CurrentPhim"]));
            if (!IsPostBack)
            {
                try
                {
                    //Th_HinhAnh.ImageUrl = ((Phim)Session["CurrentPhim"]).AnhPhim;
                    //KiemTraQuyenBinhLuan(dt);
                    //FormView_Phim.DataSource = from phim in dt.Phims
                    //                           where phim.MaPhim == currentPhim.MaPhim
                    //                           select phim;
                    //FormView_Phim.DataBind();
                    
                }
                catch
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                
            }
        }

        private void LoadThongTinPhim(CinemaLINQDataContext dt, Phim currentPhim)
        {
            FormView_Phim.DataSource = from phim in dt.Phims
                                       where phim.MaPhim == currentPhim.MaPhim
                                       select phim;
            FormView_Phim.DataBind();
        }
        protected void Xl_ThemBinhLuan_Click(object sender, EventArgs e)
        {
            try
            {
                CinemaLINQDataContext dt = new CinemaLINQDataContext();

                BinhLuan bl = new BinhLuan();
                bl.MaPhim = ((Phim)Session["CurrentPhim"]).MaPhim;
                bl.NoiDungBinhLuan = Th_BinhLuanMoi.Text;
                bl.MaNguoiDung = ((NguoiDung)Session["NguoiDung"]).MaNguoiDung;
                bl.TinhTrang = dt.DanhMucTinhTrangBinhLuans.Where(ttbl => ttbl.TenTinhTrang.CompareTo("Bình thường")==0).Select(ttbl => ttbl.MaTinhTrang).Single();
                bl.ThoiGianBinhLuan = DateTime.Now;
                dt.BinhLuans.InsertOnSubmit(bl);

                dt.SubmitChanges();

                Th_BinhLuanMoi.Text = "";
                //Response.Redirect("/phim/chitietphim.aspx");
            }
            catch
            {
                //Response.Redirect("/phim/chitietphim.aspx");
            }
        }

        protected void Xl_ChinhSua_Click(object sender, EventArgs e)
        {            
            Response.Redirect("ChinhSuaPhim.aspx");            
        }

        protected void Xl_Xoa_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = (from binhLuan in dt.BinhLuans
                         where binhLuan.MaBinhLuan == int.Parse(((Button)sender).CommandArgument)
                         select binhLuan).Single();
            query.TinhTrang = dt.DanhMucTinhTrangBinhLuans.Where(ttbl => ttbl.TenTinhTrang.CompareTo("Đã xóa") == 0).Select(ttbl => ttbl.MaTinhTrang).Single(); ;
            dt.SubmitChanges();
        }

        protected void Xl_Sua_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = (from binhLuan in dt.BinhLuans
                         where binhLuan.MaBinhLuan == int.Parse(((Button)sender).CommandName)
                         select binhLuan).Single();
            //query.NoiDungBinhLuan = Th_NoiDungBinhLuan.Text;
            dt.SubmitChanges();
        }
        protected void UpdatePanel1_PreRender(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            NguoiDung nguoiDung = ((NguoiDung)Session["NguoiDung"]);
            var query = from binhLuan in dt.BinhLuans
                        where binhLuan.MaPhim == ((Phim)Session["CurrentPhim"]).MaPhim && binhLuan.TinhTrang == dt.DanhMucTinhTrangBinhLuans.Where(ttbl => ttbl.TenTinhTrang.CompareTo("Bình thường")==0).Select(ttbl => ttbl.MaTinhTrang).Single()
                        select binhLuan;

            DataList1.DataSource = query;
            DataList1.DataBind();

            int _count = 0;
            foreach (BinhLuan _bl in query)
            {
                if (nguoiDung != null && (nguoiDung.MaDanhMucNguoiDung == dt.DanhMucNguoiDungs.Where(dmnd=> dmnd.TenDanhMucNguoiDung.CompareTo("Admin") == 0).Select(dmnd=>dmnd.MaDanhMucNguoiDung).Single() || nguoiDung.MaNguoiDung == _bl.MaNguoiDung))
                {
                    ((TextBox)DataList1.Items[_count].FindControl("Th_NoiDungBinhLuan")).ReadOnly = false;
                    DataList1.Items[_count].FindControl("Xl_Sua").Visible = true;
                    DataList1.Items[_count].FindControl("Xl_Xoa").Visible = true;
                }
                else
                {
                    ((TextBox)DataList1.Items[_count].FindControl("Th_NoiDungBinhLuan")).ReadOnly = true;
                    DataList1.Items[_count].FindControl("Xl_Sua").Visible = false;
                    DataList1.Items[_count].FindControl("Xl_Xoa").Visible = false;
                }
                Button temp = (Button)DataList1.Items[_count].FindControl("Xl_Sua");
                temp.CommandName = _count.ToString();
                _count++;
            }
            if (nguoiDung == null)
            {
                UpdatePanel1.FindControl("Xl_ThemBinhLuan").Visible = false;
                UpdatePanel1.FindControl("Th_BinhLuanMoi").Visible = false;
            }
            else
            {
                UpdatePanel1.FindControl("Xl_ThemBinhLuan").Visible = true;
                UpdatePanel1.FindControl("Th_BinhLuanMoi").Visible = true;
            }
            
        }

        protected void Xl_ChoDiem_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            ChamDiem cd = new ChamDiem();
            cd.MaPhim = ((Phim)Session["CurrentPhim"]).MaPhim;
            cd.SoDiem = int.Parse(Th_DiemCuaBan.SelectedItem.Value);
            cd.MaNguoiDung = ((NguoiDung)Session["NguoiDung"]).MaNguoiDung;

            dt.ChamDiems.InsertOnSubmit(cd);

            dt.SubmitChanges();

            var query = (from phim in dt.Phims
                         where phim.MaPhim == ((Phim)Session["CurrentPhim"]).MaPhim
                         select phim).Single();
            var query1 = from cd_ in dt.ChamDiems
                         where cd_.MaPhim == ((Phim)Session["CurrentPhim"]).MaPhim
                         select cd_.SoDiem;

            query.DiemDanhGia = (float)query1.Sum() / (float)query1.Count();
                
            dt.SubmitChanges();

            KiemTraQuyenBinhLuan(dt);
            LoadThongTinPhim(dt, ((Phim)Session["CurrentPhim"]));
        }

        private void KiemTraQuyenBinhLuan(CinemaLINQDataContext dt)
        {
            if ((NguoiDung)Session["NguoiDung"] != null)
            {
                var query = from cd_ in dt.ChamDiems
                            where cd_.MaNguoiDung == ((NguoiDung)Session["NguoiDung"]).MaNguoiDung && cd_.MaPhim == ((Phim)Session["CurrentPhim"]).MaPhim
                            select cd_;
                if (query.Count<ChamDiem>() == 0)
                {
                    Th_DiemCuaBan.Visible = true;
                    Xl_ChoDiem.Visible = true;
                    Lb_DiemCuaBan.Visible = true;
                    Lb_DaChoDiem.Visible = false;
                }
                else
                {
                    Th_DiemCuaBan.Visible = false;
                    Xl_ChoDiem.Visible = false;
                    Lb_DiemCuaBan.Visible = false;
                    Lb_DaChoDiem.Visible = true;
                    Lb_DaChoDiem.Text = "Bạn đã chấm điểm cho phim này rồi";
                }
            }
            else
            {
                Th_DiemCuaBan.Visible = false;
                Xl_ChoDiem.Visible = false;
                Lb_DiemCuaBan.Visible = false;
                Lb_DaChoDiem.Visible = true;
                Lb_DaChoDiem.Text = "Bạn cần đăng nhập để chấm điểm cho phim";
            }
        }
    }
}