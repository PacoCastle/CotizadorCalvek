<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoVisitas.aspx.cs" Inherits="VisitasVentas_listadoVisitas" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 777px">
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblUsuario" runat="server" Font-Bold="False" Font-Size="7pt"></asp:Label>&nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="VISITAS"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblEtiquetaAgentes" runat="server" Text="Agente:" Visible="False"></asp:Label>
                <asp:DropDownList ID="lstAgentes" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2"
                    DataTextField="usuarioNombreCompleto_cotizacion" DataValueField="usuarioId_cotizacion"
                    OnSelectedIndexChanged="lstAgentes_SelectedIndexChanged" Visible="False">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" EnableViewState="False"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaAgentesVentaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 126px">
            </td>
            <td style="height: 126px">
                <asp:SqlDataSource ID="sdsListadoVisitasSeguimiento" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="set_borrarVisitaVentas" DeleteCommandType="StoredProcedure" SelectCommand="get_listadoVisitasSbVenta"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblUsuario" Name="intUsuarioIdVisita" PropertyName="Text"
                            Type="Int32" />
                        <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                            Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intBanderaSeguimiento" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:ControlParameter ControlID="GridView2" Name="visitaVentasId" PropertyName="SelectedValue"
                            Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdsListadoVisitasSeguimiento" Font-Size="8pt" ForeColor="#333333" GridLines="None"
                    Width="761px" AllowPaging="True" BackColor="LightBlue" BorderColor="Black" Caption="EN SEGUIMIENTO" PageIndex="5" DataKeyNames="visitaVentasId">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" CausesValidation="False"
                                    CommandName="Delete" Font-Bold="True" Font-Size="9pt" ForeColor="Red" Text="X"
                                    ToolTip="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="visitaVentasId" HeaderText="ID" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="fechaVisita" HeaderText="Fecha" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Usuario" HeaderText="Usuario" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Cliente" HeaderText="Cliente" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Novedad" HeaderText="Novedad" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Objetivo" HeaderText="Objetivo" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Tema" HeaderText="Tema" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="EstatusActual" HeaderText="Estatus Act" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="observaciones" HeaderText="Observaciones" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
            <td style="height: 126px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:SqlDataSource ID="sdsListadoVisitas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="set_borrarVisitaVentas" DeleteCommandType="StoredProcedure" SelectCommand="get_listadoVisitasSbVenta"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblUsuario" Name="intUsuarioIdVisita" PropertyName="Text"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="intBanderaSeguimiento" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:ControlParameter ControlID="GridView1" Name="visitaVentasId" PropertyName="SelectedValue"
                            Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdsListadoVisitas" Font-Size="8pt" ForeColor="#333333" GridLines="None"
                    Width="761px" AllowPaging="True" PageSize="30" RowHeaderColumn="ID" AllowSorting="True" DataKeyNames="visitaVentasId">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" CausesValidation="False"
                                    CommandName="Delete" Font-Bold="True" Font-Size="9pt" ForeColor="Red" Text="X" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="visitaVentasId" HeaderText="ID" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="fechaVisita" HeaderText="Fecha" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Usuario" HeaderText="Usuario" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Cliente" HeaderText="Cliente" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Novedad" HeaderText="Novedad" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Objetivo" HeaderText="Objetivo" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="Tema" HeaderText="Tema" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="EstatusActual" HeaderText="Estatus Act" />
                        <asp:HyperLinkField DataNavigateUrlFields="visitaVentasId" DataNavigateUrlFormatString="~/VisitasVentas/FormularioVisita.aspx?visitaId={0}"
                            DataTextField="observaciones" HeaderText="Observaciones" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
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
    </table>
</asp:Content>

