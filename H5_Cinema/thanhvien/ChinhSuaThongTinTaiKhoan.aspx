<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChinhSuaThongTinTaiKhoan.aspx.cs" Inherits="H5_Cinema.thanhvien.ChinhSuaThongTinTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width: 100%" align="center">
<div style="border: thin solid #FF3300; width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300; background-image: url('../Img/001.png'); background-repeat: repeat">
    <asp:Label ID="Label1" runat="server" Text="C&#7852;P NH&#7852;T THÔNG TIN TÀI KHO&#7842;N" 
    ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label></div>    
    <div style="width: 100%" align="center"><asp:Label ID="Label2" runat="server" Text="C&#7853;p nh&#7853;t thông tin tài kho&#7843;n thành công" 
    ForeColor="Red" Font-Bold="True" Font-Size="Large" Visible="false"></asp:Label></div>    
    <br />
    <div>

        <table style="width:100%; color: #FF3300;" align="center">
            <tr>
                <td style="width: 152px">
                    Tên tài kho&#7843;n:</td>
                <td style="width: 368px;text-align:left">
                    <asp:TextBox ID="Th_TenTaiKhoan" runat="server" Width="285px" ToolTip="Tên tài kho&#7843;n &#273;&#259;ng ký"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" Text="" />
                    <asp:Button ID="Check" runat="server" Text="Check" onclick="Check_Click" CausesValidation="false" />
                    <br />
                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Tên tài kho&#7843;n không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_TenTaiKhoan" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Tài kho&#7843;n ph&#7843;i t&#7915; 6-32 ký t&#7921; và không ch&#7913;a ký t&#7921; &#273;&#7863;c bi&#7879;t" ControlToValidate="Th_TenTaiKhoan" 
                        Display="None" 
                        ValidationExpression="^[a-zA-Z0-9]{6,32}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Email:</td>
                <td style="width: 368px;text-align:left">
                    <asp:TextBox ID="Th_Email" runat="server" Width="285px" ToolTip="Email ng&#432;&#7901;i dùng"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Email không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_Email" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Email không &#273;úng &#273;&#7883;nh d&#7841;ng" ControlToValidate="Th_Email" 
                        Display="None" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    &#272;&#7883;a ch&#7881;:</td>
                <td style="width: 368px;text-align:left">
                    <asp:TextBox ID="Th_DiaChi" runat="server" Width="285px" ToolTip="&#272;&#7883;a ch&#7881; ng&#432;&#7901;i dùng"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="&#272;&#7883;a ch&#7881; không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_DiaChi" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td style="width: 152px">
                    Lo&#7841;i ng&#432;&#7901;i dùng:</td>
                <td style="width: 368px;text-align:left">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CinemaLINQLoaiNguoiDung" 
                        DataTextField="TenDanhMucNguoiDung" 
                        DataValueField="MaDanhMucNguoiDung" Width="200px" 
                        ToolTip="Lo&#7841;i ng&#432;&#7901;i dùng" 
                        ondatabound="DropDownList2_DataBound">
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="CinemaLINQLoaiNguoiDung" runat="server" 
                        ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
                        Select="new (MaDanhMucNguoiDung, TenDanhMucNguoiDung)" TableName="DanhMucNguoiDungs" 
                        Where="TinhTrang == @TinhTrang">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="true" Name="TinhTrang" Type="Boolean" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr> 
        </table>
        <br/>
    </div>
    <div style="width: 100%" align="center">
        <asp:Button ID="Xl_CapNhatThayDoi" runat="server" Text="C&#7853;p nh&#7853;t thay &#273;&#7893;i" 
            style="text-align: center" onclick="Xl_CapNhatThayDoi_Click"/>
        
    </div>
    <br/>
    <div style="width: 100%">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
            BackColor="#0099CC" />
    </div>
    <br/>
    </div>
</asp:Content>
