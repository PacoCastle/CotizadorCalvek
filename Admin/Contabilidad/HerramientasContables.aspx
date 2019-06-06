<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HerramientasContables.aspx.cs" Inherits="Admin_Contabilidad_HerramientasContables" Title="Herramientas Contables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[



// ]]>
</script>

    <table id="TABLE1" style="width: 514px" onclick="return TABLE1_onclick()">
        <tr>
            <td style="width: 143px">
            </td>
            <td style="width: 240px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text="Herramientas Contables"></asp:Label></td>
            <td style="width: 148px">
            </td>
        </tr>
        <tr>
            <td style="width: 143px; height: 18px">
            </td>
            <td style="width: 240px; height: 18px">
            </td>
            <td style="width: 148px; height: 18px">
            </td>
        </tr>
    </table>
    <table style="width: 512px">
        <tr>
            <td style="width: 518px">
            </td>
        </tr>
        <tr>
            <td style="width: 518px; height: 20px">
                <asp:LinkButton ID="Pdescuadradas" runat="server" PostBackUrl="~/Admin/Contabilidad/PolizasDescuadradas.aspx">Polizas Descuadradas</asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 518px">
            </td>
        </tr>
        <tr>
            <td style="width: 518px">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Contabilidad/CuentasIncorrectas.aspx">Cuentas Incorrectas</asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 518px">
            </td>
        </tr>
        <tr>
            <td style="width: 518px; height: 20px">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Admin/Contabilidad/DocsSinPoliza.aspx">Documentos Sin Poliza</asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 518px; ">
            </td>
        </tr>
        <tr>
            <td style="width: 518px; height: 20px">
                <asp:LinkButton ID="LinkButton3" runat="server" 
                    PostBackUrl="~/Admin/Nomina/Nomina.aspx">Nomina</asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 518px; ">
            </td>
        </tr>
        <%--<tr>
            <td style="width: 518px; height: 20px">
                <asp:LinkButton ID="LinkButton4" runat="server" 
                    PostBackUrl="~/Admin/ProveedorXml/LeectorXML.aspx">Buscador XML</asp:LinkButton></td>
        </tr>--%>
		<tr>
			<td style="width: 518px; height: 20px">
                <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/CalendarioComisiones/CalendarioComisiones.aspx">Catalogos Comisiones</asp:LinkButton>
			</td>
		 </tr>
        </tr>
    </table>
</asp:Content>

