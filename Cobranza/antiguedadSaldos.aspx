<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="antiguedadSaldos.aspx.cs" Inherits="Cobranza_estatusCobranza" Title="Antiguedad de Saldos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<link href="../Estilos/Grid_AMI.css" rel="stylesheet" />

<%--
<style type="text/css">    
    .headerStyle 
{
    background-color: #341C5E;
    color: #FFFFFF;
    font-size: 8pt;
    font-weight: bold;
    font-family: "Verdana", Sans, serif;
}

.footerStyle 
{
    background-color: #341C5E;
    color: #FFFFFF;
    font-size: 8pt;
    font-weight: bold;
    font-family: "Arial", Sans, serif;
}

.itemStyle
{
    background-color: #FFFFFF;
    color: #000000;
    font-size: 8pt;
    
}

.alternateItemStyle
{
    background-color: #F1EFF3;
    color: #000000;
    font-size: 8pt;
}

    .linkStyle
{
    
    color: #000000;
    font-size: 8pt;
    link="#341C5E";
    alink="#341C5E";
    vlink="#189097";
}
        .editStyle
{
    
    background-color: #189097;
    color: #FFFFFF;
    font-size: 8pt;
}

</style>--%>

    <table>
        <tr>
            <td colspan="2">
            </td>
            <td colspan="2">
            </td>
            <td colspan="2" style="width: 48px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2" style="width: 48px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2" style="width: 48px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2" style="width: 48px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 2px; width: 100px;" valign="top">
                <asp:Label ID="Label1" runat="server" Text="Sucursal:" Font-Size="9pt"></asp:Label></td>
            <td style="width: 6px; height: 2px;" valign="top">
                <asp:DropDownList ID="lstSucursal" runat="server" Font-Size="9pt" DataSourceID="odsOficinas" DataTextField="texto" DataValueField="sucursal">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsOficinas" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_oficinasCobranza_antSaldosTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="height: 2px" valign="top">
                <asp:Label ID="Label5" runat="server" Font-Size="9pt" Text="Año:"></asp:Label>
                <asp:DropDownList ID="lstAno" runat="server" Font-Size="9pt" >
                    <asp:ListItem Selected="True">2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList></td>
            <td colspan="3" style="height: 2px" valign="top">
                <asp:Label ID="Label3" runat="server" Text="Agente:" Font-Size="9pt"></asp:Label>
                <asp:DropDownList ID="lstAgentes" runat="server" DataSourceID="odsAgentes" DataTextField="nombreAgente"
                    DataValueField="nombreAgente" Font-Size="9pt" >
                </asp:DropDownList><asp:ObjectDataSource ID="odsAgentes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_agentesCobranza_antSaldosTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 3px; width: 100px;" valign="top">
                <asp:Label ID="Label2" runat="server" Text="Cliente:" Font-Size="9pt"></asp:Label></td>
            <td colspan="5" style="height: 3px" valign="top">
                <asp:DropDownList ID="lstClientes" runat="server" DataSourceID="odsClientes" DataTextField="Cliente"
                    DataValueField="Clave" Font-Size="9pt">
                </asp:DropDownList><asp:ObjectDataSource ID="odsClientes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_clientesCobranza_antSaldosTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 6px; width: 100px;" valign="top">
                <asp:Label ID="Label4" runat="server" Text="Cartera:" Font-Size="9pt"></asp:Label><br />
                <asp:CheckBoxList ID="ckblstEstatusCobranza" runat="server" Font-Size="9pt" Height="44px"
                    Width="75px">
                    <asp:ListItem Selected="True">MOROSO</asp:ListItem>
                    <asp:ListItem>PAGADO</asp:ListItem>
                </asp:CheckBoxList></td>
            <td style="width: 6px; height: 6px;" valign="top">
                <asp:Label ID="Label20" runat="server" Font-Size="9pt" Text="Otros Estatus:" Width="95px"></asp:Label>
                <asp:CheckBoxList ID="ckblstEstatusCobranzaOtros" runat="server" Font-Size="9pt" Height="44px"
                    Width="129px">
                    <asp:ListItem>AL CORRIENTE</asp:ListItem>
                    <asp:ListItem>DEV VTA</asp:ListItem>
                    <asp:ListItem>NOTA CREDITO</asp:ListItem>
                </asp:CheckBoxList></td>
           <td colspan="3" style="height: 6px" valign="top">
                <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="Estatus  Documento:"></asp:Label>
               &nbsp;<br />
               <asp:DropDownList ID="lstEstatusDoc" runat="server" Font-Size="9pt">
                    <asp:ListItem Selected="True" Value="1">Activo</asp:ListItem>
                    <asp:ListItem Value="0">Cancelado</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblTmpEstaCobranza" runat="server" Font-Size="5pt" Text="MOROSO,MOROSO PARCIAL," Visible="False"></asp:Label>
           </td>
           <td align="right" style="height: 24px">
                <asp:Button ID="Button1" runat="server" Font-Size="9pt" Text="BUSCAR" OnClick="Button1_Click" />
           </td>
        </tr>       
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="odsEstadoCobranza" ForeColor="#333333" GridLines="None" ShowFooter="True" onRowDataBound="GridView1_RowDataBound" Font-Names="Verdana">
        <RowStyle ForeColor="#333333" CssClass="itemStyle" />
        <Columns>
            <asp:TemplateField HeaderText="Clave" SortExpression="Clave">
                <EditItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 5%; height: 18px">
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Clave") %>' CssClass="editStyle"></asp:Label></td>
                            <td style="width: 27%; height: 18px">
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Cliente") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("[1-30 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("[31-45 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("[46-60 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("[61-90 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("[91-120 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("[121-150 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 8%; height: 18px">
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("[>150 DIAS]", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                            <td align="right" style="width: 9%; height: 18px">
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("SaldoTotal", "{0:#,##0.00}") %>' CssClass="editStyle"></asp:Label></td>
                        </tr>
                    </table>
                    <asp:ObjectDataSource ID="odsEstadoCobranzaDetalle" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_estadoCobranzaDetalleTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lstSucursal" DefaultValue=" " Name="strSucursal"
                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="Label10" DefaultValue=" " Name="strClaveCliente"
                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="lstAgentes" DefaultValue=" " Name="strAgente" PropertyName="SelectedValue"
                Type="String" />
                            <asp:ControlParameter ControlID="lblTmpEstaCobranza" Name="strEstatusCobranza"
                PropertyName="Text" Type="String" DefaultValue=" " />
                            <asp:ControlParameter ControlID="lstAno" DefaultValue="2011" Name="intA&#241;o" PropertyName="SelectedValue"
                Type="Int32" />
                            <asp:ControlParameter ControlID="lstEstatusDoc" DefaultValue="1" Name="blnActivo"
                PropertyName="SelectedValue" Type="Byte" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        ForeColor="White" Text="Cerrar"></asp:LinkButton><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="odsEstadoCobranzaDetalle"
                        ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle CssClass="alternateItemStyle" />
                        <Columns>
                            <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" SortExpression="Sucursal" />
                            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
                            <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                            <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente" />
                            <asp:BoundField DataField="EstatusDoc" HeaderText="EstatusDoc" SortExpression="EstatusDoc" />
                            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:#,##0.00}" />
                            <asp:BoundField DataField="Importe" HeaderText="Importe" SortExpression="Importe" DataFormatString="{0:#,##0.00}" />
                            <asp:BoundField DataField="Abono" HeaderText="Abono" SortExpression="Abono" DataFormatString="{0:#,##0.00}" />
                            <asp:BoundField DataField="Saldo" HeaderText="Saldo" SortExpression="Saldo" DataFormatString="{0:#,##0.00}" />
                            <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                            <asp:BoundField DataField="cdEstado" HeaderText="cdEstado" SortExpression="cdEstado" />
                            <asp:BoundField DataField="EstatusCobranza" HeaderText="EstatusCobranza" SortExpression="EstatusCobranza" />
                            <asp:BoundField DataField="tcRango" HeaderText="tcRango" SortExpression="tcRango" />
                            <asp:BoundField DataField="Rango" HeaderText="Rango" SortExpression="Rango" />
                            <asp:BoundField DataField="FechaFactura" HeaderText="FechaFactura" ReadOnly="True"
                                SortExpression="FechaFactura" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle CssClass="itemStyle" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="headerStyle" />
                    </asp:GridView>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='<%# Bind("Clave") %>' CssClass="linkStyle"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="5%" />
                <ItemStyle Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cliente" SortExpression="Cliente">
                <EditItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Cliente") %>'></asp:Label><asp:Label
                        ID="lblClaveCliente" runat="server" Text='<%# Eval("Clave") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='<%# Bind("Cliente") %>' CssClass="linkStyle"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="30%" />
                <ItemStyle Width="30%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="1-30 DIAS" SortExpression="1-30 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("[1-30 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# sumaTotal_1a30(Eval("[1-30 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_1a30" runat="server" Text='<%# getTotal_1a30() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="31-45 DIAS" SortExpression="31-45 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("[31-45 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# sumaTotal_31a45(Eval("[31-45 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_31a45" runat="server" Text='<%# getTotal_31a45() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="46-60 DIAS" SortExpression="46-60 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("[46-60 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# sumaTotal_46a60(Eval("[46-60 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_46a60" runat="server" Text='<%# getTotal_46a60() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="61-90 DIAS" SortExpression="61-90 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("[61-90 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# sumaTotal_61a90(Eval("[61-90 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_61a90" runat="server" Text='<%# getTotal_61a90() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="91-120 DIAS" SortExpression="91-120 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("[91-120 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# sumaTotal_91a120(Eval("[91-120 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_91a120" runat="server" Text='<%# getTotal_91a120() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="121-150 DIAS" SortExpression="121-150 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("[121-150 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# sumaTotal_121a150(Eval("[121-150 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_121a150" runat="server" Text='<%# getTotal_121a150() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="&gt;150 DIAS" SortExpression="&gt;150 DIAS">
                <EditItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("[>150 DIAS]", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# sumaTotal_mas150(Eval("[>150 DIAS]").ToString()) %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_mas150" runat="server" Text='<%# getTotal_mas150() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle Width="8%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Saldo Total" SortExpression="SaldoTotal">
                <EditItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("SaldoTotal", "{0:#,##0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# String.Format("{0:#,##0.00}", Eval("SaldoTotal")) %>' Font-Bold="True" ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" Width="9%" />
                <ItemStyle Font-Bold="True" HorizontalAlign="Right" Width="8%" />
                <FooterTemplate>
                    <asp:Label ID="lblTotal_total" runat="server" Text='<%# getTotal_total() %>' CssClass="footerStyle"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <EditRowStyle CssClass="editStyle" />
        <FooterStyle Font-Bold="True" ForeColor="White" CssClass="footerStyle" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="headerStyle" />
        <AlternatingRowStyle ForeColor="#284775" CssClass="alternateItemStyle" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsEstadoCobranza" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_estadoCobranzaTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lstSucursal" DefaultValue=" " Name="strSucursal"
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="lstClientes" DefaultValue=" " Name="strClaveCliente"
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="lstAgentes" DefaultValue=" " Name="strAgente" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="lblTmpEstaCobranza" Name="strEstatusCobranza"
                PropertyName="Text" Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="lstAno" DefaultValue="2017" Name="intA&#241;o" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="lstEstatusDoc" DefaultValue="1" Name="blnActivo"
                PropertyName="SelectedValue" Type="Byte" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

