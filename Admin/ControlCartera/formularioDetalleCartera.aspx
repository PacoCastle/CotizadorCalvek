<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioDetalleCartera.aspx.cs" Inherits="Admin_ControlCartera_formularioDetalleCartera" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 700px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="9pt" Text="CONTROL DE FACTURACION Y CARTERA"></asp:Label></td>
            <td style="height: 20px" align="right">
                <asp:Label ID="lblConcepto" runat="server" Font-Bold="True" Font-Size="9pt"></asp:Label></td>
        </tr>
        <tr>
            <td>
            </td>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    SelectCommand="sp_listadoPendientesDetalleEditar" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                &nbsp;
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SqlDataSource1" Font-Size="8pt" ForeColor="#333333" GridLines="None"
                    Width="575px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="concepto" HeaderText="concepto" ReadOnly="True" SortExpression="concepto" />
                        <asp:BoundField DataField="id_kepler_abono" HeaderText="id_kepler_abono" SortExpression="id_kepler_abono" />
                        <asp:BoundField DataField="sucursal" HeaderText="sucursal" SortExpression="sucursal" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" ReadOnly="True" SortExpression="Monto" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td align="right">
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="8pt" PostBackUrl="~/Admin/ControlCartera/busquedaFacturasCarteras.aspx"><< VOLVER</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>

