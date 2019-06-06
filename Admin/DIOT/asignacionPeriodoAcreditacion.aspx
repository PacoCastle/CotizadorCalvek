<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="asignacionPeriodoAcreditacion.aspx.cs" Inherits="Admin_DIOT_asignacionPeriodoAcreditacion2" Title="Reporte DIOT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 900px">
        <tr>
            <td colspan="4" style="text-align: left;">
                <span style="font-size: 12pt; font-family: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman';
                    mso-ansi-language: ES-MX; mso-fareast-language: ES; mso-bidi-language: AR-SA"><strong>
                        Asignación de periodo de acreditamiento</strong></span></td>
        </tr>
        <tr style="font-family: Verdana">
            <td align="left" colspan="4" style="color: #000000; text-align: left">
                <asp:RadioButtonList ID="txtrazonsocial" runat="server" Font-Names="Tahoma" Font-Size="10pt" RepeatDirection="Horizontal" AutoPostBack="True" BorderStyle="None" CellSpacing="10" EnableTheming="True" ForeColor="Black" OnSelectedIndexChanged="txtrazonsocial_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="CSA">Calvek Sa</asp:ListItem>
                    <asp:ListItem Value="CCC">Calvek del Centro</asp:ListItem>
                    <asp:ListItem Value="CBJ">Calvek Bajio</asp:ListItem>
                </asp:RadioButtonList><br />
                <table cellpadding="0" cellspacing="0" style="width: 329px; height: 134px; text-align: left">
                    <tr>
                        <td align="left" style="width: 62px; height: 5px" valign="top">
                            <span style="font-size: 10pt">Año:</span></td>
                        <td align="left" style="width: 96px; height: 5px" valign="top">
                <asp:TextBox ID="txtAno" runat="server" MaxLength="4" Width="51px" Font-Size="9pt">2013</asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAno"
                    Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAno"
                    ErrorMessage="Valor no valido" ValidationExpression="\d{4}" Display="Dynamic" Font-Size="7pt" ValidationGroup="validaCaptura"></asp:RegularExpressionValidator></td>
                        <td align="left" style="width: 65px; height: 5px" valign="top">
                            <span style="font-size: 10pt">Mes:</span></td>
                        <td align="left" style="width: 94px; height: 5px" valign="top">
                            <asp:DropDownList ID="lstMes" runat="server" DataSourceID="odsMeses" DataTextField="Texto"
                    DataValueField="mesId" Font-Size="9pt" OnSelectedIndexChanged="lstMes_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstMes"
                    Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt" InitialValue="0"
                    ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 62px; height: 5px" valign="top">
                            <span style="font-size: 10pt">
                Cuenta:</span></td>
                        <td align="left" style="width: 96px; height: 5px" valign="top">
                <asp:TextBox ID="txtCuenta" runat="server" Font-Size="9pt" MaxLength="15" Width="69px">101-01</asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCuenta"
                    Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtCuenta"
                    Display="Dynamic" ErrorMessage="Formato no valido." Font-Size="7pt" ValidationExpression="^101-0(1|2)([-][0-9]{0,3})?([-][0-9]{0,3})?$"
                    ValidationGroup="validaCaptura"></asp:RegularExpressionValidator></td>
                        <td style="width: 65px; height: 5px" valign="top">
                            <span style="font-size: 10pt; color: #666666">Proveedor:</span></td>
                        <td style="width: 94px; height: 5px" valign="top"><asp:DropDownList ID="lstProveedorReporte" runat="server" DataSourceID="odsProveedores" DataTextField="descripcion"
                    DataValueField="clave" Font-Size="9pt">
                        </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 62px; height: 5px" valign="top">
                            <span style="font-size: 10pt">Num. Ini:</span></td>
                        <td align="left" style="width: 96px; height: 5px" valign="top">
                            <asp:TextBox ID="txtNumIni" runat="server" Font-Size="9pt" MaxLength="3" Width="58px">1</asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNumIni"
                    Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNumIni"
                    Display="Dynamic" ErrorMessage="Valor no valido" Font-Size="7pt" ValidationExpression="\d{1,3}"
                    ValidationGroup="validaCaptura"></asp:RegularExpressionValidator></td>
                        <td align="left" style="width: 65px; height: 5px" valign="top">
                            <span style="font-size: 10pt">Num. Fin:</span></td>
                        <td align="left" style="width: 94px; height: 5px" valign="top">
                            <asp:TextBox ID="txtNumFin" runat="server" Font-Size="9pt" MaxLength="3" Width="58px">10</asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNumFin"
                    Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNumFin"
                    Display="Dynamic" ErrorMessage="Valor no valido" Font-Size="7pt" ValidationExpression="\d{1,3}"
                    ValidationGroup="validaCaptura"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td align="right" colspan="4" style="height: 5px; text-align: right">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" ValidationGroup="validaCaptura" BorderStyle="None" BorderWidth="1px" OnClick="btnBuscar_Click" />
                            <asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
                </asp:ObjectDataSource><asp:ObjectDataSource ID="odsProveedores" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DIOTTableAdapters.get_proveedoresDiotTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstMes" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" DefaultValue="" />
                        <asp:ControlParameter ControlID="txtAno" Name="intAno" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtrazonsocial" Name="razon" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                <span style="font-size: 10pt">&nbsp;</span></td>
        </tr>
        <tr style="font-family: Verdana">
            <td style="height: 20px; width: 172px;">
                <span style="font-size: 10pt">
                    <asp:Label ID="lblEtiDetalle" runat="server" Font-Bold="True" Font-Size="11pt" Text="Detalle:"
                        Visible="False"></asp:Label></span></td>
            <td style="height: 20px; width: 57px;">
            </td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr style="font-family: Verdana">
            <td colspan="4" style="height: 7px">
                <asp:GridView ID="gvPolizas" runat="server" CellPadding="4" Font-Size="8pt" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="sucursal,Fecha,Poliza,Cuenta,claveProveedor,Documento,TipoPoliza" DataSourceID="sdsPolizasDiot" AllowPaging="True" Visible="False" onrowcommand="gvPolizas_rowCommand" onRowDataBound="gvPolizas_RowDataBound" PageSize="50" Width="1079px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbPoliza" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Poliza" SortExpression="Poliza">
                            <EditItemTemplate>
                                <asp:Label ID="lblTmpSucursal" runat="server" Text='<%# Bind("sucursal") %>' Visible="False"></asp:Label><br />
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 70px">
                                <asp:Label ID="lblPoliza" runat="server" Text='<%# Bind("Poliza") %>'></asp:Label></td>
                                        <td style="width: 70px">
                                <asp:Label ID="lbltmpCuenta" runat="server" Text='<%# Bind("Cuenta") %>'></asp:Label></td>
                                        <td style="width: 80px">
                                            <asp:Label ID="lblTmpFecha" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label></td>
                                        <td style="width: 110px">
                                            <asp:Label ID="lblTmpClaveProveedor" runat="server" Text='<%# Bind("claveProveedor") %>'></asp:Label></td>
                                        <td style="width: 445px">
                                            <asp:Label ID="lblTmpNombreProv" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label></td>
                                        <td style="width: 80px">
                                            <asp:Label ID="lblTmpImporte" runat="server" Text='<%# Bind("Importe") %>'></asp:Label></td>
                                        <td style="width: 80px">
                                            <asp:Label ID="lblTmpEjercicio" runat="server" Text='<%# Bind("Ejercicio") %>'></asp:Label></td>
                                        <td style="width: 80px">
                                            <asp:Label ID="lblTmpPeriodo" runat="server" Text='<%# Bind("Periodo") %>'></asp:Label></td>
                                        <td style="width: 80px">
                                <asp:Label ID="lblTmpTipoPoliza" runat="server" Text='<%# Bind("TipoPoliza") %>'></asp:Label></td>
                                        <td style="width: 100px">
                                            <asp:Label ID="lblTmpDocumento" runat="server" Text='<%# Bind("Documento") %>'></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblTmpTipoDocumento" runat="server" Text='<%# Bind("TipoDocumento") %>'></asp:Label></td>
                                    </tr>
                                </table>
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Folio,ivaRetenidoProv,isrRetenidoProv" ForeColor="Black" GridLines="Horizontal" Width="100%" onrowcommand="GridView1_rowCommand">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="btnEliMov" runat="server" CausesValidation="False" CommandName="Delete" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                    Font-Bold="True" Font-Size="7pt" ForeColor="#C00000" Text="X" BorderStyle="None" BorderWidth="1px" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Folio" HeaderText="Folio" InsertVisible="False" ReadOnly="True"
                                            SortExpression="Folio" >
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="claveProveedor" HeaderText="Proveedor" SortExpression="claveProveedor" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="Tasa" SortExpression="Tasa">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Tasa") %>' Visible="False"></asp:Label><asp:Label ID="lblProveedor" runat="server" Text='<%# Eval("claveProveedor") %>' Visible="False"></asp:Label><asp:ObjectDataSource ID="odsPorcentajeIva" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_listaPorcetajeIvaTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblProveedor" Name="strProveedor" PropertyName="Text"
                                                                Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                                <asp:DropDownList ID="Tasa" runat="server" AppendDataBoundItems="True"
                                                        DataSourceID="odsPorcentajeIva" DataTextField="descripcion" DataValueField="porcentaje" Font-Size="8pt" SelectedValue='<%# Eval("Tasa") %>'>
                                                    <asp:ListItem Value="0">-</asp:ListItem>
                                                </asp:DropDownList><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                                    ControlToValidate="Tasa" Display="Dynamic" ErrorMessage="campo Requerido"
                                                    Font-Size="7pt" InitialValue="0" ValidationGroup="agregaMovimiento"></asp:RequiredFieldValidator>
                                                &nbsp;
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Tasa") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Importe" SortExpression="Importe">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="Importe" runat="server" Width="57px" Text='<%# Bind("Importe") %>' Font-Size="8pt"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Importe","{0:#,##0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImporteBase" HeaderText="Importe Base" ReadOnly="True"
                                            SortExpression="ImporteBase" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ImporteIva" HeaderText="Importe Iva" ReadOnly="True" SortExpression="ImporteIva" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Otras Erogaciones" SortExpression="OtrasErogaciones">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="otrasErogaciones" runat="server" Text='<%# Bind("OtrasErogaciones") %>'
                                                    Width="60px" Font-Size="8pt"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="otrasErogaciones" runat="server" Width="77px" Font-Size="8pt"></asp:TextBox>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("OtrasErogaciones","{0:#,##0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImporteAntesRetensiones" HeaderText="Importe a/Retensiones"
                                            ReadOnly="True" SortExpression="ImporteAntesRetensiones" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IvaRetenido" HeaderText="Iva Retenido" ReadOnly="True"
                                            SortExpression="IvaRetenido" DataFormatString="{0:#,##0.00}" NullDisplayText="0" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IsrRetenido" HeaderText="Isr Retenido" ReadOnly="True"
                                            SortExpression="IsrRetenido" DataFormatString="{0:#,##0.00}" NullDisplayText="0" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="totalErogacion" HeaderText="Total Erogaci&#243;n" ReadOnly="True"
                                            SortExpression="totalErogacion" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:Button ID="btnActMov" runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="True"
                                                    CommandName="Update" Font-Size="8pt" Text="Actualizar"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;<asp:Button ID="btnCanMov"
                                                        runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="False"
                                                        CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="False"
                                                    CommandName="Insert" Font-Size="8pt" Text="Agregar" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="btnMofiMov" runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="False"
                                                    CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" BackColor="#ff9900" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Folio,ivaRetenidoProv,isrRetenidoProv" ForeColor="Black" GridLines="Horizontal" Width="100%" onrowcommand="GridView1_rowCommand">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False" >
                                            <ItemTemplate>
                                                 <asp:Label ID="Label1" runat="server" Width="145px"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>                                      
                                        <asp:TemplateField HeaderText="Total Importe" SortExpression="Importe">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="Importe" runat="server" Width="57px" Text='<%# Bind("Importe") %>' Font-Size="8pt"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Importe","{0:#,##0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImporteBase" HeaderText="Total Importe Base" ReadOnly="True"
                                            SortExpression="ImporteBase" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ImporteIva" HeaderText="Total Importe Iva" ReadOnly="True" SortExpression="ImporteIva" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Total Otras Erogaciones" SortExpression=" Total Otras Erogaciones">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="otrasErogaciones" runat="server" Text='<%# Bind("OtrasErogaciones") %>'
                                                    Width="60px" Font-Size="8pt"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="otrasErogaciones" runat="server" Width="77px" Font-Size="8pt"></asp:TextBox>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("OtrasErogaciones","{0:#,##0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImporteAntesRetensiones" HeaderText="Total Importe a/Retensiones"
                                            ReadOnly="True" SortExpression="ImporteAntesRetensiones" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IvaRetenido" HeaderText="Total Iva Retenido" ReadOnly="True"
                                            SortExpression="IvaRetenido" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IsrRetenido" HeaderText="Total Isr Retenido" ReadOnly="True"
                                            SortExpression="IsrRetenido" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="totalErogacion" HeaderText="Total Erogaci&#243;n" ReadOnly="True"
                                            SortExpression="totalErogacion" DataFormatString="{0:#,##0.00}" >
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False" >
                                            <ItemTemplate>
                                                 <asp:Label ID="Label1" runat="server" Width="60px"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>                                    
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                                    SelectCommand="get_movimientosPolizaDIOT" SelectCommandType="StoredProcedure" InsertCommand="set_insertaMovimientoPolizaDIOT" InsertCommandType="StoredProcedure" UpdateCommand="set_actualizaMovimientoPolizaDIOT"  UpdateCommandType="StoredProcedure" DeleteCommand="delete from movimientoPolizaDIOT &#13;&#10;where  movimientoPolizaId = @Folio">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblPoliza" Name="intPoliza" PropertyName="Text"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="lbltmpCuenta" Name="strCuenta" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpTipoPoliza" Name="strTipoPoliza" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpDocumento" Name="strDocumento" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpClaveProveedor" Name="strclaveProveedor" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpSucursal" Name="strSucursal" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Folio" />
                                        <asp:Parameter Name="Importe" Type="Double" DefaultValue="0" />
                                        <asp:Parameter Name="otrasErogaciones" />
                                        <asp:Parameter Name="Tasa" Type="Double" />
                                        <asp:Parameter Name="ivaRetenidoProv" Type="Double" />
                                        <asp:Parameter Name="isrRetenidoProv" Type="Double" />
                                        <asp:SessionParameter Name="usuarioId" SessionField="usuarioId" />
                                        <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="resultado" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="lblPoliza" DefaultValue="" Name="Poliza" PropertyName="Text"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="lbltmpCuenta" Name="Cuenta" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpTipoPoliza" Name="TipoPoliza" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpDocumento" Name="Documento" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpClaveProveedor" Name="claveProveedor" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpSucursal" Name="sucursal" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpImporte" Name="Importe" PropertyName="Text"
                                            Type="Double" />
                                        <asp:Parameter Name="Tasa" Type="Double" />
                                        <asp:Parameter Name="IVAretenidoOri" Type="Double" />
                                        <asp:Parameter Name="ISRretenidoOri" Type="Double" />
                                        <asp:Parameter Name="otrasErogaciones" Type="Double" />
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                        <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="resultado" Type="Int32" />
                                    </InsertParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="Folio" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                                    SelectCommand="get_movimientosPolizaDIOTTotales" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblPoliza" Name="intPoliza" PropertyName="Text"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="lbltmpCuenta" Name="strCuenta" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpTipoPoliza" Name="strTipoPoliza" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpDocumento" Name="strDocumento" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpClaveProveedor" Name="strclaveProveedor" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="lblTmpSucursal" Name="strSucursal" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>                                   
                                </asp:SqlDataSource>
                                        <table style="width: 100%; color: white; background-color: #336699" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top" style="width: 1461px; height: 16px; background-color: #808f9d">
                                                    <strong>
                                                        </strong></td>
                                                <td style="width: 493px; height: 16px; background-color: #808f9d" valign="top">
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="9pt" Text="Proveedor"></asp:Label></td>
                                                <td valign="top" style="height: 16px; background-color: #808f9d; width: 55px;">
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="Tasa" Font-Size="9pt"></asp:Label></strong></td>
                                                <td valign="top" style="width: 89px; height: 16px; background-color: #808f9d">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="Importe" Font-Size="9pt"></asp:Label></strong></td>
                                                <td valign="top" style="width: 128px; height: 16px; background-color: #808f9d">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="Otras Erogaciones" Font-Size="9pt" Width="124px"></asp:Label></strong></td>
                                                <td style="width: 79px; height: 16px; background-color: #808f9d" valign="top">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 1461px; background-color: #f4edfc">
                                                    <strong><span style="color: black">MOVIMIENTO</span></strong></td>
                                                <td style="width: 493px; background-color: #f4edfc">
                                                    <asp:ObjectDataSource ID="odsProveedores" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetData" TypeName="DIOTTableAdapters.get_proveedoresDIOT_allTableAdapter">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="txtrazonsocial" Name="razon" PropertyName="SelectedValue"
                                                                Type="String" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <asp:DropDownList ID="lstProveedores" runat="server" AppendDataBoundItems="True"
                                                        AutoPostBack="True" DataSourceID="odsProveedores" DataTextField="descripcionProveedor"
                                                        DataValueField="claveProveedor" Font-Size="8pt" OnSelectedIndexChanged="lstProveedores_SelectedIndexChanged">
                                                        <asp:ListItem Value="0">-</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="lstProveedores"
                                                        Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt" InitialValue="0"
                                                        ValidationGroup="agregaMovimiento"></asp:RequiredFieldValidator></td>
                                                <td style="background-color: #f4edfc; width: 128px;">
                                                    <asp:ObjectDataSource ID="odsPorcentajeIva" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetData" TypeName="DIOTTableAdapters.get_listaPorcetajeIva_DIOTTableAdapter">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lstProveedores" Name="strProveedor" PropertyName="SelectedValue"
                                                                Type="String" />
                                                            <asp:ControlParameter ControlID="txtrazonsocial" Name="razon" PropertyName="SelectedValue"
                                                                Type="String" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <asp:DropDownList ID="lstPorcentajeIva" runat="server" AppendDataBoundItems="True"
                                                        DataSourceID="odsPorcentajeIva" DataTextField="descripcion" DataValueField="porcentaje" Font-Size="8pt">
                                                        <asp:ListItem Value="-5">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="lstPorcentajeIva"
                                                        Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt" InitialValue="-5"
                                                        ValidationGroup="agregaMovimiento"></asp:RequiredFieldValidator></td>
                                                <td style="width: 128px; background-color: #f4edfc">
                                                    <asp:TextBox ID="Importe" runat="server" ForeColor="Black" OnTextChanged="TextBox1_TextChanged" Width="70px" Font-Size="8pt"></asp:TextBox><br />
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Importe"
                                                        Display="Dynamic" ErrorMessage="Valor numérico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"
                                                        ValidationGroup="agregaMovimiento"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator2" runat="server" ControlToValidate="Importe" Display="Dynamic"
                                                            ErrorMessage="campo Requerido" Font-Size="7pt" ValidationGroup="agregaMovimiento"></asp:RequiredFieldValidator></td>
                                                <td style="width: 128px; background-color: #f4edfc">
                                            <asp:TextBox ID="otrasErogaciones" runat="server" OnTextChanged="TextBox1_TextChanged" Width="70px" ForeColor="Black" Font-Size="8pt"></asp:TextBox><br />
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="otrasErogaciones"
                                                        Display="Dynamic" ErrorMessage="Valor numérico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"
                                                        ValidationGroup="agregaMovimiento"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="otrasErogaciones"
                                                        Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt" ValidationGroup="agregaMovimiento"></asp:RequiredFieldValidator></td>
                                                <td style="width: 79px; background-color: #f4edfc" align="right">
                                                    <asp:Button ID="btnAgregar" runat="server" BorderStyle="None" BorderWidth="1px" Font-Size="8pt"
                                                        Text="Agregar" CommandName="Insert" ValidationGroup="agregaMovimiento" /></td>
                                            </tr>
                                        </table>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Poliza") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cuenta" SortExpression="Cuenta">
                            <ItemTemplate>
                                <asp:Label ID="Label23" runat="server" Text='<%# Bind("Cuenta") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha" SortExpression="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="Label33" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clave Proveedor" SortExpression="claveProveedor">
                            <ItemTemplate>
                                <asp:Label ID="Label43" runat="server" Text='<%# Bind("claveProveedor") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="Label53" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="300px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Importe" SortExpression="Importe">
                            <ItemTemplate>
                                <asp:Label ID="Label63" runat="server" Text='<%# Bind("Importe", "{0:#,##0.00}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ejercicio" SortExpression="Ejercicio">
                            <ItemTemplate>
                                <asp:Label ID="Label73" runat="server" Text='<%# Bind("Ejercicio") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Periodo" SortExpression="Periodo">
                            <ItemTemplate>
                                <asp:Label ID="Label83" runat="server" Text='<%# Bind("Periodo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo Poliza" SortExpression="TipoPoliza">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("TipoPoliza") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Documento" SortExpression="Documento">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Documento") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo Documento" SortExpression="TipoDocumento">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("TipoDocumento") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="btnCancelar" runat="server" BorderStyle="None" BorderWidth="1px"
                                    CommandName="Cancel" Font-Size="8pt" Text="Cerrar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderWidth="1px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="8pt" Text="Asignar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsPolizasDiot" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_busquedaPolizasDIOT" SelectCommandType="StoredProcedure" InsertCommand="set_insertaMovimientoPolizaDIOT" InsertCommandType="StoredProcedure" UpdateCommand="set_insertaMovimientoPolizaDIOT" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtAno" Name="intAno" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtCuenta" Name="strCuenta" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="lstProveedorReporte" Name="strProveedor" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtNumIni" Name="intNumInt" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtNumFin" Name="intNumFin" PropertyName="Text"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:ControlParameter ControlID="txtrazonsocial" Name="razon" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="Poliza" Type="Int32" />
                        <asp:Parameter Name="Cuenta" Type="String" />
                        <asp:Parameter Name="TipoPoliza" Type="String" />
                        <asp:Parameter Name="Documento" Type="String" />
                        <asp:Parameter Name="claveProveedor" Type="String" />
                        <asp:Parameter Name="sucursal" Type="String" />
                        <asp:Parameter Name="Importe" Type="Double" />
                        <asp:Parameter Name="Tasa" Type="Double" />
                        <asp:Parameter Name="otrasErogaciones" Type="Double" />
                        <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                            Type="Int32" />
                        <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="resultado" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Poliza" Type="Int32" />
                        <asp:Parameter Name="Cuenta" Type="String" />
                        <asp:Parameter Name="TipoPoliza" Type="String" />
                        <asp:Parameter Name="Documento" Type="String" />
                        <asp:Parameter Name="claveProveedor" Type="String" />
                        <asp:Parameter Name="sucursal" Type="String" />
                        <asp:Parameter Name="Importe" Type="Double" />
                        <asp:Parameter Name="Tasa" Type="Double" />
                        <asp:Parameter Name="otrasErogaciones" Type="Double" />
                        <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                            Type="Int32" />
                        <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="resultado" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr style="font-family: Verdana">
            <td style="width: 172px;">
                <asp:Label ID="lblMensaje" runat="server" Font-Size="9pt" ForeColor="#CC0000"></asp:Label><br />
                <asp:Label ID="lblMensajeEx" runat="server" Font-Size="9pt" ForeColor="#0000C0"></asp:Label><br />
            </td>
            <td colspan="2">
                </td>
            <td>
            </td>
        </tr>
        <tr style="font-family: Verdana">
            <td style="height: 1px" colspan="4">
                <span style="font-size: 10pt; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: ES-MX;
                    mso-fareast-language: ES; mso-bidi-language: AR-SA"><asp:Panel ID="panelAplica"
                        runat="server" Height="150px" Visible="False" Width="250px">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 224px; height: 134px;">
                            <tr>
                                <td colspan="2" style="height: 21px">
                                    <asp:Label ID="lblEtiqueta" runat="server" Text="Periodo de acreditamiento:" Font-Bold="True" Width="241px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td valign="top" style="height: 9px">
                                    Año:</td>
                                <td style="width: 232px; height: 9px;" valign="top">
                                    <asp:TextBox ID="txtAnoAcreditacion" runat="server"
                    Font-Size="9pt" MaxLength="4" Width="51px" ValidationGroup="AplicaPeriodo"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAnoAcreditacion"
                                        Display="Dynamic" ErrorMessage="El año es requerido." Font-Size="7pt" ValidationGroup="AplicaPeriodo"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td valign="top" style="height: 5px">
                                    Mes:</td>
                                <td style="width: 232px; height: 5px;" valign="top">
                                    <asp:DropDownList ID="lstMesAcreditacion" runat="server" DataSourceID="odsMesesAcreditacion" DataTextField="Texto"
                    DataValueField="mesId" Font-Size="9pt" ValidationGroup="AplicaPeriodo">
                    </asp:DropDownList>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtAnoAcreditacion"
                                        Display="Dynamic" ErrorMessage="Año no valido." Font-Size="7pt" ValidationExpression="\d{4}"
                                        ValidationGroup="AplicaPeriodo"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator7" runat="server" ControlToValidate="lstMesAcreditacion"
                                            ErrorMessage="El mes es requerido." Font-Size="7pt" InitialValue="0" ValidationGroup="AplicaPeriodo"></asp:RequiredFieldValidator><asp:ObjectDataSource ID="odsMesesAcreditacion" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 28px" valign="middle">
                                </td>
                                <td style="width: 232px; height: 28px" valign="middle">
                <asp:Button ID="btnAplicaPeriodo" runat="server" OnClick="btnAplicaPeriodo_Click"
                    Text="Aplica Periodo" BorderStyle="None" BorderWidth="1px" Font-Size="9pt" ValidationGroup="AplicaPeriodo" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </span>
            </td>
        </tr>
        <tr style="font-family: Verdana">
            <td style="width: 172px;">
            </td>
            <td style="width: 57px;">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

