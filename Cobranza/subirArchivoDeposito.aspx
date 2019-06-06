<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="subirArchivoDeposito.aspx.cs" Inherits="Cobranza_subirArchivoDeposito" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;<table style="width: 847px; height: 219px">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Navy"
                    Text="COBRANZA"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 166px">
            </td>
            <td>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Subir archivo"></asp:Label><br />
    
    
    <div>
        &nbsp;
        <br />
        <asp:Label ID="lMensajeExito" runat="server"></asp:Label><br />
        <br />
        <br />
        <asp:FileUpload id="fuCargarArchivo"  size="52" name="Archivo" runat="server" /><br />
        <br />
        <br />
         <asp:button id="bSubirArchivo" runat="server" Height="22px" Width="96px" Text="Continuar" OnClick="bSubirArchivo_Click"></asp:button>&nbsp;</div>
    
    
                </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 166px">
            </td>
            <td>
                <asp:Label ID="lblResultados" runat="server"></asp:Label></td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

