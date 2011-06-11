<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietPhim.aspx.cs" Inherits="H5_Cinema.WebForm3" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="H5_Cinema" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border: thin solid #808080; width: 100%; background-image: url('/Img/subtlecolor.jpg'); background-repeat: repeat;" 
        align="center">
    <script src="../Scripts/jwplayer.js" type="text/javascript"></script>
        <% Phim currentPhim = (Phim)Session["CurrentPhim"]; %>
    <div style="border: thin solid #808080; background-image: url('../Img/001.png'); width: 100%;" 
            align="center">
    <asp:Label ID="Label1" runat="server" Text="CHI TI&#7870;T B&#7896; PHIM" 
        ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        </div>
    <div style="border: thin solid #808080; width: 100%; background-image: url(''/Img/subtlecolor.jpg'');" 
            align="center">
  <div style="width: 100%;" >
        <br />
        <div id='mediaspace' style="border: medium ridge #FF9933; color: #808080;" 
                align="center">Không tìm th&#7845;y trailer cho phim này</div>
        <br />
        <script type='text/javascript'>
            jwplayer('mediaspace').setup({
                'flashplayer': 'player.swf',
                'file': '<%=currentPhim.TrailerPhim %>',
                'controlbar': 'bottom',
                'width': '560',
                'height': '360'
            });
        </script>
    </div>
    <br />
    <div>
        <asp:FormView ID="FormView_Phim" runat="server" Width="80%">
            <HeaderTemplate>
            <div align="center" 
                    style="border: medium groove #333333; background-color: #6699FF; background-image: url('../Img/001.png');">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    ForeColor="#CC6600" Text="THÔNG TIN PHIM"></asp:Label>
            </div>
            </HeaderTemplate>
            <ItemTemplate>
            <div align="center">
            <div style="border: thin groove #333333; padding: 5px; margin: 10px; width: 90%; background-image: url('../Img/001.png'); background-repeat: repeat;" 
                    align="center">
                <asp:Image ID="Th_HinhAnh" runat="server" Width="80%" 
                    ImageUrl='<%# Eval("AnhPhim") %>' />
            </div>
            <div align="left" 
                    style="padding: 10px; margin: 10px; color: #CCFFCC; background-image: url('/Img/001.png'); width: 90%;">
                <asp:Label ID="Th_TenPhim" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    ForeColor="#FF3300" Text='<%# Eval("TenPhim") %>'></asp:Label>
                <br />
                Lo&#7841;i phim:<asp:Label ID="Th_LoaiPhim" runat="server" ForeColor="#FFCC00" 
                    Text='<%# Eval("DanhMucLoaiPhim.TenTheLoai") %>'></asp:Label>
                <br />
                Th&#7875; lo&#7841;i:<asp:Label ID="Th_TheLoai" runat="server" ForeColor="#00CCFF" 
                    Text='<%# Eval("DanhMucTheLoaiPhim.TenDanhMucTheLoaiPhim") %>'></asp:Label>
                <br />
                &#272;&#7841;o di&#7877;n:<asp:Label ID="Th_DaoDien" runat="server" ForeColor="#00CCFF" 
                    Text='<%# Eval("DaoDien") %>'></asp:Label>
                <br />
                Di&#7877;n viên tham gia:<asp:Label ID="Th_DienVien" runat="server" 
                    ForeColor="#00CCFF" Text='<%# Eval("DienVienThamGia") %>'></asp:Label>
                <br />
                Ngôn ng&#7919;:<asp:Label ID="Th_NgonNgu" runat="server" ForeColor="#00CCFF" 
                    Text='<%# Eval("NgonNgu") %>'></asp:Label>
                <br />
                Th&#7901;i l&#432;&#7907;ng:<asp:Label ID="Th_ThoiLuong" runat="server" ForeColor="#00CCFF" 
                    Text='<%# Eval("ThoiLuong") %>'></asp:Label>
                <br />
                <span class="style1">&#272;i&#7875;m &#273;ánh giá:</span><asp:Label ID="Th_DiemDanhGia" 
                    runat="server" ForeColor="#00CCFF" Text='<%# Eval("DiemDanhGia") %>'></asp:Label>
                <br />
            </div>
            <div style="border: thin groove #666666; padding: 10px; margin: 10px; background-image: url('/Img/001.png'); background-repeat: repeat; width: 90%;" 
            align="center"><asp:TextBox ID="Th_NoiDungPhim" runat="server" TextMode="MultiLine" 
                    ReadOnly="True" Text='<%# Eval("NoiDung") %>' BackColor="#3E3E3E" 
                    ForeColor="#00CCFF" Font-Names="Tahoma" Height="101px" Width="100%"></asp:TextBox></div>
            </div>
            </ItemTemplate>
        </asp:FormView>
    </div>
        <div align="left" 
            
            
            style="padding: 10px; margin: 10px; width: 76%; background-image: url('/Img/001.png');">  
            <div>      
            <asp:Label runat="server" Text="&#272;i&#7875;m c&#7911;a b&#7841;n:" 
                ForeColor="#00CCFF" ID="Lb_DiemCuaBan"></asp:Label>
            <br />
            <asp:DropDownList ID="Th_DiemCuaBan" runat="server" Width="120">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>            
            <br />
            <asp:Button ID="Xl_ChoDiem" runat="server" Text="Cho &#272;i&#7875;m" 
                onclick="Xl_ChoDiem_Click" />
            <br />
            </div>
            <div align="center">
            <asp:Label ID="Lb_DaChoDiem" runat="server" 
                Text="B&#7841;n &#273;ã cho &#273;i&#7875;m phim này r&#7891;i" 
                ForeColor="#00CCFF" Visible="False"></asp:Label>
            </div>
        </div>
        <br />
        <div style="border: thin groove #808080; padding: 20px; width: 90%; background-image: url('/Img/001.png');">
            
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" 
        onprerender="UpdatePanel1_PreRender">
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Width="90%" 
            BorderStyle="Ridge" BorderWidth="4px" BorderColor="#333333" Height="300"
            HorizontalAlign="Justify">        
        <asp:DataList ID="DataList1" runat="server" BackColor="#333333"
                HorizontalAlign="Center">        
            <ItemTemplate>      
                <div align="left" 
                    style="padding: 5px; margin: 5px; background-image: url('/Img/001.png'); width: 550px;">         
                    <asp:Label ID="Th_TenNguoiDung" runat="server" Text='<%# Eval("NguoiDung.TenNguoiDung") %>' 
                        ForeColor="Blue"></asp:Label>
                    
                    <br />
                    <asp:Label ID="Th_ThoiGianBinhLuan" runat="server" ForeColor="#CCFF66" 
                        Text='<%# Eval("ThoiGianBinhLuan") %>' Font-Size="Small"></asp:Label>
                    <br />
                    
                    <asp:TextBox ID="Th_NoiDungBinhLuan" runat="server" ForeColor="Black" 
                        Text='<%# Eval("NoiDungBinhLuan") %>' TextMode="MultiLine" Width="500" Font-Names="Tahoma"></asp:TextBox>
                    
                    <br />
                    
                    <asp:Button ID="Xl_Sua" runat="server" 
                        CommandArgument='<%# Eval("MaBinhLuan") %>' onclick="Xl_Sua_Click" Text="S&#7917;a" />
                    <asp:Button ID="Xl_Xoa" runat="server" 
                        CommandArgument='<%# Eval("MaBinhLuan") %>' Text="Xóa" 
                        onclick="Xl_Xoa_Click"/>
                </div> 
            </ItemTemplate>
        </asp:DataList>
        </asp:Panel>
        <br />
        <div>
            <asp:TextBox ID="Th_BinhLuanMoi" runat="server" Height="70px" 
                TextMode="MultiLine" Width="480px" Font-Names="Tahoma"></asp:TextBox>
            <br />
            <asp:Button ID="Xl_ThemBinhLuan" runat="server" Text="Thêm bình lu&#7853;n" onclick="Xl_ThemBinhLuan_Click" />
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>        
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Img/loading.gif" 
            Height="50px" Width="50px">
        </asp:Image>
    </ProgressTemplate>
    </asp:UpdateProgress>
        </div>
    
    
    </div>
    </div>
</asp:Content>
