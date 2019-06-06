<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListarPerfil.aspx.cs" Inherits="Seguridad_Perfiles_ListarPerfil" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Mensaje01" runat="server" Text=""></asp:Label><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Seguridad/Perfiles/FormularioPerfil.aspx">Alta de Perfiles</asp:HyperLink><br />
    <br />
    <table border="1" style="width: 512px; height: 256px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Listado de Perfiles"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Nombre del perfil:</td>
            <td style="width: 189px">
                <asp:TextBox ID="txtNombreP" runat="server"></asp:TextBox></td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Estatus:</td>
            <td style="width: 189px">
                <asp:DropDownList ID="listEstatus" runat="server" DataSourceID="ObjectDataSource1"
                    DataTextField="texto" DataValueField="valor">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboEstatusTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 28px">
            </td>
            <td style="width: 191px; height: 28px">
            </td>
            <td style="width: 189px; height: 28px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" /></td>
            <td style="width: 42px; height: 28px">
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="ObjectDataSource2" EnableViewState="False" DataKeyNames="perfilid">
        <Columns>
            <asp:BoundField DataField="perfilid" HeaderText="perfilid" InsertVisible="False"
                ReadOnly="True" SortExpression="perfilid" />
            <asp:HyperLinkField DataNavigateUrlFields="perfilid" DataNavigateUrlFormatString="~/Seguridad/Perfiles/FormularioPerfil.aspx?perfilid={0}"
                DataTextField="perfil_nombre" HeaderText="Nombre Perfil" NavigateUrl="~/Seguridad/Perfiles/FormularioPerfil.aspx" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        OnSelecting="ObjectDataSource2_Selecting" SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaPerfilesTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="listEstatus" DefaultValue="" Name="estatus" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="txtNombreP" Name="nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;
    <br />
</asp:Content>

