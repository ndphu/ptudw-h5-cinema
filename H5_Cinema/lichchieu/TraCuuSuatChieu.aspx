<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraCuuSuatChieu.aspx.cs" Inherits="H5_Cinema.lichchieu.TraCuuSuatChieu" %>
<%@ Import Namespace="H5_Cinema" %>
<%@ Import Namespace="System.Linq" %>

<script language="C#" runat="Server">
    void LBT_Click_ChiTietPhim(object sender, EventArgs e)
    {
        LinkButton _sender = (LinkButton)sender;
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        Session["CurrentPhim"] = (from _phim in dt.Phims
                                  where _phim.MaPhim == int.Parse(_sender.CommandArgument.ToString())
                                  select _phim).Single();
        Response.Redirect("/phim/ChiTietPhim.aspx");
    }

    void LBT_Click_DatVe(object sender, EventArgs e)
    {
        CinemaLINQDataContext dt = new CinemaLINQDataContext(); 
        var suatchieu = from _suatchieu in dt.SuatChieus 
                        where _suatchieu.MaSuatChieu == int.Parse(((LinkButton)sender).CommandArgument)
                        select _suatchieu; 
        if (suatchieu.Count<SuatChieu>() == 1)
        {
            Session["SuatChieu"] = suatchieu.Single();
            Response.Redirect("/datve/datve.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="height: 947px">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" onload="UpdatePanel2_Load" 
            onprerender="UpdatePanel2_PreRender">
        
            <ContentTemplate>
                <asp:Label ID="lb_SuatChieuChon" runat="server" Font-Size="20pt" 
                    ForeColor="#FFFFCC"></asp:Label>
            <br />
            <br />
                <asp:Label ID="lb_ChonNgayChieu" runat="server" Font-Font-Size="10pt" 
                    Font-Size="10pt" ForeColor="Yellow" Text="Ch&#7885;n ngày chi&#7871;u:"></asp:Label>
                <br />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    ShowGridLines="True" Width="220px" 
                    onselectionchanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
                <br />
                <br />
                <br />
                <table border="Ridge" style="width: 100%">
                    <tr>
                        <td>
                            <div align="center">
                                <asp:Label ID="lb_DanhSachPhimChieu" runat="server" Font-Size="15pt" 
                                    ForeColor="#00CCFF" Text="Danh sách phim chi&#7871;u trong ngày" 
                                    Visible="False"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="center">
                                <asp:DataList ID="DataList1" runat="server">
                                    <ItemTemplate>
                                        <div align="center">
                                            <asp:LinkButton ID="lbt_TenPhimChieu" runat="server" 
                                                CommandArgument='<%# Eval("Phim.MaPhim") %>' Font-Size="18pt" ForeColor="Lime" 
                                                OnClick="LBT_Click_ChiTietPhim" Text='<%# Eval("Phim.TenPhim") %>'></asp:LinkButton>
                                        </div>
                                        <div align="center">
                                            <asp:LinkButton ID="lbt_DatVe" runat="server" 
                                                CommandArgument='<%# Eval("MaSuatChieu") %>' Font-Size="12pt" ForeColor="Red" 
                                                OnClick="LBT_Click_DatVe">&#272;&#7863;t vé</asp:LinkButton>
                                        </div>
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
