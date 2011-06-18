using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace H5_Cinema
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public int CurrentIndex
        {
            get
            {
                if (this.ViewState["CurrentPageIndex"] == null)
                    return 0;
                else
                {
                    //string temp = this.ViewState["CurrentPageIndex"].ToString();
                    return int.Parse(this.ViewState["CurrentPageIndex"].ToString());
                }
            }
            set
            {
                this.ViewState["CurrentPageIndex"] = value;
            }
        }

        int _pageSize = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingData();
            }
        }

        public void BindingData()
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            List<Phim> _dsPhim = (from _phim in dt.Phims
                                  where _phim.SuatChieus.Where(sc => sc.LichChieuPhim.NgayChieu.Date >= DateTime.Now.Date).Count() > 0
                                  orderby _phim.TenPhim ascending
                                  select _phim).ToList();

            if (_dsPhim.Count == 0)
            {
                return;
            }
            else
            {
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = _dsPhim;
                pds.AllowPaging = true;
                pds.PageSize = _pageSize;
                pds.CurrentPageIndex = CurrentIndex;

                Th_KetQuaTraCuu.DataSource = pds;
                Th_KetQuaTraCuu.DataBind();

                if (Session["NguoiDung"] == null || ((NguoiDung)Session["NguoiDung"]).MaDanhMucNguoiDung != 1)
                {
                    int _temp = _dsPhim.Count - (CurrentIndex * _pageSize);
                    int _itemCount = 0;
                    if (_temp >= _pageSize)
                        _itemCount = _pageSize;
                    else
                        _itemCount = _temp;

                    for (int i = 0; i < _itemCount; i++)
                    {
                        ((LinkButton)Th_KetQuaTraCuu.Items[i].FindControl("lbt_ChinhSuaPhim")).Visible = false;
                    }
                }

                Pagging_CountPage(_dsPhim.Count);
            }
        }

        public void Pagging_CountPage(int _rowCount)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            int _pageCount = _rowCount / _pageSize;
            int _temp = _rowCount % _pageSize;
            if (_temp > 0)
                _pageCount++;

            for (int i = 0; i < _pageCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i.ToString();
                dr[1] = (i + 1).ToString();
                dt.Rows.Add(dr);
            }
            dtl_pagging.DataSource = dt;
            dtl_pagging.DataBind();

            LinkButton _pageIndex = (LinkButton)dtl_pagging.Items[CurrentIndex].FindControl("lbt_PageIndex");
            _pageIndex.ForeColor = System.Drawing.Color.Red;

        }

        protected void dtl_pagging_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dtl_pagging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("lbt_PageIndex"))
            {
                CurrentIndex = int.Parse(e.CommandArgument.ToString());
                BindingData();
            }
        }

        /*protected void ChiTiet_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            Session["CurrentPhim"] = (from phim in dt.Phims
                                      where phim.MaPhim == int.Parse(((Button)sender).CommandName)
                                      select phim).Single();
            Response.Redirect("../phim/ChiTietPhim.aspx");
        }

        protected void ChinhSua_Click(object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            Session["CurrentPhim"] = (from phim in dt.Phims
                                      where phim.MaPhim == int.Parse(((Button)sender).CommandName)
                                      select phim).Single();
            Response.Redirect("../phim/ChinhSuaPhim.aspx");
        }

        protected void Xl_ThemPhimMoi_Click(object sender, EventArgs e)
        {
            Response.Redirect("../phim/ThemPhimMoi.aspx");
        }*/
    }
}