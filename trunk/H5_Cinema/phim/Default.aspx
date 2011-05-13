<%@ Page Title="Phim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="H5_Cinema.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="PHIM" ForeColor="GreenYellow" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
    <br />
    <asp:ListView ID="Th_DanhSachPhim" runat="server" DataSourceID="LinqDataSource2" 
        GroupItemCount="4" style="text-align: left" 
        onselectedindexchanged="ListView1_SelectedIndexChanged">
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                Mã phim:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                Tên phim:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                Th&#7875; lo&#7841;i:
                <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                <br />
                <asp:Image ID="PlaybillAddLabel" runat="server" 
                    ImageUrl='<%# Eval("PlaybillAdd") %>' />
                <br />
                &#272;&#7897; dài (phút):
                <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                <br />
                <asp:Button runat="server" OnClick="ChiTiet_Click" Text="Chi ti&#7871;t" CommandName='<%# Eval("ID") %>'> </asp:Button>
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="H5_Cinema.CinemaLINQDataContext" EntityTypeName="" 
        Select="new (ID, Name, Type, PlaybillAdd, Length)" TableName="Films">
    </asp:LinqDataSource>
    </asp:Content>
