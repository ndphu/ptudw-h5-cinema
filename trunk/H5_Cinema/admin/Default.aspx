<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="H5_Cinema.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="left" 
        style="padding: 5px; margin: 5px; background-image: url('/Img/001.png'); border: thin groove #333333; top: 30px">
        <br />
        <div>
            
            <asp:Label ID="lb_QuanLyPhim" runat="server" Text="Qu&#7843;n lý Phim" 
                Font-Size="X-Large" ForeColor="#CCFF33" Font-Bold="True"></asp:Label>
            <br />
            <asp:HyperLink ID="hp_ThemPhimMoi" runat="server" NavigateUrl="/phim/themphimmoi.aspx">Thêm phim m&#7899;i</asp:HyperLink>
        </div>
        <br />
        <div id="QuanLyPhong">
            <asp:Label ID="lb_QuanLyPhong" runat="server" Text="Qu&#7843;n lý phòng" 
                Font-Size="X-Large" ForeColor="#CCFF33" Font-Bold="True"></asp:Label>
            <br />
            <asp:HyperLink ID="hp_ThemPhongMoi" runat="server" NavigateUrl="/admin/ThemPhongMoi.aspx">Thêm phòng m&#7899;i</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hp_CapNhatPhong" runat="server" NavigateUrl="/admin/CapNhatPhong.aspx">C&#7853;p nh&#7853;t thông tin phòng</asp:HyperLink>
        </div>
        <br />
        <br />
        <div id="QuanLySuatChieu">
            <asp:Label ID="lb_QuanLySuatChieu" runat="server" Text="Qu&#7843;n lý l&#7883;ch chi&#7871;u - su&#7845;t chi&#7871;u" 
                Font-Size="X-Large" ForeColor="#CCFF33" Font-Bold="True"></asp:Label>
            <br />
            <asp:HyperLink ID="hp_CapNhatSuatChieu" runat="server" NavigateUrl="/admin/CapNhatSuatChieu.aspx">C&#7853;p nh&#7853;t danh m&#7909;c su&#7845;t chi&#7871;u</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/admin/TaoLichChieu.aspx">T&#7841;o l&#7883;ch chi&#7871;u t&#7921; &#273;&#7897;ng</asp:HyperLink>
        </div>
        <br />
        <div id="QuanLyTaiKhoan">            
            <asp:Label ID="lb_QuanLyTaiKhoan" runat="server" Text="Qu&#7843;n lý thông tin tài kho&#7843;n" 
                Font-Size="X-Large" ForeColor="#CCFF33" Font-Bold="True"></asp:Label>
            <br />
            <asp:HyperLink ID="hp_ThemTaiKhoan" runat="server" NavigateUrl="/thanhvien/themtaikhoanmoi.aspx">Thêm tài kho&#7843;n m&#7899;i</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hp_ThayDoiThongTinTaiKhoan" runat="server" NavigateUrl="/thanhvien/thaydoithongtintaikhoan.aspx">Thay &#273;&#7893;i thông tin tài kho&#7843;n</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hp_ThayDoiTinhTrangTaiKhoan" runat="server" NavigateUrl="/thanhvien/thaydoitinhtrangtaikhoan.aspx">Thay &#273;&#7893;i tình tr&#7841;ng tài kho&#7843;n</asp:HyperLink>
            
        </div>
    </div>
</asp:Content>
