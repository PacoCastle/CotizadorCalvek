<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cartaCambioAgente.aspx.cs" Inherits="Admin_Cartas_cartaCambioAgente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SICK - Reasignación de Clientes</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 650px">
            <tr>
                <td colspan="2" style="height: 19px">
                    <img src="../../Imagenes/LOGOCALVEK.gif" /></td>
                <td align="right" style="height: 19px; width: 336px;">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 19px">
                    <strong>ADMINISTRACION Y VENTAS</strong></td>
                    <td align="right" style="height: 19px; width: 336px;">
                   <strong>
                       <asp:Label ID="lblFecha" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label></strong>
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    <strong>CALVEK, SA DE CV</strong></td>
            </tr>
            <tr>
                <td width="335">
                    &nbsp;</td>
                <td width="50">
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 20px">
                    <span style="font-size: 11pt">Por este medio recibo y acepto el cliente: </span>
                    <asp:Label ID="lblcliente" runat="server" Font-Bold="True" Font-Size="11pt" Font-Names="Times New Roman"></asp:Label><span
                        style="font-size: 11pt">, con las condiciones que se describe a continuación.</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <strong><span style="font-size: 10pt">I<span style="font-size: 11pt">nformación de Cartera</span><br />
                    </span>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ObjectDataSource1" onRowDataBound="GridView1_RowDataBound"
                            Font-Size="10pt" Width="650px">
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <Columns>
                                <asp:TemplateField HeaderText="Folio Factura" SortExpression="Folio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Folio") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Folio") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha Facturaci&#243;n" SortExpression="Fecha">
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="diasTranscurridos" HeaderText="D&#237;as Transcurridos"
                                    SortExpression="diasTranscurridos">
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Moneda" HeaderText="Moneda" >
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Monto") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0.00}", Eval("Monto")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="agenteAnterior" HeaderText="Asesor Anterior" SortExpression="agenteAnterior" >
                                    <ItemStyle Width="120px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="unidadnegocio" HeaderText="unidadnegocio" SortExpression="unidadnegocio"
                                    Visible="False" />
                            </Columns>
                            <RowStyle ForeColor="Black" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" />
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoFacturas" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="MidnightBlue"
                                    Text="NO HAY FACTURAS" Width="413px"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_documentosCarteraTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="cliente" QueryStringField="codigoCliente" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </strong>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <strong>Información de Remisiones<br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ObjectDataSource2" onRowDataBound="GridView2_RowDataBound"
                            Font-Size="10pt" Width="650px" ForeColor="Black" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <Columns>
                                <asp:BoundField DataField="folio" HeaderText="Folio Remisi&#243;n" SortExpression="folio" >
                                    <ItemStyle HorizontalAlign="Center" ForeColor="Black" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fechaRemision" HeaderText="Fecha Remisi&#243;n" ReadOnly="True"
                                    SortExpression="fechaRemision">
                                    <ItemStyle HorizontalAlign="Center" ForeColor="Black" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="diasTrascurridos" HeaderText="D&#237;as Transcurridos"
                                    SortExpression="diasTrascurridos">
                                    <ItemStyle HorizontalAlign="Center" ForeColor="Black" Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" >
                                    <ItemStyle ForeColor="Black" HorizontalAlign="Center" Width="100px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Monto", "${0:#,##0.00}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" ForeColor="Black" Width="80px" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0.00}", Eval("Monto")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente" >
                                    <ItemStyle ForeColor="Black" Width="120px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="unidad_negocio" HeaderText="unidad_negocio" SortExpression="unidad_negocio"
                                    Visible="False" >
                                    <ItemStyle ForeColor="Black" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" />
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoRemisiones" runat="server" Font-Bold="True" Font-Size="12pt"
                                    ForeColor="MidnightBlue" Text="NO PRESENTA REMISIONES A LA FECHA DE CAMBIO" Width="413px"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_informacionRemisionesCartasTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="strCliente" QueryStringField="codigoCliente" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </strong>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <span style="font-size: 11pt">
                    POLITICAS: </span>
                    <ol>
                        <li><span style="font-size: 11pt">Las remisiones que presenten mas de 60 días serán cobradas al agente original y aquellas que en este periodo se logran facturar, deberán ser facturadas por el agente que logra la recuperación de las mismas.</span></li>
                        <li><span style="font-size: 11pt">Las facturas pendientes de cobro serán pagadas al agente de la venta origen, si es que no se han pagado con anticipación al mismo (despido, finiquito).</span></li>
                        <li><span style="font-size: 11pt">En la recuperación de la cartera vencida en caso de intervención del abogado externo, parte de sus honorarios serán descontados de las comisiones calculadas.</span></li>
                    </ol>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 19px">
                    <span style="font-size: 11pt">
                    Conozco y estoy al tanto de las condiciones del cliente que recibo a partir de esta
                    fecha.</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 336px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <strong><span style="font-size: 11pt">
                    A t e n t a m e n t e ,</span></strong></td>
                <td>
                    &nbsp;</td>
                <td align="center" style="width: 336px">
                    <strong><span style="font-size: 11pt">E n t r e g a</span></strong></td>
            </tr>
            <tr>
                <td align="center" style="vertical-align: bottom; height: 40px">
                    _________________</td>
                <td style="vertical-align: bottom; height: 40px">
                    &nbsp;</td>
                <td align="center" style="vertical-align: bottom; height: 40px; width: 336px;">
                    _________________</td>
            </tr>
            <tr>
                <td align="center" style="height: 38px">
                    <strong>
                        <asp:Label ID="lblAtencion" runat="server" Font-Bold="True" Font-Names="Times New Roman" Font-Size="11pt"></asp:Label><br />
                        <span style="font-size: 11pt">CALVEK
                            <asp:Label ID="lblUnidadNegocioAgente" runat="server" Font-Names="Times New Roman"
                                Font-Size="11pt"></asp:Label></span></strong></td>
                <td style="height: 38px">
                    &nbsp;</td>
                <td align="center" style="height: 38px; width: 336px;">
                    <strong>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource3">
                            <EditItemTemplate>
                                Agente:
                                <asp:TextBox ID="AgenteTextBox" runat="server" Text='<%# Bind("Agente") %>'>
                                </asp:TextBox><br />
                                Oficina:
                                <asp:TextBox ID="OficinaTextBox" runat="server" Text='<%# Bind("Oficina") %>'>
                                </asp:TextBox><br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update">
                                </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel">
                                </asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                Agente:
                                <asp:TextBox ID="AgenteTextBox" runat="server" Text='<%# Bind("Agente") %>'>
                                </asp:TextBox><br />
                                Oficina:
                                <asp:TextBox ID="OficinaTextBox" runat="server" Text='<%# Bind("Oficina") %>'>
                                </asp:TextBox><br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert">
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel">
                                </asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="AgenteLabel" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                                    Font-Size="11pt" Text='<%# Bind("Agente") %>'></asp:Label><br />
                                <span style="font-size: 11pt">CALVEK</span>
                                <asp:Label ID="OficinaLabel" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                                    Font-Size="11pt" Text='<%# Bind("Oficina") %>'></asp:Label><br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_agenteOficinaClienteCartaTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="strCodigoCliente" QueryStringField="codigoCliente"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </strong></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
