<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YeuCauDangNhap.aspx.cs" Inherits="H5_Cinema.thanhvien.YeuCauDangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
<div style="border: thin solid #FF3300;width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300;background-image: url('../Img/001.png'); background-repeat: repeat">
 <asp:Label ID="Label1" runat="server" Text="THÔNG BÁO" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
        <div align="center" style="color: Lime">        
        C&#7847;n ph&#7843;i &#273;&#259;ng nh&#7853;p &#273;&#7875; th&#7921;c hi&#7879;n ch&#7913;c n&#259;ng này
        </div>    
        <p><asp:Button ID="Button1" runat="server" Text="V&#7873; trang ch&#7911;" 
                onclick="Button1_Click" /><asp:Button ID="Button2" runat="server" 
                Text="&#272;&#259;ng nh&#7853;p" onclick="Button2_Click" /></p>
    </div>
 </div> 
</asp:Content>
