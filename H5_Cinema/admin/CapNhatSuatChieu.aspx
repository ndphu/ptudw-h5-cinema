<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapNhatSuatChieu.aspx.cs" Inherits="H5_Cinema.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="title">
            <asp:Label ID="lb_CapNhatSuatChieu" runat="server" 
                        Text="C&#7853;p nh&#7853;t su&#7845;t chi&#7871;u" Font-Size="X-Large" 
                        ForeColor="#CCFF66" Font-Bold="True"></asp:Label>
        </div>
        <br />
        <div id="main">
            
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <div id="control" align="center" 
                                
                                style="border: thin groove #333333; width: 400; background-image: url('/Img/001.png'); background-repeat: repeat;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lb_ChonGio" runat="server" Text="Ch&#7885;n gi&#7901;:" ForeColor="#FFFF66"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tb_Gio" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lb_ChonPhut" runat="server" Text="Ch&#7885;n phút:" 
                                        ForeColor="#FFFF66"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tb_Phut" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lb_GiaDanhMuc" runat="server" Text="Giá danh m&#7909;c:" 
                                        ForeColor="#FFFF66"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tb_GiaDanhMucSuatMoi" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="btn_ThemSuat" runat="server" Text="Thêm su&#7845;t m&#7899;i" 
                                        onclick="btn_ThemSuat_Click" />
                                    </td>
                                </tr>                                
                            </table>
                            </div>
                            <div id="validate">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="Gi&#7901; không th&#7875; b&#7887; tr&#7889;ng" ControlToValidate="tb_Gio" Display="None"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="Phút không th&#7875; b&#7887; tr&#7889;ng" ControlToValidate="tb_Phut" 
                                    Display="None"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="Giá danh m&#7909;c không &#273;&#432;&#7907;c b&#7887; tr&#7889;ng" ControlToValidate="tb_GiaDanhMucSuatMoi" 
                                    Display="None"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ErrorMessage="Gi&#7901; ph&#7843;i t&#7915; 0-&gt;23" ControlToValidate="tb_Gio" 
                                    MaximumValue="23" MinimumValue="0" Type="Integer" Display="None"></asp:RangeValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                    ErrorMessage="Phút ph&#7843;i t&#7915; 0-&gt;59" 
                                    ControlToValidate="tb_Phut" Display="None" 
                                    MaximumValue="59" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                <asp:RangeValidator ID="RangeValidator3" runat="server" 
                                    ErrorMessage="Giá danh m&#7909;c ph&#7843;i t&#7915; 0->1000000" 
                                    ControlToValidate="tb_GiaDanhMucSuatMoi" Display="None" 
                                    MaximumValue="1000000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                <div align="left" style="width: 80%">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                                </div>
                
                            </div>
                        </div>
                        <div>
                            <asp:DataList ID="dl_SuatChieuHienTai" runat="server" 
                                onprerender="dl_SuatChieuHienTai_PreRender" RepeatColumns="4" 
                                RepeatDirection="Horizontal" 
                                onselectedindexchanged="dl_SuatChieuHienTai_SelectedIndexChanged">
                                <ItemTemplate>
                                    
                                    <div style="border: thin groove #808080; padding: 5px; margin: 5px; width: 150px; background-image: url('../Img/001.png'); background-repeat: repeat;" align="center">
                                        <asp:Label ID="lb_ThoiGianBatDau" runat="server" ForeColor="#FFFFCC"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="tb_GiaDanhMuc" runat="server" Text='<%# Eval("GiaDanhMuc")%>' Width="80"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="lb_TrangThai" runat="server"></asp:Label>
                                        <br />
                                        <asp:LinkButton ID="btn_ThayDoi" runat="server" 
                                            CommandArgument='<%# Eval("MaDanhMucSuatChieu") %>' 
                                            onclick="btn_ThayDoi_Click" Width="100" Font-Size="Small" 
                                            CausesValidation="False" />
                                        <br />
                                        <asp:LinkButton ID="btn_CapNhatGia" runat="server" 
                                            CommandArgument='<%# Eval("MaDanhMucSuatChieu") %>' Font-Size="Small" 
                                            CausesValidation="False" onclick="btn_CapNhatGia_Click">C&#7853;p nh&#7853;t giá</asp:LinkButton>
                                    </div>
                                    
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
