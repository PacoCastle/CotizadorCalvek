<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CaidaOrdenCompra.aspx.cs" Inherits="OrdenesCompra_CaidaOrdenCompra" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SICK - OC</title>
<script language="javascript" type="text/javascript">
// <!CDATA[


// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" style="width: 770px">
            <tr>
                <td style="width: 18867px; height: 40px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/logoCalvekAutomation.jpg" Height="67px" Width="244px" /></td>
                <td style="width: 578px; height: 40px">
                    <table style="width: 225px">
                        <tr>
                            <td>
                                <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong><span style="font-size: 9pt">
                                            Orden de compra:
                                            <asp:Label ID="lblOrdenCompraId" runat="server" Font-Italic="True" Font-Bold="True" Font-Size="11pt"></asp:Label></span></strong></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <span style="font-size: 9pt">
                                            Fecha:</span><asp:Label ID="lblFecha" runat="server" Font-Bold="True" Font-Size="9pt"></asp:Label></td>
                                        </tr>
                                    </table>
                                </strong>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 18867px">
                    <table border="1" style="width: 100%; height: 135px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 100%">
                                <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td style="height: 16px; width: 86px;">
                                            <span style="font-size: 9pt">
                                Proveedor:</span></td>
                                        <td style="height: 16px; width: 205px;">
                                <asp:Label ID="lblProveedor" runat="server" Font-Size="9pt"></asp:Label></td>
                                        <td style="font-size: 12pt; height: 16px">
                                            <span style="font-size: 9pt">
                                RFC:</span></td>
                                        <td style="font-size: 12pt; height: 16px">
                                <asp:Label ID="lblRFC" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td style="width: 86px">
                                            <span style="font-size: 9pt">
                                Contacto:</span></td>
                                        <td style="width: 205px">
                                <asp:Label ID="lblContacto" runat="server" Font-Size="9pt"></asp:Label></td>
                                        <td style="font-size: 12pt" colspan="2">
                                            <span style="font-size: 9pt">
                                E-mail:</span><asp:Label ID="lblEMail" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td style="height: 18px; width: 86px;">
                                            <span style="font-size: 9pt">Teléfono:</span></td>
                                        <td style="height: 18px; width: 205px;">
                                <asp:Label ID="lblTelefono" runat="server" Font-Size="9pt"></asp:Label></td>
                                        <td style="height: 18px">
                                            <span style="font-size: 9pt">
                                Fax:</span></td>
                                        <td style="height: 18px">
                                <asp:Label ID="lblFax" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td style="height: 17px; width: 86px;">
                                            <span style="font-size: 9pt">Dirección:</span></td>
                                        <td style="height: 17px; width: 205px;">
                                <asp:Label ID="lblDireccion" runat="server" Font-Size="9pt"></asp:Label></td>
                                        <td style="height: 17px">
                                        </td>
                                        <td style="height: 17px">
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td style="height: 17px; width: 86px;">
                                            <span style="font-size: 9pt">Via de Embarque:</span></td>
                                        <td style="height: 17px; width: 205px;">
                                            <asp:Label ID="lblViaEmbarque" runat="server" Font-Size="9pt"></asp:Label></td>
                                        <td style="height: 17px">
                                            <span style="font-size: 9pt">Fob:</span></td>
                                        <td style="height: 17px">
                                            <asp:Label ID="lblFob" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-size: 12pt">
                    <table border="1" cellpadding="0" cellspacing="0" style="width: 225px; height: 135px;">
                        <tr>
                            <td style="width: 203px">
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt">Facturar
                                        a: 
                                    <asp:Label ID="lblRazonSoc" runat="server" Font-Bold="True" Font-Size="9pt" 
                                        Text="CALVEK, S.A. DE C.V."></asp:Label>
                                    </span></span>
                                    </p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt">RFC. 
                                    <asp:Label ID="lblrfcRazon" runat="server" Font-Size="9pt" 
                                        Text="CAL 980715 AA3"></asp:Label>
                                    </span></span></p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt">Dirección:
                                        <asp:Label ID="lblcalleRazon" runat="server" Text="San Pedro No.70,"></asp:Label>
                                    </span></span></p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt">Colonia: 
                                    <asp:Label ID="lbldireccionRazon" runat="server" 
                                        Text="Rinconada de San Pedro, C.P.:78434, Soledad de Graciano Sánchez, S. L. P."></asp:Label>
