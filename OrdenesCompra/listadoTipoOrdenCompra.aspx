<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoTipoOrdenCompra.aspx.cs" Inherits="OrdenesCompra_reporteTipoOrdenCompra" Title="Reporte OC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 659px">
        <tr>
            <td colspan="1" style="text-align: center">
                <asp:Label ID="lblTituloReporte" runat="server" Text="Reporte"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTipo" runat="server" Font-Size="10pt" Text="Tipo:"></asp:Label>
                <asp:DropDownList ID="lstTipoOCSERV" runat="server" Font-Size="8pt" Height="17px" Width="177px" AutoPostBack="True">
                    <asp:ListItem Value="0">JOB</asp:ListItem>
                    <asp:ListItem Value="1">ORDEN DE SERVICIO</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="1">
                <asp:GridView ID="gvListadoOC" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odsListado" Font-Size="8pt" ForeColor="#333333" GridLines="None" DataKeyNames="Nombre,tipo">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                        <asp:BoundField DataField="fh_min" HeaderText="Fecha M&#237;nima" SortExpression="fh_min" />
                        <asp:BoundField DataField="fh_max" HeaderText="Fecha M&#225;xima" SortExpression="fh_max" />
                        <asp:HyperLinkField DataNavigateUrlFields="Nombre,tipo" DataNavigateUrlFormatString="~/OrdenesCompra/reporteTipoOrdenCompra.aspx?monedaId=1&amp;valor={0}&amp;tipo={1}"
                            DataTextField="TotPesos" DataTextFormatString="{0:#,#.##}" HeaderText="PESOS" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Nombre,tipo" DataNavigateUrlFormatString="~/OrdenesCompra/reporteTipoOrdenCompra.aspx?monedaId=2&amp;valor={0}&amp;tipo={1}"
                            DataTextField="TotDolar" DataTextFormatString="{0:#,#.##}" HeaderText="DOLARES" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Nombre,tipo" DataNavigateUrlFormatString="~/OrdenesCompra/reporteTipoOrdenCompra.aspx?monedaId=3&amp;valor={0}&amp;tipo={1}"
                            DataTextField="TotEuros" DataTextFormatString="{0:#,#.##}" HeaderText="EUROS">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="TotFinalPesos" DataFormatString="{0:#,#.##}" HeaderText="TOTAL DOLARES"
                            SortExpression="TotFinalPesos">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsListado" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_listadoOC_ServicioIngTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstTipoOCSERV" DefaultValue="0" Name="intTipo" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="UsuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

