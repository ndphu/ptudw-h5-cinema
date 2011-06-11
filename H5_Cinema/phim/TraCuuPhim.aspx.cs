using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace H5_Cinema.phim
{
    public partial class TraCuuPhim : System.Web.UI.Page
    {

        public int CurrentIndex
        {
            get 
            {
                if (this.ViewState["CurrentPageIndex"] == null)
                    return 0;
                else
                {
                    string temp = this.ViewState["CurrentPageIndex"].ToString();
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
                                  where _phim.TenPhim.Contains(Session["TenPhimTimKiem"].ToString())
                                  select _phim).ToList();

            if (_dsPhim.Count == 0)
                return;
            else
            {
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = _dsPhim;
                pds.AllowPaging = true;
                pds.PageSize = _pageSize;
                pds.CurrentPageIndex = CurrentIndex;

                Th_KetQuaTraCuu.DataSource = pds;
                Th_KetQuaTraCuu.DataBind();

                int _count = 0;
                foreach (Phim _subPhim in pds)
                {
                    Label _lb = (Label)Th_KetQuaTraCuu.Items[_count].FindControl("lb_TheLoai");
                    _lb.Text = _subPhim.DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim;
                    _count++;
                }

                Pagging_CountPage(_dsPhim.Count);
            }
        }

        public void Pagging_CountPage(int _rowCount)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            for (int i = 0; i < ((int)_rowCount / _pageSize) + 1; i++)
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

        protected void dtl_pagging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("lbt_PageIndex"))
            {
                CurrentIndex = int.Parse(e.CommandArgument.ToString());
                BindingData();
            }
        }

        protected void dtl_pagging_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}