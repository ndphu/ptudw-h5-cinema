<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCBinhLuan.ascx.cs" Inherits="H5_Cinema.phim.UCBinhLuan"%>
<div style="border-color: #666666; border-style: solid; background-image: url('../Img/001.png');">
<div style="background-color: #000066; background-image: none;">
    </br>
    <div style="background-image: none">
    <asp:Label ID="Th_TenNguoiDung" runat="server" Text="Label" ForeColor="Red"></asp:Label>    
    </div>
    <br />
</div>
    <div style="border-width: thin; border-style: inset">
    <asp:TextBox ID="Th_NoiDungBinhLuan" runat="server" Enabled="true" 
            TextMode="MultiLine" Width="100%"></asp:TextBox>
    </div>
    <br />
    
    <div>
    <asp:Button ID="Xl_Sua" runat="server" Text="Sửa" ToolTip="Đánh dấu spam" 
        Visible="False" Width="80px"/>
    <asp:Button ID="Xl_Xoa" runat="server" Text="Xóa" ToolTip="Xóa comment này" 
        Visible="False" Width="80px"/>
    </div>
</div>

