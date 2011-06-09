<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemTaiKhoanMoi.aspx.cs" Inherits="H5_Cinema.thanhvien.ThemTaiKhoanMoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
<div style="border: thin solid #FF3300; width: 79%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300; background-image: url('../Img/001.png'); background-repeat: repeat">
    <asp:Label ID="Label1" runat="server" Text="THÊM TÀI KHOẢN MỚI" 
    ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>  </div>
    <div>
        <table style="width:100%; color: #FF3300;" align="center">
            <tr>
                <td style="width: 152px">
                    Tên tài kho&#7843;n:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_TenTaiKhoan" runat="server" Width="338px" ToolTip="Tên tài kho&#7843;n &#273;&#259;ng ký"></asp:TextBox>
                    <br />
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
                    M&#7853;t kh&#7849;u:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_MatKhau" runat="server" Width="338px" 
                        ToolTip="M&#7853;t kh&#7849;u s&#7917; d&#7909;ng" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="M&#7853;t kh&#7849;u không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_MatKhau" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="M&#7853;t kh&#7849;u ph&#7843;i t&#7915; 6-32 ký t&#7921;" ControlToValidate="Th_MatKhau" 
                        Display="None" 
                        ValidationExpression="^[a-zA-Z0-9@#$%^&+=]{6,32}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Xác nh&#7853;n m&#7853;t kh&#7849;u:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_XacNhanMatKhau" runat="server" Width="338px" 
                        ToolTip="Xác nh&#7853;n l&#7841;i m&#7853;t kh&#7849;u" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Xác nh&#7853;n m&#7853;t kh&#7849;u không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_XacNhanMatKhau" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Xác nh&#7853;n m&#7853;t kh&#7849;u không chính xác" ControlToValidate="Th_XacNhanMatKhau"  ControlToCompare="Th_MatKhau"
                        Display="None"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Email:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_Email" runat="server" Width="338px" ToolTip="Email ng&#432;&#7901;i dùng"></asp:TextBox>
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
                <td style="width: 338px">
                    <asp:TextBox ID="Th_DiaChi" runat="server" Width="338px" ToolTip="&#272;&#7883;a ch&#7881; ng&#432;&#7901;i dùng"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="&#272;&#7883;a ch&#7881; không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_DiaChi" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>   
             <tr>
                <td style="width: 152px">
                    Lo&#7841;i ng&#432;&#7901;i dùng:</td>
                <td style="width: 338px">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CinemaLINQLoaiNguoiDung" 
                        DataTextField="TenDanhMucNguoiDung" 
                        DataValueField="MaDanhMucNguoiDung" Width="200px" ToolTip="Loại người dùng">
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
        </br>
        <asp:Button ID="Xl_ThemTaiKhoan" runat="server" Text="Thêm tài kho&#7843;n" 
            style="text-align: center" onclick="Button1_Click" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        BackColor="#0099CC" />
        </br>
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </br>
        </div>
        </br>
    </div>
</div>
</asp:Content>
