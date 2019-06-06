<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="comprasSeguimientoPendidos.aspx.cs" Inherits="Admin_SeguimientoPedidos_Default" Title="Seguimiento Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;
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
                            <asp:Button ID="Button1" runat="server" Font-Size="9pt" Text="Buscar" OnClick="Button1_Click1" BorderStyle="None" BorderWidth="1px" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 4px">
                        </td>
                    </tr>
                </table>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_listaProductosSeguimientoPedidosTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtProductoBus" Name="strCod_prod" PropertyName="Text"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="cod_prod" DataSourceID="ObjectDataSource1" ForeColor="#333333"
                                GridLines="None" onrowcreated="GridView1_RowCreated" Width="100%" Font-Size="8pt" Height="68px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select"
                                                OnClick="Button1_Click" Text="√" Font-Size="9pt" Height="21px" Width="27px" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="5%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="cod_prod" HeaderText="C&#211;DIGO" SortExpression="cod_prod" >
                                        <HeaderStyle HorizontalAlign="Left" Width="25%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombre_prod" HeaderText="DESCRIPCI&#211;N" SortExpression="nombre_prod" >
                                        <HeaderStyle HorizontalAlign="Left" Width="70%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <EditRowStyle BackColor="#999999" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; height: 2px;">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 1px">
                    <tr>
                        <td align="left" style="width: 5%">
                <asp:Label ID="lblProducto" runat="server" Font-Bold="True" Font-Size="8pt" Text="Producto:"
                    Width="35px" Visible="False"></asp:Label></td>
                        <td align="left" style="width: 30%">
                <asp:Label ID="lblCodigoProducto" runat="server" Font-Bold="True" Font-Size="10pt" Visible="False"></asp:Label></td>
                        <td align="left" style="width: 65%">
                            &nbsp;
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" Font-Size="7pt"></asp:Label></td>
                    </tr>
                </table>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;</td>
        </tr>        
        <tr>
            <td style="height: 6px; width: 1038px;">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_listaPedidosProductoSegPedidos" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="strCod_prod" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="cidmovim01,cseriedo01,cfolio,oficinaId,fecha" DataSourceID="SqlDataSource1" ForeColor="#333333"
                    GridLines="None" Font-Size="9pt" onRowDataBound="GridView2_RowDataBound" Width="100%">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbPedidos" runat="server" Font-Size="9pt" OnCheckedChanged="ckbPedidos_CheckedChanged" Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="cidmovim01" HeaderText="Id" SortExpression="cidmovim01" ReadOnly="True" />
                        <asp:BoundField DataField="sucursal" HeaderText="Sucursal" SortExpression="sucursal" ReadOnly="True" />
                        <asp:BoundField DataField="cseriedo01" HeaderText="Serie" SortExpression="cseriedo01" ReadOnly="True" />
                        <asp:BoundField DataField="cfolio" HeaderText="Folio" SortExpression="cfolio" ReadOnly="True" />
                        <asp:BoundField DataField="fecha" HeaderText="FechaAlta" ReadOnly="True" SortExpression="fecha" />
                        <asp:BoundField DataField="pendientes" HeaderText="Pendientes" SortExpression="pendientes" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Documento" SortExpression="serieDocumento">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("serieDocumento") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("serieDocumento") %>'></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("folioDocumento") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fechaEntrega" HeaderText="fechaPrevista" SortExpression="fechaEntrega" ReadOnly="True" />
                        <asp:BoundField DataField="fechaConfirmada" HeaderText="fechaConfirmada" SortExpression="fechaConfirmada" ReadOnly="True" />
                        <asp:BoundField DataField="Instruccion" HeaderText="Instruccion" SortExpression="Instruccion" ReadOnly="True" />
                        <asp:BoundField DataField="oficinaId" HeaderText="oficinaId" SortExpression="oficinaId"
                            Visible="False" ReadOnly="True" />
                        <asp:TemplateField HeaderText="comentario" SortExpression="comentario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Height="34px" MaxLength="800" Text='<%# Bind("comentario") %>'
                                    TextMode="MultiLine" Width="297px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("comentario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Proveedor Contactado" SortExpression="banderaContactoProv">
                            <EditItemTemplate>
                                <asp:CheckBox ID="banderaContactoProv" runat="server" Checked='<%# Bind("banderaContactoProv") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("banderaContactoProvText") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" Visible="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
                                    CommandName="Update" Font-Size="8pt" Text="Actualizar" />&nbsp;<asp:Button ID="Button2"
                                        runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                        CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="8pt" Text="Modificar" />
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
            </td>
            <td style="width: 3px; height: 6px;">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table style="width: 373px" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 3px; height: 5px" valign="top">
                        </td>
                        <td style="width: 2px; height: 5px" valign="top">
                        </td>
                        <td style="width: 2px; height: 5px" valign="top">
                        </td>
                        <td style="width: 2px; height: 5px" valign="top">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 3px; height: 3px" valign="top">
                            <asp:Label ID="lblOrdenCompra" runat="server" Font-Bold="True" Font-Size="9pt" Text="Orden Compra:" Width="139px" Visible="False"></asp:Label><br />
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                            <asp:TextBox ID="txtSerieDocumento" runat="server" Font-Size="9pt" Width="24px" Visible="False" MaxLength="7"></asp:TextBox></td>
                                    <td>
                                        &nbsp;<asp:TextBox ID="txtFolioDocumento" runat="server" Font-Size="9pt" Width="85px" Visible="False" MaxLength="10"></asp:TextBox>
                                        
                                    </td>
                                </tr>
                            </table>
                                    
                                    <%--FJCA 15/04/2013 agrego dos RequiredFieldValidator para obligar a que los campos Serie y Folio lleven un valor--%>
                                    <asp:RequiredFieldValidator id="rfvNoFolio" runat="server" Font-Size="7pt" ErrorMessage="Inserte el No de Folio " Display="Dynamic" ControlToValidate="txtFolioDocumento" Width="115px" SetFocusOnError="True" ValidationGroup="procesa"></asp:RequiredFieldValidator><br> 
                                    <asp:RequiredFieldValidator ID="rfvNoSerie" runat="server" Font-Size="7pt" ErrorMessage="Inserte el No de Serie" Display="Dynamic" ControlToValidate="txtSerieDocumento"  SetFocusOnError="True" ValidationGroup="procesa"></asp:RequiredFieldValidator>
                                              
                            
                            
                                
                        <td style="height: 3px; width: 2px;" valign="top">
                            <asp:Label ID="lblFechaEntrega" runat="server" Font-Bold="True" Font-Size="9pt" Text="Fecha de Prevista:" Width="165px" Visible="False"></asp:Label><br />
                            <asp:TextBox ID="txtFechaEntrega" runat="server" Font-Size="9pt" Visible="False" MaxLength="10"></asp:TextBox><br />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFechaEntrega"
                                Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt"
                                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" Width="190px" ValidationGroup="procesa"></asp:RegularExpressionValidator></td>
                        <td style="width: 2px; height: 3px" valign="top">
                            <asp:Label ID="lblFechaConfirmada" runat="server" Font-Bold="True" Font-Size="9pt" Text="Fecha Confirmada:"
                                Width="165px" Visible="False"></asp:Label><asp:TextBox ID="txtFechaConfirmada" runat="server" Font-Size="9pt" Visible="False" MaxLength="10"></asp:TextBox><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFechaConfirmada"
                                Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt"
                                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"
                                Width="168px" ValidationGroup="procesa"></asp:RegularExpressionValidator><br />
                        </td>
                        <td style="width: 2px; height: 3px" valign="top">
                            <asp:Label ID="lblProvContacto" runat="server" Font-Bold="True" Font-Size="9pt" Text="Proveedor Contactado:"
                                Visible="False" Width="168px"></asp:Label><br />
                            <asp:CheckBox ID="ckbProvContac" runat="server" Font-Size="9pt" Visible="False" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 5px">
                            <asp:Label ID="lblComentario" runat="server" Font-Bold="True" Font-Size="9pt" Text="Comentario:" Width="87px" Visible="False"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtComentario"
                                Display="Dynamic" ErrorMessage="Forzoso" Font-Size="7pt" ValidationGroup="procesa"></asp:RequiredFieldValidator></td>
                        <td colspan="1" style="height: 5px">
                        </td>
                        <td colspan="1" style="height: 5px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 7px">
                            <asp:TextBox ID="txtComentario" runat="server" Font-Size="9pt" Height="33px" TextMode="MultiLine"
                                Width="358px" Visible="False" ValidationGroup="procesa"></asp:TextBox></td>
                        <td colspan="1" style="height: 7px">
                        </td>
                        <td colspan="1" style="height: 7px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 7px">
                        </td>
                        <td colspan="1" style="height: 7px">
                        </td>
                        <td colspan="1" style="height: 7px">
                <asp:Button ID="btnContinuar" runat="server" Font-Size="9pt" Text="Aplicar Cambios" OnClick="btnContinuar_Click" Visible="False" BorderStyle="None" BorderWidth="1px" ValidationGroup="procesa" /></td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
</asp:Content>

