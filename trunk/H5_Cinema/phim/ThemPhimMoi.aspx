<%@ Page Title="Thêm phim m&#7899;i" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemPhimMoi.aspx.cs" Inherits="H5_Cinema.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" 
    style="border: thin solid #808080; background-image: url('../Img/browndirt.jpg')">
    <div style="border: thin solid #808080; width: 100%; background-image: url('../Img/001.png');" 
        align="center"><asp:Label ID="Label1" runat="server" Text="THÊM PHIM M&#7898;I" 
    ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label></div>    
    <br />
    <div>

        <table style="width:100%; color: #FF3300;" align="center">
            <tr>
                <td style="width: 152px">
                    Tên phim:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_TenPhim" runat="server" Width="338px" ToolTip="Tên b&#7897; phim"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Tên phim không th&#7875; b&#7887; tr&#7889;ng" ControlToValidate="Th_TenPhim" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Th&#7875; lo&#7841;i:</td>
                <td style="width: 338px">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="CinemaLINQTheLoai" 
                        DataTextField="TenDanhMucTheLoaiPhim" 
                        DataValueField="MaDanhMucTheLoaiPhim" Width="200px" 
                        ToolTip="Th&#7875; lo&#7841;i phim">
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="CinemaLINQTheLoai" runat="server" 
                        ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                        TableName="DanhMucTheLoaiPhims">
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Lo&#7841;i phim:</td>
                <td style="width: 338px">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CinemaLINQLoaiPhim" 
                        DataTextField="TenTheLoai" 
                        DataValueField="MaLoai" Width="200px" ToolTip="Th&#7875; lo&#7841;i phim">
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="CinemaLINQLoaiPhim" runat="server" 
                        ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                        TableName="DanhMucLoaiPhims">
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    &#272;&#7841;o di&#7877;n:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_DaoDien" runat="server" Width="338px" 
                        ToolTip="&#272;&#7841;o di&#7877;n c&#7911;a phim"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Tên &#273;&#7841;o di&#7877;n không th&#7875; b&#7887; tr&#7889;ng" 
                        ControlToValidate="Th_DaoDien" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Di&#7877;n viên:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_DienVien" runat="server" Width="338px" 
                        ToolTip="Di&#7877;n viên chính c&#7911;a b&#7897; phim"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Tên di&#7877;n viên không th&#7875; b&#7887; tr&#7889;ng" 
                        ControlToValidate="Th_DienVien" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Tóm t&#7855;t n&#7897;i dung:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_NoiDung" runat="server" Width="338px" Height="68px" 
                        TextMode="MultiLine" ToolTip="Tóm t&#259;t n&#7897;i dung c&#7911;a phim" 
                        Font-Names="Tahoma"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Tóm t&#7855;t n&#7897;i dung không th&#7875; b&#7887; tr&#7889;ng" 
                        ControlToValidate="Th_NoiDung" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Ngôn ng&#7919;:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_NgonNgu" runat="server" Width="338px" 
                        ToolTip="Ngôn ng&#7919; c&#7911;a phim"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Ngôn ng&#7919; không th&#7875; b&#7887; tr&#7889;ng" ControlToValidate="Th_NgonNgu" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Th&#7901;i l&#432;&#7907;ng:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_ThoiLuong" runat="server" Width="338px" 
                        ToolTip="Th&#7901;i l&#432;&#7907;ng c&#7911;a phim (t&#7915; 60-180 phút)"></asp:TextBox>
                    <br />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ErrorMessage="Th&#7901;i l&#432;&#7907;ng không h&#7907;p l&#7879;" ControlToValidate="Th_ThoiLuong" 
                        Display="None" MaximumValue="180" MinimumValue="60" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            
            <tr>
                <td style="width: 152px">
                    &#7842;nh phim:</td>
                <td style="width: 338px">
                    <asp:FileUpload ID="Th_AnhPhim" runat="server" Width="218px" 
                        ToolTip="&#7842;nh poster c&#7911;a phim" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="&#7842;nh phim không th&#7875; b&#7887; tr&#7889;ng" ControlToValidate="Th_AnhPhim" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="Th_AnhPhim" Display="None" 
                        ErrorMessage="&#7842;nh phim ph&#7843;i là &#273;&#7883;nh d&#7841;ng jpg/jpeg/png/gif/bmp/tif" 
                        ValidationExpression="^.+\.((bmp)|(BMP)|(gif)|(GIF)|(jpg)|(JPG)|(jpeg)|(JPEG)|(png)|(PNG))$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Trailer:</td>
                <td style="width: 338px">
                    <asp:FileUpload ID="Th_Trailer" runat="server" Width="219px" 
                        ToolTip="Trailer c&#7911;a phim" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Trailer phim không th&#7875; b&#7887; tr&#7889;ng" 
                        ControlToValidate="Th_Trailer" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="Th_Trailer" Display="None" 
                        ErrorMessage="Trailer ph&#7843;i là &#273;&#7883;nh d&#7841;ng mp4/flv/ogg/avi/wmv" 
                        ValidationExpression="^.+\.((avi)|(AVI)|(mp4)|(MP4)|(ogg)|(OGG)|(flv)|(FLV))$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>

    </div>
    <div style="width: 100%" align="center">
        <asp:Button ID="Xl_ThemPhimMoi" runat="server" Text="Thêm phim m&#7899;i" 
            style="text-align: center" onclick="Button1_Click" />
    </div>
    <div style="width: 100%">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
            BackColor="#0099CC" />
    </div>
<br />
</div>
</asp:Content>
