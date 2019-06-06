<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReporteSeguimientoOrdenCompra.aspx.cs" Inherits="OrdenesCompra_ReporteSeguimientoOrdenCompra" Title="Seguimiento OC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;
    <table>
        <tr>
            <td style="width: 170px">
                <asp:DropDownList ID="lstTipo" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">-</asp:ListItem>
                    <asp:ListItem Value="1">Job</asp:ListItem>
                    <asp:ListItem Value="2">Orden de Servicio</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lblTemporal" runat="server" Visible="False"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 170px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 170px">
                </td>
            <td>
    <asp:ObjectDataSource ID="odsRangoOrdenCompra" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_listaEstatusSeguimientoOrdenesCompraTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lstTipo" DefaultValue="" Name="intTipo" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="odsRangoOrdenCompra" RepeatDirection="Horizontal" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" Font-Size="9pt" GridLines="Both">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <ItemStyle BackColor="White" ForeColor="Navy" HorizontalAlign="Center" />
        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <ItemTemplate>
            <asp:LinkButton ID="lnkbRango" runat="server" CommandArgument='<%# Eval("Orden") %>' Text='<%# Eval("Rango") %>' OnCommand="muestraReporte"></asp:LinkButton><br/>
            <asp:LinkButton ID="lnkbConteo" runat="server" CommandArgument='<%# Eval("Orden") %>' Text='<%# Eval("Conteo") %>' OnCommand="muestraReporte"></asp:LinkButton>
        </ItemTemplate>
    </asp:DataList></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 170px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 170px">
            </td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odsDetalleReporte" Font-Size="8pt" ForeColor="#333333" GridLines="Horizontal"
                    Height="91px"
                    Width="100%" DataKeyNames="ordenCompraId">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="5px" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="OrdenCompra" HeaderText="Orden Compra" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Tipo" HeaderText="Tipo" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="descripcion" HeaderText="Descripci&#243;n" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="cantidad" HeaderText="Cantidad" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Recibido" HeaderText="Recibido" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Pendientes" HeaderText="Pendientes" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Fecha" HeaderText="Fecha" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="fechaEntrega" HeaderText="Fecha Entrega" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="diferenciaDias" HeaderText="D&#237;as por Vencer" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="ordenCompraId" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Rango" HeaderText="Rango" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                    </Columns>
                    <FooterStyle BackColor="#E0E0E0" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#5D7B9D" />
                    <EditRowStyle BackColor="#E2DED6" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="5px" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsDetalleReporte" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_listaEstatusSeguimientoOrdenesCompraDetalleTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstTipo" Name="intTipo" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lblTemporal" Name="intOrden" PropertyName="Text"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

