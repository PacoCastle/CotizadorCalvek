<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioModifDetalleMarcasCompras.aspx.cs" Inherits="Admin_compras_formularioModifDetalleMarcasCompras" Title="COMPRAS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 700px" align="left">
        <tr>
            <td style="width: 293px;">
                <asp:Label ID="lblLineaId" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblMarca" runat="server"></asp:Label>
                </td>
            <td style="width: 224px;">
                <asp:Label ID="lblSucursal" runat="server" Visible="False"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" valign="top">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="odsPreCompra" CellPadding="4" Font-Size="10pt" ForeColor="#333333" Width="680px">
                    <EditItemTemplate>
                        TipoDocumento:
                        <asp:TextBox ID="TipoDocumentoTextBox" runat="server" Text='<%# Bind("TipoDocumento") %>'>
                        </asp:TextBox><br />
                        Oficina:
                        <asp:TextBox ID="OficinaTextBox" runat="server" Text='<%# Bind("Oficina") %>'>
                        </asp:TextBox><br />
                        Proveedor:
                        <asp:TextBox ID="ProveedorTextBox" runat="server" Text='<%# Bind("Proveedor") %>'>
                        </asp:TextBox><br />
                        Folio:
                        <asp:TextBox ID="FolioTextBox" runat="server" Text='<%# Bind("Folio") %>'>
                        </asp:TextBox><br />
                        Moneda:
                        <asp:TextBox ID="MonedaTextBox" runat="server" Text='<%# Bind("Moneda") %>'>
                        </asp:TextBox><br />
                        Comentario:
                        <asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'>
                        </asp:TextBox><br />
                        claveProveedor:
                        <asp:TextBox ID="claveProveedorTextBox" runat="server" Text='<%# Bind("claveProveedor") %>'>
                        </asp:TextBox><br />
                        Fecha:
                        <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Actualizar">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        TipoDocumento:
                        <asp:TextBox ID="TipoDocumentoTextBox" runat="server" Text='<%# Bind("TipoDocumento") %>'>
                        </asp:TextBox><br />
                        Oficina:
                        <asp:TextBox ID="OficinaTextBox" runat="server" Text='<%# Bind("Oficina") %>'>
                        </asp:TextBox><br />
                        Proveedor:
                        <asp:TextBox ID="ProveedorTextBox" runat="server" Text='<%# Bind("Proveedor") %>'>
                        </asp:TextBox><br />
                        Folio:
                        <asp:TextBox ID="FolioTextBox" runat="server" Text='<%# Bind("Folio") %>'>
                        </asp:TextBox><br />
                        Moneda:
                        <asp:TextBox ID="MonedaTextBox" runat="server" Text='<%# Bind("Moneda") %>'>
                        </asp:TextBox><br />
                        Comentario:
                        <asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'>
                        </asp:TextBox><br />
                        claveProveedor:
                        <asp:TextBox ID="claveProveedorTextBox" runat="server" Text='<%# Bind("claveProveedor") %>'>
                        </asp:TextBox><br />
                        Fecha:
                        <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insertar">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <strong>Folio:</strong></td>
                                <td>
                        <asp:Label ID="FolioLabel" runat="server" Text='<%# Bind("Folio") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Tipo:</strong>
                                </td>
                                <td>
                        <asp:Label ID="TipoDocumentoLabel" runat="server" Text='<%# Bind("TipoDocumento") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Moneda:</strong></td>
                                <td>
                        <asp:Label ID="MonedaLabel" runat="server" Text='<%# Bind("Moneda") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Proveedor:</strong>
                                </td>
                                <td>
                        <asp:Label ID="ProveedorLabel" runat="server" Text='<%# Bind("Proveedor") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="height: 16px">
                                    <strong>Oficina:</strong></td>
                                <td style="height: 16px">
                        <asp:Label ID="OficinaLabel" runat="server" Text='<%# Bind("Oficina") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Fecha:</strong></td>
                                <td>
                        <asp:Label ID="FechaLabel" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Comentario:</strong></td>
                                <td>
                        <asp:Label ID="ComentarioLabel" runat="server" Text='<%# Bind("Comentario") %>'></asp:Label></td>
                            </tr>
                        </table>
                        <asp:Label ID="claveProveedorLabel" runat="server" Text='<%# Bind("claveProveedor") %>'
                            Visible="False"></asp:Label>
                        <asp:Label ID="TipoDocumentoIdLabel" runat="server" Text='<%# Bind("TipoDocumentoId") %>'
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                </asp:FormView>
                <asp:ObjectDataSource ID="odsPreCompra" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ComprasTableAdapters.get_datosPreCompraTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intComprasId" QueryStringField="comprasId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblMensaje" runat="server" Font-Size="8pt" ForeColor="#CC0033"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <asp:SqlDataSource ID="sdsDetalleCompras" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    DeleteCommand="delete&#13;&#10;from preComprasDetalle&#13;&#10;where comprasId = @intCompraId&#13;&#10;and preComprasDetalleId = @Id&#13;&#10;&#13;&#10;delete&#13;&#10;from preComprasDetallePedido&#13;&#10;where comprasId = @intCompraId&#13;&#10;and preComprasDetalleId = @Id&#13;&#10;"
                    SelectCommand="get_datosPreCompraDetalle" SelectCommandType="StoredProcedure"
                    UpdateCommand="update preComprasDetalle set cantidad=@Cantidad,costo=@Costo&#13;&#10;where comprasId = @intComprasId&#13;&#10;and preComprasDetalleId = @Id">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intComprasId" QueryStringField="comprasId" Type="Int32" />
                        <asp:QueryStringParameter Name="intMonedaId" QueryStringField="monedaId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="intCompraId" QueryStringField="comprasId" />
                        <asp:Parameter Name="Id" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Cantidad" />
                        <asp:Parameter Name="Costo" />
                        <asp:QueryStringParameter Name="intComprasId" QueryStringField="comprasId" />
                        <asp:Parameter Name="Id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdsDetalleCompras" Font-Size="8pt" ForeColor="#333333" GridLines="None" DataKeyNames="Id,id_producto" Width="809px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="btnBorrar" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Delete" Font-Bold="True" Font-Size="7pt" ForeColor="Red" Text="X" />
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="C&#243;digo : Descripci&#243;n" SortExpression="id_producto">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_producto") %>'></asp:Label>
                                :
                                <asp:Label ID="Label42" runat="server" Font-Size="7pt" Text='<%# Bind("descripcion") %>'></asp:Label>
                                <asp:Label ID="lblEtiTmpProducto" runat="server" Font-Size="7pt" Text='<%# Eval("id_producto") %>'
                                    Visible="False"></asp:Label><asp:Label ID="lblEtiTmpPreComId" runat="server" Text='<%# Eval("Id") %>' Visible="False"></asp:Label><br />
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="oficinaId,Folio"
                                    DataSourceID="sdsDocumentos" Font-Size="6pt" ForeColor="Black" GridLines="Vertical"
                                    OnRowCommand="GridView2_rowCommand" OnRowDataBound="GridView2_RowDataBound">
                                    <RowStyle BackColor="#F7F7DE" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False"></asp:TemplateField>
                                        <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" ReadOnly="True" SortExpression="Sucursal" />
                                        <asp:TemplateField HeaderText="Folio" SortExpression="Folio">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Folio") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblMarcada" runat="server" ForeColor="Green" Text="✓"></asp:Label><asp:Label
                                                    ID="Label1" runat="server" Text='<%# Bind("Folio") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cantidadPed" HeaderText="cantidad Pedido" ReadOnly="True"
                                            SortExpression="cantidadPed" />
                                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                                        <asp:BoundField DataField="Instruccion" HeaderText="Instruccion" ReadOnly="True"
                                            SortExpression="Instruccion" />
                                        <asp:BoundField DataField="Ocompra" HeaderText="Orden compra" ReadOnly="True" SortExpression="Ocompra" />
                                        <asp:BoundField DataField="PendienteOC" HeaderText="Pendiente OC" ReadOnly="True"
                                            SortExpression="PendienteOC" />
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                                    Text="Actualizar" />&nbsp;
                                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancelar" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="btnMarcar" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Marcar"
                                                    Font-Bold="True" Font-Size="7pt" ForeColor="#339966" Text="✓" />
                                                <asp:Button ID="btnEliminar" runat="server" BorderStyle="None" BorderWidth="0px"
                                                    CausesValidation="False" CommandArgument='<%# Eval("comPedId") %>' CommandName="Borrar"
                                                    Font-Size="6pt" ForeColor="#CC3333" Text="X" ToolTip="Quitar" Visible="False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="comPedId" HeaderText="comPedId" SortExpression="comPedId"
                                            Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sdsDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                                    DeleteCommand="delete &#13;&#10;from preComprasDetallePedido&#13;&#10;where preComprasDetallePedidoId = @comPedId&#13;&#10;"
                                    SelectCommand="get_listadoProductoEnDocumentos" SelectCommandType="StoredProcedure"
                                    UpdateCommand="set_insActPreComprasDetallePedido" UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblLineaId" Name="intCveLinea" PropertyName="Text"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="lblEtiTmpProducto" Name="strProducto" PropertyName="Text"
                                            Type="String" />
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:ControlParameter ControlID="lblEtiTmpProducto" Name="cod_prod" PropertyName="Text"
                                            Type="String" />
                                        <asp:Parameter Name="Folio" Type="Int32" />
                                        <asp:Parameter Name="oficinaId" Type="Int32" />
                                        <asp:SessionParameter Name="usuarioId" SessionField="UsuarioId" Type="Int32" />
                                        <asp:ControlParameter ControlID="lblEtiTmpPreComId" Name="preComprasDetalleId" PropertyName="Text"
                                            Type="Int32" />
                                        <asp:QueryStringParameter Name="ComprasId" QueryStringField="comprasId" Type="Int32" />
                                    </UpdateParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="comPedId" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("id_producto") %>' Font-Size="9pt"></asp:Label>
                                : &nbsp;
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("descripcion") %>' Font-Size="7pt" ></asp:Label><br />
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsDocumentos">
                                    <ItemTemplate>
                                            <asp:Label ID="Label94" runat="server" Text='<%#Eval("Folio")%>' Font-Size="7pt" ForeColor="Gray"></asp:Label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                
                                <asp:SqlDataSource ID="sdsDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                                    SelectCommand="get_datosPreComprasDetallePedido" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="intComprasId" QueryStringField="comprasId"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="Label3" DefaultValue="" Name="strCod_prod" PropertyName="Text"
                                            Type="String" />
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="400px" />
                            <ItemStyle HorizontalAlign="Left" Width="400px" VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CostoMinimo" HeaderText="Costo M&#237;nimo" ReadOnly="True"
                            SortExpression="CostoMinimo" >
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CostoMaximo" HeaderText="Costo M&#225;ximo" ReadOnly="True"
                            SortExpression="CostoMaximo" >
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UltimoCosto" HeaderText="Ultimo Costo" ReadOnly="True"
                            SortExpression="UltimoCosto" >
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CostoModa" HeaderText="Costo Moda" ReadOnly="True" SortExpression="CostoModa" >
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Cantidad" SortExpression="cantidad">
                            <EditItemTemplate>
                                <asp:TextBox ID="Cantidad" runat="server" Text='<%# Bind("cantidad") %>' Font-Size="8pt" MaxLength="9" Width="50px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="Cantidad"
                                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("cantidad") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Costo" SortExpression="costo">
                            <EditItemTemplate>
                                <asp:TextBox ID="Costo" runat="server" Text='<%# Bind("costo") %>' Font-Size="8pt" MaxLength="9" Width="50px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Costo"
                                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("costo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
                                    CommandName="Update" Font-Size="7pt" ForeColor="#003366" Text="Actualizar" Width="55px" />&nbsp;<asp:Button
                                        ID="btnCancelar" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                        CommandName="Cancel" Font-Size="7pt" ForeColor="#003366" Text="Cancelar" Width="55px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="7pt" ForeColor="#003366" Text="Editar" />
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 293px; height: 22px;" align="right" valign="top">
                <asp:Label ID="lblMensaje2" runat="server" Font-Size="8pt" ForeColor="#CC0033"></asp:Label></td>
            <td style="width: 224px; height: 22px;" align="left" valign="top">
                <asp:Label ID="lblCompraId" runat="server"></asp:Label></td>
            <td style="height: 22px" align="left" valign="top">
                <asp:Button ID="btnGenera" runat="server" OnClick="btnGenera_Click" Text="Continuar" ValidationGroup="procesa" BorderStyle="None" BorderWidth="0px" Font-Size="10pt" ForeColor="#003366" /></td>
        </tr>
    </table>
</asp:Content>

