<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoDepositosPendientes.aspx.cs" Inherits="Cobranza_DepositosPendientes_listadoDepositosPendientes" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
            </td>
            <td style="text-align: center">
                <span style="font-size: 11pt"><strong>DEPOSITOS SIN IDENTIFICAR</strong></span></td>
            <td>
            </td>
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
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_listaDepositosSinIdentificarTableAdapter">
                </asp:ObjectDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ObjectDataSource1" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                    Width="613px">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="Id,depositosPendientesId" DataNavigateUrlFormatString="~/Cobranza/DepositosPendientes/FormularioDepositosPendientes.aspx?Id={0}&amp;pendienteId={1}"
                            DataTextField="Id" HeaderText="Id" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id,depositosPendientesId" DataNavigateUrlFormatString="~/Cobranza/DepositosPendientes/FormularioDepositosPendientes.aspx?Id={0}&amp;pendienteId={1}"
                            DataTextField="fecha" HeaderText="Fecha" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id,depositosPendientesId" DataNavigateUrlFormatString="~/Cobranza/DepositosPendientes/FormularioDepositosPendientes.aspx?Id={0}&amp;pendienteId={1}"
                            DataTextField="folio" HeaderText="Folio" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id,depositosPendientesId" DataNavigateUrlFormatString="~/Cobranza/DepositosPendientes/FormularioDepositosPendientes.aspx?Id={0}&amp;pendienteId={1}"
                            DataTextField="Monto" HeaderText="Monto" />
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
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
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

