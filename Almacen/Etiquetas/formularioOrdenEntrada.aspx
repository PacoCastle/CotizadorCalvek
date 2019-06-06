<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioOrdenEntrada.aspx.cs" Inherits="Almacen_Etiquetas_formularioOrdenEntrada" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 613px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="etiTitulo" runat="server" Text="Ordenes de Entrada"></asp:Label></td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td>
                </td>
            <td>
                </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
                </td>
            <td style="height: 20px">
                </td>
            <td style="height: 20px">
                </td>
            <td style="height: 20px">
                </td>
        </tr>
        <tr>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td style="height: 20px" colspan="4">
                <asp:FormView ID="frmOrdenEntrada" runat="server" DataSourceID="odsOrdenesEntradaKep">
                    <EditItemTemplate>
                        sucursalId:
                        <asp:TextBox ID="sucursalIdTextBox" runat="server" Text='<%# Bind("sucursalId") %>'>
                        </asp:TextBox><br />
                        Sucursal:
                        <asp:TextBox ID="SucursalTextBox" runat="server" Text='<%# Bind("Sucursal") %>'>
                        </asp:TextBox><br />
                        Serie:
                        <asp:TextBox ID="SerieTextBox" runat="server" Text='<%# Bind("Serie") %>'>
                        </asp:TextBox><br />
                        Folio:
                        <asp:TextBox ID="FolioTextBox" runat="server" Text='<%# Bind("Folio") %>'>
                        </asp:TextBox><br />
                        proveedorId:
                        <asp:TextBox ID="proveedorIdTextBox" runat="server" Text='<%# Bind("proveedorId") %>'>
                        </asp:TextBox><br />
                        Proveedor:
                        <asp:TextBox ID="ProveedorTextBox" runat="server" Text='<%# Bind("Proveedor") %>'>
                        </asp:TextBox><br />
                        Moneda:
                        <asp:TextBox ID="MonedaTextBox" runat="server" Text='<%# Bind("Moneda") %>'>
                        </asp:TextBox><br />
                        Referencia:
                        <asp:TextBox ID="ReferenciaTextBox" runat="server" Text='<%# Bind("Referencia") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Actualizar">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        sucursalId:
                        <asp:TextBox ID="sucursalIdTextBox" runat="server" Text='<%# Bind("sucursalId") %>'>
                        </asp:TextBox><br />
                        Sucursal:
                        <asp:TextBox ID="SucursalTextBox" runat="server" Text='<%# Bind("Sucursal") %>'>
                        </asp:TextBox><br />
                        Serie:
                        <asp:TextBox ID="SerieTextBox" runat="server" Text='<%# Bind("Serie") %>'>
                        </asp:TextBox><br />
                        Folio:
                        <asp:TextBox ID="FolioTextBox" runat="server" Text='<%# Bind("Folio") %>'>
                        </asp:TextBox><br />
                        proveedorId:
                        <asp:TextBox ID="proveedorIdTextBox" runat="server" Text='<%# Bind("proveedorId") %>'>
                        </asp:TextBox><br />
                        Proveedor:
                        <asp:TextBox ID="ProveedorTextBox" runat="server" Text='<%# Bind("Proveedor") %>'>
                        </asp:TextBox><br />
                        Moneda:
                        <asp:TextBox ID="MonedaTextBox" runat="server" Text='<%# Bind("Moneda") %>'>
                        </asp:TextBox><br />
                        Referencia:
                        <asp:TextBox ID="ReferenciaTextBox" runat="server" Text='<%# Bind("Referencia") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insertar">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="1" cellpadding="0" cellspacing="0" style="width: 563px">
                            <tr>
                                <td style="width: 72px">
                <asp:Label ID="lblEtiCliente" runat="server" Text="Proveedor:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 269px">
                <asp:Label ID="lblProveedor" runat="server" Font-Size="10pt" Text='<%# Eval("Proveedor") %>'></asp:Label></td>
                                <td style="width: 65px">
                <asp:Label ID="lblEtiSucursal" runat="server" Text="Sucursal:" Font-Size="10pt"></asp:Label></td>
                                <td>
                <asp:Label ID="lblSucursal" runat="server" Font-Size="10pt" Text='<%# Eval("Sucursal") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 72px">
                <asp:Label ID="lblEtiSerie" runat="server" Text="Serie:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 269px">
                <asp:Label ID="lblSerie" runat="server" Font-Size="10pt" Text='<%# Eval("Serie") %>'></asp:Label></td>
                                <td style="width: 65px">
                                    <asp:Label ID="lblEtiMoneda" runat="server" Font-Size="10pt">Moneda:</asp:Label></td>
                                <td>
                                    <asp:Label ID="lblMoneda" runat="server" Font-Size="10pt" Text='<%# Eval("Moneda") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 72px">
                <asp:Label ID="lblEtiFolio" runat="server" Text="Folio:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 269px">
                <asp:Label ID="lblFolio" runat="server" Font-Size="10pt" Text='<%# Eval("Folio") %>'></asp:Label></td>
                                <td style="width: 65px">
                                    <asp:Label ID="Label1" runat="server" Font-Size="10pt">Referencia:</asp:Label></td>
                                <td>
                                    <asp:Label ID="lblReferencia" runat="server" Font-Size="10pt" Text='<%# Eval("Referencia") %>'></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="odsOrdenesEntradaKep" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="AlmacenTableAdapters.get_datosOrdenesEntradaKeplerTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intSucursalId" QueryStringField="sucurId" Type="Int32" />
                        <asp:QueryStringParameter Name="intFolio" QueryStringField="folio" Type="Int32" />
                        <asp:QueryStringParameter Name="intIdtipo" QueryStringField="idtipo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="height: 20px" colspan="4">
                <asp:GridView ID="gdvDetalleOrdenEntrada" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="odsDetalleOrdenEntrada" Font-Size="8pt" ForeColor="#333333" GridLines="None" Height="94px" Width="479px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Producto" HeaderText="Producto" SortExpression="Producto" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Unidad" HeaderText="Unidad" SortExpression="Unidad" />
                        <asp:TemplateField HeaderText="Imprimir">
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckbImprimirTodos" runat="server" OnCheckedChanged="ckbImprimirTodos_CheckedChanged"
                                    Text="Todos" AutoPostBack="True" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbImprimir" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="10px" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsDetalleOrdenEntrada" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AlmacenTableAdapters.get_datosDetalleOrdenesEntradaKeplerTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intSucursalId" QueryStringField="sucurId" Type="Int32" />
                        <asp:QueryStringParameter Name="intFolio" QueryStringField="folio" Type="Int32" />
                        <asp:QueryStringParameter Name="intIdtipo" QueryStringField="idtipo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Button ID="btnContinuar" runat="server" Font-Size="10pt" Height="21px" Text="Continuar"
                    Width="64px" OnClick="btnContinuar_Click" PostBackUrl="~/Almacen/Etiquetas/caidaEtiquetas.aspx" /></td>
        </tr>
    </table>
</asp:Content>

