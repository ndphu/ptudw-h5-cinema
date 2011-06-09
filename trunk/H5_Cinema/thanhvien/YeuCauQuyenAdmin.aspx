<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YeuCauQuyenAdmin.aspx.cs" Inherits="H5_Cinema.thanhvien.YeuCauQuyenAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
<div style="border: thin solid #FF3300;width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300;background-image: url('../Img/001.png'); background-repeat: repeat">
 <asp:Label ID="Label1" runat="server" Text="THÔNG BÁO" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
        <div align="center" style="color: Lime">        
        Tài khoản của bạn không đủ quyền hạn để thực hiện chức năng này
        </div>    
        <p><asp:Button ID="Button1" runat="server" Text="V&#7873; trang ch&#7911;" 
                onclick="Button1_Click" /><asp:Button ID="Button2" runat="server" 
                Text="&#272;&#259;ng nh&#7853;p" onclick="Button2_Click" /></p>
    </div>
 </div> 
</asp:Content>
