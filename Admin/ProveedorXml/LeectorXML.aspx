<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LeectorXML.aspx.cs" Inherits="Admin_ProveedorXml_LeectorXML" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .style108 {
            width: 490px;
        }

        .style200 {
            width: 3px;
            text-align: right;
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


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                                Text="Buscador XML" Height="37px"></asp:Label>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table border="0" style="width: auto">
                    <tr>
                        <td class="style108" style="text-align: left">
                            <asp:Button ID="btnImport" runat="server" Font-Size="9pt" CausesValidation="false"
                                Height="20px" Text="Importar" Width="140px" OnClick="btnImport_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <table border="0" style="width: auto">
                    <tr>
                        <td style="width: auto">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="odsXmlProveedores" Font-Size="8pt" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center"/>
                                <Columns>
                                    <asp:BoundField DataField="UuId" HeaderText="UUID" />
                                    <asp:BoundField DataField="Serie" HeaderText="Serie" />
                                    <asp:BoundField DataField="Folio" HeaderText="Folio" />
                                    <asp:BoundField DataField="ImporteTotal" HeaderText="Importe total" />
                                    <asp:BoundField DataField="Moneda" HeaderText="Moneda" />
                                    <asp:BoundField DataField="TipoCambio" HeaderText="Tipo de cambio" />
                                    <asp:BoundField DataField="Tasa" HeaderText="Tasa" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="Rfc" HeaderText="RFC" />
                                    <asp:BoundField DataField="RfcReceptor" HeaderText="RFC Receptor" />
                                    <asp:BoundField DataField="TipoComprobante" HeaderText="Tipo de comprobante" />
                                    <asp:BoundField DataField="DateTimbrado" HeaderText="Fecha de timbrado" />
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="odsXmlProveedores" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="ContabilidadTableAdapters.get_xmlProveedoresTableAdapter"></asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr>
                        <td colspan="3" style="width: 280px; height: 30px; vertical-align:top">
                            <asp:Label ID="LabelFiltrosProveedor" runat="server" Font-Size="12pt" Text="Filtros"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="LabelFiltrosBusqueda" runat="server" Font-Size="12pt" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="LabelOficina" runat="server" Font-Size="9pt" Text="Razón Social:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="listOficina" runat="server" ValidationGroup="valida"
                             AppendDataBoundItems="true" Width="115px" AutoPostBack="True" OnSelectedIndexChanged="oficina_onChange">
                            <asp:ListItem Text="" Value="0" />
                            <asp:ListItem Text="Calvek SA" Value="1" />
                            <asp:ListItem Text="Calvek Del Centro" Value="2" />
                            <asp:ListItem Text="Calvek Bajio" Value="3" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="OficinaRequired" runat="server" ControlToValidate="listOficina"  ValidationGroup="valida"
                                ErrorMessage="El campo oficina es obligatorio" InitialValue="0" Font-Size="7pt"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                        <td>
                            <asp:Label ID="LabelLstProvedores" runat="server" Font-Size="9pt" Text="Proveedores:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="lstProveedores" runat="server" Width="300px" DataSourceID="SqlDataSource3"
                                DataTextField="nombre" DataValueField="valor" AutoPostBack="True" OnSelectedIndexChanged="proveedores_onChange">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_comboProveedoresXml" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstMes" DefaultValue="0" Name="mes" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstAños" DefaultValue="0" Name="año" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="listOficina" DefaultValue="" Name="idOficina" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="LabelMes" runat="server" Font-Size="9pt" Text="Mes:"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="lstMes" runat="server" DataSourceID="odsMeses" DataTextField="Texto" AutoPostBack="True"
                                DataValueField="mesId" Width="115px" OnSelectedIndexChanged="mes_onChange"  ValidationGroup="valida" >
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter"></asp:ObjectDataSource>
                            <asp:RequiredFieldValidator ID="MesRequired" runat="server" ControlToValidate="lstMes"  ValidationGroup="valida"
                                ErrorMessage="El campo mes es obligatorio" InitialValue="0" Font-Size="7pt"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                        <td>
                            <asp:Label ID="LabelDia" runat="server" Font-Size="9pt" Text="Día:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="lstDias" runat="server" CausesValidation="false" DataSourceID="SqlDataSourceDia" OnSelectedIndexChanged="dia_onChange"
                                DataTextField="nombreDia" DataValueField="valorDia" AutoPostBack="True" Width="115px"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDia" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_diasPorMes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstMes" DefaultValue="1" Name="Mes" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstAños" DefaultValue="2015" Name="Anio" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Button ID="infoAñosDoc" runat="server" OnClick="infoAñoDoc_OnClick" ToolTip="Ayuda" CausesValidation="false"
                              Style="background-image: url('../../Imagenes/kub-help.png'); width: 15px; background-repeat: no-repeat;border-color:#26276C; border: 1; background-color:#26276C" />
                            <asp:Label ID="LabelAño" runat="server" Font-Size="9pt" Text="Año documento:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="lstAños" runat="server" DataTextField="Texto" Width="115px" AutoPostBack="True" OnSelectedIndexChanged="añoDocumento_onChange">
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td>
                            <asp:Label ID="LabelMoneda" runat="server" Font-Size="9pt" Text="Moneda:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="lstMoneda" runat="server" Width="115px" DataSourceID="SDSMoneda" OnSelectedIndexChanged="moneda_onChange"
                                DataTextField="nombreMoneda" DataValueField="valorMoneda" AutoPostBack="True" CausesValidation="false">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SDSMoneda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_comboMonedaXML" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstMes" DefaultValue="0" Name="mes" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstAños" DefaultValue="0" Name="año" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="listOficina" DefaultValue="" Name="idOficina" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="Consulta en Kepler:"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="ChkConsultaKepler" runat="server" CausesValidation="false" AutoPostBack="true"
                                Checked="false" OnCheckedChanged="chkLinked_CheckedChanged"/>
                        </td>
                        <td></td>
                        <td>
                            <asp:Label ID="LabelMontoInc" runat="server" Font-Size="9pt" Text="Monto inicial:"></asp:Label>           
                        </td>
                        <td>
                            <asp:TextBox ID="txtMontoInicial" runat="server" Width="110px" ValidationGroup="valida" AutoPostBack="true" OnTextChanged="txtIncialOnChange"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMontoInicial"
                                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,4})?$" ValidationGroup="valida">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Size="9pt" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Button ID="infoAñosKepler" runat="server" OnClick="infoAñoKepler_OnClick" ToolTip="Ayuda"  CausesValidation="false"
                              Style="background-image: url('../../Imagenes/kub-help.png'); width: 15px; background-repeat: no-repeat;border-color:#26276C; border: 1; background-color:#26276C" />
                            <asp:Label ID="LabelAnioBusqueda" runat="server" Font-Size="9pt" Text="Año consulta Kepler:"></asp:Label>
                        </td>                                                  
                        <td>
                            <asp:DropDownList ID="lstAñosBd" runat="server" DataTextField="Texto" Width="115px" AutoPostBack="True" OnSelectedIndexChanged="añoBd_onChange">
                            </asp:DropDownList>
                        </td>                       
                        <td></td>
                        <td>
                            <asp:Label ID="LabelMontoFnl" runat="server" Font-Size="9pt" Text="Monto final:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxMontoFinal" runat="server" Width="110px" ValidationGroup="valida" AutoPostBack="true" OnTextChanged="txtFinalOnChange"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxMontoFinal"
                                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,4})?$" ValidationGroup="valida">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Button ID="btnBusquedaProveedor" runat="server" Font-Size="9pt" ValidationGroup="valida"
                                Height="20px" Text="Busqueda" Width="100px" OnClick="btnBusqueda_click" />
