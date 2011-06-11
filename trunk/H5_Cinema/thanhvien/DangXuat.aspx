<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangXuat.aspx.cs" Inherits="H5_Cinema.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    function delayedRedirect() {
        window.location = "/default.aspx"
    }
</script>
<body onload="setTimeout('delayedRedirect()', 3000)">
    <div align="center" style="height: 335px">
        <div style="border: thin solid #FF3300; width: 70%; background-image: url('../Img/browndirt.jpg'); background-repeat: repeat;">
            <div style="border: thin solid #FF3300; background-image: url('../Img/001.png'); background-repeat: repeat">
                    <asp:Label ID="Label1" runat="server" Text="&#272;&#258;NG XU&#7844;T" 
                    ForeColor="GreenYellow" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                    </div>
                    <br/>
                    <div align="center" style="color: Lime">        
                    &#272;&#259;ng xu&#7845;t thành công
                    </div>
            <br/>
        </div>
    </div>  
</body>
</asp:Content>
