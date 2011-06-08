﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThayDoiThongTinTaiKhoan.aspx.cs" Inherits="H5_Cinema.thanhvien.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width: 100%" align="center">
    <asp:Label ID="Label1" runat="server" Text="C&#7852;P NH&#7852;T THÔNG TIN TÀI KHO&#7842;N" 
    ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label></div>    
    <div style="width: 100%" align="center"><asp:Label ID="Label2" runat="server" Text="Cập nhật thông tin tài khoản thành công" 
    ForeColor="Red" Font-Bold="True" Font-Size="Large" Visible="false"></asp:Label></div>    
    <br />
    <div>

        <table style="width:100%; color: #FF3300;" align="center">
            <tr>
                <td style="width: 152px">
                    Tên tài kho&#7843;n:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_TenTaiKhoan" runat="server" Width="338px" ToolTip="Tên tài kho&#7843;n" ReadOnly="true"></asp:TextBox>
                    <br />                    
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
           
        </table>

    </div>
    <div style="width: 100%" align="center">
        <asp:Button ID="Xl_CapNhatThayDoi" runat="server" Text="C&#7853;p nh&#7853;t thay &#273;&#7893;i" 
            style="text-align: center" onclick="Xl_CapNhatThayDoi_Click"/>
    </div>
    <div style="width: 100%">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
            BackColor="#0099CC" />
    </div>
</asp:Content>
