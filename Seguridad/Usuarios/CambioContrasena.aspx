<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CambioContrasena.aspx.cs" Inherits="Seguridad_Usuarios_CambioContrasena" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="1" style="width: 512px; height: 256px">
            <tr>
                <td align="center" colspan="4" valign="middle">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Cambio de Password"></asp:Label></td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 38px">
                    &nbsp;</td>
                <td style="width: 191px">
                    Password:</td>
                <td style="width: 189px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ToolTip="Nuevo Password"></asp:TextBox>&nbsp;
                </td>
                <td style="width: 42px">
                    &nbsp;</td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 38px">
                    &nbsp;</td>
                <td style="width: 191px">
                    Confirmar Password:</td>
                <td style="width: 189px">
                    <asp:TextBox ID="txtConformaPaswword" runat="server" TextMode="Password" ToolTip="Confirma Password"></asp:TextBox></td>
                <td style="width: 42px">
                    &nbsp;</td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 38px; height: 28px">
                    &nbsp;</td>
                <td style="width: 191px; height: 28px">
                    &nbsp;<asp:Label ID="Label2" runat="server" Width="65px"></asp:Label></td>
                <td style="width: 189px; height: 28px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cambiar Password" /></td>
                <td style="width: 42px; height: 28px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
