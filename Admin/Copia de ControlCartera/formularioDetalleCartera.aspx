<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioDetalleCartera.aspx.cs" Inherits="Admin_ControlCartera_formularioDetalleCartera" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 700px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="9pt" Text="CONTROL DE FACTURACION Y CARTERA"></asp:Label></td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    SelectCommand="sp_listadoPendientesDetalleEditar" SelectCommandType="StoredProcedure"
                    UpdateCommand="&#13;&#10;UPDATE TH_ABONOS2009 SET FH_ULTIMOCAMBIOS = GETDATE() &#13;&#10;WHERE id_admin = @IdAdmin&#13;&#10;">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intConcepto" QueryStringField="concepto" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="IdAdmin" PropertyName="SelectedValue" />
                        <asp:Parameter Name="Folio" />
                        <asp:Parameter Name="Serie" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="Serie,Folio" DataSourceID="SqlDataSource1" Font-Size="8pt"
                    ForeColor="#333333" GridLines="None" Width="760px" onrowupdating="GridView1_RowUpdating">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="Folio" SortExpression="Folio">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Serie") %>'></asp:Label>-<asp:Label ID="Label1" runat="server" Text='<%# Eval("Folio") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Serie") %>'></asp:Label>-<asp:Label ID="Label1" runat="server" Text='<%# Bind("Serie")+"-"+Bind("Folio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# String.Format("${0:#,##0.00}", Eval("Monto")) %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# String.Format("${0:#,##0.00}", Eval("Monto")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" SortExpression="fecha" />
                        <asp:TemplateField HeaderText="Facturas">
                            <EditItemTemplate>
                                <asp:Label ID="lblCliente" runat="server" Text='<%# Eval("IdCliente") %>' Visible="False"></asp:Label><asp:Label ID="lblciddocum01" runat="server" Text='<%# Eval("ciddocum01") %>' Visible="False"></asp:Label><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                                    SelectCommand="sp_listadoFacturasPendientes" SelectCommandType="StoredProcedure"
                                    UpdateCommand="IF (@ID_DEVNCFACTURAS)=0&#13;&#10;BEGIN&#13;&#10;&#9;INSERT INTO TC_DEVNC_FACTURAS(ciddocum01,ID_ADMIN,IM_MONTO)&#13;&#10;&#9;VALUES(@ciddocum01,@IdAdmin,@IM_MONTO)&#13;&#10;&#13;&#10;&#9;INSERT INTO TH_ABONOS_DETALLE(ID_ADMIN,TP_FOLIO,TP_SERIE,NB_CLIENTE,NU_DEPOSITOMN,FH_ABONO)&#13;&#10;&#9;SELECT id_admin,tp_folio,tp_serie,cd_cliente,@IM_MONTO,getdate()&#13;&#10;&#9;FROM TH_ABONOS2009&#13;&#10;&#9;WHERE id_admin = @IdAdmin&#13;&#10;END&#13;&#10;ELSE&#13;&#10;BEGIN&#13;&#10;&#9;UPDATE TC_DEVNC_FACTURAS SET IM_MONTO=@IM_MONTO WHERE ID_DEVNCFACTURAS=@ID_DEVNCFACTURAS&#13;&#10;&#9;&#13;&#10;&#9;UPDATE TH_ABONOS_DETALLE SET NU_DEPOSITOMN = @IM_MONTO&#13;&#10;&#9;WHERE ID_ADMIN = @IdAdmin&#13;&#10;END&#13;&#10;&#13;&#10;UPDATE TH_ABONOS2009&#13;&#10;SET NU_DEPOSITOMN=(SELECT isnull(ROUND(SUM(NU_DEPOSITOMN),0),0) AS NU_DEPOSITOMN &#13;&#10;&#9;&#9;   FROM TH_ABONOS_DETALLE WHERE ID_ADMIN = @IdAdmin),&#13;&#10;&#9;FH_ULTIMOCAMBIOS=getdate()&#13;&#10;WHERE ID_ADMIN = @IdAdmin&#13;&#10;&#13;&#10;update TH_ABONOS2009 set cd_estatus = 5&#13;&#10;where id_admin = @IdAdmin&#13;&#10;and NU_DEPOSITOMN > NU_TOTALPM">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblCliente" Name="intCliente" PropertyName="Text"
                                            Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="ID_DEVNCFACTURAS" />
                                        <asp:ControlParameter ControlID="lblciddocum01" Name="ciddocum01" PropertyName="Text" />
                                        <asp:Parameter Name="IdAdmin" />
                                        <asp:Parameter Name="IM_MONTO" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <div style="overflow: auto; width: 248px; height: 182px">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" DataKeyNames="IdAdmin,Folio,ID_DEVNCFACTURAS" Font-Size="7pt" ForeColor="#333333" GridLines="None" Width="229px">
                                    <Columns>
                                        <asp:BoundField DataField="ID_DEVNCFACTURAS" HeaderText="ID_DEVNCFACTURAS" SortExpression="ID_DEVNCFACTURAS"
                                            Visible="False" />
                                        <asp:BoundField DataField="IdAdmin" HeaderText="IdAdmin" SortExpression="IdAdmin" Visible="False" />
                                        <asp:BoundField DataField="Folio" HeaderText="Folio" ReadOnly="True" SortExpression="Folio" />
                                        <asp:TemplateField HeaderText="Monto">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="MONTO" runat="server" Text='<%# Bind("IM_MONTO") %>' Width="57px" Font-Size="8pt"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" BackColor="Black"
                                                    ControlToValidate="MONTO" Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="10pt"
                                                    ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("IM_MONTO") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                                    Font-Size="7pt" Text="Update" />&nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False"
                                                        CommandName="Cancel" Font-Size="7pt" Text="Cancel" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                                    Font-Size="7pt" Text="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nu_depositomn" HeaderText="nu_depositomn" SortExpression="nu_depositomn"
                                            Visible="False" />
                                    </Columns>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                                </div>
                               
                            </EditItemTemplate>
                            <ItemTemplate>
                                &nbsp;
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="Button2" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Terminar" Font-Size="8pt" Height="20px" Width="50px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Mostrar" Font-Size="8pt" Height="19px" Width="45px" />
                            </ItemTemplate>
                            <ItemStyle Font-Size="8pt" HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                &nbsp;&nbsp;<br />
            </td>
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

