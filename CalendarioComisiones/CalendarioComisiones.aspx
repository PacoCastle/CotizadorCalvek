<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CalendarioComisiones.aspx.cs" Inherits="CalendarioComisiones_CalendarioComisiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .CustomTabStyle .ajax__tab_header {
            font-family: verdana,tahoma,helvetica;
            font-size: 13px;
            background: url('../imagenes/Tabs/tab-line.gif') repeat-x bottom;
        }

        .CustomTabStyle .ajax__tab_outer {
            padding-right: 4px;
            background: url('../../imagenes/Tabs/tab-right.gif') no-repeat right;
            height: 21px;
        }

        .CustomTabStyle .ajax__tab_inner {
            padding-left: 3px;
            background: url('../../imagenes/Tabs/tab-left.gif') no-repeat;
        }

        .CustomTabStyle .ajax__tab_tab {
            height: 13px;
            padding: 4px;
            margin: 0;
            background: url('../../imagenes/Tabs/tab.gif') repeat-x;
        }

        .CustomTabStyle .ajax__tab_hover .ajax__tab_outer {
            background: url('../../imagenes/Tabs/tab-hover-right.gif') no-repeat right;
        }

        .CustomTabStyle .ajax__tab_hover .ajax__tab_inner {
            background: url('../../imagenes/Tabs/tab-hover-left.gif') no-repeat;
        }

        .CustomTabStyle .ajax__tab_hover .ajax__tab_tab {
            background: url('../../imagenes/Tabs/tab-hover.gif') repeat-x;
        }

        .CustomTabStyle .ajax__tab_active .ajax__tab_outer {
            background: url('../../imagenes/Tabs/tab-active-right.gif') no-repeat right;
        }

        .CustomTabStyle .ajax__tab_active .ajax__tab_inner {
            background: url('../../imagenes/Tabs/tab-active-left.gif') no-repeat;
        }

        .CustomTabStyle .ajax__tab_active .ajax__tab_tab {
            background: url('../../imagenes/Tabs/tab-active.gif') repeat-x;
        }

        .CustomTabStyle .ajax__tab_body {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            border: 1px solid #ffffff;
            border-top: 0;
            padding: 8px;
            background-color: #ffffff;
        }

        .TestCssStyle {
            text-align: left;
            font-weight: bold;
            font-size: x-large;
            padding: 2px;
            background-color: silver;
            border-collapse: separate;
        }

        .modalpopup {
            min-width: 200px;
            min-height: 150px;
            background: white;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 1px 1px 16px 0px rgba(255, 255, 255, 0.55);
            -moz-box-shadow: 1px 1px 16px 0px rgba(255, 255, 255, 0.55);
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
            z-index: 10001;
        }

        .popupCorrecto {
            border-style: solid;
            border-color: #F3F5F5;
            background-color: #F3F5F5;
            margin: 1em;
            width: 300px;
            height: 175px;
            text-align: center;
        }

        .style2 {
            width: 300px;
            height: 10px;
            text-align: left;
            font-size: 14px;
        }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {

            $(function () {
                $("#" + '<%=txtFechaCalendario.ClientID%>').datePicker({
                                startDate: '01/01/2015'
                            });
                        });


            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#" + '<%=txtFhInicioGt.ClientID%>').datePicker({
                    startDate: '01/01/2015'
                }).attr('readOnly', 'true');
            }

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandlerV);
            function EndRequestHandlerV(sender, args) {
                $("#" + '<%=txtFhVigenciaGt.ClientID%>').datePicker({
                                startDate: '01/01/2015'
                            }).attr('readOnly', 'true');
            }

            $(function () {
                $("#" + '<%=txtFhInicioEdit.ClientID%>').datePicker({
                    startDate: '01/01/2015'
                }).attr('readOnly', 'true');
            });

            $(function () {
                $("#" + '<%=txtFhVigenciaEdit.ClientID%>').datePicker({
                    startDate: '01/01/2015'
                }).attr('readOnly', 'true');
            });
        });

    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <contenttemplate>
        <asp:TabContainer ID="TabComisiones" runat="server" ActiveTabIndex="0" AutoPostBack="True" 
                BorderStyle="None" CssClass="CustomTabStyle" ScrollBars="Auto" Width="100%" OnActiveTabChanged="tabContainer_ActiveTabChanged">
            <asp:TabPanel ID="TPnlModifica" runat="server" HeaderText="General">
                <HeaderTemplate>
                        Calendario de Comisiones
                </HeaderTemplate>
                <ContentTemplate>   
                        <div>
                            <table style="vertical-align: top; width: 100%; text-align: center;">
                                <tr>
                                    <td style="height: 17px; text-align: center; background-color: #5d7b9d;">
                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="Calendario de Comisiones"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <asp:Button ID="btnAgregar" runat="server" Font-Size="9pt" CausesValidation="false" OnClick="btnAlta_Click"
                                        Height="20px" Text="Agregar" Width="80px" BackColor="#5d7b9d" ForeColor="White" AutoPostBack="True"/>
                                </tr>
                            </table>
                        </div>
                        <div runat="server" id="AgregaFechaDiv">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFechaCalendario" runat="server" AutoPostBack="True"  Font-Size="10pt" ToolTip="Día/Mes/Año" Width="170px" ValidationGroup="AgregaFecha"></asp:TextBox>
                                        <span style="font-size: 4pt">DD/MM/AAAA</span>
                                        <asp:Label ID="lblUsuario" runat="server" Font-Size="10pt" Visible="False"></asp:Label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFechaCalendario" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="FechaRequired" runat="server" ControlToValidate="txtFechaCalendario" ValidationGroup="AgregaFecha"
                                            ErrorMessage="El campo fecha es obligatorio" InitialValue="0" Font-Size="7pt"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table>
                                <tr>
                                    <td style="width: 90px">
                                        <asp:Button ID="btnAgregarFecha" runat="server" Font-Size="9pt" CausesValidation="false" AutoPostBack="True"
                                            Height="20px" Text="Aceptar" Width="80px" BackColor="#5d7b9d" ForeColor="White" OnClick="btnAgregar_OnClick"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" Font-Size="9pt" CausesValidation="false" AutoPostBack="True"
                                            Height="20px" Text="Cancelar" Width="80px" OnClick="btnCancelar_OnClick" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table style="vertical-align: top; width: 100%; text-align: center;">
                                <tr>
                                    <td style="height: 2px; text-align: center; background-color: #5d7b9d;">
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Height="2px" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div runat="server" id="GridFechasDiv">
                            <table align="center">
                                <tr>
                                    <td>
                                        <asp:GridView ID="dgvFechasComision" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsFechasComision" EmptyDataText="No se encontraron resultados para la busqueda"
                                            Font-Size="8pt" ForeColor="#333333" GridLines="None" DataKeyNames="idCalendario" Width="600px" OnRowDataBound="fechasComision_RowDataBound" RowStyle-Height="20px" AllowPaging="True" PageSize="12">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:BoundField DataField="idCalendario" HeaderText="idCalendario" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="idCalendario"></asp:BoundField>
                                                <asp:BoundField DataField="fechaCalendario" HeaderText="Fecha Calendario" ReadOnly="True" SortExpression="fechaCalendario"></asp:BoundField>
                                                <asp:BoundField DataField="fechaModificacion" HeaderText="Fecha Modificación" ReadOnly="True" SortExpression="fechaModificacion"></asp:BoundField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:UpdatePanel ID="UpdBtn" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Button ID="actualizaEstatusBtn" HeaderText="Eliminar" runat="server" OnClick="actualizaEstatus_OnClick" CommandArgument='<%# Eval("idCalendario")%> ' ToolTip="Eliminar"
                                                                    Style="background-image:url('../Imagenes/trash.png');width: 20px; height:20px;background-repeat: no-repeat; border: 0" />
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="actualizaEstatusBtn" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="50px" HorizontalAlign="Center" />
                                                    <HeaderTemplate>Eliminar</HeaderTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sdsFechasComision" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>'
                                            SelectCommand="get_fechasCalendarioComisiones" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </div>             
                </ContentTemplate>
                </asp:TabPanel>
                <%--TAB DE AGENTES--%> 
                <asp:TabPanel ID="TabAgentes" runat="server" HeaderText="General">
                <HeaderTemplate>
                        Agentes / Garantias
                </HeaderTemplate> 
                <ContentTemplate>
                    <asp:UpdatePanel ID="upAddAgente" runat="server">
                    <Triggers>
                        
                    </Triggers>
                             <ContentTemplate>
                                    <div>
                                        <table style="vertical-align: top; width: 100%; text-align: center;">
                                            <tr>
                                                <td style="height: 17px; text-datealign: center; background-color: #5d7b9d;">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="Catalogo de Agentes / Garantias"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />  
                                    <div>
                                        <table>
                                            <tr>
                                                <asp:Button ID="btnShowAgente" runat="server" Font-Size="9pt" CausesValidation="false" OnClick="btnShowAgente_Click"
                                                    Height="20px" Text="Agregar" Width="80px" BackColor="#5d7b9d" ForeColor="White" AutoPostBack="True"/>
                                            </tr>
                                        </table>
                                    </div>
                                    <div runat="server" id="AgregaAgenteDiv">                         
                                        <table>
                                         <tr>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                                                <asp:Label ID="LblAgentes" runat="server" Font-Size="9pt" Text="Agente:"></asp:Label>                
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="lstAgentes" runat="server" Width="150px" DataSourceID="sdsAgentesLst"  Font-Size="9pt" ValidationGroup="valida"
                                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True">
                                                </asp:DropDownList>               
                                                <asp:SqlDataSource ID="sdsAgentesLst" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboAgentesCat" 
                                                    SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="agentesLstRequired" runat="server" ControlToValidate="lstAgentes"  ValidationGroup="valida"
                                                ErrorMessage="El campo Agente es obligatorio" InitialValue=" " Font-Size="7pt"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label6" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                                                <asp:Label ID="lblOficinas" runat="server" Font-Size="9pt" Text="Oficina:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="lstOficinas" runat="server" Width="150px" DataSourceID="sdsOficinasLst"  Font-Size="9pt" ValidationGroup="valida"
                                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True" OnSelectedIndexChanged="oficina_onChange">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sdsOficinasLst" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboOficinasAgentes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="oficinaLstRequired" runat="server" ControlToValidate="lstOficinas"  ValidationGroup="valida"
                                                ErrorMessage="El campo Oficina es obligatorio" InitialValue=" " Font-Size="7pt"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp&nbsp&nbsp<asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="Sucursal:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSucursal" runat="server" CausesValidation="false" AutoPostBack="True" Font-Size="9pt" Width="146px"/>
                                            </td>
                                        </tr>
                                        </table>
                                         <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                                                    <asp:Label ID="lblPuesto" runat="server" Font-Size="9pt" Text="Puesto:"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp&nbsp&nbsp<asp:DropDownList ID="lstPuesto" runat="server" Width="150px" DataSourceID="sdsPuestoLst"  Font-Size="9pt" ValidationGroup="valida"
                                                    DataTextField="nombre" DataValueField="valor" AutoPostBack="true" OnSelectedIndexChanged="puesto_onChange">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sdsPuestoLst" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboPuestoAg" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    <asp:RequiredFieldValidator ID="puestoLstRequired" runat="server" ControlToValidate="lstPuesto"  ValidationGroup="valida"
                                                    ErrorMessage="El campo Puesto es obligatorio" InitialValue=" " Font-Size="7pt"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>  
                                        <br />
                                                <div runat="server" id="AgregaGarantiaDiv">
                                                    <table style="position:relative; left: 100px">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label9" runat="server" Font-Size="9pt" Text="Garantia:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtGarantia" runat="server" CausesValidation="false"  Font-Size="9pt" Width="116px"/>
                                                                <asp:Button ID="infoAgt" runat="server" ToolTip="Ayuda" CausesValidation="false" OnClick="ayudaGarantia_OnClick"
                                                                        Style="background-image: url('../Imagenes/kub-help.png'); width: 16px; height:18px; background-repeat: no-repeat;border-color:#26276C; border: 1; background-color:#26276C" />
                                                                <asp:RegularExpressionValidator 
                                                                    ID="revTxtGarantia" runat="server" ControlToValidate="txtGarantia"
                                                                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,4})?$" ValidationGroup="valida">
                                                                </asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label10" runat="server" Font-Size="9pt" Text="Inicio:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFhInicioGt" runat="server" AutoPostBack="true" Font-Size="9pt" ToolTip="Día/Mes/Año" Width="116px"></asp:TextBox>
                                                                <span style="font-size: 4pt">DD/MM/AAAA</span>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label11" runat="server" Font-Size="9pt" Text="Vigencia:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFhVigenciaGt" runat="server" AutoPostBack="true" Font-Size="9pt" ToolTip="Día/Mes/Año" Width="116px"></asp:TextBox>
                                                                <span style="font-size: 4pt">DD/MM/AAAA</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table style="position:relative; left: 100px">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblValidaFechas" runat="server" Font-Size="7pt" ForeColor="Red"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                              </div>  
                                        <table>
                                            <tr>
                                                <td style="width: 90px">
                                                    <asp:Button ID="btnAddAgente" runat="server" Font-Size="9pt"   ValidationGroup="valida" AutoPostBack="true"
                                                        Height="20px" Text="Aceptar" Width="80px" BackColor="#5d7b9d" ForeColor="White" OnClick="btnAgregarAgente_OnClick"/>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnCancelAgente" runat="server" Font-Size="9pt" CausesValidation="false" AutoPostBack="true"
                                                        Height="20px" Text="Cancelar" Width="80px" OnClick="btnCancelarAgente_OnClick" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table style="vertical-align: top; width: 100%; text-align: center;">
                                            <tr>
                                                <td style="height: 2px; text-align: center; background-color: #5d7b9d;">
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="White" Height="2px" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                        </table>                   
                                        </div>
                                        <br />
                                        <div runat="server" id="grdFiltrosDiv">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label14" runat="server" Font-Size="9pt" Text="Agente:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="lstAgentesFltr" runat="server" Width="150px" DataSourceID="sdsAgentesFltr"  Font-Size="9pt" 
                                                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sdsAgentesFltr" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboAgentesFltr" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        &nbsp&nbsp<asp:Label ID="Label15" runat="server" Font-Size="9pt" Text="Puesto:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="lstPuestosFltr" runat="server" Width="150px" DataSourceID="sdsPuestosFltr"  Font-Size="9pt" 
                                                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sdsPuestosFltr" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboPuestosFltr" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        &nbsp&nbsp<asp:Label ID="Label16" runat="server" Font-Size="9pt" Text="Sucursal:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="lstSucursalesFltr" runat="server" Width="150px" DataSourceID="sdsSucursalesFltr"  Font-Size="9pt" 
                                                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    <asp:TextBox ID="txtAgenteGarantiaOc" runat="server" AutoPostBack ="true" Visible="false"></asp:TextBox>
                                                    <asp:SqlDataSource ID="sdsSucursalesFltr" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboSucursalesFltr" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table style="vertical-align: top; width: 100%; text-align: center;">
                                                <tr>
                                                <td>
                                                        <asp:GridView ID="dgvAgentesGarantias" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsAsesoresGarantia" EmptyDataText="No se encontraron resultados para la busqueda"
                                                            Font-Size="8pt" ForeColor="#333333" GridLines="None" DataKeyNames="ID_AGENTE_GARANTIA" Width="100%" RowStyle-Height="16px" AllowPaging="True" PageSize="15" onRowDataBound="dgvAgentesGarantias_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:BoundField DataField="ID_AGENTE_GARANTIA" HeaderText="Id Agente Garantia" SortExpression="ID_AGENTE_GARANTIA" Visible="false"></asp:BoundField>
                                                            <asp:BoundField DataField="ID_AGENTE" HeaderText="Id" SortExpression="ID_AGENTE"></asp:BoundField>
                                                            <asp:BoundField DataField="NB_AGENTE" HeaderText="Agente" SortExpression="NB_AGENTE"></asp:BoundField>
                                                            <asp:BoundField DataField="ID_PUESTO" HeaderText="Agente" SortExpression="ID_PUESTO" Visible="false"></asp:BoundField>  
                                                            <asp:BoundField DataField="NB_PUESTO" HeaderText="Agente" SortExpression="NB_PUESTO"></asp:BoundField>                                                                                       
                                                            <asp:BoundField DataField="NB_SUCURSAL_ACTUAL" HeaderText="Sucursal" SortExpression="NB_SUCURSAL_ACTUAL"></asp:BoundField>
                                                            <asp:BoundField DataField="NB_OFICINA_ACTUAL" HeaderText="Oficina" SortExpression="NB_OFICINA_ACTUAL"></asp:BoundField>
                                                            <asp:BoundField DataField="FA_GARANTIA" HeaderText="Garantia" ReadOnly="True" SortExpression="FA_GARANTIA"></asp:BoundField>
                                                            <asp:BoundField DataField="FH_INICIO_GARANTIA" HeaderText="Fecha Inicio" ReadOnly="True" SortExpression="FH_INICIO_GARANTIA"></asp:BoundField>
                                                            <asp:BoundField DataField="FH_VIGENCIA_GARANTIA" HeaderText="Fecha Vigencia" ReadOnly="True" SortExpression="FH_VIGENCIA_GARANTIA"></asp:BoundField>

                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:UpdatePanel ID="UpdAgentePanel" runat="server" UpdateMode="Conditional">
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="UpdAgenteBtn" />
                                                                    </Triggers>
                                                                    <ContentTemplate>
                                                                        <asp:Button ID="UpdAgenteBtn" HeaderText="Editar" runat="server" OnClick="buscaEditAgt_OnClick" CommandArgument='<%# Eval("ID_AGENTE_GARANTIA")%> '
                                                                            Style="background-image: url('../Imagenes/edit-16.jpg'); width: 16px; height:16px; background-repeat: no-repeat; border: 0" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </ItemTemplate>
                                                            <HeaderStyle Width="50px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>Editar</HeaderTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:UpdatePanel ID="UpdAgentePane2" runat="server" UpdateMode="Conditional">
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="DltAgenteBtn" />
                                                                    </Triggers>
                                                                    <ContentTemplate>
                                                                        <asp:Button ID="DltAgenteBtn" HeaderText="Eliminar" runat="server" OnClick="deleteAgt_OnClick" CommandArgument='<%# Eval("ID_AGENTE_GARANTIA")%> '
                                                                            Style="background-image: url('../Imagenes/trash.png'); width: 16px; height:16px; background-repeat: no-repeat; border: 0" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </ItemTemplate>
                                                            <HeaderStyle Width="50px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>Eliminar</HeaderTemplate>
                                                        </asp:TemplateField>
                                        
                                                        </Columns> 
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:GridView>                            
                                                    <asp:SqlDataSource ID="sdsAsesoresGarantia" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_buscaAgentesGarantia" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lstAgentesFltr" PropertyName="SelectedValue" DefaultValue=" " Name="fltrAgente" Type="String"></asp:ControlParameter>
                                                            <asp:ControlParameter ControlID="lstPuestosFltr" PropertyName="SelectedValue" DefaultValue=" " Name="fltrPuesto" Type="String"></asp:ControlParameter>
                                                            <asp:ControlParameter ControlID="lstSucursalesFltr" PropertyName="SelectedValue" DefaultValue=" " Name="fltrSucursal" Type="String"></asp:ControlParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                      
                            </ContentTemplate>
                    </asp:UpdatePanel>
                <div runat="server" id="EditAgenteDiv">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label18" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Font-Size="9pt" Text="Agente:"></asp:Label>                
                            </td>
                            <td>
                                <asp:DropDownList ID="lstAgentesEdit" runat="server" Width="150px" DataSourceID="sdsAgentesLst2"  Font-Size="9pt" ValidationGroup="validaEditar"
                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True">
                                </asp:DropDownList>               
                                <asp:SqlDataSource ID="sdsAgentesLst2" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboAgentesCat" 
                                    SelectCommandType="StoredProcedure">
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="Rfv1" runat="server" ControlToValidate="lstAgentesEdit"  ValidationGroup="validaEditar"
                                ErrorMessage="El campo Agente es obligatorio" InitialValue=" " Font-Size="7pt"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                                <asp:Label ID="Label23" runat="server" Font-Size="9pt" Text="Oficina:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="lstOficinaEdit" runat="server" Width="150px" DataSourceID="sdsOficinasLst2"  Font-Size="9pt" ValidationGroup="validaEditar"
                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsOficinasLst2" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboOficinasAgentes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lstOficinaEdit"  ValidationGroup="validaEditar"
                                ErrorMessage="El campo Oficina es obligatorio" InitialValue=" " Font-Size="7pt"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp&nbsp&nbsp<asp:Label ID="Label24" runat="server" Font-Size="9pt" Text="Sucursal:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSucursarEdit" runat="server" CausesValidation="false" AutoPostBack="True" Font-Size="9pt" Width="146px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label25" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                                <asp:Label ID="Label26" runat="server" Font-Size="9pt" Text="Puesto:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="lstPuestoEdit" runat="server" Width="150px" DataSourceID="sdsPuestoLst2"  Font-Size="9pt" ValidationGroup="validaEditar"
                                DataTextField="nombre" DataValueField="valor" AutoPostBack="true" OnSelectedIndexChanged="puestoEditar_onChange">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsPuestoLst2" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboPuestoAg" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstPuestoEdit"  ValidationGroup="validaEditar"
                                ErrorMessage="El campo Puesto es obligatorio" InitialValue=" " Font-Size="7pt"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div  runat="server" id="garantiaFhEditDiv">
                        <table style="position:relative; left:100px">
                            <tr>
                                <td>
                                    <asp:Label ID="Label27" runat="server" Font-Size="9pt" Text="Garantia:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGarantiaEdit" runat="server" CausesValidation="false"  Font-Size="9pt" Width="116px"/>
                                    <asp:Button ID="Button7" runat="server" ToolTip="Ayuda" CausesValidation="false" OnClick="ayudaGarantia_OnClick"
                                            Style="background-image: url('../Imagenes/kub-help.png'); width: 16px; height:18px; background-repeat: no-repeat;border-color:#26276C; border: 1; background-color:#26276C" />
                                    <asp:RegularExpressionValidator 
                                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtGarantiaEdit"
                                        Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,4})?$" ValidationGroup="valida">
                                    </asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label20" runat="server" Font-Size="9pt" Text="Inicio:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFhInicioEdit" runat="server" AutoPostBack="true" Font-Size="9pt" ToolTip="Día/Mes/Año" Width="116px"></asp:TextBox>
                                    <span style="font-size: 4pt">DD/MM/AAAA</span>
                                </td>
                                <td>
                                    <asp:Label ID="Label21" runat="server" Font-Size="9pt" Text="Vigencia:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFhVigenciaEdit" runat="server" AutoPostBack="true" Font-Size="9pt" ToolTip="Día/Mes/Año" Width="116px"></asp:TextBox>
                                    <span style="font-size: 4pt">DD/MM/AAAA</span>
                                </td>
                            </tr>
                        </table>
                        <table style="position:relative; left: 100px">
                            <tr>
                                <td>
                                    <asp:Label ID="lblValidaFechas2" runat="server" Font-Size="7pt" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <table>
                        <tr>
                            <td style="width: 90px">
                                <asp:Button ID="btnEditAcept" runat="server" Font-Size="9pt"   ValidationGroup="valida" AutoPostBack="true"
                                    Height="20px" Text="Editar" Width="80px" BackColor="#5d7b9d" ForeColor="White" OnClick="btnEditAgt_OnClick"/>
                            </td>
                            <td>
                                <asp:Button ID="btnEditCancel" runat="server" Font-Size="9pt" CausesValidation="false" AutoPostBack="true"
                                    Height="20px" Text="Cancelar" Width="80px" OnClick="btnCancelarAgenteEdit_OnClick" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table style="vertical-align: top; width: 100%; text-align: center;">
                        <tr>
                            <td style="height: 2px; text-align: center; background-color: #5d7b9d;">
                                <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="White" Height="2px" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table> 
                </div>
                </ContentTemplate>
                </asp:TabPanel>
        </asp:TabContainer>
   </contenttemplate>

    <%--PUPUPS--%>
    <div>
        <asp:Button ID="btnInicio" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup1" runat="server" Enabled="True" TargetControlID="btnInicio" BackgroundCssClass="modalBackground" PopupControlID="PanelOperacionCorrecta" />
        <asp:Panel ID="PanelOperacionCorrecta" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="popClose" runat="server" Font-Bold="True" CausesValidation="false" AutoPostBack="True"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <img src="../Imagenes/Msj_OperacionExitosa.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button2" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup2" runat="server" Enabled="True" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PanelExisteFecha" />
        <asp:Panel ID="PanelExisteFecha" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" CausesValidation="false" AutoPostBack="True"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <img src="../Imagenes/Msj_Info_FechaActiva.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button3" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup3" runat="server" Enabled="True" TargetControlID="Button3" BackgroundCssClass="modalBackground" PopupControlID="Panel1" />
        <asp:Panel ID="Panel1" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" CausesValidation="false" AutoPostBack="True"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <img src="../Imagenes/Msj_Error_Fecha.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button4" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup4" runat="server" Enabled="True" TargetControlID="Button4" BackgroundCssClass="modalBackground" PopupControlID="Panel2" />
        <asp:Panel ID="Panel2" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" CausesValidation="false" AutoPostBack="True"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>                      
                        <img src="../Imagenes/Msj_Info_Agt_Existe.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button5" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup5" runat="server" Enabled="True" TargetControlID="Button5" BackgroundCssClass="modalBackground" PopupControlID="Panel3" />
        <asp:Panel ID="Panel3" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" CausesValidation="false" AutoPostBack="True"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <img src="../Imagenes/Msj_Error_Agt_ErrorOper.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button6" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup6" runat="server" Enabled="True" TargetControlID="Button6" BackgroundCssClass="modalBackground" PopupControlID="Panel4" />
        <asp:Panel ID="Panel4" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" CausesValidation="false" AutoPostBack="True"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <img src="../Imagenes/Msj_Info_Agt_InfoGarantia.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>

