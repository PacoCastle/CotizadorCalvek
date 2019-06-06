<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListarProductos.aspx.cs" Inherits="Catalogos_Productos_ListarProductos" Title="SICK - Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:HyperLink ID="hlkAltaProducto" runat="server" NavigateUrl="~/Catalogos/Productos/FormularioProductos.aspx">AltaProducto</asp:HyperLink>
    <asp:LinkButton ID="lkbArchivoProductos" runat="server" PostBackUrl="~/Catalogos/Productos/ArchivoProductos.aspx">ArchivoProductos</asp:LinkButton>
    <table border="0" style="width: 405px; height: 187px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Listado de Productos"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Codigo:</td>
            <td style="width: 177px">
                <asp:TextBox ID="txtCodigo" runat="server">  </asp:TextBox><td style="width: 42px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Nombre:</td>
            <td style="width: 177px">
                <asp:TextBox ID="txtNombre" runat="server">  </asp:TextBox><td style="width: 42px">
            </td>
        </tr>
        
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Marca:</td>
            <td style="width: 177px">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="marca" DataValueField="marca">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_BuscaMarcasTableAdapter">
                </asp:ObjectDataSource>
                <td style="width: 42px">
            </td>
        </tr>        
        
                <tr style="font-size: 12pt">
            <td style="width: 38px; height: 28px">
            </td>
            <td style="width: 191px; height: 28px">
            </td>
            <td style="width: 177px; height: 28px">
                <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /><td style="width: 42px; height: 28px">
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Enabled="False" Visible="False" Width="611px">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="codigo" HeaderText="codigo" SortExpression="codigo" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="precio" DataFormatString="{0:N}" HeaderText="precio" SortExpression="precio" />
            <asp:BoundField DataField="prefijo" HeaderText="moneda" SortExpression="prefijo" />
            <asp:BoundField DataField="marca" HeaderText="marca" SortExpression="marca" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaProductosTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="marca" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCodigo" DefaultValue=" " Name="codigo" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtNombre" DefaultValue=" " Name="nombre" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

