<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="seguimientoOrdenCompra.aspx.cs" Inherits="OrdenesCompra_listadoOrdenesCompra" Title="SEGUIMIENTO - OC" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<script language="javascript">

function ValidaSecuencia(source, arguments)
{    

        txtJob = eval("document.all.txtJob");    //Se obtiene el objeto de texto
        txtOrdenServicio = eval("document.all.txtOrdenServicio");    //Se obtiene el objeto de texto
        
        var blnBandera = false;
        
        alert(txtJob.value);
        if (txtJob.value != 0)//Se realiza la comparación del valor esperado
            {
            blnBandera = true;
            }
            
        alert(txtOrdenServicio.value);
        if (txtOrdenServicio.value != 0)//Se realiza la comparación del valor esperado
            {
            blnBandera = true;
            }

    if(blnBandera)
    {
    arguments.IsValid=true;    //la validación fue exitosa
    }
    else
    {
    arguments.IsValid=false;
    }
    
    return;
}

          
// ]]></script>
    <table style="width: 950px; height: 62px" border="0" cellpadding="1" cellspacing="6">
        <tr>
            <td align="left" style="width: 211px">
                <asp:LinkButton ID="lkbBusuedaOC" runat="server" Font-Size="10pt" PostBackUrl="~/OrdenesCompra/listadoOrdenesCompraSeguimiento.aspx">BUSQUEDA OC</asp:LinkButton></td>
            <td align="left" colspan="3" valign="top">
                <asp:Label ID="Label10" runat="server" Font-Size="10pt" Text="SEGUIMIENTO"></asp:Label></td>
            <td align="center" style="width: 174px;" valign="top">
            </td>
        </tr>
        <tr>
            <td style="width: 211px">
                <span style="font-size: 9pt">
                    <asp:Label ID="lblEtiquetaOrdenCompra" runat="server" Font-Bold="False" Font-Size="10pt"
                        Text="Orden de Compra:" Visible="False"></asp:Label><strong> </strong>
                <asp:Label ID="lblOrdenCompra" runat="server" Font-Bold="True" Font-Size="9pt" Visible="False"></asp:Label><br />
                    Origen:<strong> </strong>
                    <asp:Label ID="lblOrigen" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></span></td>
            <td colspan="2" align="center">
                <asp:Label ID="lblEstatusOrdenCompra" runat="server" Font-Bold="True" Font-Size="11pt"
                    ForeColor="Navy"></asp:Label></td>
            <td style="text-align: right; width: 178px;" align="right" valign="top">
                <span style="font-size: 9pt">Fecha:</span></td>
            <td style="width: 174px;" align="left" valign="top">
                <asp:Label ID="lblFecha" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label><asp:Label ID="lblOrdenCompraOculto" runat="server" Font-Bold="False" Font-Size="7pt"
                    Visible="False"></asp:Label><asp:Label ID="lblDireccionId" runat="server" Visible="False" Font-Size="7pt"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="5" valign="top" style="height: 1px">

                        
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 950px; height: 50px">
                                <tr>
                                    <td style="width: 118px; height: 16px;">
                                        <span style="font-size: 9pt">PROVEEDOR:</span></td>
                                    <td colspan="3" style="height: 16px" >
                                <asp:Label ID="lblNombreProveedor" runat="server" Font-Size="9pt" Font-Bold="True"></asp:Label><strong><span
                        style="font-size: 9pt"></span></strong></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px" valign="top">
                                            <asp:Label ID="lblEtiRFC" runat="server" Text="RFC:" Font-Size="9pt"></asp:Label></td>
                                    <td align="left" style="width: 322px" valign="top">
                                        <asp:Label ID="lblRFC" runat="server"
                                                Font-Size="9pt" Width="227px" Font-Bold="True"></asp:Label></td>
                                    <td align="left" valign="top">
                                        <span style="font-size: 9pt">Contacto:</span></td>
                                    <td align="left" valign="top">
                                        <asp:Label ID="lblContacto" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px; height: 16px;" valign="top">
                                        <span style="font-size: 9pt">Dirección:</span></td>
                                    <td align="left" valign="top" style="width: 322px; height: 16px;">
                                        <asp:Label ID="lblDireccion" runat="server" Width="269px" Font-Size="8pt" Font-Bold="True"></asp:Label><strong><span style="font-size: 9pt"></span></strong></td>
                                    <td align="left" valign="top" style="height: 16px">
                                        <span style="font-size: 9pt">Colonia:</span></td>
                                    <td align="left" valign="top" style="height: 16px">
                                        <asp:Label ID="lblColonia" runat="server" Font-Size="8pt" Width="269px" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px; height: 16px;" valign="top">
                                        <span style="font-size: 9pt">
                Ciudad:</span></td>
                                    <td valign="top" style="width: 322px; height: 16px;">
                <asp:Label ID="lblCiudad" runat="server"
                    Font-Size="8pt" Width="182px" Font-Bold="True"></asp:Label></td>
                                    <td valign="top" style="height: 16px">
                                        <span style="font-size: 9pt">
                        Estado:</span></td>
                                    <td valign="top" style="height: 16px">
                <asp:Label ID="lblEstado" runat="server" Font-Size="8pt" Width="88px" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px" valign="top">
                                        <span style="font-size: 9pt">C.P.:</span></td>
                                    <td valign="top" style="width: 322px">
                    <asp:Label ID="lblCP" runat="server" Width="44px" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                    <td valign="top">
                                        <span style="font-size: 9pt">
                    Mail:</span></td>
                                    <td valign="top">
                <asp:Label ID="lblEmail" runat="server" Width="229px" Font-Size="8pt" Visible="False" Font-Bold="True"></asp:Label>
                </td>
                                </tr>
                                <tr>
                                    <td style="width: 118px; height: 12px;" valign="top">
                                        <span style="font-size: 9pt">
                Teléfono:</span></td>
                                    <td valign="top" style="width: 322px; height: 12px;">
                <asp:Label ID="lblTelefono" runat="server" Font-Size="8pt" Width="149px" Font-Bold="True"></asp:Label></td>
                                    <td valign="top" style="height: 12px">
                                        <span style="font-size: 9pt">Fax:</span></td>
                                    <td valign="top" style="height: 12px">
                <asp:Label ID="lblFax" runat="server" Font-Size="8pt" Width="149px" Font-Bold="True"></asp:Label></td>
                                </tr>
                            </table><hr />
                            
                
            </td>
        </tr>
        <tr>
            <td align="left" colspan="5" style="height: 1px" valign="top">
                        
                        
                            <table cellpadding="0" cellspacing="1" style="width: 957px; height: 50px">
                                <tr>
                                    <td align="left" valign="top" style="width: 285px">
                                        <span style="font-size: 9pt">Moneda:<strong> </strong>
                                            <asp:Label ID="lblMoneda" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></span></td>
                                    <td style="width: 143px;" align="left">
                                        <span style="font-size: 9pt">
                                                Fecha de entrega:<strong> </strong>
                                            <asp:Label ID="lblFechaEntrega" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></span></td>
                                </tr>
                                <tr>
                                    <td style="width: 285px;">
                                        <span style="font-size: 9pt">Via de Embarque:<strong> </strong>
                                            <asp:Label ID="lblViaEmbarque" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></span></td>
                                    <td colspan="1" align="left">
                                        <span style="font-size: 9pt">FOB 
                                        </span><span style="font-size: 7pt">(Libre a Bordo)</span><span style="font-size: 9pt">:<strong>
                                        </strong>
                                            <asp:Label ID="lblFob" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></span></td>
                                </tr>
                                <tr>
                                    <td style="width: 285px;">
                                        <span style="font-size: 9pt">Proyecto:<strong> </strong>
                                            <asp:Label ID="lblProyecto" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></span></td>
                                    <td colspan="1">
                                        <strong></strong><asp:Label ID="lblClasificacion" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label>:<asp:Label ID="lblClasificacionValor"
                                                                    runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 285px;">
                                            <asp:Label ID="Label9" runat="server" Text="Pedimento:" Visible="False"></asp:Label><asp:Label ID="lblPedimento" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                    <td style="width: 143px;">
                                            <asp:Label ID="Label8" runat="server" Text="Fecha Pedimento:" Visible="False" Font-Size="10pt" Width="126px"></asp:Label><asp:Label ID="lblFechaPedimento" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 285px;">
                                        <strong><span style="font-size: 9pt">
                <asp:CheckBox ID="ckbPagodeContado" runat="server" Font-Bold="True"
                    Font-Size="9pt" Text="De Contado" Enabled="False" /></span></strong></td>
                                    <td style="width: 143px;">
                                        <strong><span style="font-size: 9pt">&nbsp;<asp:Label ID="lblEstatus" runat="server" Enabled="False" Text="Estatus:" Font-Size="9pt"></asp:Label><asp:Label ID="lblEstatusTex" runat="server" Font-Size="8pt"></asp:Label></span></strong></td>
                                </tr>
                                <tr>
                                    <td style="height: 7px;" colspan="2">
                                        <span style="font-size: 11pt">Factura:</span>
                                        <asp:TextBox ID="txtFolio" runat="server" Font-Size="10pt" MaxLength="20" Width="180px" ValidationGroup="agrega1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFolio"
                                            Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt" ValidationGroup="procesa"></asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                            

                
                <hr />
            </td>
        </tr>
        <tr>
            <td align="left" colspan="5" valign="top">
                <span style="font-size: 9pt">
                    </span>
                        
                            <table border="0" cellpadding="1" cellspacing="0" style="width: 957px; height: 1px;">
                                <tr>
                                    <td colspan="5">
                                    <asp:Label ID="lblBankInformation" runat="server" Font-Bold="True" Font-Size="10pt"
                                    Text="Bank Information" Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px;">
                                        <strong><span style="font-size: 9pt">
                                            <asp:Label ID="lblAccountName" runat="server" Text="Account Name:" Visible="False" Font-Bold="False"></asp:Label></span></strong></td>
                                    <td align="left" style="width: 130px;">
                                        <asp:Label ID="lblAccountNameTex" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                    <td style="width: 149px;">
                                    </td>
                                    <td style="width: 82px;">
                                        <strong><span style="font-size: 9pt">
                                            <asp:Label ID="lblAddress" runat="server" Text="Address:" Visible="False" Font-Bold="False"></asp:Label></span></strong></td>
                                    <td align="left">
                                        <asp:Label ID="lblAddressTex" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px;">
                                        <strong><span style="font-size: 9pt">
                                            <asp:Label ID="lblAccountNumber" runat="server" Text="Account Number:" Visible="False" Font-Bold="False"></asp:Label></span></strong></td>
                                    <td align="left" style="width: 130px;">
                                        <asp:Label ID="lblAccountNumberTex" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                    <td style="width: 149px;">
                                    </td>
                                    <td style="width: 82px;">
                                        <strong><span style="font-size: 9pt">
                                            <asp:Label ID="lblBankName" runat="server" Text="Bank Name:" Visible="False" Font-Bold="False"></asp:Label></span></strong></td>
                                    <td align="left">
                                        <asp:Label ID="lblBankNameTex" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 118px">
                                        <strong><span style="font-size: 9pt">
                                            <asp:Label ID="lblBankAddress" runat="server" Text="Bank Address:" Visible="False" Font-Bold="False"></asp:Label></span></strong></td>
                                    <td align="left" style="width: 130px">
                                        <asp:Label ID="lblBankAddressTex" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                    <td style="width: 149px">
                                    </td>
                                    <td style="width: 82px">
                                        <strong><span style="font-size: 9pt">
                                            <asp:Label ID="lblABA" runat="server" Text="A.B.A.:" Visible="False" Font-Bold="False"></asp:Label></span></strong></td>
                                    <td align="left">
                                        <asp:Label ID="lblAbaTex" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
                                </tr>
                            </table>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="height: 1px">
    <table style="width: 975px; height: 61px" border="0">
        <tr>
            <td colspan="11" style="height: 1px" valign="top">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="detalleOrdenCompraId,OrdenCompraId,pendientes" DataSourceID="SqlDataSource1" Font-Size="8pt" 
                    ForeColor="#333333" GridLines="Horizontal" Width="100%" OnRowCreated="Grid_RowCreated" OnDataBound ="GridView1_DataBound" onRowDataBound="GridView1_RowDataBound" Height="91px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                    <FooterStyle BackColor="#E0E0E0" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                    <Columns>
                        <asp:BoundField DataField="OrdenCompraId" HeaderText="OrdenCompraId" SortExpression="OrdenCompraId"
                            Visible="False" />
                        <asp:BoundField DataField="detalleOrdenCompraId" HeaderText="detalleOrdenCompraId"
                            InsertVisible="False" ReadOnly="True" SortExpression="detalleOrdenCompraId" Visible="False" />
                        <asp:TemplateField HeaderText="-">
                            <ItemStyle HorizontalAlign="Center" Font-Italic="True" Font-Size="6pt" VerticalAlign="Bottom" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text="<%# get_numeroPartida() %>" Font-Size="6pt"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="2%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="cantidad" HeaderText="CANTIDAD" SortExpression="cantidad" ReadOnly="True">
                            <HeaderStyle Width="10%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="DESCRIPCION" SortExpression="descripcion">
                            <EditItemTemplate>
                                &nbsp;
                                <asp:Label ID="Label41" runat="server" Font-Size="9pt" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <br />
                                &nbsp;
                            </FooterTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="20%" />
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("descripcion") %>' Font-Size="9pt"></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Left" />
                            <ItemStyle Width="400px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRECIO" SortExpression="precioUnitario">
                            <EditItemTemplate>
                                <asp:Label ID="Label51" runat="server" Font-Size="9pt" Text='<%# String.Format("{0:#,##0.00}", Eval("precioUnitario")) %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <br />
                                &nbsp;
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" Width="10%" />
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Font-Size="9pt" Text='<%# String.Format("{0:#,##0.00}", Eval("precioUnitario")) %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DESCUENTO">
                            <EditItemTemplate>
                                <asp:Label ID="Label61" runat="server" Text='<%# Bind("Descuento") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                &nbsp;
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Descuento") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TOTAL" SortExpression="Total">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Total") %>' Font-Size="9pt"></asp:Label>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Font-Bold="True" Font-Size="9pt" ForeColor="Gray" />
                            <HeaderStyle HorizontalAlign="Right" Width="5%" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Size="9pt" Text='<%# String.Format("{0:N}",Get_Amount(Double.Parse(Eval("Total").ToString()))) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TIPO" SortExpression="tipoDetalleOrdenCompraId">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("tipoDetalleOrdenCompra") %>'></asp:Label>&nbsp;
                            </ItemTemplate>
                            <FooterTemplate>
                                &nbsp;
                            </FooterTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Folios" InsertVisible="False" SortExpression="detalleOrdenCompraId" Visible="False">
                            <ItemTemplate>
                               <HeaderStyle Width="200px" />
                              <ItemStyle Width="200px" />
                            </ItemTemplate>
                            <ControlStyle Width="300px" />
                            <FooterStyle Width="300px" />
                            <ItemStyle Width="300px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REGISTRAR" SortExpression="pendientes">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("pendientes") %>' Font-Size="9pt"></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <br />
                                &nbsp;
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:TextBox ID="pendiente" runat="server" Text='<%# Bind("pendientes") %>' Font-Size="9pt" Width="46px" MaxLength="9" ValidationGroup="procesa"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                                    ControlToValidate="pendiente" Display="Dynamic" ErrorMessage="Numérico" Font-Size="7pt"
                                    Height="15px" ValidationExpression="^\d+(\.\d{1,2})?$"
                                    Width="49px"></asp:RegularExpressionValidator>
                                <asp:Label
                                        ID="lblPendientes" runat="server" Font-Size="9pt" Text='<%# Bind("pendientes") %>'
                                        Visible="False"></asp:Label>
                                    
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="7%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FECHA ENTREGA" SortExpression="fechaEntrega">
                            <EditItemTemplate>
                                <asp:TextBox ID="fechaEntrega" runat="server" Font-Size="10pt" Text='<%# Bind("fechaEntrega") %>'
                                    Width="104px"></asp:TextBox><asp:Button ID="Button2" runat="server" CommandName="Update"
                                        Text="OK" /><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="fechaEntrega"
                                    Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" Height="16px"
                                    ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"
                                    ValidationGroup="procesa" Width="153px"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                &nbsp;
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnFechaEntrega" runat="server" BorderStyle="Solid" CommandName="Edit"
                                    Font-Size="9pt" OnClick="Button1_Click2" Text='<%# Eval("fechaEntrega") %>' />
                                <asp:Label ID="lblFechaEntrega" runat="server" Font-Size="9pt" Text='<%# Bind("fechaEntrega") %>'
                                    Visible="False"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                            <HeaderStyle Width="13%" />
                        </asp:TemplateField>
                        
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="5px" />
                    <EditRowStyle BackColor="#E2DED6" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#5D7B9D" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="5px" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="delete detalleOrdenCompra where detalleOrdenCompraId = @detalleOrdenCompraId&#13;&#10;&#13;&#10;"
                    SelectCommand="get_datosDetalleOrdenCompra" SelectCommandType="StoredProcedure"
                    UpdateCommand="update detalleOrdenCompra set &#13;&#10;&#9;fechaEntrega = @fechaEntrega&#13;&#10;where ordenCompraId = @intOrdenCompraId&#13;&#10;and detalleOrdenCompraId = @detalleOrdenCompraId&#13;&#10;">
                    <DeleteParameters>
                        <asp:Parameter Name="detalleOrdenCompraId" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="lblOrdenCompraOculto" DefaultValue="" Name="intOrdenCompraId"
                            PropertyName="Text" Type="Int32" />
                        <asp:Parameter Name="detalleOrdenCompraId" Type="Int32" />
                        <asp:Parameter Name="fechaEntrega" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intOrdenCompraId" QueryStringField="ordenCompraId" Type="Int32" DefaultValue="0" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="11" style="height: 1px" valign="top">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="8">
            </td>
            <td style="text-align: right; width: 406px;">
                <span style="font-size: 9pt">Subtotal:</span></td>
            <td style="text-align: right">
                <asp:Label ID="lblSubtotal" runat="server" Font-Size="8pt" Text="0.0" Font-Bold="True"></asp:Label></td>
            <td style="text-align: right">
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <span style="font-size: 9pt">Datos transferencia:</span></td>
            <td rowspan="2" valign="top">
                <asp:Label ID="lblDatosTransferencia" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
            <td style="text-align: right; width: 406px;">
                <span style="font-size: 9pt">Descuento:<asp:Label ID="lblDescuentoTex" runat="server"
                    Text="0.0" Font-Bold="True" Font-Size="8pt"></asp:Label>%</span></td>
            <td style="text-align: right">
                <asp:Label ID="lblDescuento" runat="server" Font-Size="8pt" Text="0.0" Font-Bold="True"></asp:Label></td>
            <td style="text-align: left" align="left">
                </td>
        </tr>
        <tr>
            <td colspan="7" style="height: 8px">
            </td>
            <td style="height: 8px; text-align: right; width: 406px;">
                <span style="font-size: 9pt">Envio:</span></td>
            <td style="height: 8px; text-align: right" align="right">
                <asp:Label ID="lblEnvio" runat="server" Font-Size="8pt" Text="0.0" Font-Bold="True"></asp:Label>
            </td>
            <td style="height: 8px; text-align: left" align="left">
                </td>
        </tr>
        <tr>
            <td colspan="7">
                <span style="font-size: 9pt">Instrucciones de Embarque:</span></td>
            <td rowspan="2" valign="top">
                <asp:Label ID="lblIntruccionesEmbarque" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
            <td style="text-align: right; width: 406px;">
                <span style="font-size: 9pt">Impuesto:<asp:Label ID="lblImpuestoTex" runat="server"
                    Font-Size="8pt" Text="16" Font-Bold="True"></asp:Label>%</span></td>
            <td style="text-align: right">
                <asp:Label ID="lblImpuesto" runat="server" Font-Size="8pt" Text="0.0" Font-Bold="True"></asp:Label></td>
            <td style="text-align: left" align="left">
                </td>
        </tr>
        <tr>
            <td colspan="7" style="height: 11px">
            </td>
            <td style="text-align: right; height: 11px; width: 406px;">
                <span style="font-size: 9pt">Imp. Importación:</span></td>
            <td align="right" style="height: 11px">
                <asp:Label ID="lblImpuestoImportacion" runat="server" Font-Size="8pt" Text="0.0" Font-Bold="True"></asp:Label>
            </td>
            <td align="left" style="height: 11px">
                </td>
        </tr>
        <tr>
            <td colspan="7" style="height: 20px">
                <span style="font-size: 9pt">Terminos:</span></td>
            <td rowspan="2" valign="top">
                <asp:Label ID="lblTerminos" runat="server" Font-Size="8pt" Font-Bold="True"></asp:Label></td>
            <td style="height: 20px; text-align: right; width: 406px;">
                <span style="font-size: 9pt">Total:</span></td>
            <td style="height: 20px; text-align: right">
                <asp:Label ID="lblTotal" runat="server" Text="0.0" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
            <td style="height: 20px; text-align: right">
            </td>
        </tr>
        <tr>
            <td colspan="7" style="height: 6px">
                &nbsp;</td>
            <td align="right">
                <asp:Label ID="lblMensaje" runat="server" Font-Size="10pt" Font-Bold="True" ForeColor="#CC0033"></asp:Label></td>
            <td colspan="2" style="height: 6px; text-align: right">
                &nbsp;<asp:Button ID="btnContinuar" runat="server" OnClick="btnContinuar_Click" Text="Continuar"
                    Width="68px" BackColor="DarkGray" BorderStyle="Solid" BorderWidth="0px" Font-Size="10pt" ValidationGroup="procesa" /></td>
        </tr>
    </table>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Id" DataSourceID="odsOrdenCompra" Font-Size="8pt" ForeColor="#333333"
                    GridLines="Horizontal">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="Facturas" InsertVisible="False" SortExpression="Id">
                            <EditItemTemplate>
                                <asp:Label ID="lblId" runat="server" Font-Size="7pt" Text='<%# Eval("Id") %>'></asp:Label><br />
                                Factura:
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="#000000" Text='<%# Bind("Factura") %>'></asp:Label><br />
                                Fecha:
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label><br />
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="Navy" BorderStyle="None" BorderWidth="3px" CellPadding="4" DataSourceID="odsDetalleOrdenCompra"
                                    Font-Size="7pt" GridLines="Horizontal">
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField DataField="descripcion" HeaderText="C&#243;digo" SortExpression="descripcion" />
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#000040" Font-Bold="True" ForeColor="White" Width="5px" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="odsDetalleOrdenCompra" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_listaDetalleSeguimientoOrdenCompraTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblOrdenCompraOculto" Name="intOrdenCompraId" PropertyName="Text"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="lblId" Name="intSeguimientoOrdenCompraId" PropertyName="Text"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="cancel"
                                    ForeColor="Red" Text="cerrar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Edit"
                                    Font-Size="7pt" Text='<%# Eval("Id") %>'></asp:LinkButton>
                                |
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text='<%# Eval("Factura") %>'></asp:LinkButton>
                                |
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text='<%# Eval("Fecha") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="LightGray" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsOrdenCompra" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_listaSeguimientoOrdenCompraTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblOrdenCompraOculto" Name="intOrdenCompraId" PropertyName="Text"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
            <td align="right" style="width: 178px; text-align: right" valign="top">
            </td>
            <td align="left" rowspan="1" style="width: 174px" valign="top">
            </td>
        </tr>
    </table>
    &nbsp;
</asp:Content>

