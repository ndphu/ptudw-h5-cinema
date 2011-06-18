<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapNhatLichChieu.aspx.cs" Inherits="H5_Cinema.lichchieu.CapNhatLichChieu" %>
<%@ Import Namespace="H5_Cinema" %>
<%@ Import Namespace="System.Linq" %>

<script language="C#" runat="Server">
    void LBT_Click_CapNhat (object sender, EventArgs e)
    {
        //Neu nhu session nguoi dung bi mat cho nay thi bat dang nhap lai
        /*if (Session["NguoiDung"] == null)
        {
            Response.Redirect("/thanhvien/DangNhap.aspx");
            return; 
        }
        */
        int _itemIndex = int.Parse(((LinkButton)sender).CommandArgument);
        Panel temp = (Panel)DataList1.Items[_itemIndex].FindControl("pn_CapNhat");

        if (temp.Visible)
        {
            temp.Visible = false;
            ((LinkButton)DataList1.Items[_itemIndex].FindControl("lbt_CapNhat")).Text = "C&#7853;p nh&#7853;t...";
        }
        else
        {
            for (int i = 0; i < DataList1.Items.Count; i++)
            {
                ((Panel)DataList1.Items[i].FindControl("pn_CapNhat")).Visible = false;
                ((LinkButton)DataList1.Items[i].FindControl("lbt_CapNhat")).Text = "C&#7853;p nh&#7853;t...";
            }
            temp.Visible = true;
            ((LinkButton)DataList1.Items[_itemIndex].FindControl("lbt_CapNhat")).Text = "&#272;óng...";

            //Bat dau kiem tra va load len
            int _maSuatChieuCapNhat = int.Parse(((Button)temp.FindControl("bt_CapNhat")).CommandArgument.ToString());
            
            CinemaLINQDataContext dt = new CinemaLINQDataContext ();
            
            SuatChieu _suatChieuCapNhat = (from _sc in dt.SuatChieus
                                           where _sc.MaSuatChieu == _maSuatChieuCapNhat
                                           select _sc).Single();

            Phim _phim = (from ph in dt.Phims
                          where ph.MaPhim == _suatChieuCapNhat.MaPhim
                          select ph).Single();

            
            DropDownList _TH_dsSuatMoi = (DropDownList)temp.FindControl("ddl_dsSuat");
            _TH_dsSuatMoi.Items.Clear();

            List<DanhMucSuatChieu> _dsDanhMucSuatChieu = (from _dmsc in dt.DanhMucSuatChieus
                                                          orderby _dmsc.ThoiGianBatDau.TimeOfDay ascending
                                                          select _dmsc).ToList();
            
            foreach (DanhMucSuatChieu _dmsc in _dsDanhMucSuatChieu)
            {
                List<SuatChieu> _dsSuatChieuTonTai = (from _sc in dt.SuatChieus
                                                      where _sc.MaDanhMucSuatChieu == _dmsc.MaDanhMucSuatChieu && _sc.MaPhong == _suatChieuCapNhat.MaPhong && _sc.MaLichChieu == _suatChieuCapNhat.MaLichChieu
                                                      select _sc).ToList();
                //Neu cho do con trong.
                if (_dsSuatChieuTonTai.Count == 0)
                {
                    List<SuatChieu> _temp = (from _sc in dt.SuatChieus
                                                 where _sc.MaPhong == _suatChieuCapNhat.MaPhong && _sc.MaLichChieu == _suatChieuCapNhat.MaLichChieu && _sc.DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay > _dmsc.ThoiGianBatDau.TimeOfDay
                                                 orderby _sc.DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay
                                                 select _sc).ToList();
                    
                    if (_dmsc.ThoiGianBatDau.TimeOfDay < _suatChieuCapNhat.DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay)
                    {
                        SuatChieu _minDuoi = _temp[0];
                        if (_dmsc.ThoiGianBatDau.AddMinutes(_phim.ThoiLuong).TimeOfDay < _minDuoi.DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay)
                        {
                            _TH_dsSuatMoi.Items.Add(_dmsc.ThoiGianBatDau.ToString("HH:mm"));
                        }             
                    }
                    else
                    {
                        if (_temp.Count == 0)
                        {
                            _TH_dsSuatMoi.Items.Add(_dmsc.ThoiGianBatDau.ToString("HH:mm"));
                        }   
                        else
                        {
                            SuatChieu _minDuoi = _temp[0];
                            if (_dmsc.ThoiGianBatDau.AddMinutes(_phim.ThoiLuong).TimeOfDay < _minDuoi.DanhMucSuatChieu.ThoiGianBatDau.TimeOfDay)
                            {
                                _TH_dsSuatMoi.Items.Add(_dmsc.ThoiGianBatDau.ToString("HH:mm"));
                            }
                        }               
                    }
                }
            }
            if (_TH_dsSuatMoi.Items.Count == 0)
            {
                ((Button)temp.FindControl("bt_CapNhat")).Enabled = false;
            }
            else
            {
                ((Button)temp.FindControl("bt_CapNhat")).Enabled = true;
                Session["CNLC-SuatChieuMoi"] = _TH_dsSuatMoi.Items[0].Text;
            }
        }
    }
    
    void LBT_Click_Xoa (object sender, EventArgs e)
    {
        if (Session["NguoiDung"] == null)
        {
            Response.Redirect("/thanhvien/DangNhap.aspx");
            return;
        }
        
        LinkButton _lbtXoa = (LinkButton)sender;
        int _maSuatChieu = int.Parse(_lbtXoa.CommandArgument.ToString());
        
        CinemaLINQDataContext dt = new CinemaLINQDataContext ();
        SuatChieu _toDel = (from _sc in dt.SuatChieus
                            where _sc.MaSuatChieu == _maSuatChieu
                            select _sc).Single();
        dt.SuatChieus.DeleteOnSubmit(_toDel);
        dt.SubmitChanges();
        MyDataBind();
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label3" runat="server" ForeColor="#0099FF" 
            Text="C&#7852;P NH&#7852;T L&#7882;CH CHI&#7870;U" Font-Size="20pt"></asp:Label>
        <br />
        <asp:Label ID="lb_Phim" runat="server" ForeColor="Red" Text="Phim:" 
            Font-Size="15pt"></asp:Label>
        <br />
        <asp:Label ID="lb_NgayChieu" runat="server" ForeColor="#FFFFCC" 
            Text="Ngày chi&#7871;u:" Font-Size="15pt"></asp:Label>
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" 
            onprerender="UpdatePanel2_PreRender">
            <ContentTemplate>
                <table border="Ridge" style="width: 100%">
                    <tr>
                        <td align="center">
                            <asp:Label ID="Label4" runat="server" ForeColor="#00CCFF" 
                                Text="DANH SÁCH SU&#7844;T CHI&#7870;U" Font-Size="15pt"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:DataList ID="DataList1" runat="server" Width="308px">
                                <ItemTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label5" runat="server" ForeColor="#00CCFF" Text="Su&#7845;t:"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="lb_Suat" runat="server" ForeColor="#FFFF66" Text="Label" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label7" runat="server" ForeColor="#00CCFF" Text="Phòng:"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="lb_Phong" runat="server" ForeColor="#FFFF66" 
                                                    Text='<%# Eval("PhongChieuPhim.TenPhongChieuPhim") %>' Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="4" style="height: 23px">
                                                <asp:LinkButton ID="lbt_Xoa" runat="server" OnClick = "LBT_Click_Xoa" 
                                                    OnClientClick = "return confirm ('B&#7841;n có ch&#7855;c mu&#7889;n xóa?');" Font-Size="10pt" 
                                                    ForeColor="Red" CommandArgument='<%# Eval("MaSuatChieu") %>'>Xóa...</asp:LinkButton>
                                                <br />
                                                <asp:LinkButton ID="lbt_CapNhat" runat="server" OnClick = "LBT_Click_CapNhat" 
                                                    ForeColor="#33CC33">C&#7853;p nh&#7853;t...</asp:LinkButton>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel ID="pn_CapNhat" runat="server" BackImageUrl="~/Img/browndirt.jpg" 
                                        BorderStyle="Inset" Visible="False">
                                        <div align="center">
                                            <asp:Label ID="Label9" runat="server" ForeColor="Yellow" 
                                                Text="Danh sách su&#7845;t chi&#7871;u có th&#7875; chuy&#7875;n:" 
                                                Font-Size="10pt"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="ddl_dsSuat" runat="server" ForeColor="Black" 
                                                Height="20px" Width="126px" AutoPostBack="True" 
                                                onselectedindexchanged="ddl_dsSuat_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <asp:Button ID="bt_CapNhat" runat="server" BorderStyle="Dotted" 
                                                Text="C&#7853;p nh&#7853;t" CommandArgument='<%# Eval("MaSuatChieu") %>' 
                                                onclick="bt_CapNhat_Click"/>
                                            <br />
                                            <br />
                                        </div>
                                    </asp:Panel>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="height: 153px">
    </div>
</asp:Content>
