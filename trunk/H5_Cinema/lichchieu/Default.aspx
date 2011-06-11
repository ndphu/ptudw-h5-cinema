<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="H5_Cinema.WebForm7" %>
<%@ Import Namespace="H5_Cinema" %>
<%@ Import Namespace="System.Linq" %>

<script language="C#" runat="Server">
    void LBT_Click_XemLichChieu(object sender, EventArgs e)
    {
        int _maPhim = int.Parse(((LinkButton)sender).CommandArgument.ToString());
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        List<SuatChieu> _dsSuatChieu = (from _sc in dt.SuatChieus
                                        where _sc.LichChieuPhim.NgayChieu.Date >= DateTime.Now.Date && _sc.MaPhim == _maPhim
                                        orderby _sc.MaLichChieu ascending
                                        select _sc).ToList();
        List<LichChieuPhim> _dsLichChieu = new List<LichChieuPhim>();
        int _currentLichChieu = -1;
        for (int i = 0; i < _dsSuatChieu.Count; i++)
        {
            if (_currentLichChieu != _dsSuatChieu[i].MaLichChieu)
            {
                _dsLichChieu.Add(_dsSuatChieu[i].LichChieuPhim);
                _currentLichChieu = _dsSuatChieu[i].MaLichChieu;
            }
        }

        dtl_DanhSachNgayChieu.DataSource = _dsLichChieu;
        dtl_DanhSachNgayChieu.DataBind();

        int _count = 0;
        foreach (LichChieuPhim _lcp in _dsLichChieu)
        {
            ((Label)dtl_DanhSachNgayChieu.Items[_count].FindControl("lb_NgayChieu")).Text = _dsLichChieu[_count].NgayChieu.Date.ToString("dd/MM/yyyy");
            List<SuatChieu> _dsSuatChieuTrongNgay = LaySuatChieuTheoLichChieuVaPhim(_maPhim, _dsLichChieu[_count].MaLichChieuPhim);
            DataList _dsSuatChieuTH = (DataList)dtl_DanhSachNgayChieu.Items[_count].FindControl("dtl_DanhSachSuatChieu");
            _dsSuatChieuTH.DataSource = _dsSuatChieuTrongNgay;
            _dsSuatChieuTH.DataBind();
            int _count2 = 0;
            foreach (SuatChieu _sc in _dsSuatChieuTrongNgay)
            {
                ((LinkButton)_dsSuatChieuTH.Items[_count2].FindControl("lbt_SuatChieu")).Text = _sc.DanhMucSuatChieu.ThoiGianBatDau.ToString("HH:mm");
                _count2++;
            }
            _count++;
        }
        
    }

    List<SuatChieu> LaySuatChieuTheoLichChieuVaPhim(int _maPhim, int _maLichChieu)
    {
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        List<SuatChieu> _dsSuatChieu = (from _sc in dt.SuatChieus
                                        where _sc.MaPhim == _maPhim && _sc.LichChieuPhim.MaLichChieuPhim == _maLichChieu
                                        orderby _sc.MaDanhMucSuatChieu ascending
                                        select _sc).ToList();

        List<SuatChieu> _dsSuatChieuTheoSuat = new List<SuatChieu>();
        int _currentSuatChieu = -1;
        for (int i = 0 ; i < _dsSuatChieu.Count; i++)
        {
            if (_currentSuatChieu != _dsSuatChieu[i].MaDanhMucSuatChieu)
            {
                _dsSuatChieuTheoSuat.Add(_dsSuatChieu[i]);
                _currentSuatChieu = _dsSuatChieu[i].MaDanhMucSuatChieu;
            }
        }
        return _dsSuatChieuTheoSuat;
    }
                                                    
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="left" style="height: 847px; width: 700px">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table border="Ridge" style="width: 100%; height: 19px;">
            <tr>
                <td align="center" class="style2" style="width: 311px">
                    <asp:Label ID="Label3" runat="server" Font-Size="18pt" ForeColor="#FFFF99" 
                        Text="Danh sách phim &#273;ang chi&#7871;u"></asp:Label>
                </td>
                <td align="center">
                    <asp:Label ID="Label4" runat="server" Font-Size="18pt" ForeColor="#FFFF99" 
                        Text="L&#7883;ch chi&#7871;u"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" style="width: 311px">
                    <asp:Panel ID="Panel1" runat="server" Height="807px">
                        <asp:DataList ID="dtl_DanhSachPhim" runat="server">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("Phim.MaPhim") %>' Font-Size="16pt" 
                                OnClick = "LBT_Click_XemLichChieu"
                                ForeColor="#00CCFF" Text='<%# Eval("Phim.TenPhim") %>'></asp:LinkButton>
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    </asp:Panel>
                </td>

                <td>
                    <asp:Panel ID="Panel2" runat="server" Height="805px">
                        <asp:DataList ID="dtl_DanhSachNgayChieu" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="lb_NgayChieu" runat="server" Text="Ngày chi&#7871;u:" Font-Size="16pt" 
                                ForeColor="#00CCFF"></asp:Label>
                            <br />
                            <asp:DataList ID="dtl_DanhSachSuatChieu" runat="server" 
                                RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbt_SuatChieu" runat="server" Font-Size="11pt" 
                                        ForeColor="#99FF33" CommandArgument='<%# Eval("MaSuatChieu") %>'>LinkButton</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:DataList>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    </asp:Panel>
                </td>
            </tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
