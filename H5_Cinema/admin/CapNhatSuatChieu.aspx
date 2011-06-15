<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapNhatSuatChieu.aspx.cs" Inherits="H5_Cinema.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="title">
            <asp:Label ID="lb_CapNhatSuatChieu" runat="server" 
                        Text="Cập nhật suất chiếu" Font-Size="X-Large" 
                        ForeColor="#CCFF66"></asp:Label>
        </div>
        <div id="main">
            <div>
                <asp:DataList ID="dl_SuatChieuHienTai" runat="server">

                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
