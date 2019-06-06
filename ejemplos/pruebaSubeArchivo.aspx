<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pruebaSubeArchivo.aspx.cs" Inherits="ejemplos_pruebaSubeArchivo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <br />
        <br />
        <asp:Label ID="lMensajeExito" runat="server"></asp:Label><br />
        <br />
        <br />
        <br />
        <asp:FileUpload id="fuCargarArchivo" style="Z-INDEX: 104; LEFT: 168px; WIDTH: 432px; POSITION: absolute; TOP: 112px; HEIGHT: 24px" size="52" name="Archivo" runat="server" /><br />
        <br />
        <br />
        <br />
        <br />
        <br />
         <asp:button id="bSubirArchivo" style="Z-INDEX: 105; LEFT: 504px; POSITION: absolute; TOP: 152px"
 runat="server" Height="32px" Width="96px" Text="Enviar" OnClick="bSubirArchivo_Click"></asp:button>
        <asp:GridView ID="gListaArchivos" runat="server" >
        </asp:GridView>
    </div>
    </form>
</body>
</html>
