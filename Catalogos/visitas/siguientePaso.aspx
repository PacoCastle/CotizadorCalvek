<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="siguientePaso.aspx.cs" Inherits="Catalogos_visitas_Departamentos" Title="VISITAS-SIGUIENTEPASO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 814px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="lblEtiquetaTitulo" runat="server" Text="Siguiente Paso"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;<asp:Label ID="lblMensaje" runat="server" Font-Size="7pt"></asp:Label></td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="height: 101px">
            </td>
            <td style="height: 101px">
                <asp:GridView ID="gvwSiguientePaso" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="siguientePasoId" DataSourceID="sdsSiguientePasoVisitas" Font-Size="9pt"
                    ForeColor="#333333" GridLines="None" ShowFooter="True" Height="130px" Width="327px" OnRowCommand="GridView1_RowCommand1">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="siguientePasoId" HeaderText="Id" InsertVisible="False"
                            SortExpression="siguientePasoId" />
                        <asp:TemplateField HeaderText="nombre" SortExpression="nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>' MaxLength="150"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="nombre" runat="server" Font-Size="10pt" Height="13px" MaxLength="150"></asp:TextBox>
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
                    <EmptyDataTemplate>
                        <asp:Label ID="lblSinInformacion" runat="server" Font-Size="8pt" Text="No se encontró Información"></asp:Label><br />
                        <br />
                        Texto:<br />
                        <asp:TextBox ID="nombre" runat="server" Height="12px" MaxLength="150" Width="170px"></asp:TextBox><asp:Button ID="btnAgregar" runat="server" CommandName="EmptyInsert" Font-Bold="True"
                            Font-Size="8pt" ForeColor="Green" Text="Agregar (+)" UseSubmitBehavior="False" />
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsSiguientePasoVisitas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update siguientePasoVisita set activo = 0 &#13;&#10;where siguientePasoId = @siguientePasoId"
                    InsertCommand="insert into siguientePasoVisita(nombre,activo) values(@nombre,1)"
                    SelectCommand="get_listaSiguientePasoVisita" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="-1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="siguientePasoId" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nombre" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="lblMensaje2" runat="server" Font-Size="7pt"></asp:Label></td>
            <td style="height: 101px">
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

