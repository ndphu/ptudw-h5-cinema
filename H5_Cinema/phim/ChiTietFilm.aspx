<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietFilm.aspx.cs" Inherits="H5_Cinema.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="CHI TI&#7870;T B&#7896; PHIM" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
    <br />
    <br />
    <table align="left" border="0" width="800">
    <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Tên film:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_TenPhim" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label8" runat="server" Text="Th&#7875; lo&#7841;i:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_TheLoai" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label9" runat="server" Text="&#272;&#7841;o di&#7877;n:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_DaoDien" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label10" runat="server" Text="Di&#7877;n viên chính:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_DienVien" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label11" runat="server" Text="&#272;i&#7875;m &#273;ánh giá: " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_Diem" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Th&#7901;i l&#432;&#7907;ng: " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_ThoiLuong" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label12" runat="server" Text="Hình &#7843;nh:" ForeColor="Red"></asp:Label></td>
        <td>
            <asp:Image ID="Th_HinhAnh" runat="server" />
        </td>
    </tr>
    </table> 
</asp:Content>
