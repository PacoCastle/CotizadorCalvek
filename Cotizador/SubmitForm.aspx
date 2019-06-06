<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitForm.aspx.cs" Inherits="Cotizador_SubmitForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>SubmitForm</title>
</head>

<body onload="SubmitForm.submit()">

<form id="SubmitForm" action="CreditCheck.aspx" method="post">

<input type="hidden" name="ReturnURL" value="OrderCapture.aspx"/>
<input type="hidden" name="MerchantID" value="webWarehouse.com"/>
<input type="hidden" name="CustomerID" value="<%=Session["OrderNumber"]%>"/>
<input type="hidden" name="OrderTotal" value="<%=Session["OrderTotal"]%>"/>

</form>

</body>
</html>
