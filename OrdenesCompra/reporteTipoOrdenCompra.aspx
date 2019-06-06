<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reporteTipoOrdenCompra.aspx.cs" Inherits="OrdenesCompra_reporteTipoOrdenCompra" Title="Reporte Seg OC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 669px">
        <tr>
            <td>
            </td>
            <td style="text-align: center">
                <asp:Label ID="lblTitulo" runat="server"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odsDetalleOrdenCompra2" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                    Width="900px" DataKeyNames="Id">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Origen" HeaderText="hOrigen" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Consecutivo" HeaderText="hConsecutivo" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="FechaOC" HeaderText="hFecha OC" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Usuario" HeaderText="hUsuario" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Nombre" HeaderText="Nombre" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="moneda" HeaderText="Moneda" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="cantidad" HeaderText="Cantidad" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="descripcion" HeaderText="Descripci&#243;n" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="total" HeaderText="Total" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsDetalleOrdenCompra2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_detalleOC_ServicioIngTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intTipo" QueryStringField="tipo" Type="Int32" />
                        <asp:QueryStringParameter Name="intMonedaId" QueryStringField="monedaId" Type="Int32" />
                        <asp:QueryStringParameter Name="strValor" QueryStringField="valor" Type="String" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="UsuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

