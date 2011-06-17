using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace H5_Cinema
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CinemaLINQDataContext dt = new CinemaLINQDataContext();
            //DateTime time = DateTime.Today;
            //for (int i = 0; i < 96; ++i)
            //{
            //    DanhMucSuatChieu dmsc = new DanhMucSuatChieu();
            //    dmsc.ThoiGianBatDau = time.AddMinutes(i * 15);
            //    dmsc.TinhTrang = false;
            //    dmsc.GiaDanhMuc = 90000;
            //    dt.DanhMucSuatChieus.InsertOnSubmit(dmsc);
            //    dt.SubmitChanges();
            //}
            
        }

        protected void dl_SuatChieuHienTai_PreRender(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();

            var dsdmsc = (from dmsc in dt.DanhMucSuatChieus
                          select dmsc).OrderBy(dmsc => dmsc.ThoiGianBatDau);

            dl_SuatChieuHienTai.DataSource = dsdmsc;
            dl_SuatChieuHienTai.DataBind();
            int _count = 0;
            foreach (DanhMucSuatChieu dmsc in dsdmsc)
            {
                Label lb = (Label)dl_SuatChieuHienTai.Items[_count].FindControl("lb_ThoiGianBatDau");
                lb.Text = dmsc.ThoiGianBatDau.ToShortTimeString();
                lb.ForeColor = dmsc.TinhTrang ? Color.LightGreen : Color.DarkGray;

                Label lbTT = (Label)dl_SuatChieuHienTai.Items[_count].FindControl("lb_TrangThai");
                lbTT.Text = dmsc.TinhTrang ? "Đang sử dụng" : "Chưa sử dụng";
                lbTT.ForeColor = dmsc.TinhTrang ? Color.Green : Color.Red;

                LinkButton btn = (LinkButton)dl_SuatChieuHienTai.Items[_count].FindControl("btn_ThayDoi");
                btn.Text = dmsc.TinhTrang ? "Ngưng sử dụng" : "Sử dụng";

                LinkButton btnCN = (LinkButton)dl_SuatChieuHienTai.Items[_count].FindControl("btn_CapNhatGia");
                btnCN.CommandName = _count.ToString();
                ++_count;
            }
        }

        //protected void btn_Sua_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    //((TextBox)dl_SuatChieuHienTai.Items[int.Parse(btn.CommandName)].FindControl("tb_ThoiGian")).ReadOnly = false;
        //    CinemaLINQDataContext dt = new CinemaLINQDataContext();
        //    DateTime time = new DateTime();
        //    for (int i = 0; i < 96; ++i)
        //    {
        //        DanhMucSuatChieu dmsc = new DanhMucSuatChieu();
        //        dmsc.ThoiGianBatDau = time.AddMinutes(i * 15);
        //        dmsc.TinhTrang = false;
        //        dmsc.GiaDanhMuc = 90000;
        //        dt.DanhMucSuatChieus.InsertOnSubmit(dmsc);                
        //    }
        //    dt.SubmitChanges();
        //}

        protected void btn_ThayDoi_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = (from dmsc in dt.DanhMucSuatChieus
                        where dmsc.MaDanhMucSuatChieu == int.Parse(((LinkButton)sender).CommandArgument)
                        select dmsc).Single();
            query.TinhTrang = !query.TinhTrang;

            dt.SubmitChanges();
        }

        protected void btn_ThemSuat_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            
            var query = from dmsc in dt.DanhMucSuatChieus
                        where dmsc.ThoiGianBatDau.Hour == int.Parse(tb_Gio.Text) && dmsc.ThoiGianBatDau.Minute == int.Parse(tb_Phut.Text)
                        select dmsc;
            
            if (query.Count<DanhMucSuatChieu>() == 0)
            {
                DanhMucSuatChieu dmsc = new DanhMucSuatChieu();
                DateTime time = new DateTime(1990, 1, 1);
                time = time.AddHours(int.Parse(tb_Gio.Text));
                time = time.AddMinutes(int.Parse(tb_Phut.Text));
                dmsc.ThoiGianBatDau = time;
                dmsc.TinhTrang = true;
                dmsc.GiaDanhMuc = int.Parse(tb_GiaDanhMucSuatMoi.Text);
                dt.DanhMucSuatChieus.InsertOnSubmit(dmsc);
                dt.SubmitChanges();
            }
        }

        protected void dl_SuatChieuHienTai_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btn_CapNhatGia_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            var query = (from dmsc in dt.DanhMucSuatChieus
                         where dmsc.MaDanhMucSuatChieu == int.Parse(((LinkButton)sender).CommandArgument)
                         select dmsc).Single();
            var giaMoi = int.Parse(((TextBox)dl_SuatChieuHienTai.Items[int.Parse(((LinkButton)sender).CommandName)].FindControl("tb_GiaDanhMuc")).Text);
            query.GiaDanhMuc = giaMoi;
            dt.SubmitChanges();
        }
    }
}