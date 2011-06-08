<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangXuat.aspx.cs" Inherits="H5_Cinema.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center" style="height: 335px">
        <asp:Label ID="Label1" runat="server" Text="&#272;&#258;NG XU&#7844;T" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        <div align="center" style="color: Lime">        
        &#272;&#259;ng xu&#7845;t thành công
        <p>
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                Text="V&#7873; trang ch&#7911;" Width="100px" />
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                Text="&#272;&#259;ng nh&#7853;p" Width="100px" />
            </p>
          
        </div>
</div>  
</asp:Content>
