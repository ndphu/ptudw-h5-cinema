<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemPhimThanhCong.aspx.cs" Inherits="H5_Cinema.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="height: 335px">
    <div style="border: thin solid #808080;width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #808080;background-image: url('../Img/001.png'); background-repeat: repeat">
        <asp:Label ID="Label1" runat="server" Text="THÔNG BÁO" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
        <div align="center" style="color: Lime">        
        Thêm phim m&#7899;i thành công
        <p><asp:Button ID="Button1" runat="server" Text="Xem danh sách phim" 
                onclick="Button1_Click" /><asp:Button ID="Button2" runat="server" 
                Text="Thêm phim khác" onclick="Button2_Click" />          
        </div>
        </div>
</div>  
</asp:Content>
