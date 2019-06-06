<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActualizaStatusProductosKepler.aspx.cs" Inherits="ActualizaStatusProductosKepler" Title="Actualiza Estatus Productos Kepler" %>
 
    

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table width="100%">
    
        <tr>
            <td colspan="2" style="height: 8px; text-align: center">
                <strong><span style="font-size: 9pt">Busqueda</span></strong></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 5px">
                <span style="font-size: 9pt"></span><table style="width: 100%">
                    <tr>
                        <td style="width: 47px; height: 20px;" align="left">
                            <asp:Label ID="Label1" runat="server" Font-Size="9pt" Text="Producto:"></asp:Label></td>
                        <td style="height: 20px" align="left">
                            <asp:TextBox ID="txtProductoBus" runat="server" Font-Size="9pt"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Font-Size="9pt" Text="Buscar" 
                                BorderStyle="None" BorderWidth="1px" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 4px">
                <asp:SqlDataSource ID="sdsEstatusProductosKepler" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_listaProductosKeplerEstatus" SelectCommandType="StoredProcedure"
                    UpdateCommand="set_EstatusProductosKepler" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtProductoBus" Name="CD_PRODUCTO" PropertyName="Text"
                            Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CD_PRODUCTO" Type="String" />
                        <asp:Parameter Name="CD_ESTATUS" Type="String" /> 
                        <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                            <asp:GridView ID="gvProductosKepler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsEstatusProductosKepler" ForeColor="#333333"
                                GridLines="None" Width="100%" Font-Size="8pt" Height="68px" AllowPaging="True" DataKeyNames="CD_PRODUCTO" OnRowCommand="gvProductosKepler_RowCommand">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <Columns>
                                    <asp:BoundField DataField="CD_PRODUCTO" HeaderText="ID PRODUCTO" ReadOnly="True" SortExpression="CD_PRODUCTO" />
                                    <asp:BoundField DataField="NB_PRODUCTO" HeaderText="PRODUCTO" ReadOnly="True" SortExpression="NB_PRODUCTO" />
                                    <%--<asp:BoundField DataField="CD_ESTATUS" HeaderText="ESTATUS" ReadOnly="True" SortExpression="CD_ESTATUS" />--%>
                                    <asp:BoundField DataField="CD_RAZONSOCIAL" HeaderText="RAZON SOCIAL" ReadOnly="True" SortExpression="CD_RAZONSOCIAL" />
                                    <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlEstatus" runat="server" Font-Size="8pt" 
                                            SelectedValue='<%# Eval("CD_ESTATUS") %>'>
                                                <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                                <asp:ListItem Value="">Activo</asp:ListItem>                                    
                                            </asp:DropDownList>                                 
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEstatus" runat="server" Text='<%# Bind("NB_ESTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
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
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
            </td>
        </tr>
    </table>
    
</asp:Content>

