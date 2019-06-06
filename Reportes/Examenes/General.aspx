<%@ Page Language="C#" AutoEventWireup="true" CodeFile="General.aspx.cs" Inherits="Reportes_CaidaCotizador" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0 , Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:21.59cm; width:27.94cm">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <br />
            <rsweb:ReportViewer ID="rvExamenesGeneral" runat="server" Height="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                <LocalReport EnableHyperlinks="True">
                </LocalReport>
            </rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>
