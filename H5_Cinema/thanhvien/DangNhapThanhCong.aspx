<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhapThanhCong.aspx.cs" Inherits="H5_Cinema.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center" style="height: 335px">
<div style="border: thin solid #FF3300;width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300;background-image: url('../Img/001.png'); background-repeat: repeat">
        <asp:Label ID="Label1" runat="server" Text="&#272;&#258;NG NH&#7852;P THÀNH CÔNG" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
        <div align="center" style="color: Lime">        
        Xin chào <span style="color: #FFFF00"><%=((H5_Cinema.NguoiDung)Session["NguoiDung"]).TenNguoiDung %></span>
        <p>
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                Text="V&#7873; trang ch&#7911;" Width="100px" />
            </p>
          
        </div>
        </div>
</div>  
</asp:Content>
