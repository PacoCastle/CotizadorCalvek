<%@ Page Language="C#" MasterPageFile="~/Cotizador/Caida.master" AutoEventWireup="true" CodeFile="caidaCotizacion.aspx.cs" Inherits="Cotizador_caidaCotizacion" Title="SICK - Cotizador" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_detalleCotizacionTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="intCotizacionid" QueryStringField="cotizacionId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
        SelectCommand="get_Descuento_Cotizacion" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="intCotizacionid" 
                QueryStringField="cotizacionId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
        SelectCommand="get_Iva_Cotizacion" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="intCotizacionid" 
                QueryStringField="cotizacionId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" GridLines="Horizontal" HorizontalAlign="Left" meta:resourcekey="GridView1Resource1" ShowFooter="True" Width="817px" OnRowCreated="GridView_RowCreated" Font-Bold="False" ForeColor="Black">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text="<%# get_numeroPartida() %>"></asp:Label>
                    &nbsp;
                </ItemTemplate>
                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Size="8pt" 
                    VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="IdProducto" HeaderText="PRODUCTO" SortExpression="IdProducto" meta:resourcekey="BoundFieldResource2" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="DESCRIPCIÓN" SortExpression="Descripcion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Comentario") %>' 
                        Visible="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRECIO" SortExpression="PrecioDescuento">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("PrecioDescuento") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# String.Format("{0:#,##0.00}", Eval("PrecioDescuento")) %>'></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text='<%# String.Format("{0:#,##0.00}", Eval("Precio")) %>'
                        Visible="False"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CANTIDAD" SortExpression="Cantidad">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cantidad") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                    <asp:Label ID="Label9" runat="server" Font-Size="9pt" Text='<%# Bind("unidadMedida") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCUENTO" meta:resourcekey="TemplateFieldResource1"
                SortExpression="DESCUENTO">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text='<%# Eval("Descuento") %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    &nbsp;<br />
                    <br />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text='<%# Bind("Descuento") %>'></asp:Label>
                    <asp:Label ID="lblsimbolo" runat="server" Font-Size="8pt" Text="%"></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:Label ID="lblDescuento" runat="server" Text="DESCUENTO"></asp:Label>
                </HeaderTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="T. ENTREGA" SortExpression="TiempoEntrega">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TiempoEntrega") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="12pt" meta:resourcekey="Label3Resource1"
                        Text="SubTotal:"></asp:Label><br />
                    <asp:Label ID="Label4" runat="server" Font-Size="10pt" meta:resourcekey="Label4Resource1"
                        Text="Iva:"></asp:Label><br />
                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Total:" Width="80px"></asp:Label>
                    <br />
                    <asp:Label ID="Label10" runat="server" Font-Size="12pt" meta:resourcekey="Label10Resource1"
                        Text="Desc Gral:" Enabled="False" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="Label11" runat="server" Font-Size="12pt" meta:resourcekey="Label11Resource1"
                        Text="SubTS/Desc:" Enabled="False" Visible="False"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TiempoEntrega") %>'></asp:Label>
                    <asp:Label ID="Label7" runat="server" Font-Size="8pt" Text="días hábiles"></asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TOTAL" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text='<%# String.Format("{0:N}",Get_Amount(Double.Parse(Eval("Importe").ToString() ))) %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="subtotal" runat="server" Text='<%# String.Format("{0:N}", Get_SubTotal()) %>'></asp:Label>
                    <br />
                    <asp:Label ID="Iva" runat="server" Text='<%# String.Format("{0:N}", Get_Interes()) %>'></asp:Label><br />
                    <asp:Label ID="Total" runat="server" Text='<%# String.Format("{0:N}", Get_Order_Total()) %>' ></asp:Label>
                    <br />
                    <asp:Label ID="Descuento" runat="server" 
                        Text='<%# String.Format("{0:N}", Get_Descuento()) %>' Enabled="False" 
                        Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="SubtSinDesc" runat="server" 
                        Text='<%# String.Format("{0:N}", Get_SubTotalSinDesc()) %>' Enabled="False" 
                        Visible="False"></asp:Label>
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BorderColor="#404040" BorderStyle="None" BorderWidth="3px" HorizontalAlign="Left" BackColor="Gray" Font-Size="9pt" ForeColor="White" />
        <RowStyle BorderStyle="Groove" BorderWidth="1px" BorderColor="Silver" />
        <AlternatingRowStyle BorderStyle="Groove" BorderWidth="1px" BorderColor="Silver" />
        <FooterStyle Font-Bold="True" />
        <SelectedRowStyle BorderStyle="None" />
    </asp:GridView>
</asp:Content>

