<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RemisionesAltaAcciones.aspx.cs" Inherits="Cobranza_reporteRemisiones" Title="Alta Acciones Remisiones" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        var limit = 63;
        function res(limit) {
            $('textarea[id$=txtAccion]').keyup(function () {
                var len = $(this).val().length;
                if (len > limit) {
                    this.value = this.value.substring(0, limit);
                }
                $('#charLeft').text(limit - len + " characters left");
            });
        }
    </script>    
    <div>
            <span><strong>            
            Alta Acciones:<br /> </strong></span>
    &nbsp;<hr border-color: white; height: 1px; />
            Accion:
            <br />
                <asp:TextBox ID="txtAccion" runat="server" MaxLength="35" Height="42px" TextMode="MultiLine" Font-Size="Medium" ValidationGroup="Agregar"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAccion" runat="server" ControlToValidate="txtAccion" Display="Dynamic" ErrorMessage="*Requerido" Font-Size="7pt" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <br />
            <br />
            Tipo:
            <asp:RadioButtonList ID="rblTipo" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="1">Auditor</asp:ListItem>
                <asp:ListItem Value="2">Asesor</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" ValidationGroup="Agregar" />
            <br />
    </div>

</asp:Content>

