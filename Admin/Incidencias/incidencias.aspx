<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="incidencias.aspx.cs" Inherits="Admin_Incidencias_incidencias" Title="SICK-Incidencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 196px">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="@Arial Unicode MS"
                    Text="Alta Incidencia"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 23px; text-align: center">
            </td>
        </tr>
        <tr>
            <td style="width: 45px">
                <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Sucursal:"></asp:Label></td>
            <td style="width: 258px">
                <asp:DropDownList ID="lstOficina" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="texto" DataValueField="valor" Font-Size="8pt">
                </asp:DropDownList><br />
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lstOficina"
                    Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 45px">
                <asp:Label ID="Label3" runat="server" Font-Size="9pt" Text="Departamento:"></asp:Label></td>
            <td style="width: 258px">
                <asp:DropDownList ID="lstDepartamento" runat="server" AppendDataBoundItems="True"
                    DataSourceID="odsDepartamentos" DataTextField="departamento" DataValueField="departamentoId"
                    Font-Size="8pt">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><br />
                <asp:ObjectDataSource ID="odsDepartamentos" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaDepartamentosClvkTableAdapter">
                </asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstDepartamento"
                    Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 45px">
                <asp:Label ID="Label4" runat="server" Font-Size="9pt" Text="Incidencia:"></asp:Label></td>
            <td style="width: 258px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtComentario" runat="server" Font-Size="8pt" Height="60px" MaxLength="800"
                    TextMode="MultiLine" Width="380px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComentario"
                    Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right">
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" Font-Size="7pt" ForeColor="DarkGreen"></asp:Label>&nbsp;<asp:Button
                    ID="btnNuevo" runat="server" Font-Size="9pt" OnClick="btnNuevo_Click" Text="Nuevo"
                    Visible="False" /><asp:Button ID="btnGuardar" runat="server" Font-Size="9pt" OnClick="btnGuardar_Click"
                        Text="Guardar" /></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sdsIncidencia" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
        InsertCommand="set_insertaDatosIncidencia" InsertCommandType="StoredProcedure"
        SelectCommand="set_insertaDatosIncidencia" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="intDepartamentoId" Type="Int32" />
            <asp:Parameter Name="intOficinaId" Type="Int32" />
            <asp:Parameter Name="strIncidencia" Type="String" />
            <asp:Parameter Name="intUsuarioId" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="resultado" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="intDepartamentoId" Type="Int32" />
            <asp:Parameter Name="intOficinaId" Type="Int32" />
            <asp:Parameter Name="strIncidencia" Type="String" />
            <asp:Parameter Name="intUsuarioId" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="resultado" Type="Int32" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

