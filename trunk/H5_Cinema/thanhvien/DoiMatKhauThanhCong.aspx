<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoiMatKhauThanhCong.aspx.cs" Inherits="H5_Cinema.thanhvien.DoiMatKhauThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
 <asp:Label ID="Label1" runat="server" Text="THÔNG BÁO" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        <div align="center" style="color: Lime">        
        Đổi mật khẩu thành công
        </div>    
        <p><asp:Button ID="Button1" runat="server" Text="V&#7873; trang ch&#7911;" 
                onclick="Button1_Click" /></p>
 </div>   
</asp:Content>
