<%@ Page Language="C#" AutoEventWireup="true" CodeFile="caidaCompras.aspx.cs" Inherits="Admin_compras_caidaCompras" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>COMPRAS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 800px">
            <tr>
                <td rowspan="3" style="width: 309px">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Imagenes/logoCalvek.jpg" /></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14pt" Text="ORDEN DE COMPRA"></asp:Label></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Folio:"></asp:Label>
                    <asp:Label ID="lblFolio" runat="server" Font-Size="10pt"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Moneda:"></asp:Label>
                    <asp:Label ID="lblMoneda" runat="server" Font-Size="10pt"></asp:Label></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Sucursal:"></asp:Label>
                    <asp:Label ID="lblSucursal" runat="server" Font-Size="10pt"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 8px">
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2" style="height: 17px" valign="top">
                    <table style="width: 485px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 133px">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Datos Facturación:" Font-Size="10pt"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="10pt" Text="CALVEK S.A. DE C.V."></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="10pt" Text="CARR. MEXICO-PIEDRAS NEGRAS KM 426"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="10pt" Text="COL. CENTRAL DE MAQUINARIA"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="10pt" Text="CP. 78434, SAN LUIS POTOSI, SLP"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                            </td>
                            <td>
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="10pt" Text="RFC: CAL-980715-AA3"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                            </td>
                            <td>
                                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="10pt" Text="TEL:(444) 8183807"></asp:Label></td>
                        </tr>
                    </table>
                </td>
                <td align="left" style="height: 17px" valign="top">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Contacto:"></asp:Label>&nbsp;
                    <asp:Label ID="Label11" runat="server" Font-Bold="False" Text="compras@calvek.com"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 8px">
                    <hr />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 19px; width: 309px;">
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Proveedor:"></asp:Label>&nbsp;
                    <asp:Label ID="lblProveedor" runat="server" Font-Size="10pt"></asp:Label></td>
                <td style="height: 19px">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Clave:"></asp:Label>
                    <asp:Label ID="lblClave" runat="server" Font-Size="10pt"></asp:Label></td>
                <td style="height: 19px">
                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Fecha:"></asp:Label>&nbsp;
                    <asp:Label ID="lblFecha" runat="server" Font-Size="10pt"></asp:Label></td>
            </tr>
            <tr>
                <td style="height: 19px; width: 309px;">
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="RFC:"></asp:Label>
                    <asp:Label ID="lblRFC" runat="server" Font-Size="10pt"></asp:Label></td>
                <td style="height: 19px">
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Referencia:"></asp:Label>
                    <asp:Label ID="lblReferencia" runat="server" Font-Size="10pt"></asp:Label></td>
                <td style="height: 19px">
                    <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Condiciones de Pago:"></asp:Label>
                    <asp:Label ID="lblCondPago" runat="server" Font-Size="10pt"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr />
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 2px">
                    <asp:ObjectDataSource ID="odsCompras" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ComprasTableAdapters.get_listadoDetalleComprasTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="compraId" Name="intComprasId" PropertyName="Text"
                                Type="Int32" />
                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataSourceID="odsCompras" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Font-Size="9pt">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Font-Size="8pt" Text="<%# get_numeroPartida() %>"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="C&#243;digo : Descripci&#243;n" SortExpression="id_producto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("id_producto") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_producto") %>'></asp:Label>&nbsp;
                                    <asp:Label ID="Label33" runat="server" Text='<%# Bind("producto") %>' Font-Size="7pt"></asp:Label><br/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Repeater ID="Repeater1"
                                        runat="server" DataSourceID="sdsDocumentos">
                                        <ItemTemplate>
                                            <asp:Label ID="Label94" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%#Eval("Folio")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    
                                    <asp:SqlDataSource ID="sdsDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                                        SelectCommand="get_datosPreComprasDetallePedido" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="compraId" DefaultValue="0" Name="intComprasId" PropertyName="Text"
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="Label2" DefaultValue="" Name="strCod_prod" PropertyName="Text"
                                                Type="String" />
                                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="400px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" >
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Costo" SortExpression="costo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("costo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("costo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# String.Format("{0:#,##0.00}",Get_Amount( Int32.Parse(Eval("cantidad").ToString()),Double.Parse(Eval("Costo").ToString()))) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 1px">
                    <hr />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 19px;" colspan="2" valign="top">
                    <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Comentarios:"></asp:Label><br />
                    <asp:Label ID="lblComentario" runat="server" Height="59px" Width="423px"></asp:Label></td>
                <td rowspan="3">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label28" runat="server" Font-Bold="False" Text="Subtotal:"></asp:Label></td>
                            <td align="right">
                                <asp:Label ID="lblSubtotal1" runat="server" Font-Size="10pt">0.0</asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label30" runat="server" Font-Bold="False" Text="Descuento:"></asp:Label></td>
                            <td align="right">
                                <asp:Label ID="lblDescuento" runat="server" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label31" runat="server" Font-Bold="False" Text="Flete:"></asp:Label></td>
                            <td align="right">
                                <asp:Label ID="lblFlete" runat="server" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label32" runat="server" Font-Bold="False" Text="SubTotal:"></asp:Label></td>
                            <td align="right">
                                <asp:Label ID="lblSubtotal2" runat="server" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="height: 21px">
                                <asp:Label ID="Label33" runat="server" Font-Bold="False" Text="IEPS:"></asp:Label></td>
                            <td align="right" style="height: 21px">
                                <asp:Label ID="lblIEPS" runat="server" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label34" runat="server" Font-Bold="False" Text="IVA:"></asp:Label></td>
                            <td align="right">
                                <asp:Label ID="lblIVA" runat="server" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Total:"></asp:Label></td>
                            <td align="right">
                                <asp:Label ID="lblTotal" runat="server" Font-Size="10pt"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 309px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 309px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 38px; width: 309px;">
                    <asp:Label ID="LINEAID" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Marca" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="sucursal" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="TipoDocumento" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Moneda" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Agentes" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Cliente" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Pedido" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="compraId" runat="server" Visible="False"></asp:Label></td>
                <td style="height: 38px">
                </td>
                <td style="height: 38px">
                    <asp:Label ID="lblTemporal" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 309px">
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
