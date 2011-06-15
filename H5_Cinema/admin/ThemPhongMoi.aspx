<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemPhongMoi.aspx.cs" Inherits="H5_Cinema.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
    <div align="center">
                <asp:Label ID="lb_ThemPhongMoi" runat="server" 
                    Text="Thêm phòng m&#7899;i" Font-Size="X-Large" 
                    ForeColor="#CCFF66"></asp:Label>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" 
            onprerender="UpdatePanel1_PreRender">
        <ContentTemplate>
            <div style="padding: 10px; margin: 10px; width: 80%; background-image: url('/Img/001.png');" align="left">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 160px">
                            <asp:Label ID="lb_TenPhong" runat="server" ForeColor="Wheat" 
                                Text="Tên phòng chi&#7871;u:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tb_TenPhong" runat="server" Width="270px" ></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="tb_TenPhong" Display="None" 
                                ErrorMessage="Tên phòng chi&#7871;u không th&#7875; b&#7887; tr&#7889;ng" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </td>                
                    </tr>
                    <tr>
                        <td style="width: 160px">
                            <asp:Label ID="lb_Rap" runat="server" Text="R&#7841;p:" ForeColor="Wheat"></asp:Label>
                        </td>
                        <td>
                    
                            <asp:DropDownList ID="cbb_RapPhim" runat="server" DataSourceID="CinemaLINQRap" 
                                DataTextField="TenRapChieuPhim" DataValueField="MaRapChieuPhim" 
                                Width="270px">
                            </asp:DropDownList>
                            <asp:LinqDataSource ID="CinemaLINQRap" runat="server" 
                                ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                                TableName="RapChieuPhims" Where="TinhTrang == @TinhTrang">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="True" Name="TinhTrang" Type="Boolean" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 160px">
                            <asp:Label ID="lb_SoHangGhe" runat="server" Text="S&#7889; hàng gh&#7871;:" ForeColor="Wheat"></asp:Label>
                            :</td>
                        <td>
                            <asp:TextBox ID="tb_SoHangGhe" runat="server" Width="150px" ></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="tb_SoHangGhe" Display="None" 
                                ErrorMessage="S&#7889; hàng gh&#7871; không th&#7875; b&#7887; tr&#7889;ng" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="tb_SoHangGhe" Display="None" 
                                ErrorMessage="S&#7889; hàng gh&#7871; ch&#7881; t&#7915; 4-25 hàng" ForeColor="#FF3300" 
                                MaximumValue="25" MinimumValue="4" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 160px">
                            <asp:Label ID="lb_SoGheTrenHang" runat="server" Text="S&#7889; ghê trên hàng:" ForeColor="Wheat"></asp:Label>
                            :</td>
                        <td>
                            <asp:TextBox ID="tb_SoGheTrenHang" runat="server" Width="150px" ></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="tb_SoGheTrenHang" Display="None" 
                                ErrorMessage="S&#7889; ghê trên hàng không th&#7875; b&#7887; tr&#7889;ng" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                ControlToValidate="tb_SoGheTrenHang" Display="None" 
                                ErrorMessage="S&#7889; gh&#7871; ch&#7881; t&#7915; 4-22 gh&#7871;" 
                                ForeColor="#FF3300" MaximumValue="22" 
                                MinimumValue="4" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">                            
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="Small" 
                                ForeColor="#FF3300" />
                        </td>
                    </tr>
                </table>
            </div>
                <asp:Button ID="Xl_XemSoDoGhe" runat="server" 
                Text="Xem s&#417; &#273;&#7891; gh&#7871;" onclick="Xl_XemSoDoGhe_Click" />
            <div>
            <div>
                <div style="padding: 5px; margin: 5px; background-image: url('/Img/browndirt.jpg'); background-repeat: repeat; width: 100%">
                    <div id="manchieu">
                        <asp:Image ID="img_manchieu" runat="server" ImageUrl="/Img/manchieu.png"/>
                    </div>
                    <div>
                        <asp:DataList ID="dl_SoDoGhe" runat="server"
                            RepeatDirection="Horizontal" CellPadding="1" CellSpacing="1">
                            <ItemTemplate>
                                        <asp:ImageButton
                                            ID="btn_Chuyen" runat="server" onclick="btn_Chuyen_Click" CausesValidation="False" CommandArgument='<%#Eval("MaGhe") %>'
                                       />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
                <div align="left" 
                    style="border: thin groove #333333; padding: 5px; margin: 5px; width: 50%; background-color: #333333;">
                    <asp:Image ID="img_GheThuong" runat="server" ImageUrl="/Img/ghethuong.jpg" />
                    <asp:Label ID="lb_GheThuong" runat="server" 
                        Text="  : Gh&#7871; th&#432;&#7901;ng" ForeColor="#FFFFCC" 
                        Font-Size="Small"></asp:Label>
                    <br />
                    <asp:Image ID="img_GheVip" runat="server" ImageUrl="/Img/ghevip.jpg" />
                    <asp:Label ID="lb_GheVip" runat="server" Text="  : Gh&#7871; Vip" 
                        ForeColor="#FFFFCC" Font-Size="Small"></asp:Label>
                    <br />
                    <asp:Label ID="lb_HuongDan" runat="server" ForeColor="#CCFF33" 
                        
                        Text="Click lên gh&#7871; &#273;&#7875; thay &#273;&#7893;i lo&#7841;i cho gh&#7871; &#273;ó" 
                        Font-Size="Small"></asp:Label>
                </div>
                <div>
                    <asp:Button ID="btn_ThemPhongMoi" runat="server" Text="Thêm phòng m&#7899;i" 
                        onclick="btn_ThemPhongMoi_Click" />
                </div>
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>
