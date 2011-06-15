<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapNhatPhong.aspx.cs" Inherits="H5_Cinema.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 5px; margin: 5px">
        <div align="center">
                    <asp:Label ID="lb_CapNhatPhong" runat="server" 
                        Text="C&#7853;p nh&#7853;t phòng" Font-Size="X-Large" 
                        ForeColor="#CCFF66"></asp:Label>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" onprerender="UpdatePanel1_PreRender">
                <ContentTemplate>
                    <div id="ChonPhong">
                        <asp:Label ID="lb_ChonPhong" runat="server" Text="Ch&#7885;n phòng:" ForeColor="#FFFFCC"></asp:Label>
                        <asp:DropDownList ID="cbb_Phong" runat="server" DataSourceID="CinemaLINQ_Phong" 
                            DataTextField="TenPhongChieuPhim" DataValueField="MaPhongChieuPhim" 
                            Width="200" 
                            AutoPostBack="True" ToolTip="Ch&#7885;n phòng">
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="CinemaLINQ_Phong" runat="server" 
                            ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                            TableName="PhongChieuPhims" Where="TinhTrang == @TinhTrang">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="true" Name="TinhTrang" Type="Boolean" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                    <br />
                    <div id="SoDoGhe">
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
                    <asp:Button ID="btn_CapNhatHoanTat" runat="server" 
                        Text="C&#7853;p nh&#7853;t hoàn t&#7845;t" 
                        onclick="btn_CapNhatHoanTat_Click"/>
                </div>
            </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
