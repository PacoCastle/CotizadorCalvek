<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  CodeFile="CanastaMateriales.aspx.cs" Inherits="Clientes_administradorClientesKepler"  EnableEventValidation="false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript" >

        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(mantainDate);
            function mantainDate() {
                $(function () {
                    $(".date-pick").datePicker({ startDate: '01/01/2011' });
                });
            }
        });
        function ValidateDate(sender, args) {
            var dateString = document.getElementById(sender.controltovalidate).value;
            //var regex = /(((0|1)[1-9]|2[0-9]|3[0-1])\/(0[1-9]|1[1-2])\/((19|20)\d\d))$/;
            var regex = /(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[1-2])\/((19|20)\d\d))$/;
            if (regex.test(dateString)) {
                var parts = dateString.split("/");
                var dt = new Date(parts[1] + "/" + parts[0] + "/" + parts[2]);
                args.IsValid = (dt.getDate() == parts[0] && dt.getMonth() + 1 == parts[1] && dt.getFullYear() == parts[2]);
            }
            else { args.IsValid = false; }
        }
    </script> 
<style type="text/css">
    .CustomTabStyle .ajax__tab_header {font-family:verdana,tahoma,helvetica;font-size:13px;background:url('../imagenes/Tabs/tab-line.gif') repeat-x bottom;}
