<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoTaiKhoanThanhCong.aspx.cs" Inherits="H5_Cinema.thanhvien.TaoTaiKhoanThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
<div style="border: thin solid #FF3300;width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300;background-image: url('../Img/001.png'); background-repeat: repeat">
 <asp:Label ID="Label1" runat="server" Text="THÔNG BÁO" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
        <div align="center" style="color: Lime">        
        T&#7841;o tài kho&#7843;n thành công
        </div>    
        <p><asp:Button ID="Button1" runat="server" Text="V&#7873; trang ch&#7911;" 
                onclick="Button1_Click" /><asp:Button ID="Button2" runat="server" 
                Text="&#272;&#259;ng nh&#7853;p" onclick="Button2_Click" /></p>
                </div>
 </div>       
</asp:Content>
