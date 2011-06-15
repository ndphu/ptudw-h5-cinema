<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapNhatSuatChieu.aspx.cs" Inherits="H5_Cinema.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="title">
            <asp:Label ID="lb_CapNhatSuatChieu" runat="server" 
                        Text="C&#7853;p nh&#7853;t su&#7845;t chi&#7871;u" Font-Size="X-Large" 
                        ForeColor="#CCFF66"></asp:Label>
        </div>
        <div id="main">
            
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:DataList ID="dl_SuatChieuHienTai" runat="server" 
                                onprerender="dl_SuatChieuHienTai_PreRender">
                                <ItemTemplate>
                                    <asp:TextBox ID="tb_ThoiGian" runat="server" ReadOnly="True" 
                                        Text='<%# Eval("ThoiGianBatDau") %>'></asp:TextBox>
                                    <asp:Button ID="btn_Sua" runat="server" 
                                        CommandArgument='<%# Eval("MaDanhMucSuatChieu") %>' Text="S&#7917;a" />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
