<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoMarcasCompras.aspx.cs" Inherits="Admin_compras_listadoMarcasCompras" Title="COMPRAS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" style="width: 603px">
        <tr>
            <td style="width: 627px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="odsMarcasCompras" Font-Size="9pt" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,MARCA" DataNavigateUrlFormatString="~/Admin/compras/formularioDetalleMarcasCompras.aspx?LINEAID={0}&amp;Marca={1}"
                DataTextField="MARCA" HeaderText="MARCA" />
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,MARCA" DataNavigateUrlFormatString="~/Admin/compras/formularioDetalleMarcasCompras.aspx?LINEAID={0}&amp;Marca={1}"
                DataTextField="CONTEO" HeaderText="#" />
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,MARCA" DataNavigateUrlFormatString="~/Admin/compras/formularioDetalleMarcasCompras.aspx?LINEAID={0}&amp;Marca={1}&amp;sucursal=001"
                DataTextField="AUT" HeaderText="AUT" />
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,MARCA" DataNavigateUrlFormatString="~/Admin/compras/formularioDetalleMarcasCompras.aspx?LINEAID={0}&amp;Marca={1}&amp;sucursal=002"
                DataTextField="SLP" HeaderText="SLP" />
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,MARCA" DataNavigateUrlFormatString="~/Admin/compras/formularioDetalleMarcasCompras.aspx?LINEAID={0}&amp;Marca={1}&amp;sucursal=003"
                DataTextField="QRO" HeaderText="QRO" />
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,MARCA" DataNavigateUrlFormatString="~/Admin/compras/formularioDetalleMarcasCompras.aspx?LINEAID={0}&amp;Marca={1}&amp;sucursal=004"
                DataTextField="CLY" HeaderText="CLY" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsMarcasCompras" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ComprasTableAdapters.get_listadoMarcasCompraTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="usuarioId" SessionField="usuarioId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 627px">
    <asp:ObjectDataSource ID="odsOrdCompSick" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ComprasTableAdapters.get_listadoOCSickTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="usuarioId" SessionField="usuarioId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="odsOrdCompSick" Font-Size="8pt" ForeColor="#333333" GridLines="None" Width="758px" DataKeyNames="comprasId">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="comprasId" HeaderText="Id" >
                <HeaderStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="Fecha" HeaderText="Fecha" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="moneda" HeaderText="Moneda" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="Marca" HeaderText="Marca" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="sucursal" HeaderText="Sucursal" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="FolioOC_Sick" HeaderText="Folio&lt;BR&gt;OC_Sick" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LINEAID,Marca,sucursalId,ComprasId,monedaId"
                DataNavigateUrlFormatString="~/Admin/compras/formularioModifDetalleMarcasCompras.aspx?comprasId={3}&amp;Etr=1&amp;LINEAID={0}&amp;Marca={1}&amp;sucursal={2}&amp;monedaId={4}"
                DataTextField="Proveedor" HeaderText="Proveedor" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="LINEAID" HeaderText="LINEAID" SortExpression="LINEAID"
                Visible="False" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
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
    </table>
</asp:Content>

