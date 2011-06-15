<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemPhongThanhCong.aspx.cs" Inherits="H5_Cinema.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onload="setTimeout('delayedRedirect()', 3000)">
        <div style="padding: 5px; margin: 5px; border: thin groove #333333;">
            <div align="left">
                <asp:Label ID="lb_ThemPhongThanhCong" runat="server" 
                    Text="Thêm phòng m&#7899;i thành công" Font-Size="X-Large" 
                    ForeColor="#CCFF66"></asp:Label>
            </div>
            <div style="color: #FFFFCC" align="left">
                <span>B&#7845;m vào </span><asp:HyperLink ID="hp_TrangAdmin" runat="server" NavigateUrl="/admin/Default.aspx">&#273;ây</asp:HyperLink><span>&nbsp;n&#7871;u h&#7879; th&#7889;ng không t&#7921; chuy&#7875;n b&#7841;n &#273;&#7871;n trang Admin</span>        
            </div>
        </div>
    </body>
</asp:Content>
