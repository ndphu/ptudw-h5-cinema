<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="H5_Cinema.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="height: 349px">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="GreenYellow" Text="&#272;&#258;NG NH&#7852;P"></asp:Label>
    <br />
    <br />
    <br />
    <table align="center" style="width: 65%; font-family: Tahoma; color: #FF3300;">
        <tr>
            <td align="left" style="width: 160px">
                Tên &#273;&#259;ng nh&#7853;p:</td>
            <td align="left">
                <asp:TextBox ID="Th_TenDangNhap" runat="server" Width="309px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Th_TenDangNhap" Display="None" 
                    ErrorMessage="Tên &#273;&#259;ng nh&#7853;p không th&#7875; b&#7887; tr&#7889;ng"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 160px">
                M&#7853;t kh&#7849;u:</td>
            <td align="left">
                <asp:TextBox ID="Th_MatKhau" runat="server" TextMode="Password" Width="309px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Th_MatKhau" Display="None" 
                    ErrorMessage="Password không th&#7875; b&#7887; tr&#7889;ng"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 160px">
                &nbsp;</td>
            <td align="left">
                <asp:Button ID="Xl_DangNhap" runat="server" onclick="Xl_DangNhap_Click" 
                    Text="&#272;&#259;ng nh&#7853;p" Width="129px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>
