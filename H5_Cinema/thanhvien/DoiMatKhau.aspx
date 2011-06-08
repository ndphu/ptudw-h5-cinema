<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="H5_Cinema.thanhvien.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width: 100%" align="center">
<div style="border: thin solid #FF3300; width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
<div style="border: thin solid #FF3300; background-image: url('../Img/001.png'); background-repeat: repeat">
<asp:Label ID="Label1" runat="server" Text="&#272;&#7892;I M&#7852;T KH&#7848;U" 
    ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label></div>    
    
    <div style="width: 100%" align="center"><asp:Label ID="Label2" runat="server" Text="&#272;&#7893;i m&#7853;t kh&#7849;u thành công" 
    ForeColor="Red" Font-Bold="True" Font-Size="Large" Visible="false"></asp:Label></div>    
    <br />
    <div>

        <table style="width:100%; color: #FF3300;" align="center">
            <tr>
                <td style="width: 152px">
                    M&#7853;t kh&#7849;u c&#361;:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_MatKhauCu" runat="server" Width="338px" 
                        ToolTip="M&#7853;t kh&#7849;u c&#361;" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="M&#7853;t kh&#7849;u c&#361; không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_MatKhauCu" 
                        Display="None"></asp:RequiredFieldValidator>                    
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    M&#7853;t kh&#7849;u m&#7899;i:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_MatKhauMoi" runat="server" Width="338px" 
                        ToolTip="M&#7853;t kh&#7849;u m&#7899;i" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="M&#7853;t kh&#7849;u m&#7899;i không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_MatKhauMoi" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="M&#7853;t kh&#7849;u m&#7899;i ph&#7843;i t&#7915; 6-32 ký t&#7921;" ControlToValidate="Th_MatKhauMoi" 
                        Display="None" 
                        ValidationExpression="^[a-zA-Z0-9@#$%^&+=]{6,32}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 152px">
                    Xác nh&#7853;n m&#7853;t kh&#7849;u m&#7899;i:</td>
                <td style="width: 338px">
                    <asp:TextBox ID="Th_XacNhanMatKhauMoi" runat="server" Width="338px" 
                        ToolTip="Xác nh&#7853;n l&#7841;i m&#7853;t kh&#7849;u m&#7899;i" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Xác nh&#7853;n m&#7853;t kh&#7849;u m&#7899;i không &#273;&#432;&#7907;c &#273;&#7875; tr&#7889;ng" ControlToValidate="Th_XacNhanMatKhauMoi" 
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Xác nh&#7853;n m&#7853;t kh&#7849;u m&#7899;i không chính xác" ControlToValidate="Th_XacNhanMatKhauMoi"  ControlToCompare="Th_MatKhauMoi"
                        Display="None"></asp:CompareValidator>
                </td>
            </tr>
            
            
        </table>

    </div>
    <div style="width: 100%" align="center">
    </br>
        <asp:Button ID="Xl_DoiMatKhau" runat="server" Text="&#272;&#7893;i m&#7853;t kh&#7849;u" 
            style="text-align: center" onclick="Button1_Click" />
    </div>
    </br>
    <div style="width: 100%">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
            BackColor="#0099CC" />
    </div>
    </br>
    </div>
<br />
</asp:Content>
