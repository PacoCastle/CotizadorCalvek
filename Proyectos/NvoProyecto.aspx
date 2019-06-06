<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NvoProyecto.aspx.cs" Inherits="Proyectos_NvoProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">

        function InvokePop(ctrListSuc, ctrClienteId)
        {
            val = document.getElementById(ctrListSuc).value;
            
            if (window.showModalDialog) {
                //retVal = window.showModalDialog("BusqClientes.aspx?ControlVal=" + val, 'Show Popup Window', "dialogHeight:50%,dialogWidth:20%,resizable:yes,center:yes");
                retVal = window.showModalDialog("BusqClientes.aspx?ControlVal=" + val, 'Show Popup Window', "dialogHeight: 400px; dialogWidth: 500px;" +
                    "center: Yes; modal:Yes" +
                    "help: No; resizable: Yes;");
             
                document.getElementById(ctrClienteId).value = retVal.ClienteId;
                
                document.getElementById('Nombre').innerHTML = retVal.Nombre;
                document.getElementById('Calle').innerHTML = retVal.Calle;
                document.getElementById('Colonia').innerHTML = retVal.Colonia;
                document.getElementById('Estado').innerHTML = retVal.Estado;
            }
            //else {
            //    retVal = window.open("BusqClientes.aspx?Control1=" + fname + "&ControlVal=" + val, 'Show Popup Window', 'height=90,width=250,resizable=yes,modal=yes,center=yes');
            //    retVal.focus();

            //    //"dialogwidth: 450px; dialogheight: 300px; resizable: yes"
            //}
            
        }
    </script>




  <div>
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <panel ID="pnlNvoProyecto">
                <br>
                <br>
                <table  style="background-color: #CCCCCC;  border-style: inset; border-width: thin; vertical-align: top; text-align: left; font-family:Arial; width:60%;">
                    <tr>
                        <td colspan="2" style="border-color: #000099; border-style: groove; font-family:Arial; font-size: xx-large; font-weight: bold; font-style: inherit; font-variant: small-caps; text-transform: lowercase; color: #0000FF; text-decoration: underline; vertical-align: middle; text-align: center; height: 41px;">                          
                            PROYECTOS CALVEK
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color: #FFFFFF">
                                
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><span style="font-size: small">Razon Social:</span><asp:RadioButtonList ID="rblRazonSocial" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                 <asp:ListItem Selected="True">CSA</asp:ListItem>
                                 <asp:ListItem>CBJ</asp:ListItem>
                                 <asp:ListItem>CCC</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><span style="font-size: small">

                            Sucursal:

                            <asp:DropDownList ID="lstSucursales" runat="server" DataSourceID="sdsOficinas" DataTextField="texto" DataValueField="valor">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsOficinas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_comboOficinas_X_RazonSocial" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="rblRazonSocial" DefaultValue="CSA" Name="strRazonSocial" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><span style="font-size: small">
                            Cliente:
                            <asp:TextBox ID="txtCliente" runat="server" Font-Size="12px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCliente" runat="server" ControlToValidate="txtCliente" Display="Dynamic" ErrorMessage="*Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        <tr>
                            <td colspan="2" style="border-style: inset; border-width: thin">
                                <p>
                                    <em id="Nombre"></em><br />
                                    <em id="Calle"></em><br />
                                    <em id="Colonia"></em><br />
                                    <em id="Estado"></em>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><span style="font-size: small">Proyecto:<asp:TextBox ID="txtProyId" runat="server" Font-Size="12px" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProyId" runat="server" ControlToValidate="txtProyId" Display="Dynamic" ErrorMessage="*Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><span style="font-size: small">Descripcion<br />
                                <asp:TextBox ID="txtProyDescripcion" runat="server" CssClass="inline" Style="vertical-align: top;" TextMode="MultiLine" Width="100%" Font-Size="12px" MaxLength="40"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProyDescripcion" runat="server" ControlToValidate="txtProyDescripcion" Display="Dynamic" ErrorMessage="*Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="font-size: small">Moneda:<asp:DropDownList ID="lstMoneda" runat="server" DataSourceID="sdsMoneda" DataTextField="descripcion" DataValueField="monedaKepler">
                                </asp:DropDownList>
                            </td>
                            <td colspan="2"><span style="font-size: small">Monto:<asp:TextBox ID="txtMonto" runat="server" Font-Size="12px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMonto" runat="server" ControlToValidate="txtMonto" Display="Dynamic" ErrorMessage="*Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMonto" runat="server" ControlToValidate="txtMonto" Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="vertical-align: bottom; position: relative; text-align: center">
                                <br />
                                <br />
                                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" Height="33px" />
                                <asp:SqlDataSource ID="sdsNvoProyecto" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" InsertCommand="set_insertaNvoProyecto" InsertCommandType="StoredProcedure" OnInserted="sdsNvoProyecto_Inserted">
                                    <InsertParameters>
                                        <asp:Parameter Name="CD_Oficina" Type="Int32" />
                                        <asp:Parameter Name="CD_Proyecto" Type="String" />
                                        <asp:Parameter Name="NB_Proyecto" Type="String" />
                                        <asp:Parameter Name="CD_Cte" Type="String" />
                                        <asp:Parameter Name="NB_Moneda" Type="String" />
                                        <asp:Parameter Name="NU_IMPORTE" Type="Double" />
                                        <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                        <asp:Parameter Direction="Output" Name="resultado" Type="Int32" />
                                        <asp:Parameter Direction="InputOutput" Name="msgInsert" Size="150" Type="String" />
                                        <asp:Parameter Direction="InputOutput" Name="msgReplica" Size="150" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sdsMoneda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_listaMoneda_Parametro" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="valParametro" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>
                        </tr>
                </table>
            </panel>
            
             <br />
        </ContentTemplate>

    </asp:UpdatePanel>
</div>
    </asp:Content>

