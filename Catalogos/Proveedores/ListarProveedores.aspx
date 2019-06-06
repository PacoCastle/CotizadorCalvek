<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListarProveedores.aspx.cs" Inherits="Catalogos_Proveedores_ListarProveedores" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" style="width: 404px; height: 162px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Listado de Preveedores"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Codigo:</td>
            <td style="width: 177px">
                <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            <td style="width: 42px">
            </td>
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
                <asp:Button ID="Button1" runat="server" Text="Buscar" /></td>
            <td style="width: 42px; height: 28px">
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="InterfaceAdminPaqTableAdapters.buscaClienteProveedorCatTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="CTIPOCLI01" Type="Int32" />
            <asp:ControlParameter ControlID="txtCodigo" Name="CCODIGOC01" PropertyName="Text"
                Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="txtRazon" Name="CRAZONSO01" PropertyName="Text"
                Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="txtRFC" Name="CRFC" PropertyName="Text" Type="String" DefaultValue=" " />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" Width="553px">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" />
            <asp:BoundField DataField="RAZONSOCIAL" HeaderText="RAZONSOCIAL" SortExpression="RAZONSOCIAL" />
            <asp:BoundField DataField="RFC" HeaderText="RFC" SortExpression="RFC" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
    </asp:GridView>

</asp:Content>

