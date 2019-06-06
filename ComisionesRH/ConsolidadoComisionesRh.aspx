<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsolidadoComisionesRh.aspx.cs" Inherits="CoverScreen.ComisionesRH_ConsolidadoComisionesRh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
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

        .overlay  
        {
          position: fixed;
          z-index: 98;
          top: 0px;
          left: 0px;
          right: 0px;
          bottom: 0px;
            background-color: Black; 
            filter: alpha(opacity=80); 
            opacity: 0.8; 
        }
        .overlayContent
        {
          z-index: 99;
          margin: 250px auto;
          width: 80px;
          height: 80px;
        }
        .overlayContent h2
        {
            font-size: 18px;
            font-weight: bold;
            color: #000;
        }
        .overlayContent img
        {
          width: 80px;
          height: 80px;
        }
    </style>

    <script type="text/javascript">
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upAddAgente" runat="server">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <div>
                <table style="vertical-align: top; width: 100%; text-align: center;">
                    <tr>
                        <td style="height: 17px; text-datealign: center; background-color: #5d7b9d;">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="Consolidado de Comisiones"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <div>
                <asp:UpdatePanel ID="upAddAgente2" runat="server">
                    <ContentTemplate>
                        <table style="width: 100%; text-align: right">
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Font-Size="10pt" Text="Congelar mes "></asp:Label>
                                    <asp:Label ID="txtMesCong" runat="server" Font-Size="10pt"></asp:Label>
                                    <asp:Button ID="btnCongelar" runat="server" Font-Size="9pt" AutoPostBack="true"
                                        Height="20px" Text="Ir" Width="50px" BackColor="#5d7b9d" ForeColor="White" OnClick="congelaCom_OnClick" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Size="10pt" Text="Año:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="lstYear" runat="server" AutoPostBack="True" DataSourceID="sdsYear" DataTextField="año" DataValueField="año" Font-Size="9pt" Width="100px" OnSelectedIndexChanged="lstAnio_onChange"/>
                            <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_obtiene_año_coms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text="Mes:"></asp:Label>
                        </td>
                        <td>
                            <%--                            <asp:DropDownList ID="lstMes" runat="server" AutoPostBack="True" Font-Size="9pt" Width="100px">
                                <asp:ListItem Value="1">Enero</asp:ListItem>
                                <asp:ListItem Value="2">Febrero</asp:ListItem>
                                <asp:ListItem Value="3">Marzo</asp:ListItem>
                                <asp:ListItem Value="4">Abril</asp:ListItem>
                                <asp:ListItem Value="5">Mayo</asp:ListItem>
                                <asp:ListItem Value="6">Junio</asp:ListItem>
                                <asp:ListItem Value="7">Julio</asp:ListItem>
                                <asp:ListItem Value="8">Agosto</asp:ListItem>
                                <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>--%>
                            <asp:DropDownList ID="lstMes" runat="server" AutoPostBack="True" DataSourceID="sdsMesDif" DataTextField="nombre"
                                DataValueField="valor" Font-Size="9pt" Width="100px" OnSelectedIndexChanged="lstMes_onChange" />
                            <asp:SqlDataSource ID="sdsMesDif" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_comboMesPorAnio" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstYear" PropertyName="SelectedValue" DefaultValue="0" Name="a&#241;oActual" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Size="10pt" Text="Sucursal:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="lstSucursales" runat="server" AutoPostBack="True" Font-Size="9pt" Width="100px">
                                <asp:ListItem Value="1">San Luis</asp:ListItem>
                                <asp:ListItem Value="2">Queretaro</asp:ListItem>
                                <asp:ListItem Value="3">Celaya</asp:ListItem>
                                <asp:ListItem Value="4">Irapuato</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="vertical-align: top; width: 400px; text-align: center;">
                    <tr>
                        <td>
                            <asp:GridView ID="dgvComPorOficina" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsComPorOficina" EmptyDataText="No se encontraron resultados para la busqueda"
                                Font-Size="8pt" ForeColor="#333333" GridLines="None" Width="400px" RowStyle-Height="16px" AllowPaging="True" PageSize="15" OnRowDataBound="oficnaCom_rowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                <Columns>
                                    <asp:BoundField DataField="UNIDAD_NEGOCIO" HeaderText="Sucursal" SortExpression="UNIDAD_NEGOCIO"></asp:BoundField>
                                    <asp:BoundField DataField="TOTAL_VTAS_NTAS" HeaderText="Ventas Netas" SortExpression="TOTAL_VTAS_NTAS"></asp:BoundField>
                                    <asp:BoundField DataField="META_OFICINA" HeaderText="Meta Oficina" SortExpression="META_OFICINA"></asp:BoundField>
                                    <asp:BoundField DataField="PORC_META" HeaderText="% Meta" SortExpression="PORC_META"></asp:BoundField>
                                </Columns>

                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsComPorOficina" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_logrosOficina_Comisiones" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstYear" PropertyName="SelectedValue" DefaultValue="0" Name="a&#241;o" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lstMes" PropertyName="SelectedValue" DefaultValue="0" Name="mes" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table style="width: 100%; text-align: right">
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red" Height="2px" Text="*La Meta Personal y de Oficina, se encuentran expresadas en Miles" Font-Size="7pt" />
                        </td>
                    </tr>
                </table>
                <table style="vertical-align: top; width: 100%; text-align: center;">
                    <tr>
                        <td style="height: 2px; text-align: center; background-color: #5d7b9d; width: 20%">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="White" Height="2px" Text="Ventas Internas" Font-Size="8pt"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table style="vertical-align: top; width: 100%; text-align: center;">
                    <tr>
                        <td>
                            <asp:GridView ID="dgvComVentasInternas" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsComVentasInternas" EmptyDataText="No se encontraron resultados para la busqueda"
                                Font-Size="8pt" ForeColor="#333333" GridLines="None" Width="100%" RowStyle-Height="16px" AllowPaging="True" PageSize="15" OnRowDataBound="ventasInternas_rowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="ID_AGENTE" HeaderText="Id" SortExpression="ID_AGENTE"></asp:BoundField>
                                    <asp:BoundField DataField="NB_AGENTE" HeaderText="Nombre Agente" SortExpression="NB_AGENTE"></asp:BoundField>
                                    <asp:BoundField DataField="SUCURSAL" HeaderText="Sucursal" SortExpression="SUCURSAL"></asp:BoundField>
                                    <%-- <asp:BoundField DataField="NB_PUESTO" HeaderText="Puesto" SortExpression="NB_PUESTO"></asp:BoundField>--%>
                                    <asp:BoundField DataField="VTASNETAS" HeaderText="Ventas Netas" SortExpression="VTASNETAS"></asp:BoundField>
                                    <asp:BoundField DataField="COBRO" HeaderText="Cobro" SortExpression="COBRO"></asp:BoundField>
                                    <asp:BoundField DataField="COMISION" HeaderText="Comision" SortExpression="COMISION"></asp:BoundField>
                                    <%--<asp:BoundField DataField="VTASNETAS_OF" HeaderText="Ventas Netas Oficina" SortExpression="VTASNETAS_OF"></asp:BoundField>--%>
                                    <asp:BoundField DataField="META_PERSONAL" HeaderText="Meta Personal" SortExpression="META_PERSONAL"></asp:BoundField>
                                    <asp:BoundField DataField="META_OFICINA" HeaderText="Meta Oficina" SortExpression="META_OFICINA"></asp:BoundField>
                                    <asp:BoundField DataField="PORC_META" HeaderText="% Meta Oficina" SortExpression="PORC_META"></asp:BoundField>
                                    <asp:BoundField DataField="BONO_META_OFICINA" HeaderText="Bono Oficina" SortExpression="BONO_META_OFICINA"></asp:BoundField>
                                    <asp:BoundField DataField="BONO_META_PERSONAL" HeaderText="Bono Meta Personal" SortExpression="BONO_META_PERSONAL"></asp:BoundField>
                                    <asp:BoundField DataField="MONTO_PAGAR" HeaderText="Monto a Pagar" SortExpression="MONTO_PAGAR"></asp:BoundField>
                                    <asp:BoundField DataField="VENTA_ESPECIAL" HeaderText="Venta Especial" SortExpression="VENTA_ESPECIAL"></asp:BoundField>
                                    <%--<asp:BoundField DataField="FA_GARANTIA" HeaderText="Garantia" SortExpression="FA_GARANTIA"></asp:BoundField>
                                    <asp:BoundField DataField="FH_INICIO_GARANTIA" HeaderText="Inicio" SortExpression="FH_INICIO_GARANTIA"></asp:BoundField>
                                    <asp:BoundField DataField="FH_VIGENCIA_GARANTIA" HeaderText="Vigencia" SortExpression="FH_VIGENCIA_GARANTIA"></asp:BoundField>--%>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsComVentasInternas" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_ventasInternas_Comisiones" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstYear" PropertyName="SelectedValue" DefaultValue="0" Name="a&#241;o" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lstMes" PropertyName="SelectedValue" DefaultValue="0" Name="mes" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lstSucursales" PropertyName="SelectedValue" DefaultValue="0" Name="sucursalInt" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <table style="vertical-align: top; width: 100%; text-align: center;">
                    <tr>
                        <td style="height: 2px; text-align: center; background-color: #5d7b9d; width: 20%">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="White" Height="2px" Text="Ventas Externas" Font-Size="8pt"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table style="vertical-align: top; width: 100%; text-align: center;">
                    <tr>
                        <td>
                            <asp:GridView ID="dgvComVentasExternas" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="sdsComVentasExternas" EmptyDataText="No se encontraron resultados para la busqueda"
                                Font-Size="8pt" ForeColor="#333333" GridLines="None" Width="100%" RowStyle-Height="16px" AllowPaging="True" PageSize="15" OnRowDataBound="ventasExternas_rowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                <Columns>
                                    <asp:BoundField DataField="ID_AGENTE" HeaderText="Id" SortExpression="ID_AGENTE"></asp:BoundField>
                                    <asp:BoundField DataField="NB_AGENTE" HeaderText="Nombre Agente" SortExpression="NB_AGENTE"></asp:BoundField>
                                    <asp:BoundField DataField="SUCURSAL" HeaderText="Sucursal" SortExpression="SUCURSAL"></asp:BoundField>
                                    <%--<asp:BoundField DataField="NB_PUESTO" HeaderText="Puesto" SortExpression="NB_PUESTO"></asp:BoundField>--%>
                                    <asp:BoundField DataField="VTASNETAS" HeaderText="Ventas Netas" ReadOnly="True" SortExpression="VTASNETAS"></asp:BoundField>
                                    <asp:BoundField DataField="COBRO" HeaderText="Cobro" ReadOnly="True" SortExpression="COBRO"></asp:BoundField>
                                    <asp:BoundField DataField="COMISION" HeaderText="Comision" ReadOnly="True" SortExpression="COMISION"></asp:BoundField>
                                    <asp:BoundField DataField="FA_GARANTIA" HeaderText="Garantia" ReadOnly="True" SortExpression="FA_GARANTIA"></asp:BoundField>
                                    <%--<asp:BoundField DataField="FH_INICIO_GARANTIA" HeaderText="Inicio" ReadOnly="True" SortExpression="FH_INICIO_GARANTIA"></asp:BoundField>
                                    <asp:BoundField DataField="FH_VIGENCIA_GARANTIA" HeaderText="Vigencia" ReadOnly="True" SortExpression="FH_VIGENCIA_GARANTIA"></asp:BoundField>--%>
                                    <asp:BoundField DataField="APLICA_GARANTIA" HeaderText="Procede" SortExpression="APLICA_GARANTIA"></asp:BoundField>
                                    <asp:BoundField DataField="TOTAL_PAGAR" HeaderText="Monto a Pagar" ReadOnly="True" SortExpression="TOTAL_PAGAR"></asp:BoundField>
                                    <asp:BoundField DataField="VENTA_ESPECIAL" HeaderText="Venta Especial" ReadOnly="True" SortExpression="VENTA_ESPECIAL"></asp:BoundField>
                                </Columns>

                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsComVentasExternas" runat="server" ConnectionString='<%$ ConnectionStrings:cotizadorCS %>' SelectCommand="get_ventasExternas_Comisiones" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstYear" PropertyName="SelectedValue" DefaultValue="0" Name="a&#241;o" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lstMes" PropertyName="SelectedValue" DefaultValue="0" Name="mes" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lstSucursales" PropertyName="SelectedValue" DefaultValue="0" Name="sucursalInt" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div>
        <asp:Button ID="btnCon1" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup1" runat="server" Enabled="True" TargetControlID="btnCon1" BackgroundCssClass="modalBackground" PopupControlID="PanelOperacionCorrecta" />
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
        <asp:Button ID="btnCon2" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup2" runat="server" Enabled="True" TargetControlID="btnCon2" BackgroundCssClass="modalBackground" PopupControlID="Panel1" />
        <asp:Panel ID="Panel1" runat="server" Style="display: none">
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
                        <img src="../Imagenes/Msj_Info_Com_ExisteMes.png" border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false" DisplayAfter="0" AssociatedUpdatePanelID="upAddAgente2">
        <ProgressTemplate>
            <div class="overlay">
                <table class="overlayContent">
                    <tr>
                        <td>
                             <asp:Label ID="lblEspereCon" runat="server" Font-Bold="True" ForeColor="White" Text="Espere..." Font-Size="20pt"></asp:Label>
                             <br />
                             <img src="../Imagenes/ajax-loader.gif" alt="Loading" border="1" />
                        </td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
