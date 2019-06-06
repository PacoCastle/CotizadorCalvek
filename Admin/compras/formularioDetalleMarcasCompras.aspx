<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioDetalleMarcasCompras.aspx.cs" Inherits="Admin_compras_formularioDetalleMarcasCompras" Title="COMPRAS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 700px">
        <tr>
            <td style="width: 293px">
                <asp:Label ID="lblLineaId" runat="server" Visible="False"></asp:Label><asp:Label ID="lblMarca" runat="server"></asp:Label><asp:Label ID="lblSucursal" runat="server" Visible="False"></asp:Label></td>
            <td style="width: 224px">
            </td>
            <td style="width: 496px">
            </td>
        </tr>
        <tr>
            <td style="width: 293px;" align="left" valign="top">
                <asp:Label ID="lblEtiMoneda" runat="server" Text="Moneda:" Font-Size="8pt"></asp:Label><asp:DropDownList ID="lstMoneda" runat="server" AutoPostBack="True" DataSourceID="odsMoneda"
                    DataTextField="descripcion" DataValueField="monedaId" Font-Size="9pt">
                </asp:DropDownList><asp:ObjectDataSource ID="odsMoneda" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaMonedaTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td colspan="2" align="left" valign="top">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 68px" valign="bottom">
                                        <asp:Label ID="lblEtiPedido" runat="server" Font-Size="9pt" Text="Pedido:"></asp:Label></td>
                                    <td style="width: 153px" valign="bottom">
                                        <asp:TextBox ID="txtPedido" runat="server"></asp:TextBox></td>
                                    <td style="width: 153px" valign="bottom">
                                        &nbsp;<asp:Button ID="btnBusqueda" runat="server" OnClick="btnBusqueda_Click" Text="Buscar" BorderStyle="None" BorderWidth="0px" ForeColor="#003366" /></td>
                                </tr>
                            </table>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblMensaje" runat="server" Font-Size="8pt" ForeColor="#CC0033"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <asp:ObjectDataSource ID="odsDetalleCompras" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ComprasTableAdapters.get_listadoDetalleMarcasCompraTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblLineaId" Name="intCveLinea" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="lblSucursal" DefaultValue="" Name="strSucursal"
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lstMoneda" DefaultValue="2" Name="intMonedaId" PropertyName="SelectedValue"
                Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsDetalleComprasBusqueda" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ComprasTableAdapters.get_listadoDetalleMarcasCompraBusquedaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblLineaId" Name="intCveLinea" PropertyName="Text"
                            Type="String" />
                        <asp:QueryStringParameter Name="strSucursal" QueryStringField="sucursal" Type="String" />
                        <asp:ControlParameter ControlID="lstMoneda" DefaultValue="2" Name="intMonedaId" PropertyName="SelectedValue"
                Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="intCveAgente" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="intCveCliente" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPedido" Name="intFolio" PropertyName="Text"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"  
        DataSourceID="odsDetalleCompras" Font-Size="8pt" ForeColor="#333333" GridLines="None" DataKeyNames="CODIGO" ShowFooter="True" Width="1100px" >
       
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="ckbCompra" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblConteo" runat="server"></asp:Label>
                </FooterTemplate>
                <ItemStyle VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="C&#243;digo : Descripci&#243;n" ShowHeader="False">
                <EditItemTemplate>
                    <asp:Label ID="lblEtiTmpProducto" runat="server" Font-Size="8pt" Text='<%# Eval("CODIGO") %>'></asp:Label>
                    :
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("PRODUCTO") %>' Font-Size="7pt"></asp:Label><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sdsDocumentos"
                        Font-Size="6pt" ForeColor="Black" GridLines="Vertical" DataKeyNames="oficinaId,Folio" onrowcommand="GridView2_rowCommand" onRowDataBound="GridView2_RowDataBound">
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False"></asp:TemplateField>
                            <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" SortExpression="Sucursal" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Folio" SortExpression="Folio">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Folio") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMarcada" runat="server" ForeColor="Green" Text="✓"></asp:Label><asp:Label ID="Label1" runat="server" Text='<%# Bind("Folio") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="cantidadPed" HeaderText="cantidad Pedido" SortExpression="cantidadPed" ReadOnly="True" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" ReadOnly="True" />
                            <asp:BoundField DataField="Instruccion" HeaderText="Instruccion" SortExpression="Instruccion" ReadOnly="True" />
                            <asp:BoundField DataField="Ocompra" HeaderText="Orden compra" ReadOnly="True" SortExpression="Ocompra" />
                            <asp:BoundField DataField="PendienteOC" HeaderText="Pendiente OC" ReadOnly="True"
                                SortExpression="PendienteOC" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />&nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="btnMarcar" runat="server" CausesValidation="False" CommandName="Marcar" Text="✓" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Font-Bold="True" Font-Size="7pt" ForeColor="#339966" BorderStyle="None" BorderWidth="0px" />
                                    <asp:Button ID="btnEliminar" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                        CommandName="Borrar" Font-Size="6pt" ForeColor="#CC3333" Text="X" ToolTip="Quitar"
                                        Visible="False" CommandArgument='<%# Eval("comPedId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="comPedId" HeaderText="comPedId" SortExpression="comPedId" Visible="False" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                        SelectCommand="get_listadoProductoEnDocumentos" SelectCommandType="StoredProcedure"
                        UpdateCommand="set_insActPreComprasDetallePedido" UpdateCommandType="StoredProcedure" DeleteCommand="delete &#13;&#10;from preComprasDetallePedido&#13;&#10;where preComprasDetallePedidoId = @comPedId&#13;&#10;">
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
                        </UpdateParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="comPedId" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel"
                        Font-Size="7pt" Text="[cerrar]"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='<%# Eval("CODIGO") %>' Font-Size="8pt"></asp:LinkButton>
                    :
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Font-Size="7pt" Text='<%# Eval("PRODUCTO") %>'></asp:LinkButton>
                    <asp:Label ID="lblEtiTmpProducto" runat="server" Font-Size="7pt" Text='<%# Eval("CODIGO") %>'
                        Visible="False"></asp:Label><br />
                    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsDocumentos">
                        <ItemTemplate>
                            <asp:Label ID="Label94" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%#Eval("Folio")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:SqlDataSource ID="sdsDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                        SelectCommand="get_datosPreComprasDetallePedido" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="intComprasId" Type="Int32" />
                            <asp:ControlParameter ControlID="lblEtiTmpProducto" DefaultValue="" Name="strCod_prod"
                                PropertyName="Text" Type="String" />
                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="400px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="400px" />
            </asp:TemplateField>
            <asp:BoundField DataField="INSTRUCCION" HeaderText="Instrucci&#243;n" SortExpression="INSTRUCCION" ReadOnly="True" Visible="False" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Pendiente Pedidos">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("pendientePed") %>'></asp:HyperLink>
                    <span style="font-size: 7pt; color: silver">(<asp:Label ID="Label1" runat="server"
                        Font-Size="7pt" ForeColor="Silver" Text='<%# Eval("conteo") %>'></asp:Label>)</span>
                </ItemTemplate>
                <EditItemTemplate>
                    &nbsp; &nbsp;
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:BoundField DataField="pendienteOC" HeaderText="pendiente Ordenes Compra" ReadOnly="True"
                SortExpression="pendienteOC" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="EX_AUT" HeaderText="AUT" ReadOnly="True" SortExpression="EX_AUT" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="EX_SLP" HeaderText="SLP" ReadOnly="True" SortExpression="EX_SLP" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="EX_QRO" HeaderText="QRO" ReadOnly="True" SortExpression="EX_QRO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="EX_CYA" HeaderText="CYA" ReadOnly="True" SortExpression="EX_CYA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="DIF" SortExpression="diferencia">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("diferencia") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("diferencia") %>' Visible="False"></asp:Label>
                    <asp:TextBox ID="txtCantidadPendiente" runat="server" Font-Size="8pt" Text='<%# Bind("diferencia") %>' Width="43px"></asp:TextBox>
                    <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCantidadPendiente"
                            Display="Dynamic" ErrorMessage="valor no valido" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"
                            ValidationGroup="procesa"></asp:RegularExpressionValidator>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:BoundField DataField="cantidadSick" HeaderText="cantidad Sick" ReadOnly="True"
                SortExpression="cantidadSick" >
                <ItemStyle Font-Bold="True" Font-Size="8pt" HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="CostoMinimo" HeaderText="Costo M&#237;nimo" SortExpression="CostoMinimo" ReadOnly="True" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="CostoMaximo" HeaderText="Costo M&#225;ximo" SortExpression="CostoMaximo" ReadOnly="True" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="CostoModa" HeaderText="Costo Moda" SortExpression="CostoModa" ReadOnly="True" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UltimoCosto" HeaderText="Ultimo Costo" SortExpression="UltimoCosto" ReadOnly="True" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Costo">
                <ItemTemplate>
                    <asp:TextBox ID="txtCosto" runat="server" Font-Size="8pt" Width="41px"></asp:TextBox><br />
                    <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCosto"
                            Display="Dynamic" ErrorMessage="valor no valido" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"
                            ValidationGroup="procesa"></asp:RegularExpressionValidator>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </EditItemTemplate>
                <ItemStyle VerticalAlign="Top" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"  />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top">
                <asp:Label ID="lblEtiProveedor" runat="server" Font-Size="9pt" Text="Proveedor:"></asp:Label>
                <asp:DropDownList ID="lstProveedor" runat="server" DataSourceID="odsProveedorCompra"
                    DataTextField="Nombre" DataValueField="claveProveedor" Font-Size="9pt" Width="496px">
                </asp:DropDownList><br />
                <asp:ObjectDataSource ID="odsProveedorCompra" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ComprasTableAdapters.get_listadoProveedoresComprasTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intCveMarca" QueryStringField="LINEAID" Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblEtiComentario" runat="server" Font-Size="9pt" Text="Comentario:"></asp:Label><br />
                <asp:TextBox ID="txtComentario" runat="server" Font-Size="9pt" Height="58px" MaxLength="100"
                    Rows="3" TextMode="MultiLine" Width="562px"></asp:TextBox></td>
            <td valign="top" style="width: 496px">
                <asp:RadioButtonList ID="rdoLstTipoDocumento" runat="server" DataSourceID="odsTipoDocumento"
                    DataTextField="tipoDocumento" DataValueField="tipoDocumentoId" Font-Size="8pt">
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdoLstTipoDocumento"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator><asp:ObjectDataSource ID="odsTipoDocumento" runat="server"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ComprasTableAdapters.get_tipoDocumentoFolioOCompraTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strSucursal" QueryStringField="sucursal" Type="String" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMensaje2" runat="server" Font-Size="8pt" ForeColor="#CC0033"></asp:Label></td>
            <td style="width: 496px">
                <asp:Button ID="btnGenera" runat="server" OnClick="btnGenera_Click" Text="Continuar" ValidationGroup="procesa" BorderStyle="None" BorderWidth="0px" Font-Size="10pt" ForeColor="#003366" />&nbsp;
                <asp:Label ID="lblCompraId" runat="server"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