&nbsp;</span></span></p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt">Tel.:
                                    <asp:Label ID="lbltelRazon" runat="server" Text="(444) 818-38-07,818-39-13"></asp:Label>
                                    </span></span></p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 10pt">
                                    <span style="line-height: 115%;"><span style="font-size: 9pt; font-family: 'Arial','sans-serif'">
                                        Fax.:
                                    <asp:Label ID="lblfaxRazon" runat="server" Text="(444) 831-66-70"></asp:Label>
                                    </span></span></p>
                                <p>
                                    <span style="line-height: 115%"></span>&nbsp;</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="font-size: 12pt; font-family: Times New Roman">
                <td style="width: 18867px; height: 63px;">
                    <table border="1" cellpadding="0" cellspacing="0" width="100%" style="height: 50px">
                        <tr>
                            <td>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt">Terminos:
                                        <asp:Label ID="lblTerminos" runat="server" Font-Size="9pt"></asp:Label><o:p></o:p></span></span></p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-family: 'Arial','sans-serif'"><span style="font-size: 9pt"></span>
                                    </span>
                                </p>
                                <p class="MsoNormal" style="margin: 0cm 0cm 10pt">
                                    <span style="font-size: 9pt; line-height: 115%; font-family: 'Arial','sans-serif'"></span>
                                </p>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="height: 63px">
                    <table border="1" cellpadding="0" cellspacing="0" width="225" style="height: 50px">
                        <tr>
                            <td>
                                <p class="MsoNormal" style="margin: 0cm 0cm 0pt; line-height: normal; mso-layout-grid-align: none">
                                    <span style="font-size: 9pt; line-height: 115%; font-family: 'Arial','sans-serif'">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 84px">
                                                    Fecha Entrega:</td>
                                                <td>
                                                    <asp:Label
                                        ID="lblFechaEntrega" runat="server" Font-Size="9pt"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </span>
                                </p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataKeyNames="detalleOrdenCompraId" DataSourceID="ObjectDataSource1" ForeColor="#333333" Width="100%" GridLines="None" Font-Size="9pt" ShowFooter="True">
                        <FooterStyle BackColor="#F7F6F3" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="NO">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="<%# get_numeroPartida() %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="cantidad" HeaderText="CANTIDAD" SortExpression="cantidad" >
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" Width="10%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="DESCRIPCION" SortExpression="descripcion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Panel ID="pnlBankInformation" runat="server" Height="116px" Width="255px">
                                        <table border="1" cellpadding="0" cellspacing="0" style="width: 163%; height: 99%">
                                            <tr>
                                                <td colspan="2" style="text-align: left">
                                                    <span style="font-size: 8pt; color: infotext">&nbsp;BANKING INFORMATION</span></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 77px; text-align: right">
                                                    <span style="font-size: 8pt; color: black">Beneficiary:</span></td>
                                                <td>
                                                    <asp:Label ID="lblAccountName" runat="server" Font-Size="8pt" ForeColor="Black"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 77px; text-align: right">
                                                    <span style="font-size: 8pt; color: black">Address:</span></td>
                                                <td>
                                                    <asp:Label ID="lblNameAddress" runat="server" Font-Size="8pt" ForeColor="Black"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 77px; text-align: right">
                                                    <span style="font-size: 8pt; color: black">Bank:</span></td>
                                                <td>
                                                    <asp:Label ID="lblBankName" runat="server" Font-Size="8pt" ForeColor="Black"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 77px; text-align: right">
                                                    <span style="font-size: 8pt; color: black">Account:</span></td>
                                                <td>
                                                    <asp:Label ID="lblAccountNumber" runat="server" Font-Size="8pt" ForeColor="Black"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 77px; text-align: right">
                                                    <span style="font-size: 8pt; color: black">ABA:</span></td>
                                                <td>
                                                    <asp:Label ID="lblAba" runat="server" Font-Size="8pt" ForeColor="Black"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 77px; text-align: right">
                                                    <span style="font-size: 8pt; color: black">Bank Address:</span></td>
                                                <td>
                                                    <asp:Label ID="lblBankAddress" runat="server" Font-Size="8pt" ForeColor="Black"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" Width="50%" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="fechaEntrega" HeaderText="T.ENTREGA" SortExpression="fechaEntrega" />
                            <asp:TemplateField HeaderText="PRECIO" SortExpression="precioUnitario">
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:#,##0.00}",Eval("precioUnitario")) %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# String.Format("{0:#,##0.00}",Eval("precioUnitario")) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DESCUENTO" SortExpression="descuento">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# String.Format("{0:#,##0.00}",Eval("descuento")) %>'
                                        Width="49px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# String.Format("{0:#,##0.00}",Eval("descuento")) %>'></asp:Label>
                                    %
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="tipoDetalleOrdenCompra" HeaderText="TIPO" SortExpression="tipoDetalleOrdenCompra" />
                            <asp:TemplateField HeaderText="TOTAL" SortExpression="Total">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    &nbsp;
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:#,##0.00}",Get_Amount(Double.Parse(Eval("Total").ToString()))) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" Width="15%" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_datosDetalleOrdenCompraTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="intOrdenCompraId" QueryStringField="ordenCompraId"
                                Type="Int32" DefaultValue="0" />
                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 18867px">
                    <table border="1" style="width: 100%; height: 147px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td colspan="3">
                                            <span style="font-size: 9pt">Proyecto:</span><asp:Label ID="lblProyecto" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr style="font-size: 9pt">
                                        <td colspan="2">
                                            Job: &nbsp;
                                            <asp:Label ID="lblJob" runat="server" Font-Size="9pt"></asp:Label></td>
                                        <td>
                                            Orden de Servicio:
                                            <asp:Label ID="Label6" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span style="font-size: 9pt">Datos transferencia:</span></td>
                                        <td rowspan="2">
                                            <asp:Label ID="lblDatosTransferencia" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 85px">
                                        </td>
                                        <td style="width: 48px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span style="font-size: 9pt">Instrucciones de Embarque:</span></td>
                                        <td rowspan="2">
                                            <asp:Label ID="lblInstruccionesEmbarque" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 85px">
                                        </td>
                                        <td style="width: 48px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 85px">
                                        </td>
                                        <td style="width: 48px">
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 225px; height: 147px;" border="1" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td style="width: 508px; text-align: right">
                                            <span style="font-size: 9pt">SubTotal:</span></td>
                                        <td style="width: 154px; text-align: right">
                                            <asp:Label ID="lblSubTotal" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 508px; text-align: right">
                                            <span style="font-size: 9pt">Descuento (</span><asp:Label ID="lblDescuento" runat="server"
                                                Font-Size="9pt"></asp:Label><span style="font-size: 9pt"> %):</span></td>
                                        <td style="width: 154px; text-align: right">
                                            <asp:Label ID="lblCantidadDescuento" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 508px; text-align: right">
                                            <span style="font-size: 9pt">Envio:</span></td>
                                        <td style="width: 154px; text-align: right">
                                            <asp:Label ID="lblEnvio" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 508px; text-align: right">
                                            <span style="font-size: 9pt">Impuesto(</span><asp:Label ID="lblImpuesto" runat="server"
                                                Font-Size="9pt"></asp:Label><span style="font-size: 9pt">%):</span></td>
                                        <td style="width: 154px; text-align: right">
                                            <asp:Label ID="lblCantImpuesto" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 508px; text-align: right">
                                            <span style="font-size: 9pt">Imp. Importación:</span></td>
                                        <td style="width: 154px; text-align: right">
                                            <asp:Label ID="lblImpImportacion" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 508px; text-align: right">
                                            <span style="font-size: 9pt">Total:</span></td>
                                        <td style="width: 154px; text-align: right">
                                            <asp:Label ID="lblTotal" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 18867px">
                    <table border="1" style="width: 100%; height: 100px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="height: 125px">
                                <table border="0" style="width: 100%; height: 80px">
                                    <tr>
                                        <td style="width: 98px">
                                            <span style="font-size: 9pt"><strong>Autorización:</strong></span></td>
                                        <td style="width: 98px">
                                        </td>
                                        <td style="width: 7px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 98px">
                                            <span style="font-size: 9pt">
                                                <br />
                                            </span></td>
                                        <td style="width: 98px">
                                            <span style="font-size: 9pt"></span>
                                        </td>
                                        <td style="width: 7px">
                                            <span style="font-size: 9pt"></span></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 98px; height: 17px; text-align: center;">
                                            <asp:Label ID="lblNombreAgente" runat="server" Font-Bold="True" Font-Size="8pt" Width="106px"></asp:Label></td>
                                        <td style="font-weight: bold; font-size: 10px; width: 98px; height: 17px; text-align: center">
                                            <asp:Label ID="lblNombreJefe" runat="server" Font-Bold="True" Font-Size="8pt" Width="106px">LIC. MARCO GRIMALDO</asp:Label></td>
                                        <td style="width: 7px; height: 17px; text-align: center;">
                                            <asp:Label ID="lblNombreProveedor" runat="server" Font-Bold="True" Font-Size="6pt"
                                                Width="170px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 98px; text-align: center">
                                            <span style="font-size: 8pt">SOLICITO</span></td>
                                        <td style="width: 98px; text-align: center">
                                            <span style="font-size: 8pt">AUTORIZO</span></td>
                                        <td style="width: 7px; text-align: center">
                                            <span style="font-size: 8pt">PROVEEDOR</span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table border="1" style="width: 225px; height: 130px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 225px">
                                <table>
                                    <tr>
                                        <td>
                                            <span style="font-size: 9pt"><strong>Moneda:</strong></span></td>
                                        <td>
                                            <asp:Label ID="lblMoneda" runat="server" Font-Size="9pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
