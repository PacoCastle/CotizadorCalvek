<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="comprasStock.aspx.cs" Inherits="Admin_SeguimientoPedidos_Default" Title="Seguimiento Pedidos" %>
 
    

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;
    <script type="text/javascript" language="javascript">// <![CDATA[
             
                    $(document).ready(function () {
            
            $(".date-pick").datePicker({startDate:'01/01/2011'});

        })
    // ]]>
    </script>  
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
                                BorderStyle="None" BorderWidth="1px" OnClick="Button1_Click" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 4px">
                        </td>
                    </tr>
                </table>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_listaProductosStockTableAdapter">
                                
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtProductoBus" Name="strCod_prod" PropertyName="Text"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="cod_prod" DataSourceID="ObjectDataSource1" ForeColor="#333333"
                                GridLines="None" Width="100%" Font-Size="8pt" Height="68px">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select"
                                             Text="√" Font-Size="9pt" Height="21px" Width="27px" />
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
            <td style="height: 6px; width: 1025px;">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_listaProductosStock_Detalles" SelectCommandType="StoredProcedure"
                    UpdateCommand="set_fechaConfirmadaStock" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="strCod_prod" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="oficinaID" Type="String" />
                        <asp:Parameter Name="ID_PRODUCTO" Type="String" /> 
                        <asp:Parameter Name="cidmovim01" Type="String" />
                        <asp:Parameter Name="cfolio" Type="String" />
                        <asp:Parameter Name="fecha_Confirmada" Type="datetime" />
                        <asp:Parameter Name="noGuia" Type="String" />
                        <asp:Parameter Name="comentarioDetalles" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="oficinaID,ID_PRODUCTO,cidmovim01,cfolio" DataSourceID="SqlDataSource1" ForeColor="#333333"
                    GridLines="None" Font-Size="9pt" Width="100%" OnRowCommand="GridView2_RowCommand" AllowPaging="True">
                    
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="cidmovim01" HeaderText="Id" SortExpression="cidmovim01" ReadOnly="True" />
                        <asp:BoundField DataField="sucursal" HeaderText="Sucursal" SortExpression="sucursal" ReadOnly="True" />
                        <asp:BoundField DataField="cseriedo01" HeaderText="Serie" SortExpression="cseriedo01" ReadOnly="True" />
                        <asp:BoundField DataField="cfolio" HeaderText="Folio" SortExpression="cfolio" ReadOnly="True" />
                        <asp:BoundField DataField="fecha" HeaderText="FechaAlta" ReadOnly="True" SortExpression="fecha" />
                        <asp:BoundField DataField="pendientes" HeaderText="Pendientes" SortExpression="pendientes" ReadOnly="True" />
                      <%--  <asp:TemplateField HeaderText="Fecha Entrega" SortExpression="FECHA_ENTREGA" HeaderStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="fecha_Entrega" runat="server" Text='<%# Bind("FECHA_ENTREGA") %>' CssClass="date-pick" Font-Size="Small"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="revFechaEntrega" runat="server" ControlToValidate="fecha_Entrega"                                
                                EnableClientScript="true" Enabled="true"
                                Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt"
                                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" Width="190px" ValidationGroup="procesa">
                            </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FECHA_ENTREGA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Fecha Confirmada" SortExpression="FECHA_CONFIRMADA" HeaderStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="fecha_Confirmada" runat="server" Text='<%# Bind("FECHA_CONFIRMADA") %>' CssClass="date-pick" Font-Size="Small"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="revFechaConfirmada" runat="server" ControlToValidate="fecha_Confirmada" 
                                EnableClientScript="true" Enabled="true"
                                Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt"
                                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" Width="190px" ValidationGroup="procesa">
                            </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFechaConfirmada" runat="server" Text='<%# Bind("FECHA_CONFIRMADA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:TemplateField HeaderText="Factura" SortExpression="factura" >
                        <EditItemTemplate>
                            <asp:TextBox ID="factura" runat="server" Text='<%# Bind("factura") %>' Font-Size="Small" Height="40">
                            </asp:TextBox>                            
                        </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFactura" runat="server" Text='<%# Bind("factura") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--  <asp:TemplateField HeaderText="Fecha Factura" SortExpression="FECHA_FACTURA" HeaderStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="fecha_Factura" runat="server" Text='<%# Bind("FECHA_FACTURA") %>' CssClass="date-pick" Font-Size="Small"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="revFechaFactura" runat="server" ControlToValidate="fecha_Factura"                                
                                EnableClientScript="true" Enabled="true"
                                Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt"
                                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" Width="190px" ValidationGroup="procesa">
                            </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFechaFactura" runat="server" Text='<%# Bind("FECHA_FACTURA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="No Guia" SortExpression="noGuia">
                        <EditItemTemplate>
                            <asp:TextBox ID="noRuta" runat="server" Text='<%# Bind("noGuia") %>' Font-Size="Small" Height="40">
                            </asp:TextBox>                            
                        </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("noGuia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Comentarios" SortExpression="comentarioDetalles">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtComentarios" runat="server" Text='<%# Bind("comentarioDetalles") %>' Font-Size="Small" Height="40">
                            </asp:TextBox>                            
                        </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblComentarioDetalles" runat="server" Text='<%# Bind("comentarioDetalles") %>'></asp:Label>
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
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
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

