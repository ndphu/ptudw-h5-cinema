<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="XemLichChieuTheoPhim.aspx.cs" Inherits="H5_Cinema.lichchieu.XemLichChieuTheoPhim" %>
<%@ Import Namespace="H5_Cinema" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Drawing" %>

<script language="C#" runat="Server">
    void LBT_Click_XemSuatChieu(object sender, EventArgs e)
    {
        if (Session["XLC-MaPhim"] == null)
            return;
        
        int _maLichChieu = int.Parse(((LinkButton)sender).CommandArgument.ToString());
        int _maPhim = int.Parse(Session["XLC-MaPhim"].ToString());
        
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        
        LichChieuPhim _lichChieu = (from _lc in dt.LichChieuPhims
                                   where _lc.MaLichChieuPhim == _maLichChieu
                                   select _lc).Single();
        
        List<SuatChieu> _dsSuatChieu = (from _sc in dt.SuatChieus
                                        where _sc.MaLichChieu == _maLichChieu && _sc.MaPhim == _maPhim
                                        orderby _sc.DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay ascending
                                        select _sc).ToList();
        List<SuatChieu> _dsSuatChieuLoc = new List<SuatChieu>();
        for (int i = 0 ;i < _dsSuatChieu.Count; i++)
        {
            if (i > 0)
            {
                if (_dsSuatChieu[i].DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay == _dsSuatChieu[i - 1].DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay)
                    continue;
            }
            _dsSuatChieuLoc.Add(_dsSuatChieu[i]);
        }
        dtl_dsSuatChieu.DataSource = _dsSuatChieuLoc;
        dtl_dsSuatChieu.DataBind();
        
        for (int i = 0; i < _dsSuatChieuLoc.Count; i++)
        {
            ((LinkButton)dtl_dsSuatChieu.Items[i].FindControl("lbt_SuatChieu")).Text = _dsSuatChieuLoc[i].DanhMucSuatChieu.ThoiGianBatDau.ToString("HH:mm");
            if (_lichChieu.NgayChieu.Date == DateTime.Now.Date && _dsSuatChieuLoc[i].DanhMucSuatChieu.ThoiGianBatDau.AddHours(-2).TimeOfDay < DateTime.Now.TimeOfDay)
            {
                ((LinkButton)dtl_dsSuatChieu.Items[i].FindControl("lbt_SuatChieu")).ForeColor = Color.White;
                ((LinkButton)dtl_dsSuatChieu.Items[i].FindControl("lbt_SuatChieu")).Enabled = false;
            }
        }
    }

    void LBT_Click_DatVe(object sender, EventArgs e)
    {
        CinemaLINQDataContext dt = new CinemaLINQDataContext();
        var suatchieu = from _suatchieu in dt.SuatChieus
                        where _suatchieu.MaSuatChieu == int.Parse(((LinkButton)sender).CommandArgument)
                        select _suatchieu;
        if (suatchieu.Count<SuatChieu>() == 1)
        {
            Session["SuatChieu"] = suatchieu.Single();
            Response.Redirect("/datve/datve.aspx");
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="height: 790px">
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="20pt" 
            ForeColor="Red"></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table style="width: 100%" border="Ridge">
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label ID="Label3" runat="server" Font-Size="20pt" ForeColor="#FFFF99" 
                                Text="L&#7882;CH CHI&#7870;U HI&#7878;N T&#7840;I"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="Label4" runat="server" Font-Size="15pt" ForeColor="#00CCFF" 
                                Text="Danh sách ngày chi&#7871;u"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="Label5" runat="server" Font-Size="15pt" ForeColor="#00CCFF" 
                                Text="Danh sách su&#7845;t chi&#7871;u"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" Height="487px">
                                <asp:DataList ID="dtl_dsNgayChieu" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbt_NgayChieu" runat="server" 
                                            CommandArgument='<%# Eval("MaLichChieuPhim") %>' ForeColor="#66FF33" 
                                            OnClick="LBT_Click_XemSuatChieu">LinkButton</asp:LinkButton>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="Panel2" runat="server" Height="490px">
                                <asp:DataList ID="dtl_dsSuatChieu" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbt_SuatChieu" runat="server" 
                                            CommandArgument='<%# Eval("MaSuatChieu") %>' ForeColor="Yellow" 
                                            OnClick="LBT_Click_DatVe">LinkButton</asp:LinkButton>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    <br />
    </div>
</asp:Content>
