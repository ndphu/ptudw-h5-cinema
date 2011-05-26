﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietFilm.aspx.cs" Inherits="H5_Cinema.WebForm3" %>
<%@ Import Namespace="System.Linq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label ID="Label1" runat="server" Text="CHI TI&#7870;T B&#7896; PHIM" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
    <br />
    <br />
    <table align="left" border="0.5" width="800">
    <tr>
        <td style="width: 185px"><asp:Label ID="Label2" runat="server" Text="Tên film:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_TenPhim" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label8" runat="server" Text="Th&#7875; lo&#7841;i:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_TheLoai" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label9" runat="server" Text="&#272;&#7841;o di&#7877;n:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_DaoDien" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label10" runat="server" Text="Di&#7877;n viên chính:   " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_DienVien" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label11" runat="server" Text="&#272;i&#7875;m &#273;ánh giá: " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_Diem" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label3" runat="server" Text="Th&#7901;i l&#432;&#7907;ng: " ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_ThoiLuong" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label12" runat="server" Text="Hình &#7843;nh:" ForeColor="Red"></asp:Label></td>
        <td>
            <asp:Image ID="Th_HinhAnh" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label13" runat="server" Text="Tóm t&#7855;t n&#7897;i dung:" ForeColor="Red"></asp:Label></td>
        <td><asp:Label ID="Th_TomTat" runat="server" ForeColor="Azure"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label4" ForeColor="Red" Text="Comment:" runat="server"></asp:Label></td>
    </tr>
    <% 
        try
        {
            H5_Cinema.CinemaLINQDataContext dt = new H5_Cinema.CinemaLINQDataContext();
            var query = from comment in dt.BinhLuans
                        where comment.MaPhim == int.Parse(Session["SelectedFilmID"].ToString())
                        select comment;

            foreach (H5_Cinema.BinhLuan binhluan in query)
            { %>
        <tr>
            <td style="color: #008000; width: 185px;"><%=binhluan.NguoiDung.TenNguoiDung%> &#273;ã vi&#7871;t:</td>
            <td style="color: #008080"><%=binhluan.NoiDungBinhLuan%></td>
        </tr>
        <% }
        }
        catch { }%>
        <tr>
        <td style="width: 185px"><asp:Label runat="server" Text="Bình lu&#7853;n c&#7911;a b&#7841;n:" ForeColor="Red" /></td>
        <td><asp:TextBox Width="400px" Height="129px" runat="server" ID="Th_BinhLuanMoi" 
                style="text-align: left"  Text="" AutoPostBack="false" CausesValidation="false" /></td>
        </tr>
        <tr>
        <td style="width: 185px"></td>
        <td>
            <asp:Button ID="Xl_ThemBinhLuan" runat="server" Text="Bình lu&#7853;n" 
                onclick="Xl_ThemBinhLuan_Click" /></td>
        </tr>
    </table> 
</asp:Content>