.CustomTabStyle .ajax__tab_outer {padding-right:4px;background:url('../../imagenes/Tabs/tab-right.gif') no-repeat right;height:21px;}
.CustomTabStyle .ajax__tab_inner {padding-left:3px;background:url('../../imagenes/Tabs/tab-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_tab {height:13px;padding:4px;margin:0;background:url('../../imagenes/Tabs/tab.gif') repeat-x;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_outer {background:url('../../imagenes/Tabs/tab-hover-right.gif') no-repeat right;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_inner {background:url('../../imagenes/Tabs/tab-hover-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_tab {background:url('../../imagenes/Tabs/tab-hover.gif') repeat-x;}
.CustomTabStyle .ajax__tab_active .ajax__tab_outer {background:url('../../imagenes/Tabs/tab-active-right.gif') no-repeat right;}
.CustomTabStyle .ajax__tab_active .ajax__tab_inner {background:url('../../imagenes/Tabs/tab-active-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_active .ajax__tab_tab {background:url('../../imagenes/Tabs/tab-active.gif') repeat-x;}
.CustomTabStyle .ajax__tab_body {font-family:verdana,tahoma,helvetica;font-size:10pt;border:1px solid #ffffff;border-top:0;padding:8px;background-color:#ffffff;}
.TestCssStyle
    {
        text-align:left;
        font-weight:bold;
        font-size:x-large;
        padding: 2px; 
        background-color:silver; 
        border-collapse: separate;       

    }
.modalBackground 
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
        z-index: 10000;
    }
    .auto-style1 {
        height: 32px;
    }
 </style>
   <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="pnlVistas" runat="server">
        <ContentTemplate>
            <asp:TabContainer ID="TabRemisiones" runat="server" ActiveTabIndex="1" AutoPostBack="True" BorderStyle="None" CssClass="CustomTabStyle" Width="100%" ScrollBars="Auto">
                <asp:TabPanel ID="TPanel1" runat="server" HeaderText="General">
                    <HeaderTemplate>
                        Alta
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="10" style="vertical-align: top; width: auto; text-align: center;">
                            <tr>
                                <td colspan="2" style="height: 15px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="ALTA PRODUCTO CANASTA"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" style="text-align: right">
                                    <asp:Label ID="Label5" runat="server" Font-Size="10pt" Text="Pedido"></asp:Label>
                                </td>
                                <td class="auto-style2" style="text-align: left">
                                    <asp:TextBox ID="txtPedido" runat="server" Font-Size="9pt"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvImporte3" runat="server" ControlToValidate="txtPedido" Display="Dynamic" ErrorMessage="*Campo requerido" Font-Size="7pt" ValidationGroup="Inserta"></asp:RequiredFieldValidator>
                                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="Buscar" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="gvPedidos" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Serie,Folio,oficinaId" DataSourceID="sdsPedidos" EmptyDataText="No hay informacion para mostrar" Font-Size="9pt" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="gvPedidos_SelectedIndexChanged" Width="100%">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Select" Font-Size="9pt" Height="21px" Text="√" Width="27px" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="5%" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Serie" HeaderText="Serie" ReadOnly="True" SortExpression="Serie" />
                                            <asp:BoundField DataField="oficinaId" HeaderText="oficinaId" SortExpression="oficinaId" />
                                            <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                                            <asp:BoundField DataField="Tipo" HeaderText="Tipo" ReadOnly="True" SortExpression="Tipo" />
                                            <asp:BoundField DataField="cliente" HeaderText="cliente" SortExpression="cliente" />
                                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                                            <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
                                            <asp:BoundField DataField="Oficina" HeaderText="Oficina" SortExpression="Oficina" />
                                            <asp:BoundField DataField="agente" HeaderText="agente" SortExpression="agente" />
                                            <asp:BoundField DataField="partidas" HeaderText="partidas" ReadOnly="True" SortExpression="partidas" />
                                            <asp:BoundField DataField="surtido" HeaderText="surtido" ReadOnly="True" SortExpression="surtido" />
                                            <asp:BoundField DataField="compra" HeaderText="compra" ReadOnly="True" SortExpression="compra" />
                                            <asp:BoundField DataField="traspaso" HeaderText="traspaso" ReadOnly="True" SortExpression="traspaso" />
                                            <asp:BoundField DataField="surtir" HeaderText="surtir" ReadOnly="True" SortExpression="surtir" />
                                            <asp:BoundField DataField="folioDocumento" HeaderText="folioDocumento" ReadOnly="True" SortExpression="folioDocumento" />
                                            <asp:BoundField DataField="TIPO_DOC" HeaderText="TIPO_DOC" ReadOnly="True" SortExpression="TIPO_DOC" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sdsPedidos" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_listaSeguimientoPedidosBusqueda" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="strCodigoAgente" Type="String" />
                                            <asp:Parameter Name="intPedido" Type="Int32" />
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="intCliente" Type="String" />
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="strFechade" Type="String" />
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="strFechaHasta" Type="String" />
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="intOpciones" Type="Int32" />
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="strAgente" Type="String" />
                                            <asp:Parameter ConvertEmptyStringToNull="False" Name="strReferencia" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TPanel2" runat="server" HeaderText="Detalles">
                    <HeaderTemplate>
                        Busqueda
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="10" style="vertical-align: top; text-align: center;">
                            <tr>
                                <td style="height: 15px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="lblTitulo1" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="BUSCAR PRODUCTOS"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="dgvProductosCanasta" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="PK_PRODUCTO" DataSourceID="sdsProductosCanasta" EmptyDataText="No se encontraron resultados para la busqueda" Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowCommand="dgvProductosCanasta_RowCommand" PageSize="25" OnRowCreated="dgvProductosCanasta_RowCreated">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="NB_SUCURSAL" HeaderText="Suc" ReadOnly="True" SortExpression="NB_SUCURSAL" />
                                            <asp:TemplateField HeaderText="Agente" SortExpression="NB_AGENTE">
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblCD_AGENTE" runat="server" Text='<%# Eval("CD_AGENTE") %>' Visible="false" />
                                                    <asp:DropDownList ID="lstAgente" runat="server" DataSourceID="sdsAgente" DataTextField="NB_AGENTE" DataValueField="CD_AGENTE" Font-Size="9pt" >
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sdsAgente" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_listaVendedoresKepler_Parameter" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblCD_AGENTE" Name="CD_AGENTE" PropertyName="Text" Type="String" />
                                                            <asp:Parameter DefaultValue="1" Name="CD_TIPO" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgente" runat="server" Text='<%# Bind("NB_AGENTE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="NB_MARCA" HeaderText="Marca" ReadOnly="True" SortExpression="NB_MARCA" />
                                            <asp:BoundField DataField="CD_PRODUCTO" HeaderText="Id" ReadOnly="True" SortExpression="CD_PRODUCTO" />
                                            <asp:BoundField DataField="NB_PRODUCTO" HeaderText="Descripción" ReadOnly="True" SortExpression="NB_PRODUCTO" />
                                            <asp:BoundField DataField="CD_PEDIDO" HeaderText="Pedido" ReadOnly="True" SortExpression="CD_PEDIDO" />
                                            <asp:TemplateField HeaderText="Fecha" SortExpression="FH_DESVIO">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtFechaDesvio" runat="server" AutoPostBack="True" CssClass="date-pick" Font-Size="10pt" Text='<%# Bind("FH_DESVIO") %>' ToolTip="Día/Mes/Año" ValidationGroup="Inserta" Width="85px"></asp:TextBox>
                                                    <span>dd/mm/yyyy</span>
                                                    <asp:RequiredFieldValidator ID="rfvFecha1" runat="server" ControlToValidate="txtFechaDesvio" ErrorMessage="*Introduzca fecha valida" Font-Size="7pt" ValidationGroup="Inserta"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revFecha1" runat="server" ControlToValidate="txtFechaDesvio" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" OnServerValidate="txtFechaValidation" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFechaDesvio" runat="server" Text='<%# Bind("FH_DESVIO") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unidades" SortExpression="NU_UNIDADES">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtUnidades" runat="server" Font-Size="Small" Text='<%# Bind("NU_UNIDADES") %>' ValidationGroup="Actualiza" Width="85px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvImporte4" runat="server" ControlToValidate="txtUnidades" Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" ValidationGroup="preInserta"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revImporte2" runat="server" ControlToValidate="txtUnidades" Display="Dynamic" ErrorMessage="Valor entero" Font-Size="7pt" ValidationExpression="^\d+$" ValidationGroup="preInserta"></asp:RegularExpressionValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnidades0" runat="server" Text='<%# Bind("NU_UNIDADES") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="NU_TOT_EXISTENCIAS" HeaderText="Exi." ReadOnly="True" SortExpression="NU_TOT_EXISTENCIAS" />
                                            <asp:BoundField DataField="NU_TOT_MOVIMIENTOS" HeaderText="Mov." ReadOnly="True" SortExpression="NU_TOT_MOVIMIENTOS" />
                                            <asp:BoundField DataField="NU_TOT_DISPONIBLE" HeaderText="Total." ReadOnly="True" SortExpression="NU_TOT_DISPONIBLE" />
                                            <asp:BoundField DataField="NU_TOTAL" DataFormatString="{0:#,##0.00}" HeaderText="Total " ReadOnly="True" SortExpression="NU_TOTAL" />
                                            <asp:BoundField DataField="NU_PRESUPUESTO" HeaderText="Ppto en miles" ReadOnly="True" SortExpression="NU_PRESUPUESTO" />
                                            <asp:BoundField DataField="NU_PORCENTAJE" DataFormatString="{0:#,##0.00}" HeaderText="%" ReadOnly="True" SortExpression="NU_PORCENTAJE" />
                                            <asp:TemplateField HeaderText="ESTATUS" SortExpression="NB_ESTATUS">
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblCD_ESTATUS" runat="server" Text='<%# Eval("CD_ESTATUS") %>' Visible="false" />
                                                    <asp:DropDownList ID="lstEstatus" runat="server" DataSourceID="sdsEstatus" DataTextField="NB_ESTATUS" DataValueField="CD_ESTATUS" Font-Size="9pt">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sdsEstatus" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_EstatusCanastaProductos" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblCD_ESTATUS" Name="CD_ESTATUS" PropertyName="Text" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NB_ESTATUS") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Comentarios" SortExpression="NB_COMENTARIOS">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtComentarios" runat="server" Font-Size="Medium" Text='<%# Bind("NB_COMENTARIOS") %>' TextMode="MultiLine" Width="150px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblComentarios" runat="server" Text='<%# Bind("NB_COMENTARIOS") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:Button ID="Button4" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Update" Font-Size="8pt" Text="Actualizar" ValidationGroup="Actualizar" />
                                                    &nbsp;
                                                    <asp:Button ID="Button5" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button6" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnDelete" Runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Delete" OnClientClick="return confirm('Esta seguro que desea eliminar el registro?');">Eliminar
                                                    </asp:LinkButton>
                                                    <%-- <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Delete" 
                                                        Text="Delete" OnClientClick="return confirm('Esta seguro que desea eliminar el registro?');" OnClick="ImageButton1_Click1" /> --%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sdsProductosCanasta" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" DeleteCommand="set_updateCanastaProducto" DeleteCommandType="StoredProcedure" SelectCommand="get_CanastaProductos" SelectCommandType="StoredProcedure" UpdateCommand="set_updateCanastaProducto" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PK_PRODUCTO" Type="Int32" />
                                            <asp:Parameter Name="NU_UNIDADES" Type="Int32" />
                                            <asp:Parameter Name="FH_DESVIO" Type="DateTime" />
                                            <asp:Parameter DefaultValue="" Name="CD_ESTATUS" Type="Int32" />
                                            <asp:Parameter Name="NB_COMENTARIOS" Type="String" />
                                            <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PK_PRODUCTO" Type="Int32" />
                                            <asp:Parameter Name="NU_UNIDADES" Type="Int32" />
                                            <asp:Parameter Name="FH_DESVIO" Type="DateTime" />
                                            <asp:Parameter Name="CD_ESTATUS" Type="Int32" />
                                            <asp:Parameter Name="NB_COMENTARIOS" Type="String" />
                                            <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                            <asp:Parameter Name="CD_AGENTE" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>
                        Reporte
                     </HeaderTemplate>
                    <ContentTemplate>
                        
                        <table cellpadding="0" cellspacing="10" style="vertical-align: top; text-align: center;">
                            <tr>
                                <td style="height: 15px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="lblTitulo2" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="ACUMULADO POR ASESOR"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="dgvProductosCanasta0" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsProductosCanastaReporte" EmptyDataText="No se encontraron resultados para la busqueda" Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowCommand="dgvProductosCanasta_RowCommand" PageSize="25">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="NB_AGENTE" HeaderText="AGENTE" ReadOnly="True" SortExpression="NB_AGENTE" />
                                            <asp:BoundField DataField="NU_TOTAL" DataFormatString="{0:#,##0.00}" HeaderText="TOTAL" ReadOnly="True" SortExpression="NU_TOTAL" />
                                            <asp:BoundField DataField="NU_PRESUPUESTO" HeaderText="PRESUPUESTO" ReadOnly="True" SortExpression="NU_PRESUPUESTO" />
                                            <asp:BoundField DataField="NU_PORCENTAJE" DataFormatString="{0:#,##0.00}" HeaderText="PORC %" ReadOnly="True" SortExpression="NU_PORCENTAJE" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sdsProductosCanastaReporte" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" DeleteCommand="set_updateCanastaProducto" SelectCommand="get_CanastaProductosReporte" SelectCommandType="StoredProcedure" UpdateCommand="set_updateCanastaProducto">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PK_PRODUCTO" Type="Int32" />
                                            <asp:Parameter Name="NU_UNIDADES" Type="Int32" />
                                            <asp:Parameter Name="FH_DESVIO" Type="DateTime" />
                                            <asp:Parameter DefaultValue="" Name="CD_ESTATUS" Type="Int32" />
                                            <asp:Parameter Name="NB_COMENTARIOS" Type="String" />
                                            <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PK_PRODUCTO" Type="Int32" />
                                            <asp:Parameter Name="NU_UNIDADES" Type="Int32" />
                                            <asp:Parameter Name="FH_DESVIO" Type="DateTime" />
                                            <asp:Parameter Name="CD_ESTATUS" Type="Int32" />
                                            <asp:Parameter Name="NB_COMENTARIOS" Type="String" />
                                            <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />
                            <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" TargetControlID="btnInicial" 
                                BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="PanelModal" runat="server">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table style="background-color: #CCCCCC; border-style: inset; border-width: thin; vertical-align: top; text-align: center">
                                        <tr>
                                            <td style="text-align:left">
                                                <asp:Label ID="lblSerie" runat="server"></asp:Label>
                                                <asp:Label ID="lblFolio" runat="server"></asp:Label>
                                                <asp:Label ID="lblSucursal" runat="server"></asp:Label>
                                                <asp:Label ID="lblAgente" runat="server"></asp:Label>
                                                <br />
                                                <asp:GridView ID="dgvDetallePedido" runat="server" AutoGenerateColumns="False" DataSourceID="sdsPedidoDetalle" Font-Size="7pt" ForeColor="#333333" GridLines="None" PageSize="4" Width="429px" DataKeyNames="oficinaId,NB_AGENTE,CD_AGENTE,Codigo,NB_MARCA,NB_PRODUCTO,folioPedido,NU_UNIDADES,FH_DESVIO,NB_COMENTARIOS,FH_PEDIDO,CD_SELECT" OnRowCommand="dgvDetallePedido_RowCommand">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkall" runat="server" AutoPostBack="True" oncheckedchanged="chkall_CheckedChanged" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                 <asp:CheckBox ID="chkPedidos" runat="server" Checked='<%#Convert.ToBoolean(Eval("CD_SELECT")) %>'  AutoPostBack="true" OnCheckedChanged="chkPedidos_CheckedChanged" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" SortExpression="Descripcion" />
                                                        <asp:TemplateField HeaderText="Agente" SortExpression="NB_AGENTE">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblCD_AGENTE" runat="server" Text='<%# Eval("CD_AGENTE") %>' Visible="false" />
                                                                <asp:DropDownList ID="lstAgente" runat="server" DataSourceID="sdsAgente" DataTextField="NB_AGENTE" DataValueField="CD_AGENTE" Font-Size="9pt" >
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="sdsAgente" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_listaVendedoresKepler_Parameter" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblCD_AGENTE" Name="CD_AGENTE" PropertyName="Text" Type="String" />
                                                                        <asp:Parameter DefaultValue="1" Name="CD_TIPO" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("NB_AGENTE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Unidades" SortExpression="NU_UNIDADES">
                                                             <EditItemTemplate>
                                                                    <asp:TextBox ID="txtUnidades" runat="server" Font-Size="10pt" Text='<%# Bind("NU_UNIDADES") %>' ValidationGroup="preInserta"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvImporte2" runat="server" ControlToValidate="txtUnidades" Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" ValidationGroup="preInserta"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="revImporte1" runat="server" ControlToValidate="txtUnidades" Display="Dynamic" ErrorMessage="Valor entero" Font-Size="7pt" ValidationExpression="^\d+$" ValidationGroup="preInserta"></asp:RegularExpressionValidator>
                                                             </EditItemTemplate>
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblUnidades" runat="server" Text='<%# Bind("NU_UNIDADES") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fecha" SortExpression="FH_DESVIO">
                                                             <EditItemTemplate>
                                                                  <asp:TextBox ID="txtFechaDesvio" runat="server" AutoPostBack="True" Font-Size="10pt"  ToolTip="Día/Mes/Año" ValidationGroup="preInserta" Width="85px" Text='<%# Bind("FH_DESVIO") %>'></asp:TextBox>
                                                                 <asp:CalendarExtender ID="calC1" runat="server" TargetControlID="txtFechaDesvio"></asp:CalendarExtender>
                                                                 <%--<asp:RequiredFieldValidator ID="rfvFecha0" runat="server" ControlToValidate="txtFechaDesvio" ErrorMessage="*Introduzca fecha valida" Font-Size="7pt" ValidationGroup="preInserta"></asp:RequiredFieldValidator>
                                                                 <asp:RegularExpressionValidator ID="revFecha0" runat="server" ControlToValidate="txtFechaDesvio" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" ValidationGroup="preInserta" OnServerValidate="txtFechaValidation" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>--%>
                                                                 <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="ValidateDate" ControlToValidate="txtFechaDesvio" ErrorMessage="CustomValidator" Font-Size="7pt"  ValidationGroup="preInserta">fecha invalida: dd/mm/aaaa</asp:CustomValidator>
                                                             </EditItemTemplate>
                                                             <ItemTemplate>
                                                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("FH_DESVIO") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Comentarios" SortExpression="NB_COMENTARIOS">
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="txtComentarios" runat="server" Height="35px" TextMode="MultiLine" Width="150px" Font-Size="Medium" Text='<%# Bind("NB_COMENTARIOS") %>'></asp:TextBox>
                                                             </EditItemTemplate>
                                                             <ItemTemplate>
                                                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("NB_COMENTARIOS") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField ShowHeader="False">
                                                                <EditItemTemplate>
                                                                    <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True" ValidationGroup="preInserta"
                                                                        CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;
                                                                    <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                                                        CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                                                        CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                                                                </ItemTemplate>
                                                          </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="20px" />
                                                    <PagerSettings PageButtonCount="5" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="15px" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                </asp:GridView>
                                                <asp:ImageButton ID="btnCerrarPopUp" runat="server" ImageUrl="~/Imagenes/cancel.png" OnClick="btnCerrarPopUp_Click" Width="32px" />
                                                <asp:ImageButton ID="btnInsertar" runat="server" ImageUrl="~/Imagenes/arrow_up_48.png" OnClick="btnInsertar_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:SqlDataSource ID="sdsPedidoDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_datosPartidaPedidoPendiente" SelectCommandType="StoredProcedure" InsertCommand="set_Inserta_CanastaProducto" UpdateCommand="print 'truco'">
                                                    <InsertParameters>
                                                        <asp:Parameter Name="CD_SUCURSAL" Type="String" />
                                                        <asp:Parameter Name="CD_AGENTE" Type="String" />
                                                        <asp:Parameter Name="CD_PRODUCTO" Type="String" />
                                                        <asp:Parameter Name="NB_PRODUCTO" Type="String" />
                                                        <asp:Parameter Name="NB_MARCA" Type="String" />
                                                        <asp:Parameter Name="NU_UNIDADES" Type="Int32" />
                                                        <asp:Parameter Name="FH_DESVIO" Type="DateTime" />
                                                        <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                                        <asp:Parameter Name="CD_ALMACEN" Type="Int32" />
                                                        <asp:Parameter Name="CD_PEDIDO" Type="String" />
                                                        <asp:Parameter Name="NB_COMENTARIOS" Type="String" />
                                                        <asp:Parameter Name="CD_TIPO" Type="Int32" />
                                                        <asp:Parameter Direction="InputOutput" Name="Res" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblSerie" Name="strSerie" PropertyName="Text" Type="String" />
                                                        <asp:ControlParameter ControlID="lblFolio" Name="intFolio" PropertyName="Text" Type="String" />
                                                        <asp:ControlParameter ControlID="lblSucursal" Name="intOficinaId" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                </ContentTemplate>
                         </asp:UpdatePanel>
                        </asp:Panel>
    </asp:Content>

