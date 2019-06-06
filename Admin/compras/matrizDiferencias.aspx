<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="matrizDiferencias.aspx.cs" Inherits="OrdenesCompra_matrizDiferencias" Title="Reporte Matriz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
    <table style="width: 646px">
        <tr>
            <td>
            </td>
            <td align="center">
                <asp:Label ID="lblTitulo" runat="server" Font-Size="12pt" Text="Matriz Diferencias"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 170px">
            </td>
            <td style="height: 170px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdsMatrizDiferencias" Font-Size="8pt" ForeColor="#333333" GridLines="None" DataKeyNames="id_producto,producto" Width="1000px" OnRowCommand="GridView1_RowCommand" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCreated="GridView1_RowCreated" OnRowEditing="GridView1_RowEditing">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                    
                         <asp:TemplateField HeaderText="Id Producto">
                            <EditItemTemplate>
                                &nbsp;<asp:ObjectDataSource ID="odsProductosPendientes" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaProductoSegPedidosXIdTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblIdProducto" Name="id_Producto" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Label ID="lblIdProducto" runat="server" Text='<%# Bind("Id_Producto") %>' Font-Size="Medium" ForeColor="White"></asp:Label><asp:GridView
                                    ID="gvwDetalle" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="odsProductosPendientes"
                                    ForeColor="Black" GridLines="Horizontal" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="ALMACEN" HeaderText="ALM" SortExpression="ALMACEN" />
                                        <asp:BoundField DataField="FOLIO" HeaderText="Folio" SortExpression="FOLIO" />
                                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                                        <asp:BoundField DataField="SUCURSAL" HeaderText="Sucursal" SortExpression="SUCURSAL" />
                                        <asp:BoundField DataField="NUM_CTE" HeaderText="No Cte" SortExpression="NUM_CTE" />
                                        <asp:BoundField DataField="NB_CLIENTE" HeaderText="Cliente" SortExpression="NB_CLIENTE" />
                                        <asp:BoundField DataField="INSTRUCCION" HeaderText="Instruccion" SortExpression="INSTRUCCION" />
                                        <asp:BoundField DataField="INSTRUCCION2" HeaderText="Instruccion 2" SortExpression="INSTRUCCION2" />
                                        <asp:BoundField DataField="idreg" HeaderText="No Sol" SortExpression="idreg" />
                                        <asp:BoundField DataField="cuenta" HeaderText="No Pend" SortExpression="cuenta" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Navy" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Button ID="BtnCloseDetalles"
                                        runat="server" BorderStyle="Solid" BorderWidth="0px" CausesValidation="False"
                                        CommandName="Cancel" Font-Size="10pt" Text="Cerrar" Width="59px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProdId" runat="server" Text='<%# Bind("Id_Producto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Producto">
                            <EditItemTemplate>
                                <asp:Label ID="lblProducto1" runat="server" Font-Size="8pt" Text='<%# Bind("producto") %>' MaxLength="300" Width="250px"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProducto" runat="server" Text='<%# Bind("producto") %>' Width="250px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="producto" HeaderText="Pedidos" SortExpression="pedidos" ReadOnly="True" />
                        <asp:BoundField DataField="pedidos" HeaderText="Pedidos" SortExpression="pedidos" ReadOnly="True" />
                        <asp:BoundField DataField="compras" HeaderText="Compras" SortExpression="compras" ReadOnly="True" />
                        <asp:BoundField DataField="almacen" HeaderText="Almacen" SortExpression="almacen" ReadOnly="True" />
                        <asp:BoundField DataField="diferencia" HeaderText="Diferencia" ReadOnly="True" SortExpression="diferencia" />
                        <asp:TemplateField HeaderText="Comentario">
                            <EditItemTemplate>
                                <asp:TextBox ID="comentario" runat="server" Font-Size="8pt" Text='<%# Bind("comentario") %>' MaxLength="300" Width="250px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("comentario") %>' Width="250px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Correo" ShowHeader="False" Visible="False">
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstCorreo" runat="server" AutoPostBack="True" Font-Size="8pt" OnSelectedIndexChanged="lstCorreo_SelectedIndexChanged">
                                    <asp:ListItem Value="0">J. Mendez</asp:ListItem>
                                    <asp:ListItem Value="0">M. Trejo</asp:ListItem>
                                    <asp:ListItem Value="1">M. Aparicio</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Copia" Visible="False" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstCorreoAdmin" runat="server" Font-Size="8pt">
                                    <asp:ListItem Value="3">Celaya</asp:ListItem>
                                    <asp:ListItem Value="9">Irapuato</asp:ListItem>
                                    <asp:ListItem Value="1">Queretaro</asp:ListItem>
                                    <asp:ListItem Value="2">San Luis</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" Visible="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
                                    CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                <asp:Button ID="Button2"
                                runat="server" BorderStyle="Solid" BorderWidth="0px" CausesValidation="False"
                                CommandName="Cancel" Font-Size="7pt" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="Solid" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="7pt" Text="Detalles / Editar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsMatrizDiferencias" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_listadoMatrizDiferecias" SelectCommandType="StoredProcedure"
                    UpdateCommand="set_updateMatrizDiferecias" UpdateCommandType="StoredProcedure">
                    <UpdateParameters>
                        <asp:Parameter Name="id_producto" />
                        <asp:Parameter Name="producto" Type="String" />
                        <asp:Parameter Name="comentario" />
                        <asp:Parameter Name="valCorreo" Type="Int32" />
                        <asp:Parameter Name="valCorreo2" Type="Int32" />
                        <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td style="height: 170px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