<%--                            <asp:Button ID="btnAccion" runat="server" Font-Size="9pt" ValidationGroup="valida"
                                Height="20px" Text="Busqueda General" Width="130px" OnClick="btnAccion_click" />--%>
                        </td>
                        <td></td>
                        <td></td>
                        <td style="text-align: left">
                            <%--<asp:Button ID="btnBusquedaProveedor" runat="server" Font-Size="9pt" ValidationGroup="valida"
                                Height="20px" Text="Busqueda Proveedor" Width="130px" OnClick="btnBusqueda_click" />--%>
                        </td>
                        <td></td>
                    </tr>
                </table>
                <br />
                <div id="gridBusquedaGral">
                    <table border="0" style="width: 1062px; position: absolute; top: 0px; left: 0px;">
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <asp:GridView ID="gridGeneral" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                        Font-Size="8pt" ForeColor="#333333" GridLines="None" Visible="False" Width="1062px"  AllowSorting="true">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center"/>
                        <Columns>
                            <asp:BoundField DataField="UuId" HeaderText="UuId" SortExpression="UuId" />
                            <asp:BoundField DataField="Folio" HeaderText="Folio Documento" SortExpression="Folio" />
                            <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" />
                            <asp:BoundField DataField="ImporteTotal" HeaderText="Importe Total" SortExpression="ImporteTotal" />
                            <asp:BoundField DataField="Moneda" HeaderText="Moneda" />
                            <asp:BoundField DataField="TipoComprobante" HeaderText="Tipo de comprobante" SortExpression="TipoComprobante" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Rfc" HeaderText="Rfc" SortExpression="Rfc Emisor" />
                            <asp:BoundField DataField="RfcReceptor" HeaderText="Rfc" SortExpression="Rfc receptor" Visible="True" />
                            <asp:BoundField DataField="DateTimbrado" HeaderText="Fecha de timbrado" />

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:UpdatePanel ID="UpdBtn" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="xmlGeneralBtn" HeaderText="Descarga" runat="server" OnClick="descargaXml_OnClick" CommandArgument='<%# Eval("UuId") + "," +  Eval("RfcReceptor")%> '
                                                Style="background-image: url('../../Imagenes/xml.png'); width: 40px; background-repeat: no-repeat; border: 0" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="xmlGeneralBtn" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ItemTemplate>
                                <HeaderStyle Width="50px" HorizontalAlign="Center" />
                                <HeaderTemplate>Descarga</HeaderTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </div>
                <div>
                    <table border="0" style="width: 1062px; position: absolute">
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_xmlPorProveedorSinKepler" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lstMes" Name="Mes" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="lstAños" Name="Año" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="listOficina" Name="banderaBd" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="lstProveedores" Name="proveedor" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="lstMoneda" Name="filtroMoneda" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="lstDias" Name="filtroDia" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtMontoInicial" Name="montoInicial"  DefaultValue=" " PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="TextBoxMontoFinal" Name="montoFinal"  DefaultValue=" " PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>


                                <asp:GridView ID="GridProveedor" runat="server" AutoGenerateColumns="False" AllowSorting="true"
                                    DataSourceID="SqlDataSource2" Font-Size="8pt" ForeColor="#333333" GridLines="None" Width="1062px" Visible="False">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center"/>
                                    <Columns>
                                        <asp:BoundField DataField="C1" HeaderText="Suc." SortExpression="C1" />
                                        <asp:BoundField DataField="C2" HeaderText="C2" SortExpression="C2" />
                                        <asp:BoundField DataField="C3" HeaderText="C3" SortExpression="C3" />
                                        <asp:BoundField DataField="C4" HeaderText="C4" SortExpression="C4" />
                                        <asp:BoundField DataField="C5" HeaderText="C5" SortExpression="C5" />
                                        <asp:BoundField DataField="C6" HeaderText="Folio" SortExpression="C6" />
                                        <asp:BoundField DataField="UuId" HeaderText="UuId" SortExpression="UuId" />
                                        <asp:BoundField DataField="Folio" HeaderText="Folio Documento" SortExpression="Folio" />
                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" />
                                        <asp:BoundField DataField="ImporteTotal" HeaderText="Importe Total" SortExpression="ImporteTotal" />
                                        <asp:BoundField DataField="Moneda" HeaderText="Moneda" />
                                        <asp:BoundField DataField="TipoComprobante" HeaderText="Tipo de comprobante" SortExpression="TipoComprobante" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"/>          
                                        <asp:BoundField DataField="Rfc" HeaderText="Rfc" SortExpression="Rfc Emisor" />
                                        <asp:BoundField DataField="RfcReceptor" HeaderText="Rfc" SortExpression="Rfc receptor" Visible="True" />
                                        <asp:BoundField DataField="DateTimbrado" HeaderText="Fecha de timbrado" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:UpdatePanel ID="UpdBtn" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Button ID="xmlProveedorBtn" HeaderText="Descarga" runat="server" OnClick="descargaProveedor_OnClick" CommandArgument='<%# Eval("UuId") + "," +  Eval("RfcReceptor")%> '
                                                            Style="background-image: url('../../Imagenes/xml.png'); width: 40px; background-repeat: no-repeat; border: 0" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="xmlProveedorBtn" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </ItemTemplate>
                                            <HeaderStyle Width="50px" HorizontalAlign="Center" />
                                            <HeaderTemplate>Descarga</HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_xmlPorProveedor" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lstMes" Name="Mes" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="lstAños" Name="Año" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="lstAñosBd" Name="AñoPedido" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="listOficina" Name="banderaBd" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="lstProveedores" Name="proveedor" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="lstMoneda" Name="filtroMoneda" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="lstDias" Name="filtroDia" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtMontoInicial" Name="montoInicial" DefaultValue=" " PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="TextBoxMontoFinal" Name="montoFinal" DefaultValue=" " PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
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
                                    <asp:LinkButton ID="popClose" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <img src="../../Imagenes/Msj_OperacionExitosa.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="btnInicio2" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopup2" runat="server" Enabled="True" TargetControlID="btnInicio2" BackgroundCssClass="modalBackground" PopupControlID="Panel1" />
        <asp:Panel ID="Panel1" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                       <img src="../../Imagenes/Msj_Info_DocumentoNoEncontrado.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopupMsjAñoDoc" runat="server" Enabled="True" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="Panel2" />
        <asp:Panel ID="Panel2" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                       <img src="../../Imagenes/Msj_Info_AñoDocumentoXML.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button2" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopupMsjAñoKepler" runat="server" Enabled="True" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="Panel3" />
        <asp:Panel ID="Panel3" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                       <img src="../../Imagenes/Msj_Info_AñoKepler.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button3" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopupValida" runat="server" Enabled="True" TargetControlID="Button3" BackgroundCssClass="modalBackground" PopupControlID="Panel4" />
        <asp:Panel ID="Panel4" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                       <img src="../../Imagenes/Msj_Info_Montos.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button4" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopupValidaInicial" runat="server" Enabled="True" TargetControlID="Button4" BackgroundCssClass="modalBackground" PopupControlID="Panel5" />
        <asp:Panel ID="Panel5" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                       <img src="../../Imagenes/Msj_Info_faltaMontoFinal.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div>
        <asp:Button ID="Button5" runat="server" Text="Button" Style="display: none" />
        <asp:ModalPopupExtender ID="ctrPopupValidaFinal" runat="server" Enabled="True" TargetControlID="Button5" BackgroundCssClass="modalBackground" PopupControlID="Panel6" />
        <asp:Panel ID="Panel6" runat="server" Style="display: none">
            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                <ContentTemplate>
                    <div class="popupCorrecto">
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" CausesValidation="false"
                                        ForeColor="#B40404" OnClick="popupClose_Click">X</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                       <img src="../../Imagenes/Msj_Info_faltaMontoInic.png"  border="0" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>

