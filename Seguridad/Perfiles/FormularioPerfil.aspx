<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioPerfil.aspx.cs" Inherits="Seguridad_Perfiles_FormularioPerfil" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Mensaje01" runat="server" Text=""></asp:Label><br />
    <br />
    <table border="1" style="width: 512px; height: 256px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Alta de Perfiles"></asp:Label></td>
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
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Procesar Alta" /></td>
            <td style="width: 42px; height: 28px">
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Height="14px" Text="Listado de Funciones"
        Width="194px"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource2" AutoGenerateColumns="False" DataKeyNames="funcionId">
        <Columns>
            <asp:BoundField DataField="funcionId" HeaderText="funcionId" ReadOnly="True" SortExpression="funcionId" />
            <asp:BoundField DataField="funcion_nombre" HeaderText="funcion_nombre" SortExpression="funcion_nombre" />
            <asp:BoundField DataField="funcion_descripcion" HeaderText="funcion_descripcion"
                SortExpression="funcion_descripcion" />
            <asp:TemplateField HeaderText="Selecion">
                  <ItemTemplate>
                      <asp:CheckBox ID="CheckBox1" runat="server" />
                  </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaFuncionesTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="estatus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

