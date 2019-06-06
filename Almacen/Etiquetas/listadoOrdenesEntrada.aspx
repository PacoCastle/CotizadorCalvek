<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoOrdenesEntrada.aspx.cs" Inherits="OrdenesCompra_formularioCredito" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 812px; height: 74px" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 45px">
                </td>
            <td>
                <asp:HyperLink ID="hlkAltaOrdenCompra" runat="server" Font-Size="9pt" NavigateUrl="~/OrdenesCompra/formularioOrdenCompra.aspx">NUEVA OC</asp:HyperLink></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 45px">
            </td>
            <td style="text-align: left">
                    <table style="width: 530px; height: 69px">
                        <tr>
                            <td style="width: 131px">
                            </td>
                            <td style="text-align: center">
                                <strong><span style="font-size: 9pt">
                                    <asp:Label ID="lblEtiBusqueda" runat="server" Text="BUSQUEDA"></asp:Label></span></strong></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left; height: 25px;">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblOrdenCompra" runat="server" Font-Size="9pt" Text="Orden Entrada:"></asp:Label></span></td>
                            <td style="text-align: left; height: 25px;">
                                <asp:TextBox ID="txtOrdenEntrada" runat="server" Font-Size="9pt" Width="44px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtOrdenEntrada"
                                    Display="Dynamic" ErrorMessage="Numérico" Font-Size="9pt" ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
                            <td style="height: 25px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblProveedor" runat="server" Font-Size="9pt" Text="Proveedor:"></asp:Label></span></td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="lstProveedor" runat="server" DataSourceID="ObjectDataSource3"
                                    DataTextField="Nombre" DataValueField="proveedorId" Font-Size="9pt">
                                </asp:DropDownList></td>
                            <td>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaProveedoresTableAdapter">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    </span></td>
                            <td style="text-align: left">
                                </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px">
                            </td>
                            <td style="text-align: center">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" /></td>
                            <td style="text-align: left">
                                </td>
                        </tr>
                    </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 3px;" colspan="3">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="width: 45px; height: 334px;">
            </td>
            <td style="height: 334px">
                <asp:GridView ID="gvListadoOrdenesCompra" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="folio,serie,sucursalId" DataSourceID="odsOrdenesEntradaBusqueda" Font-Size="9pt" ForeColor="#333333"
                    GridLines="None" AllowPaging="True" Width="100%" AllowSorting="True" EmptyDataText="NO SE TIENEN ORDENES DE COMPRA">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="serie" HeaderText="Serie" >
                            <HeaderStyle HorizontalAlign="Left" Font-Size="8pt" />
                            <ItemStyle Font-Size="8pt" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="folio" HeaderText="Folio">
                            <HeaderStyle HorizontalAlign="Left" Font-Size="10pt" />
                            <ItemStyle Font-Size="10pt" Font-Bold="True" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="referencia" HeaderText="Referencia" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="fecha" HeaderText="Fecha" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="proveedor" HeaderText="Proveedor" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="Sucursal" HeaderText="Sucursal" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="tipo" HeaderText="Tipo" />
                        <asp:HyperLinkField DataNavigateUrlFields="sucursalId,folio,IdTipo" DataNavigateUrlFormatString="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx?sucurId={0}&amp;folio={1}&amp;idtipo={2}"
                            DataTextField="Moneda" HeaderText="Moneda" />
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsOrdenesEntradaBusqueda" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="AlmacenTableAdapters.get_buscaOrdenesEntradaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstProveedor" Name="strProveedor" PropertyName="SelectedValue"
                            Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="txtOrdenEntrada" Name="intOrdEntrada" PropertyName="Text"
                            Type="Int32" DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="height: 334px">
            </td>
        </tr>
        <tr>
            <td style="width: 45px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

