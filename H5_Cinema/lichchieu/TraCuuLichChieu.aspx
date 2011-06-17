<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraCuuLichChieu.aspx.cs" Inherits="H5_Cinema.lichchieu.TraCuuLichChieu" %>

<%@ Import Namespace="H5_Cinema" %>
<script language="C#" runat="Server">
        void LinkButton_Click (object sender, EventArgs e)
        {
            int _maPhim = int.Parse(((LinkButton)sender).CommandArgument);
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            Session["TCLC_ChonPhim"] = (from _phim in dt.Phims
                                        where _phim.MaPhim == _maPhim
                                        select _phim).Single();
            
            if (Session["ThoiGianTimKiem"] != null)
            {
                List<SuatChieu> _dsSuatChieu = (from _suatChieu in dt.SuatChieus
                                               where _suatChieu.MaPhim == _maPhim && _suatChieu.LichChieuPhim.NgayChieu == (DateTime)Session["ThoiGianTimKiem"] && _suatChieu.TinhTrang == true
                                               orderby _suatChieu.MaDanhMucSuatChieu ascending
                                               select _suatChieu).ToList();

                List<SuatChieu> _dsSuatChieuTheoSuat = new List<SuatChieu>();
                int _currentPhim = -1;

                for (int i = 0; i < _dsSuatChieu.Count; i++)
                {
                    if (_currentPhim != _dsSuatChieu[i].MaDanhMucSuatChieu)
                    {
                        _dsSuatChieuTheoSuat.Add(_dsSuatChieu[i]);
                        _currentPhim = _dsSuatChieu[i].MaDanhMucSuatChieu;
                    }
                }

                dtl_DanhSachSuatChieu.DataSource = _dsSuatChieuTheoSuat;
                dtl_DanhSachSuatChieu.DataBind();

                int _count = 0;
                foreach (SuatChieu _sc in _dsSuatChieuTheoSuat)
                {
                    ((LinkButton)dtl_DanhSachSuatChieu.Items[_count].FindControl("lbt_SuatChieu")).Text = _sc.DanhMucSuatChieu.ThoiGianBatDau.ToString("HH:mm");
                    _count++;
                }                       
            }
        }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="height: 657px">
        <asp:Label ID="lb_KetQuaTraCuu" runat="server" Font-Bold="True" 
            Font-Size="20pt" ForeColor="#FFFFCC" Text="K&#7871;t qu&#7843; tra c&#7913;u"></asp:Label>
        <br />
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table border="Ridge" frame="border" style="width: 100%; height: 36px;">
                    <tr>
                        <td style="width: 477px">
                            <asp:Label ID="Label2" runat="server" Font-Size="16pt" ForeColor="Lime" 
                                Text="Danh sách phim chi&#7871;u trong ngày"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Size="16pt" ForeColor="Lime" 
                                Text="Danh sách su&#7845;t chi&#7871;u"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 477px">
                            <asp:Panel ID="Panel1" runat="server" BorderStyle="NotSet" Height="494px">
                                <asp:DataList ID="dtl_DanhSachPhim" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbt_TenPhim" runat="server" Font-Size="16pt" OnClick = "LinkButton_Click"
                                            ForeColor="#00CCFF" Text='<%# Eval("Phim.TenPhim") %>' 
                                            CommandArgument='<%# Eval("Phim.MaPhim") %>'></asp:LinkButton>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="Panel2" runat="server" Height="495px">
                                <asp:DataList ID="dtl_DanhSachSuatChieu" runat="server" Width="81px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbt_SuatChieu" runat="server" 
                                            CommandArgument='<%# Eval("MaSuatChieu") %>' Font-Size="13pt" 
                                            ForeColor="Yellow"></asp:LinkButton>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
<br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
