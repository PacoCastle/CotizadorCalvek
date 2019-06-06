<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListarUsuarios.aspx.cs" Inherits="Seguridad_Usuarios_ListarUsuarios" Title="Listado de Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;<asp:Label ID="Mensaje01" runat="server" Text=""></asp:Label><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Seguridad/Usuarios/FormularioUsuario.aspx">Alta de Usuarios</asp:HyperLink><br />
    <br />
    <table style="width: 512px; height: 256px" border="1">
        <tr>
            <td align="center" colspan="4" valign="middle">
    <asp:Label ID="Label1" runat="server" Text="Listado de Usuarios" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Nombre de Usuario:</td>
            <td style="width: 189px">
                <asp:TextBox ID="txtUsuarioId" runat="server"></asp:TextBox></td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr>
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Nombre:</td>
            <td style="width: 189px">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox></td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr>
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Oficina:</td>
            <td style="width: 189px">
                <asp:DropDownList ID="listOficina" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="texto" DataValueField="valor">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr>
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Estatus:</td>
            <td style="width: 189px">
                <asp:DropDownList ID="listEstatus" runat="server" DataSourceID="ObjectDataSource1" DataTextField="texto" DataValueField="valor" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">--</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboEstatusTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td style="width: 42px">
            </td>
        </tr>
        <tr>
            <td style="width: 38px; height: 28px">
            </td>
            <td style="width: 191px; height: 28px">
            </td>
            <td style="width: 189px; height: 28px">
                <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /></td>
            <td style="height: 28px; width: 42px;">
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="usuarioId" EnableViewState="False" AutoGenerateColumns="False" DataSourceID="ObjectDataSource3">
        <Columns>
            <asp:HyperLinkField DataTextField="usuarioId" HeaderText="Num Usuario" />
            <asp:HyperLinkField DataTextField="usuario_nombreCompleto" HeaderText="Nombre Completo"
                NavigateUrl="~/Seguridad/Usuarios/FormularioUsuario.aspx" DataNavigateUrlFields="usuarioId" DataNavigateUrlFormatString="~/Seguridad/Usuarios/FormularioUsuario.aspx?usuarioId={0}" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUsuariosTableAdapter" OnSelecting="ObjectDataSource3_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUsuarioId" Name="login" PropertyName="Text" Type="String" DefaultValue="" />
            <asp:ControlParameter ControlID="txtNombre" DefaultValue="" Name="nombre" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="listOficina" DefaultValue="-1" Name="oficinaId"
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="listEstatus" DefaultValue="-1" Name="estatus" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp; &nbsp;
    
</asp:Content>