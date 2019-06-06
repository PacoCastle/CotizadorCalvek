<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioDepositosPendientes.aspx.cs" Inherits="Cobranza_DepositosPendientes_FormularioDepositosPendientes" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td colspan="4" style="text-align: center">
                <strong><span style="font-size: 11pt">DEPOSITOS SIN IDENTIFICAR</span></strong></td>
        </tr>
        <tr>
            <td style="width: 9px">
            </td>
            <td style="width: 9px">
                </td>
            <td>
                </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource1"
                    Height="50px" Width="388px" CellPadding="4" CellSpacing="1" Font-Size="9pt" ForeColor="#333333" GridLines="None" >
                    <Fields>
                        <asp:BoundField DataField="folio" HeaderText="Folio:" SortExpression="folio" />
                        <asp:BoundField DataField="fecha" HeaderText="Fecha:" ReadOnly="True" SortExpression="fecha" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto:" ReadOnly="True" SortExpression="Monto" />
                        <asp:BoundField DataField="fechaSick" HeaderText="fechaSick" ReadOnly="True" SortExpression="fechaSick" Visible="False" />
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_listaDepositosSinIdentificarDetalleTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intMovimientoId" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 9px; height: 20px;">
                <strong><span style="font-size: 9pt">Documentos:</span></strong></td>
            <td style="width: 9px; height: 20px;">
                <span style="font-size: 9pt"></span></td>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="width: 9px; height: 231px;">
            </td>
            <td style="width: 9px; height: 231px;">
                <asp:GridView ID="gwDocumentos" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdsDocumentos" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                    ShowFooter="True" Width="312px" DataKeyNames="documentosDepositosPendientesId,serieFactura,FolioFactura">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="documentosDepositosPendientesId" HeaderText="documentosDepositosPendientesId"
                            ReadOnly="True" SortExpression="documentosDepositosPendientesId" Visible="False" />
                        <asp:TemplateField HeaderText="Folio" SortExpression="serieFactura">
                            <EditItemTemplate>
                                &nbsp;<asp:TextBox ID="serieFactura" runat="server" Font-Size="9pt" Text='<%# Eval("serieFactura") %>'
                                    Width="36px"></asp:TextBox>
                                <asp:TextBox ID="FolioFactura" runat="server" Font-Size="9pt" Text='<%# Eval("FolioFactura") %>'
                                    Width="46px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtSerie" runat="server" Font-Size="9pt" Width="36px"></asp:TextBox>
                                <asp:TextBox ID="txtFolio" runat="server" Font-Size="9pt" Width="46px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSerie"
                                    Display="Dynamic" ErrorMessage="El campo Serie es Requerido" ValidationGroup="agregaDocumento"></asp:RequiredFieldValidator><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFolio"
                                    Display="Dynamic" ErrorMessage="El campo Folio es Requerido" ValidationGroup="agregaDocumento"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("serieFactura") %>'></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("FolioFactura") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Actualizar"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnAgregar" runat="server" Font-Size="9pt" Height="19px" OnClick="btnAgregar_Click"
                                    Text="Agregar" Width="54px" ValidationGroup="agregaDocumento" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Editar"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                    Text="Eliminar"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_datosDocumentosDepositosPendientes" SelectCommandType="StoredProcedure" DeleteCommand="update DocumentosDepositosPendientes set activo= 0&#13;&#10;where documentosDepositosPendientesId = @documentosDepositosPendientesId&#13;&#10;&#13;&#10;" UpdateCommand="update DocumentosDepositosPendientes set serieFactura = @serieFactura,FolioFactura = @FolioFactura&#13;&#10;where documentosDepositosPendientesId= @documentosDepositosPendientesId&#13;&#10;">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intDepositoPendientesId" QueryStringField="pendienteId" Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="documentosDepositosPendientesId" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="serieFactura" />
                        <asp:Parameter Name="FolioFactura" />
                        <asp:Parameter Name="documentosDepositosPendientesId" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td style="height: 231px">
            </td>
            <td style="font-size: 12pt; height: 231px;">
            </td>
        </tr>
        <tr>
            <td style="width: 9px">
            </td>
            <td style="width: 9px">
            </td>
            <td>
            </td>
            <td style="font-size: 12pt">
            </td>
        </tr>
        <tr>
            <td style="width: 9px">
            </td>
            <td style="width: 9px">
            </td>
            <td>
            </td>
            <td style="font-size: 12pt">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 9px; height: 20px;">
            </td>
            <td style="width: 9px; height: 20px;">
            </td>
            <td style="height: 20px">
            </td>
            <td style="font-size: 12pt; height: 20px;">
            </td>
        </tr>
    </table>
</asp:Content>

