<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DetalleMorosos.aspx.cs" Inherits="Admin_ControlCartera_DetalleMorosos" Title="Cartera-Morosos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 560px; height: 198px">
        <tr>
            <td style="width: 3px">
            </td>
            <td style="width: 3px">
                <asp:Label ID="Label1" runat="server" Font-Size="10pt" Text="DETALLE MOROSOS" Width="177px"></asp:Label></td>
            <td align="right" style="width: 24px">
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="7pt" PostBackUrl="~/Admin/ControlCartera/busquedaFacturasCarteras.aspx" Width="87px"><< VOLVER</asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 3px">
            </td>
            <td colspan="2">
                <span style="font-size: 7pt">CLIENTE:</span><asp:DropDownList ID="lstCliente" runat="server"
                    DataSourceID="ObjectDataSource2" DataTextField="Cliente" DataValueField="clienteId"
                    Font-Size="7pt" Width="220px">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_listadoClientesMorososTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intEstatus" QueryStringField="estatus" Type="Int32" />
                        <asp:QueryStringParameter Name="intRangodias" QueryStringField="rangoId" Type="Int32" />
                        <asp:QueryStringParameter Name="strUnidadNegocio" QueryStringField="unidadNegocio"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Button ID="btnContinuar" runat="server" Font-Size="8pt" OnClick="btnContinuar_Click"
                    Text="Buscar" /></td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="ObjectDataSource1" Font-Size="8pt" ForeColor="#333333"
                    GridLines="None" Width="558px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="tp_serie" HeaderText="Serie" SortExpression="tp_serie" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tp_folio" HeaderText="Folio" SortExpression="tp_folio" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tp_unidadNegocio" HeaderText="Unidad Negocio" SortExpression="tp_unidadNegocio" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Total" SortExpression="total">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0.00}", Eval("total")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_listadoDetalleMorososTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intEstatus" QueryStringField="estatus" Type="Int32" />
                        <asp:QueryStringParameter Name="intRangodias" QueryStringField="rangoId" Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="" Name="strUnidadNegocio" QueryStringField="unidadNegocio"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_listadoDetalleMorososBusquedaTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intEstatus" QueryStringField="estatus" Type="Int32" />
                        <asp:QueryStringParameter Name="intRangodias" QueryStringField="rangoId" Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="" Name="strUnidadNegocio" QueryStringField="unidadNegocio"
                            Type="String" />
                        <asp:ControlParameter ControlID="lstCliente" DefaultValue="0" Name="intClienteId"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

