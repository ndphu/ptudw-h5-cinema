<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="H5_Cinema.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="left" 
        style="padding: 5px; margin: 5px; background-image: url('/Img/001.png'); border: thin groove #333333; top: 30px">
        <br />
        <div id="QuanLyPhong">
            <asp:Label ID="lb_QuanLyPhong" runat="server" Text="Qu&#7843;n lý phòng" 
                Font-Size="X-Large" ForeColor="#CCFF33" Font-Bold="True"></asp:Label>
            <br />
            <asp:HyperLink ID="hp_ThemPhongMoi" runat="server" NavigateUrl="/admin/ThemPhongMoi.aspx">Thêm phòng m&#7899;i</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hp_CapNhatPhong" runat="server" NavigateUrl="/admin/CapNhatPhong.aspx">C&#7853;p nh&#7853;t thông tin phòng</asp:HyperLink>
        </div>
        <br />
        <br />
        <div id="QuanLySuatChieu">
            <asp:Label ID="lb_QuanLySuatChieu" runat="server" Text="Qu&#7843;n lý su&#7845;t chi&#7871;u" 
                Font-Size="X-Large" ForeColor="#CCFF33" Font-Bold="True"></asp:Label>
            <br />
            <asp:HyperLink ID="hp_ThemSuatChieu" runat="server" NavigateUrl="/admin/ThemSuatChieu.aspx">Thêm su&#7845;t chi&#7871;u</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hp_CapNhatSuatChieu" runat="server" NavigateUrl="/admin/CapNhatSuatChieu.aspx">C&#7853;p nh&#7853;t su&#7845;t chi&#7871;u</asp:HyperLink>
        </div>
        <br />
    </div>
</asp:Content>
