<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioProductos.aspx.cs" Inherits="Catalogos_Productos_FormularioProductos" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" style="width: 740px; height: 187px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Alta de Productos"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px">
            </td>
            <td style="width: 82px">
                Codigo:</td>
            <td colspan="2">
                <asp:TextBox ID="txtCodigo" runat="server">  </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 26px;">
            </td>
            <td style="width: 82px; height: 26px;">
                Nombre:</td>
            <td colspan="2" style="height: 26px">
                <asp:TextBox ID="txtNombre" runat="server">  </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNombre"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px">
            </td>
            <td style="width: 82px">
                Marca:</td>
            <td colspan="2">
                <asp:DropDownList ID="lstMarca" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="marcaNombre" DataValueField="marcaNombre">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lstMarca"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt"></asp:RequiredFieldValidator>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaMarcasProductosTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 28px">
            </td>
            <td style="width: 82px; height: 28px">
                Precio:</td>
            <td colspan="2" style="height: 28px">
                <asp:TextBox ID="txtPrecio" runat="server" Width="99px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrecio"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrecio"
                    Display="Dynamic" ErrorMessage="Formato no valido (dd.dd)" Font-Size="10pt" ValidationExpression="^(?:\+|-)?\d+\.\d*$"></asp:RegularExpressionValidator></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 28px">
            </td>
            <td style="width: 82px; height: 28px">
                Moneda:</td>
            <td colspan="2" style="height: 28px">
                <asp:DropDownList ID="lstMoneda" runat="server" DataSourceID="ObjectDataSource1"
                    DataTextField="descripcion" DataValueField="monedaId">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="lstMoneda"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt"></asp:RequiredFieldValidator>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaMonedaTableAdapter"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 28px">
            </td>
            <td style="width: 82px; height: 28px">
                Categoria:</td>
            <td colspan="2" style="height: 28px">
                <asp:TextBox ID="txtCategoria" runat="server"></asp:TextBox></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 28px">
            </td>
            <td style="width: 82px; height: 28px">
                Descripcion:</td>
            <td colspan="2" style="height: 28px">
                <asp:TextBox ID="txtDescripcion" runat="server" Width="486px"></asp:TextBox></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 28px">
            </td>
            <td style="width: 82px; height: 28px">
                Tiempo Entrega:</td>
            <td style="width: 246px; height: 28px">
                <asp:TextBox ID="txtTiempoEntrega" runat="server" Width="40px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTiempoEntrega"
                    Display="Dynamic" ErrorMessage="Formato no valido" Font-Size="10pt" ValidationExpression="[0-9]{1,100}"></asp:RegularExpressionValidator></td>
            <td style="width: 42px; height: 28px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 8px; height: 28px">
            </td>
            <td style="width: 82px; height: 28px">
            </td>
            <td style="width: 246px; height: 28px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Continuar" />
                <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label></td>
            <td style="width: 42px; height: 28px">
            </td>
        </tr>
    </table>
</asp:Content>

