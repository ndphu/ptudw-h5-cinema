<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietPhim.aspx.cs" Inherits="H5_Cinema.WebForm3" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="H5_Cinema" %>
<%@ Register Src="~/phim/UCBinhLuan.ascx" TagName="UCBinhLuan" TagPrefix="UC"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border: thin solid #808080; width: 100%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;" 
        align="center">
    

    <script src="../Scripts/jwplayer.js" type="text/javascript"></script>
    <%
       
        try
        {
            Phim currentPhim = (Phim)Session["CurrentPhim"];
            if (currentPhim != null)
            {
             %>
             <div style="border: thin solid #808080; background-image: url('../Img/001.png'); width: 100%;" 
            align="center">
    <asp:Label ID="Label1" runat="server" Text="CHI TI&#7870;T B&#7896; PHIM" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
    <div style="border: thin solid #808080; width: 100%; background-image: url('../Img/browndirt.jpg');" 
            align="center">
    <table align="center" border="0.5" 
            
            style="border: thin solid #808080; background-image: inherit; width: 100%;" >
            <tr>
        
        <td style="color: #008080" colspan="2" align="center">
        
        <div id='mediaspace' style="border: medium ridge #FF9933; color: #808080" 
                align="center">Không tìm th&#7845;y trailer cho phim này</div>
 
        <script type='text/javascript'>
            jwplayer('mediaspace').setup({
                'flashplayer': 'player.swf',
                'file': '<%=currentPhim.TrailerPhim %>',
                'controlbar': 'bottom',
                'width': '640',
                'height': '480'
            });
        </script>
        </td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label2" runat="server" Text="Tên film:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.TenPhim%></td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label8" runat="server" Text="Th&#7875; lo&#7841;i:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim%></td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label9" runat="server" Text="&#272;&#7841;o di&#7877;n:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DaoDien%></td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label10" runat="server" Text="Di&#7877;n viên chính:   " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DienVienThamGia%></td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label11" runat="server" Text="&#272;i&#7875;m &#273;ánh giá: " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.DiemDanhGia%></td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label3" runat="server" Text="Th&#7901;i l&#432;&#7907;ng: " ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF"><%=currentPhim.ThoiLuong%></td>
    </tr>
    <tr>
        <td style="width: 200px"><asp:Label ID="Label12" runat="server" Text="Hình &#7843;nh:" ForeColor="Red"></asp:Label></td>
        <td style="color: #FFFFFF">
        <asp:Image runat="server" Width="180" ID="Th_HinhAnh"/>
        </td>
    </tr>

    <tr>
        <td style="width: 200px"><asp:Label runat="server" Text="Tóm t&#7855;t n&#7897;i dung:" ForeColor="Red"></asp:Label></td>
        <td style="color: #008080"><%=currentPhim.NoiDung %>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2"><div>
        <%
            %>
            </br>
            <div style="width: 90%">
            <asp:Panel ID="Panel1" runat="server" BorderWidth="3px" Height="300px" 
                    ScrollBars="Horizontal">
            </asp:Panel>
            </div>
            </br>
        </div></td>
    </tr>
    <%
    }%>
        <%NguoiDung nguoiDung = (NguoiDung)Session["NguoiDung"];
          if (nguoiDung != null)
          { %>
        <tr>
        <td colspan="2" align="center">
            <asp:TextBox Width="85%" 
                runat="server" ID="Th_BinhLuanMoi" 
                style="text-align: left"  Text="" AutoPostBack="false" 
                CausesValidation="false" Font-Names="Tahoma" TextMode="MultiLine" 
                Height="116px" /></td>
        </tr>
        <tr>
        <td colspan="2" align="center">
            <br />
            <asp:Button ID="Xl_ThemBinhLuan" runat="server" Text="Bình lu&#7853;n" 
                onclick="Xl_ThemBinhLuan_Click" />
            <br />
            </td>
        </tr>
            <%
        }
        }
        catch { }%>
        
    </table> 
    </div>
    </div>
</asp:Content>
