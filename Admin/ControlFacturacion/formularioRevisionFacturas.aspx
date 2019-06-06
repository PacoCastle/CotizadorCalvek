<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioRevisionFacturas.aspx.cs" Inherits="Admin_ControlFacturacion_formularioRevisionFacturas" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 689px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="lblEtiquetaTitulo" runat="server" Font-Bold="True" Text="Revisión"></asp:Label></td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <table style="width: 315px">
                    <tr>
                        <td>
                            <asp:Label ID="lblEtiFolio" runat="server" Text="Folio:" Font-Size="9pt"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtFolio" runat="server" Font-Size="9pt"></asp:TextBox></td>
                        <td rowspan="4" style="width: 8px">
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                                BorderWidth="1px" Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="102px"
                                NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False"
                                Width="231px">
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                                    Font-Size="10pt" ForeColor="#333399" />
                            </asp:Calendar>
                            <table style="width: 100px">
                                <tr>
                                    <td>
                            <asp:Button ID="btnRepSinAcuse" runat="server" OnClick="btnRepSinAcuse_Click" Text="Folios sin acuse de Recibo" Font-Size="9pt" /></td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Button ID="btnVencidoFechaRev" runat="server" OnClick="btnVencidoFechaRev_Click"
                                Text="Folios por vencidos fecha Revisión" Font-Size="9pt" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                            <asp:Button ID="btnFoliosProgramados" runat="server" OnClick="btnFoliosProgramados_Click"
                                Text="Folios Programados" Font-Size="9pt" /><asp:Label ID="lblEtiSemana" runat="server"
                                    Font-Size="9pt" Text="Semana:" Visible="False"></asp:Label><asp:DropDownList ID="lstSemana"
                                        runat="server" AppendDataBoundItems="True" DataSourceID="odsSemanaAno" DataTextField="fechas"
                                        DataValueField="semana" Font-Size="9pt" Visible="False">
                                        <asp:ListItem Value="0"></asp:ListItem>
                                    </asp:DropDownList><asp:Button ID="btnConFolProg" runat="server" Font-Size="9pt"
                                        OnClick="btnConFolProg_Click" Text="Consultar" Visible="False" /><asp:ObjectDataSource
                                            ID="odsSemanaAno" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaSemanaAnoTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEtiFecha" runat="server" Text="Fecha:" Font-Size="9pt"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtFecha" runat="server" Font-Size="9pt"></asp:TextBox>
                            <asp:ImageButton ID="imgCalendario" runat="server" Height="21px" ImageUrl="~/Imagenes/10129.ico"
                                OnClick="imgCalendario_Click" ValidationGroup="nada" Width="23px" /><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server"
                                ControlToValidate="txtFecha" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="10pt"
                                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEtiCliente" runat="server" Text="Cliente:" Font-Size="9pt"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="lstClientes" runat="server" DataSourceID="ObjectDataSource2"
                                DataTextField="razonSocial" DataValueField="idClienteAdmin" Width="350px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblBanderaBusqueda" runat="server" Text="0" Visible="False"></asp:Label></td>
                        <td>
                            <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" Font-Size="9pt" /></td>
                    </tr>
                </table>
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                                <asp:SqlDataSource ID="sdsRevisionFactura" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    SelectCommand="get_listaFacturasPendientesRevision" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="UsuarioId" Type="Int32" DefaultValue="" />
                        <asp:ControlParameter ControlID="txtFolio" DefaultValue="0" Name="intFolio" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstClientes" DefaultValue=" " Name="strCliente"
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtFecha" DefaultValue=" " Name="strFechaFactura"
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lblBanderaBusqueda" DefaultValue="0" Name="intBandera"
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="lstSemana" DefaultValue="" Name="intSemana" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="IDKEPLER,folio,intControlFacturaId,sucursal" DataSourceID="sdsRevisionFactura"
                    Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowUpdating="Valida_check" AllowPaging="True" PageSize="25">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="oficina" HeaderText="oficina" ReadOnly="True" SortExpression="oficina" />
                        <asp:BoundField DataField="folio" HeaderText="folio Fact" ReadOnly="True" SortExpression="folio" />
                        <asp:BoundField DataField="fecha" HeaderText="fecha Fact" ReadOnly="True" SortExpression="fecha" />
                        <asp:BoundField DataField="semanafecha" HeaderText="Semana" SortExpression="semanafecha" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                        <asp:TemplateField HeaderText="Fecha Programada" SortExpression="strFechaProgramada">
                            <EditItemTemplate>
                                <asp:TextBox ID="strFechaProgramada" runat="server" Text='<%# Bind("strFechaProgramada") %>' Font-Size="8pt" MaxLength="10" Width="107px"></asp:TextBox><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="strFechaProgramada"
                                    ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="10pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"
                                    ValidationGroup="prueba"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("strFechaProgramada") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Firma Hoja Verde" SortExpression="strFirmaHojaVerde">
                            <EditItemTemplate>
                                <asp:CheckBox ID="intFirmaHojaVerde" runat="server" OnCheckedChanged="ckHojaVerde_CheckedChanged"
                                    Text="SI" Checked='<%# bool.Parse(Eval("intFirmaHojaVerde").ToString()) %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("strFirmaHojaVerde") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ImporteOrigen" DataFormatString="{0:N2}" HeaderText="Importe Origen"
                            ReadOnly="True" SortExpression="ImporteOrigen" />
                        <asp:BoundField DataField="moneda" HeaderText="Moneda Origen" ReadOnly="True" SortExpression="moneda" />
                        <asp:BoundField DataField="importePVentas" DataFormatString="{0:N2}" HeaderText="Importe Ventas"
                            ReadOnly="True" SortExpression="importePVentas" />
                        <asp:BoundField DataField="importePContabilidad" DataFormatString="{0:N2}" HeaderText="Importe Contabilidad"
                            ReadOnly="True" SortExpression="importePContabilidad" />
                        <asp:TemplateField HeaderText="Comentarios" SortExpression="strComentarios">
                            <EditItemTemplate>
                                <asp:TextBox ID="strComentarios" runat="server" Text='<%# Bind("strComentarios") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("strComentarios") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Revisi&#243;n">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" OnClick="Button1_Click" Text="Actualizar" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Editar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:DropDownList ID="lstEstatus" runat="server" OnSelectedIndexChanged="cambiaEstatus_click" DataSourceID="odsEstatusControlFact" DataTextField="estatusControlFactura" DataValueField="estatusControlFacturaId" SelectedValue='<%# Bind("estatusControlFacturaId") %>' Font-Size="8pt" >
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="odsEstatusControlFact" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="ControlFacturasTableAdapters.get_listaEstatusControlFacturaTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" Font-Size="8pt" />
                            </HeaderTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnGuardar2" runat="server" Font-Size="8pt" OnClick="btnGuardar2_Click"
                                    Text="Guardar" />
                            </FooterTemplate>
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
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblValorCheck" runat="server"></asp:Label></td>
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
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

