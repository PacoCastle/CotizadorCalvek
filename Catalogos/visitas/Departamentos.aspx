<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Departamentos.aspx.cs" Inherits="Catalogos_visitas_Departamentos" Title="VISITAS-DEPARTAMENTO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 814px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="lblEtiquetaTitulo" runat="server" Text="Departamentos"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="lblMensaje" runat="server" Font-Size="7pt"></asp:Label></td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:GridView ID="gvwDepartamentos" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="departamentoVisitaId" DataSourceID="sdsDepartamentosVisitas" Font-Size="9pt"
                    ForeColor="#333333" GridLines="None" ShowFooter="True" Height="130px" Width="248px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="departamentoVisitaId" HeaderText="Id" InsertVisible="False"
                            SortExpression="departamentoVisitaId" />
                        <asp:TemplateField HeaderText="nombre" SortExpression="nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="nombre" runat="server" Font-Size="10pt" Height="13px" MaxLength="30"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Insert"
                                    Font-Bold="True" Font-Size="8pt" ForeColor="Green" Text="+" ToolTip="Agregar" OnClick="GridViewInsert"/><br />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete"
                                    Font-Bold="True" Font-Size="8pt" ForeColor="Red" Text="X" ToolTip="Quitar" />
                            </ItemTemplate>
                            <ItemStyle ForeColor="Red" />
                        </asp:TemplateField>
                        
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsDepartamentosVisitas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update departamentoVisita set activo = 0 &#13;&#10;where departamentoVisitaId = @departamentoVisitaId"
                    InsertCommand="insert into departamentoVisita(nombre,activo) values(@nombre,1)"
                    SelectCommand="get_listaDepartamentoVisita" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="-1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="departamentoVisitaId" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nombre" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="lblMensaje2" runat="server" Font-Size="7pt"></asp:Label></td>
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
    </table>
</asp:Content>

