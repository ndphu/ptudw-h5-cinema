<%@ Page Title="Phim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="H5_Cinema.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%" align="center">
    <asp:Label ID="Label1" runat="server" Text="DANH SÁCH PHIM" ForeColor="GreenYellow" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
    <br />
    <%-- 
    <%  
        try
        {
            H5_Cinema.CinemaLINQDataContext dt = new H5_Cinema.CinemaLINQDataContext();
            var query = from phim in dt.Phims
                        select phim;
            foreach (H5_Cinema.Phim phim in query)
            {
        
        %>
            <table style="width: 100%;" align="left" bgcolor="#66FFFF">
        <tr>
        <td rowspan="5" class="style2" style="width: 36px">
            <img src="<%=phim.AnhPhim.ToString() %>" />
        </td>
        <td style="width: 64px">
            Tên phim:</td>
        <td class="style3">
            <%=phim.TenPhim.ToString() %>
        </td>
    </tr>
    <tr>
        <td style="width: 64px">
            Th&#7875; lo&#7841;i:</td>
        <td class="style3">
            <%=phim.DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim.ToString() %>
        </td>
    </tr>
    <tr>
        <td style="width: 64px">
            Di&#7877;n viên:</td>
        <td class="style3">
            <%=phim.DienVienThamGia.ToString() %>
        </td>
    </tr>
    <tr>
        <td style="width: 64px">
            &#272;&#7897; dài:</td>
        <td class="style3">
            <%=phim.ThoiLuong.ToString() %>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="style3" align="center"><asp:Button ID="btnChiTiet" runat="server" Text="Chi ti&#7871;t" OnClick="ChiTiet_Click" CommandName="<%=phim.MaPhim.ToString() %>"></asp:Button></td>
    </tr>
</table>
        <%
        }
        }
        catch
        {
        }%>
        --%>
        <asp:ListView ID="Th_DanhSachPhim" runat="server" DataSourceID="CinemaLINQ" 
        GroupItemCount="3" style="text-align: left" 
        onselectedindexchanged="ListView1_SelectedIndexChanged">
        <EmptyDataTemplate>
            <table id="Table1" runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td id="Td1" runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td id="Td2" runat="server" 
                style="border: thick ridge #FF9900; width: 400px; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;" 
                align="char" bgcolor="Black" valign="top">
                <div style="background-image: url('../Img/001.png'); height: 90px">                
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("TenPhim") %>' 
                    ForeColor="Blue" Font-Size="Small"/>
                    <br />
                <asp:Label runat="server" Text="Th&#7875; lo&#7841;i:" ForeColor="Lime" 
                    Font-Size="Small"></asp:Label>
                <asp:Label ID="TypeLabel" runat="server" 
                    Text='<%# Eval("DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim") %>' 
                    ForeColor="Lime" Font-Size="Small" />                    
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="#FF6600" 
                        Text="Th&#7901;i l&#432;&#7907;ng:"></asp:Label>
                    <asp:Label ID="LengthLabel" runat="server" Font-Size="Small" 
                        ForeColor="#FF6600" Text='<%# Eval("ThoiLuong") %>'></asp:Label>
                </div>
                <div style="height: 250px; vertical-align: middle; text-align: center; background-image: url('../Img/001.png') ; top: 5px; position: relative;">
                    <asp:Image ID="PlaybillAddLabel" runat="server" Width="150px"
                    ImageUrl='<%# Eval("AnhPhim") %>'/></div>
                <br />
                <asp:Button runat="server" OnClick="ChiTiet_Click" Text="Chi ti&#7871;t" 
                    CommandName='<%# Eval("MaPhim") %>' Width="100px" 
                    ToolTip="Xem chi ti&#7871;t b&#7897; phim"> </asp:Button>
                <asp:Button runat="server" OnClick="ChinhSua_Click" Text="Ch&#7881;nh s&#7917;a" 
                    CommandName='<%# Eval("MaPhim") %>' Width="100px" 
                    ToolTip="Ch&#7881;nh s&#7917;a các thông tin liên quan &#273;&#7871;n phim này"> </asp:Button>
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td3" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td4" runat="server" 
                        style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:Button runat="server" Text="Thêm phim m&#7899;i" ID="Xl_ThemPhimMoi" 
        onclick="Xl_ThemPhimMoi_Click" ToolTip="Thêm m&#7897;t phim m&#7899;i vào CSDL" />
    <asp:LinqDataSource ID="CinemaLINQ" runat="server" 
        ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
        Select="new (TenPhim, MaPhim, DanhMucTheLoaiPhim, AnhPhim, ThoiLuong, DienVienThamGia, DaoDien)" 
        TableName="Phims" Where="TinhTrang == @TinhTrang">
        <WhereParameters>
            <asp:Parameter DefaultValue="True" Name="TinhTrang" Type="Boolean" />
        </WhereParameters>
    </asp:LinqDataSource>
    </div>
    </asp:Content>
