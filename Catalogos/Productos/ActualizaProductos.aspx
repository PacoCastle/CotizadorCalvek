<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActualizaProductos.aspx.cs" Inherits="Catalogos_Productos_ActualizaProductos" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" frame="hsides" style="width: 855px; height: 197px">
        <tr>
            <td align="center" colspan="2" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Archivo Productos"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="1" style="height: 24px">
                <span>&nbsp;
                    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" Font-Size="10pt" Text="Desea continuar con la actuazacion de los productos"></asp:Label></span></td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="1" style="text-align: center">
                <asp:Button ID="btnContinuar" runat="server" Font-Size="10pt" OnClick="btnContinuar_Click"
                    Text="Continuar" />
                &nbsp;&nbsp;
                <asp:Button ID="btnCancelar" runat="server" Font-Size="10pt" OnClick="btnContinuar_Click"
                    Text="Cancelar" /></td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="1">
                &nbsp;</td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="3">
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr style="font-size: 12pt">
        </tr>
    </table>
</asp:Content>

