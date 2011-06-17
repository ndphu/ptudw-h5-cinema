<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoLichChieu.aspx.cs" Inherits="H5_Cinema.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="title">
            <asp:Label ID="lb_TaoLichChieu" runat="server" 
                Text="T&#7841;o l&#7883;ch chi&#7871;u" Font-Size="X-Large" 
                ForeColor="#CCFF66"></asp:Label>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" 
            onprerender="UpdatePanel1_PreRender">
            <ContentTemplate>        
                <div id="main" style="border: thin groove #808080; padding: 5px; margin: 5px">
                    <div id="ChonPhim" align="left">
                        <div>
                            <asp:Label ID="lb_ChonPhim" runat="server" 
                                Text="Ch&#7885;n phim" Font-Size="Large" 
                                ForeColor="#CCFF66"></asp:Label>
                        </div>
                        <div>                    
                            <asp:Label ID="lb_TenPhim" runat="server" ForeColor="#FFFFCC" Text="Tên phim:"></asp:Label>
                            <asp:DropDownList ID="cbb_ChonPhim" runat="server" DataSourceID="Phim" 
                                DataTextField="TenPhim" DataValueField="MaPhim" Width="250" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:LinqDataSource ID="Phim" runat="server" 
                                ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                                TableName="Phims" Where="TinhTrang == @TinhTrang">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="true" Name="TinhTrang" Type="Boolean" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <br />
                            <br />
                        </div>
                    </div>
                    <br />
                    <div id="ChonPhong" align="left">
                        <div>
                            <asp:Label ID="lb_ChonPhong" runat="server" 
                                Text="Ch&#7885;n phòng" Font-Size="Large" 
                                ForeColor="#CCFF66"></asp:Label>
                        </div>
                        <div>                    
                            <asp:Label ID="lb_TenPhong" runat="server" ForeColor="#FFFFCC" Text="Tên phòng:"></asp:Label>
                            <asp:DropDownList ID="cbb_Phong" runat="server" DataSourceID="Phong" 
                                DataTextField="TenPhongChieuPhim" DataValueField="MaPhongChieuPhim" 
                                Width="250px" AutoPostBack="True">
                            </asp:DropDownList>
                            
                            <asp:LinqDataSource ID="Phong" runat="server" 
                                ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                                TableName="PhongChieuPhims" Where="TinhTrang == @TinhTrang">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="true" Name="TinhTrang" Type="Boolean" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            
                            <br />
                            <br />
                        </div>
                    </div>
                    <br />
                    <div id="ChonNgay" align="left">
                        <div>
                            <asp:Label ID="lb_ChonNgay" runat="server" 
                                Text="Ch&#7885;n ngày" Font-Size="Large" 
                                ForeColor="#CCFF66"></asp:Label>
                        </div>
                        <div>                    
                            <asp:Label ID="lb_Ngay" runat="server" ForeColor="#FFFFCC" Text="Ch&#7885;n ngày:"></asp:Label>
                            <asp:DropDownList ID="cbb_ChonNgay" runat="server" Width="250" 
                                AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="1">Ngày mai</asp:ListItem>
                                <asp:ListItem Value="3">3 ngày ti&#7871;p theo</asp:ListItem>
                                <asp:ListItem Value="7">7 ngày ti&#7871;p theo</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <div id="Div1" align="center">
                        <asp:Button ID="btn_PhatSinh" runat="server" Text="Phát sinh l&#7883;ch chi&#7871;u" 
                            onclick="btn_PhatSinh_Click" />
                    </div>
                    <br />
                    <asp:DataList ID="dl_DsLichChieu" runat="server" >                        
                        <ItemTemplate>
                            <div style="padding: 5px; margin: 5px; border: medium groove #99FF33;">
                                <asp:Label ID="lb_NgayChieu" runat="server" ForeColor="#FFFFCC"></asp:Label>
                                <asp:DataList ID="dl_SuatChieu" runat="server" RepeatColumns="5" 
                                RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div style="padding: 5px; margin: 5px; border: medium groove #CC6600;">
                                            <asp:Label ID="lb_ThoiGian" runat="server" ForeColor="#99FF99"></asp:Label>
                                            <br />
                                            <asp:Label ID="lb_Phong" runat="server" ForeColor="#0066FF"></asp:Label>
                                            <br />
                                            <asp:Label ID="lb_Phim" runat="server" ForeColor="#FF9900"></asp:Label>
                                            <br />
                                            <asp:Label ID="lb_TinhTrang" runat="server" Text=""></asp:Label>
                                            <br />
                                            <asp:LinkButton ID="btn_ThayDoi" runat="server" onclick="btn_ThayDoi_Click" 
                                                CommandArgument='<%# Eval("MaSuatChieu") %>' ></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </ItemTemplate>
                        
                    </asp:DataList>

                    </div>
                </div>
                <div align="center">
                    <asp:Label ID="lb_ThongBao" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Button ID="btn_XacNhan" runat="server" Text="Xác nh&#7853;n l&#7883;ch chi&#7871;u" 
                        onclick="btn_XacNhan_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
