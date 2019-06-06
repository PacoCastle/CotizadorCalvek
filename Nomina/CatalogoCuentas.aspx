<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CatalogoCuentas.aspx.cs" Inherits="Nomina_CatalogoCuentas" Title="Catalogo Cuentas" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <script type="text/javascript" language="javascript">
        function confirm_message() {
            if (confirm("Esta a punto de cambiar el estatus del Asesor") == true)
                return true;
            else
                return false;
        }
    </script>

   <table style="vertical-align: top; width: 100%;" border="0" cellpadding="0" cellspacing="10">
                <tr style="border-color: #FF0000" >
                        <td style="border-left: medium dotted #C0C0C0; padding-left: 10px; background-color: #5D7B9D; font-family: 'AR CENA'; font-size: larger; color: #FFFFFF; text-align: center;" colspan="3">
                            CATALOGO NOMINA</td>
                </tr>
                <tr style="border-color: #FF0000 ">
                    <td style="border-left-style: dotted; border-left-width: medium; border-left-color: #C0C0C0; padding-left: 10px;">
                        <%--<a href="www.google.com" onclick="window.open(href);return false;">Vinculo que esta esta página en otra pestaña</a>--%>
                        <a href="http://201.161.53.24/Polizas/" target="_blank">Ver Catalogo</a>
                    </td>
                </tr>
            </table>
    
</asp:Content>

