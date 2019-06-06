<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AutorizaRemisiones.aspx.cs" Inherits="Operacion_AutorizaRemisiones" Title="Autoriza Remisiones" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <script type="text/javascript" language="javascript">
        function confirm_message() {
            if (confirm("Esta a punto de cambiar el estatus del Asesor") == true)
                return true;
            else
                return false;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="vertical-align: top; width: 100%;" border="0" cellpadding="0" cellspacing="10">
                <tr style="border-color: #FF0000" >
                        <td style="border-left: medium dotted #C0C0C0; padding-left: 10px; background-color: #5D7B9D; font-family: 'AR CENA'; font-size: larger; color: #FFFFFF; text-align: center;" colspan="3">
                            AUTORIZA REMISIONES ASESOR</td>
                </tr>
                <tr style="border-color: #FF0000 ">
                    <td style="border-left-style: dotted; border-left-width: medium; border-left-color: #C0C0C0; padding-left: 10px;">

                        <span style="font-size: small">Razon Social:</span><asp:RadioButtonList ID="rblRazonSocial" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" Font-Size="Large">
                            <asp:ListItem Selected="True">CSA</asp:ListItem>
                            <asp:ListItem>CBJ</asp:ListItem>
                            <asp:ListItem>CCC</asp:ListItem>
                        </asp:RadioButtonList>

                    </td>
                    <td style="border-left-style: dotted; border-left-width: medium; border-left-color: #C0C0C0; padding-left: 10px;">

                        <span style="font-size: small">Asesor:<br />
                        <asp:DropDownList ID="lstAsesores" runat="server" DataSourceID="sdsAsesores" DataTextField="NB_ASESOR" DataValueField="CD_ASESOR" OnSelectedIndexChanged="lstAsesores_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsAsesores" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_AsesoresKDUV_X_RazonSocial" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="rblRazonSocial" DefaultValue="CSA" Name="strRazonSocial" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </span>

                    </td>
                    <td style="border-left: medium dotted #C0C0C0; padding-left: 10px; "><span style="font-size: small">Autoriza:<br />
                        <asp:DropDownList ID="lstAutorizaRemision" runat="server" OnSelectedIndexChanged="lstAutorizaRemision_SelectedIndexChanged" AutoPostBack="True" DataSourceID="sdsAutoriza" DataTextField="NB_AUTORIZA" DataValueField="NB_AUTORIZA" Font-Size="Large">
                            <asp:ListItem Selected="True">S</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsAutoriza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_AutorizaRemisionAsesor_X_RazonSocial" SelectCommandType="StoredProcedure" UpdateCommand="set_AutorizaRemisionAsesor_X_RazonSocial" UpdateCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="rblRazonSocial" DefaultValue="CSA" Name="strRazonSocial" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="lstAsesores" DefaultValue="" Name="CD_ASESOR" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="rblRazonSocial" DefaultValue="CSA" Name="strRazonSocial" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="lstAsesores" DefaultValue="" Name="CD_ASESOR" PropertyName="SelectedValue" Type="String" />
                                <asp:Parameter DefaultValue="" Name="NB_ASESOR" Type="String" />
                                <asp:ControlParameter ControlID="lstAutorizaRemision" Name="NB_AUTORIZA" PropertyName="SelectedValue" Type="String" DefaultValue="" />
                                <asp:Parameter DefaultValue="ACTUALIZACION" Name="CD_ACCION" Type="String" />
                                <asp:SessionParameter DefaultValue="" Name="CD_USUARIO" SessionField="usuarioId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        </span>
                    </td>                   
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

