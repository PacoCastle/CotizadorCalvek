<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ubicacionAlmacen.aspx.cs" Inherits="Catalogos_Productos_ubicacionAlmacen" Title="Sick-UbicaciónProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 550px;">
        <tr>
            <td style="text-align: center;" colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="8pt" Text="Consulta de Localizacion de Productos x Ubicación" Width="436px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 105px; height: 26px">
                <asp:Label ID="lblEtiProducto" runat="server" Font-Size="10pt" Text="Producto:"></asp:Label></td>
            <td style="width: 36px; height: 26px">
                <asp:TextBox ID="txtCodProd" runat="server" Font-Size="9pt" Width="130px" MaxLength="30"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 105px">
                <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text="Descripción:"></asp:Label></td>
            <td style="width: 36px">
                <asp:TextBox ID="txtDescripcion" runat="server" Font-Size="9pt" Width="425px" BorderStyle="None" BorderWidth="1px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 105px">
            </td>
            <td style="width: 36px; text-align: right" align="right">
                <asp:Button ID="btnBuscar" runat="server" Font-Size="8pt" Text="Buscar" OnClick="btnBuscar_Click" /></td>
        </tr>
    </table>
    <asp:Label ID="lblUbicacion" runat="server" Font-Size="8pt"></asp:Label><br />
    <br />
    <table style="width: 550px; height: 150px;" border="1" cellpadding="0" cellspacing="0" frame="void" rules="all" >
        <tr>
            <td colspan="7" rowspan="1" style="height: 4px" valign="top">
                <asp:ObjectDataSource ID="odsUbicacion" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="UbicacionProductosTableAdapters.get_listaUbicacionProductoTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblUbicacion" Name="strCadenaUbicacion" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="gvUbicacion" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id"
                    DataSourceID="odsUbicacion" Font-Size="7pt" ForeColor="Black" GridLines="Horizontal"
                    Width="561px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="sucursal" HeaderText="sucursal" ReadOnly="True" SortExpression="sucursal" />
                        <asp:TemplateField HeaderText="Anaquel" SortExpression="Anaquel">
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstAnaquel" runat="server" AppendDataBoundItems="True" DataSourceID="odsNumerico"
                                    DataTextField="NumeroLetra" DataValueField="numero" Font-Size="7pt" SelectedValue='<%# Bind("Anaquel") %>'>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="odsNumerico" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="UbicacionProductosTableAdapters.get_listadoNumericoABCdarioTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="51" Name="intNumero" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("anaqLetra") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Columna" SortExpression="Columna">
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstColumna" runat="server" AppendDataBoundItems="True" DataSourceID="odsNumerico_1"
                                    DataTextField="NumeroLetra" DataValueField="numero" Font-Size="7pt" SelectedValue='<%# Bind("Columna") %>'>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList><asp:ObjectDataSource ID="odsNumerico_1" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="UbicacionProductosTableAdapters.get_listadoNumericoABCdarioTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="51" Name="intNumero" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("colLetra") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fila" SortExpression="Fila">
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstFila" runat="server" AppendDataBoundItems="True" DataSourceID="odsNumerico_2"
                                    DataTextField="numero" DataValueField="numero" Font-Size="7pt" SelectedValue='<%# Bind("Fila") %>'>
                                    <asp:ListItem Selected="True"></asp:ListItem>
                                </asp:DropDownList><asp:ObjectDataSource ID="odsNumerico_2" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="UbicacionProductosTableAdapters.get_listadoNumericoTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="51" Name="intNumero" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Fila") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="caja" SortExpression="caja">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("caja") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("caja") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="noCaja" SortExpression="noCaja">
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstNoCaja" runat="server" AppendDataBoundItems="True" DataSourceID="odsNumerico_3"
                                    DataTextField="numero" DataValueField="numero" Font-Size="7pt" SelectedValue='<%# Bind("noCaja") %>'>
                                    <asp:ListItem Selected="True"></asp:ListItem>
                                </asp:DropDownList><asp:ObjectDataSource ID="odsNumerico_3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="UbicacionProductosTableAdapters.get_listadoNumericoTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="51" Name="intNumero" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("noCaja") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="True"
                                    Font-Size="9pt" OnClick="Button1_Click" Text="Update" />&nbsp;<asp:Button ID="Button2"
                                        runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="False"
                                        CommandName="Cancel" Font-Size="9pt" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="1px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="9pt" Text="Editar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="7" rowspan="1" style="height: 18px" valign="top">
                <strong><span style="font-size: 9pt">Comentarios</span></strong></td>
        </tr>
        <tr>
            <td colspan="7" rowspan="1" valign="top">
                <asp:TextBox ID="txtComentario" runat="server" Height="44px" MaxLength="180" Rows="3"
                    TextMode="MultiLine" Width="553px"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    &nbsp;<br />
    
    
</asp:Content>

