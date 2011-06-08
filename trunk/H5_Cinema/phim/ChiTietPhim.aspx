<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietPhim.aspx.cs" Inherits="H5_Cinema.WebForm3" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="H5_Cinema" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%" align="center">
    <script src="../Scripts/jwplayer.js" type="text/javascript"></script>
    <%
       
        try
        {
            Phim currentPhim = (Phim)Session["CurrentPhim"];
            if (currentPhim != null)
            {
             %>
    <asp:Label ID="Label1" runat="server" Text="CHI TI&#7870;T B&#7896; PHIM" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
    <br />
    <asp:Button ID="Xl_ChinhSua" runat="server" Text="Ch&#7881;nh s&#7917;a" onclick="Xl_ChinhSua_Click" />
    <br />
    <table align="left" border="0.5" width="800">
    <tr>
        <td style="width: 185px"><asp:Label ID="Label2" runat="server" Text="Tên film:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.TenPhim%></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label8" runat="server" Text="Th&#7875; lo&#7841;i:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim%></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label9" runat="server" Text="&#272;&#7841;o di&#7877;n:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DaoDien%></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label10" runat="server" Text="Di&#7877;n viên chính:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DienVienThamGia%></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label11" runat="server" Text="&#272;i&#7875;m &#273;ánh giá: " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DiemDanhGia%></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label3" runat="server" Text="Th&#7901;i l&#432;&#7907;ng: " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.ThoiLuong%></td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label12" runat="server" Text="Hình &#7843;nh:" ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF">
        <asp:Image runat="server" Width="180" ID="Th_HinhAnh"/>
        </td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label runat="server" Text="Tóm t&#7855;t n&#7897;i dung:" ForeColor="Red"></asp:Label></td>
        <td style="color: #008080"><%=currentPhim.NoiDung %>
        </td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label runat="server" Text="Trailer:" ForeColor="Red" 
                ID="Label13"></asp:Label></td>
        <td style="color: #008080">
        
        <div id='mediaspace' style="color: #808080">Không tìm th&#7845;y trailer cho phim này</div>
 
        <script type='text/javascript'>
            jwplayer('mediaspace').setup({
                'flashplayer': 'player.swf',
                'file': '<%=currentPhim.TrailerPhim %>',
                'controlbar': 'bottom',
                'width': '470',
                'height': '320'
            });
        </script>
        </td>
    </tr>
    <tr>
        <td style="width: 185px"><asp:Label ID="Label4" ForeColor="Red" Text="Comment:" runat="server"></asp:Label></td>
    </tr>
    <%
    }%>
    <% 
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        var query = from comment in dt.BinhLuans
                    where comment.MaPhim == int.Parse(currentPhim.MaPhim.ToString())
                    select comment;

        foreach (H5_Cinema.BinhLuan binhluan in query)
        { %>
        <tr>
            <td style="color: #008000; width: 185px;"><%=binhluan.NguoiDung.TenNguoiDung%> &#273;ã vi&#7871;t:</td>
            <td style="color: #008080"><%=binhluan.NoiDungBinhLuan%></td>
        </tr>
        <%}%>
        <%NguoiDung nguoiDung = (NguoiDung)Session["NguoiDung"];
          if (nguoiDung != null)
          { %>
        <tr>
        <td style="width: 185px"><asp:Label ID="Label5" runat="server" Text="Bình lu&#7853;n c&#7911;a b&#7841;n:" ForeColor="Red" /></td>
        <td><asp:TextBox Width="400px" Height="129px" runat="server" ID="Th_BinhLuanMoi" 
                style="text-align: left"  Text="" AutoPostBack="false" 
                CausesValidation="false" Font-Names="Tahoma" TextMode="MultiLine" /></td>
        </tr>
        <tr>
        <td style="width: 185px"></td>
        <td>
            <asp:Button ID="Xl_ThemBinhLuan" runat="server" Text="Bình lu&#7853;n" 
                onclick="Xl_ThemBinhLuan_Click" />
            </td>
        </tr>
            <%
        }
        }
        catch { }%>
        
    </table> 
    </div>
</asp:Content>
