<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListarClientes.aspx.cs" Inherits="Catalogos_ListarClientes" Title="SIM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" style="width: 403px; height: 153px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Listado de Clientes"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Razon Social:</td>
            <td style="width: 177px">
                <asp:TextBox ID="txtRazon" runat="server"></asp:TextBox></td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                RFC:</td>
            <td style="width: 177px">
                <asp:TextBox ID="txtRFC" runat="server"></asp:TextBox></td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 28px">
            </td>
            <td style="width: 191px; height: 28px">
            </td>
            <td style="width: 177px; height: 28px">
                <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /></td>
            <td style="width: 42px; height: 28px">
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="574px" Font-Size="10pt" Visible="False">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:HyperLinkField DataTextField="Id" HeaderText="Id" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Catalogos/Clientes/FormularioClientes.aspx?clienteId={0}" />
            <asp:HyperLinkField DataTextField="CODIGO" HeaderText="CODIGO" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Catalogos/Clientes/FormularioClientes.aspx?clienteId={0}" />
            <asp:HyperLinkField DataTextField="RAZONSOCIAL" HeaderText="CLIENTE" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Catalogos/Clientes/FormularioClientes.aspx?clienteId={0}" />
            <asp:HyperLinkField DataTextField="RFC" HeaderText="RFC" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Catalogos/Clientes/FormularioClientes.aspx?clienteId={0}" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="catalogosTableAdapters.get_buscaClienteProveedorCatTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtRazon" DefaultValue=" " Name="strClienteRazonSocial"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtRFC" DefaultValue=" " Name="strClienteRfc" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

