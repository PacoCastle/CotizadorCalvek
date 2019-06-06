<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioClientes.aspx.cs" Inherits="Catalogos_Clientes_FormularioClientes" Title="SIM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 714px; height: 81px">
        <tr>
            <td style="width: 121px">
            </td>
            <td>
                <asp:Label ID="lblCliente" runat="server" Font-Bold="True" Font-Size="12pt" Text="Clientes"></asp:Label></td>
            <td style="width: 13px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 247px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="marcaId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Font-Size="10pt">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="marcaId" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="marcaId" />
                        <asp:BoundField DataField="marcaNombre" HeaderText="Marca" SortExpression="marcaNombre" ReadOnly="True" />
                        <asp:TemplateField HeaderText="descuento" SortExpression="descuento">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descuento") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("descuento") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_listaMarcasDescuento" SelectCommandType="StoredProcedure" UpdateCommand="if (select count(0) from descuentoClienteMarca where clienteId = @clienteId and marcaId = @marcaId) = 0&#13;&#10;begin&#13;&#10;insert into descuentoClienteMarca(clienteId,marcaId,descuento,usuarioId_actualiza) values(@clienteId,@marcaId,@descuento,@usuarioId)&#13;&#10;End&#13;&#10;else&#13;&#10;begin &#13;&#10;update descuentoClienteMarca set descuento = @descuento,usuarioId_actualiza = @usuarioId,fecha = getdate() where clienteId = @clienteId and marcaId = @marcaId&#13;&#10;end">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intClienteId" QueryStringField="clienteId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="clienteId" QueryStringField="clienteId" />
                        <asp:Parameter Name="marcaId" />
                        <asp:Parameter Name="descuento" />
                        <asp:SessionParameter Name="usuarioId" SessionField="usuarioID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 121px">
            </td>
            <td>
            </td>
            <td style="width: 13px">
            </td>
        </tr>
    </table>
</asp:Content>

