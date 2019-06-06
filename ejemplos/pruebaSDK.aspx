<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pruebaSDK.aspx.cs" Inherits="ejemplos_pruebaSDK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged">
        </asp:Calendar>
        <br />
        <br />
        fecha:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
    </form>
</body>
</html>
