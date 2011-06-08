<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemPhimThanhCong.aspx.cs" Inherits="H5_Cinema.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="THÔNG BÁO" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        <div align="left" style="color: Lime">        
        Thêm phim m&#7899;i thành công
        <p><asp:Button ID="Button1" runat="server" Text="Xem danh sách phim" 
                onclick="Button1_Click" /><asp:Button ID="Button2" runat="server" 
                Text="Thêm phim khác" onclick="Button2_Click" /><asp:Button ID="Button3" 
                runat="server" Text="Xem phim v&#7915;a thêm vào" onclick="Button3_Click" /></p>
          
        </div>
        
</asp:Content>
