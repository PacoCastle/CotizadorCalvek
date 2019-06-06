<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ventaEspecialCobranza.aspx.cs" Inherits="Cobranza_VentasEspecialesCobranza_ventaEspecialCobranza" Title="Administrador de Ventas Especiales" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .TestCssStyle {
            text-align: left;
            font-weight: bold;
            font-size: x-large;
            padding: 2px;
            background-color: silver;
            border-collapse: separate;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>

    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
    <contenttemplate>
            <table cellpadding="0" cellspacing="10" style="vertical-align: top; width: 100%; text-align: center;">
                            <tr>
                                <td colspan="2" style="height: 15px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="Consulta de Ventas Especiales"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td  style="text-align: left">
                                    <asp:Label ID="Label5" runat="server" Font-Size="10pt" Text="Año:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="lstYear" runat="server" AutoPostBack="True" DataSourceID="sdsYear" DataTextField="año" DataValueField="año" Font-Size="9pt" Width="100px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_obtiene_año_actual" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </td>                                                          
                                <td  style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Label ID="Label1" runat="server" Font-Size="10pt" Text="Mes:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="lstMes" runat="server" AutoPostBack="True"  DataSourceID="sdsMesDif" DataTextField="nombre" DataValueField="valor" Font-Size="9pt" Width="100px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsMesDif" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboMesDif" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </td>
                                <td style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                </table>
                <br />
                            <table style="width: 100%">
                              <tr style="text-align:center">
                                <td colspan="2">
                                    <asp:GridView ID="dgvVentasEspeciales" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsVentasEspeciales" EmptyDataText="No se encontraron resultados para la busqueda" 
                                        Font-Size="8pt" ForeColor="#333333" GridLines="None" onRowDataBound="gvDocDestino_RowDataBound" Width="100%">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                        <asp:TemplateField HeaderText="Agente" SortExpression="NB_AGENTE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("NB_AGENTE") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle Width="12px" />
                                        </asp:TemplateField>
                                            <%--<asp:BoundField DataField="NB_AGENTE" HeaderText="Agente" SortExpression="NB_AGENTE" />--%>
                                            <asp:BoundField DataField="CD_CLIENTE" HeaderText="Id Cliente" SortExpression="CD_CLIENTE" />
                                            <asp:BoundField DataField="NB_CLIENTE" HeaderText="Nombre Cliente" SortExpression="NB_CLIENTE" />
                                            <asp:BoundField DataField="NU_FOLIOFACT" HeaderText="Folio Factura" SortExpression="NU_FOLIOFACT" />
                                            <asp:BoundField DataField="NU_FOLIOCOB" HeaderText="Folio Cobro" SortExpression="NU_FOLIOCOB" />
                                            <asp:BoundField DataField="FH_COB" HeaderText="Fecha Cobro" SortExpression="FH_COB" />
                                            <asp:BoundField DataField="NU_MONTOCOB" HeaderText="Monto Cobro" SortExpression="NU_MONTOCOB" />                                 
                                            <asp:BoundField DataField="NU_COM" HeaderText="% Comisión" SortExpression="NU_COM" />
                                            <asp:BoundField DataField="NU_MONTOCOM" HeaderText="Monto Comisión" SortExpression="NU_MONTOCOM" />
                                            <asp:BoundField DataField="APAGAR" HeaderText="Monto a Pagar" SortExpression="APAGAR" />
                                            <asp:BoundField DataField="COMPORC" HeaderText="% a Modificar" SortExpression="COMPORC" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                <asp:SqlDataSource ID="sdsVentasEspeciales" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_ventasEspCobranza" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstYear" PropertyName="SelectedValue" DefaultValue="0" Name="FH_YEAR" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lstMes" PropertyName="SelectedValue" DefaultValue="0" Name="FH_MONTH" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                                </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
        </contenttemplate>
</asp:Content>
