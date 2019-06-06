<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReporteVisitasVentas.aspx.cs" Inherits="VisitasVentas_ReporteVisitasVentas" Title="VISITA-REPORTE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 635px; height: 78px">
        <tr>
            <td style="width: 1px">
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" Text="BUSQUEDA VISITAS"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Empresa:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstEmpresa" runat="server" DataSourceID="odsCliente" DataTextField="razonSocial"
                    DataValueField="idClienteAdmin" Font-Size="9pt">
                </asp:DropDownList><asp:ObjectDataSource ID="odsCliente" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosSuperAgentTodosTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:ControlParameter ControlID="lblTipoUsuario" Name="intTipoConsulta" PropertyName="Text"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblTipoUsuario" runat="server" Font-Size="7pt" Visible="False"></asp:Label></td>
            <td align="left" rowspan="7" valign="top">
                <asp:Calendar ID="Calendar1" runat="server" Font-Size="7pt" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="lblEtiAgente" runat="server" Font-Size="9pt" Text="Agente:" Visible="False"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstAgente" runat="server" DataSourceID="odsAgentes" DataTextField="usuarioNombreCompleto_cotizacion"
                    DataValueField="usuarioId_cotizacion" Font-Size="9pt" AutoPostBack="True" OnSelectedIndexChanged="lstAgente_SelectedIndexChanged" Visible="False">
                </asp:DropDownList><asp:ObjectDataSource ID="odsAgentes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaAgentesVentaTableAdapter" EnableViewState="False">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblAgente" runat="server" Font-Size="8pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label5" runat="server" Font-Size="9pt" Text="Fecha De:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFechaDe" runat="server" Font-Size="9pt"></asp:TextBox><asp:ImageButton
                    ID="imgCalendario" runat="server" Height="19px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="imgCalendario_Click" ValidationGroup="nada" Width="21px" />&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="A:"></asp:Label>
                <asp:TextBox ID="txtFechaA" runat="server" Font-Size="9pt"></asp:TextBox><asp:ImageButton
                    ID="imgCalendario2" runat="server" Height="19px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="imgCalendario2_Click" ValidationGroup="nada" Width="21px" />
                <asp:Label ID="lblBandera" runat="server" Font-Size="7pt" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label10" runat="server" Font-Size="9pt" Text="Novedad:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstNovedad" runat="server" AppendDataBoundItems="True" DataSourceID="odsNovedad"
                    DataTextField="nombre" DataValueField="novedadVisitaId" Font-Size="9pt">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><br />
                <asp:ObjectDataSource ID="odsNovedad" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaNovedadVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label4" runat="server" Font-Size="9pt" Text="Tema Presentado:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstTemaPresentado" runat="server" AppendDataBoundItems="True"
                    DataSourceID="odsTemaPresentado" DataTextField="nombre" DataValueField="temaPresentadoId"
                    Font-Size="9pt">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="odsTemaPresentado" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaTemaPresentadoTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="Objetivo Visita:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstObjetivoVisita" runat="server" AppendDataBoundItems="True"
                    DataSourceID="odsObjetivo" DataTextField="nombre" DataValueField="objetivoVisitaId"
                    Font-Size="9pt">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="odsObjetivo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaObjetivoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label8" runat="server" Font-Size="9pt" Text="Siguiente Paso:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstSiguentePaso" runat="server" AppendDataBoundItems="True"
                    DataSourceID="odsSiguientePaso" DataTextField="nombre" DataValueField="siguientePasoId"
                    Font-Size="9pt">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="odsSiguientePaso" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaSiguientePasoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
                <asp:Label ID="Label9" runat="server" Font-Size="9pt" Text="Solicitud Apoyo:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstSolicitudApoyo" runat="server" DataSourceID="odsSolicitudApoyo"
                    DataTextField="nombre" DataValueField="solicitudApoyoId" Font-Size="9pt" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="odsSolicitudApoyo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaSolicitudApoyoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="UsuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td style="width: 1px; height: 13px;">
                <asp:Button ID="btnExcel" runat="server" OnClick="btnExcel_Click" Text="Generar Excel" Visible="False" BorderStyle="Solid" BorderWidth="1px" Font-Size="10pt" />
                <asp:HyperLink ID="hlnkArchivoReporte" runat="server" Font-Size="9pt" Visible="False">Guardar Archivo</asp:HyperLink></td>
            <td style="height: 13px">
                <asp:Button ID="btnContinuar" runat="server" Text="Continuar" OnClick="btnContinuar_Click" BorderStyle="Solid" BorderWidth="1px" Font-Size="10pt" />
                <asp:Label ID="lblBanderaBoton" runat="server" Font-Size="7pt" Text="1" Visible="False"></asp:Label></td>
            <td style="height: 13px">
                </td>
        </tr>
        <tr>
            <td style="width: 1px;">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odsBuscaVisitasVentas" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                    Width="901px" Visible="False" OnRowCreated="GridView1_RowCreated">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="visitaVentasId" HeaderText="Id" InsertVisible="False"
                            ReadOnly="True" SortExpression="visitaVentasId" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" ReadOnly="True" SortExpression="Cliente">
                            <ItemStyle Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaVisita" HeaderText="Fecha" SortExpression="fechaVisita" />
                        <asp:BoundField DataField="Novedad" HeaderText="Novedad" ReadOnly="True" SortExpression="Novedad" />
                        <asp:BoundField DataField="Tema" HeaderText="Tema" ReadOnly="True" SortExpression="Tema" />
                        <asp:BoundField DataField="Objetivo" HeaderText="Objetivo" ReadOnly="True" SortExpression="Objetivo" />
                        <asp:BoundField DataField="comentarios" HeaderText="Comentarios" SortExpression="comentarios" />
                        <asp:BoundField DataField="siguientePaso" HeaderText="Sig. Paso" ReadOnly="True"
                            SortExpression="siguientePaso" />
                        <asp:BoundField DataField="solicitudApoyo" HeaderText="Sol. Apoyo" ReadOnly="True"
                            SortExpression="solicitudApoyo" />
                        <asp:BoundField DataField="temaApoyo" HeaderText="Tema Apoyo" SortExpression="temaApoyo" />
                        <asp:BoundField DataField="EstatusActual" HeaderText="Estatus Actual" ReadOnly="True"
                            SortExpression="EstatusActual" />
                        <asp:BoundField DataField="Venta" HeaderText="Venta" ReadOnly="True" SortExpression="Venta" />
                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
                        <asp:BoundField DataField="contacto" HeaderText="Contacto" SortExpression="contacto" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsBuscaVisitasVentas" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="visitasVentasTableAdapters.get_buscaVisitasVentasTableAdapter" EnableViewState="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstEmpresa" DefaultValue="" Name="intClienteId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lblAgente" DefaultValue="0" Name="intUsuarioId"
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFechaDe" DefaultValue=" " Name="strFechaDe" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="txtFechaA" DefaultValue=" " Name="strFechaA" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="lstNovedad" DefaultValue="0" Name="intNovedadVisitaId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lstTemaPresentado" DefaultValue="0" Name="intTemaPresentadoId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lstObjetivoVisita" DefaultValue="" Name="intObjetivoVisitaId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lstSiguentePaso" DefaultValue="0" Name="intSiguientePasoId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lstSolicitudApoyo" DefaultValue="0" Name="intSolicitudApoyoId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:SessionParameter DefaultValue="0" Name="intUsuarioIdConsulta" SessionField="usuarioId"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 1px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

