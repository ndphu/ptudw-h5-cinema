<%@ Page Title="Phim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="H5_Cinema.WebForm2" %>
<%@ Import Namespace="H5_Cinema" %>
<script language="C#" runat="Server">
        void LinkButton_Click (object sender, EventArgs e)
        {
            CinemaLINQDataContext dt = new CinemaLINQDataContext();
            Session["CurrentPhim"] = (from _phim in dt.Phims
                                 where _phim.MaPhim == int.Parse(((LinkButton)sender).CommandArgument)
                                 select _phim).Single();
            Response.Redirect("/phim/ChiTietPhim.aspx");
        }
    
    void LBT_Click_ChinhSua (object sender, EventArgs e)
    {
        int _maPhimChinhSua  = int.Parse(((LinkButton)sender).CommandArgument.ToString());
        
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        Phim _phimChinhSua = (from _ph in dt.Phims
                              where _ph.MaPhim == _maPhimChinhSua
                              select _ph).Single();

        Session["CurrentPhim"] = _phimChinhSua;
        Response.Redirect("/phim/ChinhSuaPhim.aspx");
    }
    
    void LBT_Click_XemLichChieu (object sender, EventArgs e)
    {
        Session["XLC-MaPhim"] = ((LinkButton)sender).CommandArgument.ToString();
        Response.Redirect("/lichchieu/XemLichChieuTheoPhim.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: auto;" align="center">
        <table border="Rigde" style="width: 100%">
            <tr>
                <td align="center">
    <asp:Label ID="Label1" runat="server" Text="DANH SÁCH PHIM &#272;ANG CHI&#7870;U" ForeColor="GreenYellow" 
            Font-Bold="True" Font-Size="30pt" Font-Names="Tahoma"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                <asp:DataList ID="dtl_pagging" runat="server" Height="38px" 
                    onitemcommand="dtl_pagging_ItemCommand" 
                    onselectedindexchanged="dtl_pagging_SelectedIndexChanged" 
                    RepeatDirection="Horizontal" Width="88px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbt_PageIndex" runat="server" 
                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="lbt_PageIndex" 
                            ForeColor="Lime" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
                </td>
            </tr>
            <tr>
                <td align="center">
                <asp:DataList ID="Th_KetQuaTraCuu" runat="server" Height="200px" Width="651px">
                    <HeaderTemplate>
                        <span style="color: #66FF33">
                        _____________________________________________________________________________</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="20pt" 
                                        ForeColor="Red" Text='<%# Eval("TenPhim") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="8" style="width: 156px">
                                    <asp:Image ID="Image1" runat="server" Height="181px" 
                                        ImageUrl='<%# Eval("AnhPhim") %>' Width="175px" />
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label4" runat="server" CssClass="style1" 
                                        Text="Th&#7875; lo&#7841;i:"></asp:Label>
                                    <asp:Label ID="lb_TheLoai" runat="server" ForeColor="#0099FF" 
                                        Text='<%# Eval("DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label5" runat="server" CssClass="style1" 
                                        Text="&#272;&#7841;o di&#7877;n:"></asp:Label>
                                    <asp:Label ID="Label10" runat="server" ForeColor="#0099FF" 
                                        Text='<%# Eval("DaoDien") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label6" runat="server" CssClass="style1" Text="Di&#7877;n viên:"></asp:Label>
                                    <asp:Label ID="Label11" runat="server" ForeColor="#0099FF" 
                                        Text='<%# Eval("DienVienThamGia") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label7" runat="server" CssClass="style1" Text="Ngôn ng&#7919;:"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" ForeColor="#0099FF" 
                                        Text='<%# Eval("NgonNgu") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label8" runat="server" CssClass="style1" 
                                        Text="Th&#7901;i l&#432;&#7907;ng:"></asp:Label>
                                    <asp:Label ID="Label13" runat="server" ForeColor="#0099FF" 
                                        Text='<%# Eval("ThoiLuong") %>'></asp:Label>
                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="10pt" 
                                        ForeColor="#0099FF" Text=" phút"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="lbt_ChiTietPhim" runat="server" 
                                        CommandArgument='<%# Eval("MaPhim") %>' ForeColor="#66FF33" 
                                        OnClick="LinkButton_Click">Xem chi ti&#7871;t phim...</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="lbt_XemLichChieu" runat="server" 
                                        CommandArgument='<%# Eval("MaPhim") %>' ForeColor="#0099FF" 
                                        OnClick="LBT_Click_XemLichChieu">Xem l&#7883;ch chi&#7871;u hi&#7879;n t&#7841;i...</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="lbt_ChinhSuaPhim" runat="server" 
                                        CommandArgument='<%# Eval("MaPhim") %>' ForeColor="Yellow" 
                                        OnClick="LBT_Click_ChinhSua">Ch&#7881;nh s&#7917;a phim</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                </td>
            </tr>
        </table>
        <br />
    <br />
    </div>
    </asp:Content>
