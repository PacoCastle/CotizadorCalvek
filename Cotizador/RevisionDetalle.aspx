<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RevisionDetalle.aspx.cs" Inherits="Cotizador_RevisionDetalle" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label1" runat="Server" Font-Size="14pt" ForeColor="#990000" Text="Detalle de Cotizacion"></asp:Label><br />
    <br />
    <table border="0">
        <tr>
            <td style="width: 132px">
                <b>Cotización No.: </b>
            </td>
            <td style="width: 50px">
                <asp:Label ID="OrderNumberLabel" runat="Server" meta:resourcekey="OrderNumberLabelResource1"></asp:Label></td>
            <td style="width: 79px; text-align: right">
                <b>Moneda: </b>
            </td>
            <td style="width: 121px; text-align: left">
                <asp:Label ID="lblMoneda" runat="server" meta:resourcekey="lblMonedaResource1"></asp:Label></td>
            <td style="width: 79px; text-align: right">
                <strong>Estatus.:</strong></td>
            <td style="width: 169px">
                <asp:Label ID="lbEstatusCotizacion" runat="Server" meta:resourcekey="lbEstatusCotizacionResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 132px; height: 20px; text-align: right">
                <b>Cliente: </b>
            </td>
            <td colspan="5" style="height: 20px; text-align: left">
                <asp:Label ID="lblRazonSocial" runat="server" meta:resourcekey="lblRazonSocialResource1"
                    Text="razonSocial"></asp:Label>
                <asp:Label ID="lblNumMoneda" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblTipoCambio" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblFechaCotizacion" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblCodigoCliente" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblCodigoAgente" runat="server" Visible="False"></asp:Label></td>
        </tr>
    </table>
    &nbsp;
    <asp:Label ID="NoItemsMessage" runat="Server" BackColor="#E0E0E0" BorderColor="Silver"
        BorderStyle="Solid" BorderWidth="1px" EnableViewState="False" ForeColor="#990000"
        Height="21px" Style="padding-right: 15px; margin-top: 10px; padding-left: 15px;
        padding-bottom: 15px; padding-top: 15px" Text="No hay Productos en la cotización."
        Visible="False" Width="496px"></asp:Label>
    <asp:Panel ID="Panel1" runat="Server" ForeColor="#990000" HorizontalAlign="Right"
        Width="550">
        <asp:Label ID="ErrMessage" runat="Server" EnableViewState="False" Text=" "></asp:Label></asp:Panel>
    &nbsp;
    <asp:Label ID="lblComodin" runat="server"></asp:Label>
    <asp:SqlDataSource ID="ShopCartSource" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
        DeleteCommand="DELETE FROM detalles&#13;&#10;                 WHERE cotizacionid=@OrderNumber AND productoRef=@BookID"
        OnSelected="Get_Rows" SelectCommand="select d.cotizacionid as OrderNumber,d.productoRef as BookID,d.productodesc as BookTitle,replace(d.productoprecio,'$','') as BookPrice,d.cantidad as BookQty,c.tipoMoneda as moneda,isnull(Descuento,0) as descu from detalles d,cotizaciones c where c.cotizacionid =  @OrderNumber and c.cotizacionid = d.cotizacionid"
        UpdateCommand="UPDATE detalles SET Cantidad = @BookQty, Descuento = @descu WHERE (CotizacionId = @OrderNumber) AND (ProductoRef = @BookID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OrderNumberLabel" Name="OrderNumber" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="BookQty" />
            <asp:Parameter Name="descu" />
            <asp:ControlParameter ControlID="OrderNumberLabel" Name="OrderNumber" PropertyName="Text" />
            <asp:Parameter Name="BookID" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="OrderNumberLabel" Name="OrderNumber" PropertyName="Text" />
            <asp:Parameter Name="BookID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    &nbsp;
    <asp:GridView ID="ShopCartGrid" runat="Server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="OrderNumber,BookID" DataSourceID="ShopCartSource" EditRowStyle-BackColor="#E0E0E0"
        ForeColor="#333333" GridLines="None" HeaderStyle-BackColor="#990000" HeaderStyle-ForeColor="#FFFFFF"
        meta:resourcekey="ShopCartGridResource1" OnRowCreated="ShopCartGrid_RowCreated"
        OnRowUpdating="Validate_Quantity" ShowFooter="True">
        <Columns>
            <asp:TemplateField HeaderText="Producto No." meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Font-Size="10pt" meta:resourcekey="Label2Resource1"
                        Text='<%# Eval("BookID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="10pt" meta:resourcekey="Label3Resource1"
                        Text='<%# Eval("BookID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemStyle Width="30px" />
                <FooterStyle BackColor="#E0E0E0" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Font-Size="10pt" meta:resourcekey="Label4Resource1"
                        Text='<%# Eval("BookTitle") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label5" runat="server" Font-Size="10pt" meta:resourcekey="Label5Resource1"
                        Text='<%# Eval("BookTitle") %>'></asp:Label>
                </EditItemTemplate>
                <ItemStyle Width="200px" />
                <FooterStyle BackColor="#E0E0E0" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Precio" meta:resourcekey="TemplateFieldResource3">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Font-Size="10pt" meta:resourcekey="Label6Resource1"
                        Text='<%# String.Format("{0:N}", Eval("BookPrice")) %>'></asp:Label>
                    <asp:Label ID="Label16" runat="server" Font-Size="8pt" meta:resourcekey="Label16Resource1"
                        Text='<%# get_tipoMoneda(Int32.Parse(Eval("moneda").ToString())) %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label7" runat="server" Font-Size="10pt" meta:resourcekey="Label7Resource1"
                        Text='<%# String.Format("{0:N}", Eval("BookPrice")) %>'></asp:Label>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                <FooterStyle BackColor="#E0E0E0" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cantidad" meta:resourcekey="TemplateFieldResource4">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Font-Size="10pt" meta:resourcekey="Label8Resource1"
                        Style="text-align: right" Text='<%# String.Format("{0:D}", Eval("BookQty")) %>'
                        Width="25px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BookQty" runat="server" Font-Size="10pt" Height="17px" MaxLength="2"
                        meta:resourcekey="BookQtyResource1" Style="padding: 0px; text-align: right" Text='<%# Bind("BookQty") %>'
                        Width="25px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Label9" runat="server" BorderStyle="Solid" BorderWidth="0px" Font-Size="11pt"
                        Height="20px" meta:resourcekey="Label9Resource1" Text="SubTotal:" Width="80px"></asp:Label><br />
                    <br />
                    <asp:Label ID="Label14" runat="server" BorderStyle="Solid" BorderWidth="0px" Font-Size="9pt"
                        Height="12px" meta:resourcekey="Label14Resource1" Text="Iva (15%):" Width="78px"></asp:Label><br />
                    <asp:Label ID="Label10" runat="server" BorderStyle="Solid" BorderWidth="0px" Font-Bold="True"
                        Font-Size="12pt" meta:resourcekey="Label10Resource1" Style="padding: 2px; margin-top: 5px"
                        Text="Total:" Width="50px"></asp:Label>
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Right" Width="40px" />
                <FooterStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Descuento" meta:resourcekey="TemplateFieldResource5">
                <EditItemTemplate>
                    <asp:TextBox ID="descu" runat="server" MaxLength="2" meta:resourcekey="descuResource1"
                        Text='<%# String.Format("{0:D}", getDescuento(Eval("descu").ToString())) %>' Width="33px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource2" Text='<%# String.Format("{0:D}", getDescuento(Eval("descu").ToString())) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Importe" meta:resourcekey="TemplateFieldResource6">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Font-Size="10pt" meta:resourcekey="Label11Resource1"
                        Text='<%# String.Format("{0:N}",Get_Amount(Double.Parse(Eval("BookPrice").ToString()),Int32.Parse(Eval("BookQty").ToString()),Int32.Parse(Eval("descu").ToString()))) %>'></asp:Label>
                    <asp:Label ID="Label17" runat="server" Font-Size="8pt" meta:resourcekey="Label17Resource1"
                        Text='<%# get_tipoMoneda(Int32.Parse(Eval("moneda").ToString())) %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label12" runat="server" Font-Size="10pt" meta:resourcekey="Label12Resource1"
                        Text='<%# String.Format("{0:N}",Get_Amount(Double.Parse(Eval("BookPrice").ToString()),Int32.Parse(Eval("BookQty").ToString()),Int32.Parse(Eval("descu").ToString()))) %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Label15" runat="server" Font-Size="12pt" meta:resourcekey="Label15Resource1"
                        Text='<%# String.Format("{0:N}", Get_Shipping()) %>'></asp:Label><br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Font-Size="10pt" meta:resourcekey="Label13Resource1"
                        Text='<%# String.Format("{0:N}", Get_Interes()) %>'></asp:Label><br />
                    <asp:Label ID="OrderTotal" runat="server" BorderColor="Silver" BorderStyle="Solid"
                        BorderWidth="1px" Font-Bold="True" meta:resourcekey="OrderTotalResource1" Style="padding: 2px;
                        margin-top: 5px" Text='<%# String.Format("{0:N}", Get_Order_Total()) %>' Width="80px"></asp:Label>
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Right" Width="80px" />
                <FooterStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Editar" meta:resourcekey="TemplateFieldResource7">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandName="Edit" Font-Size="7pt" meta:resourcekey="Button1Resource1"
                        Text="Edit" Width="35px" />
                    <asp:Button ID="Button2" runat="server" CommandName="Delete" Font-Size="7pt" meta:resourcekey="Button2Resource1"
                        Text="Delete" Width="35px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="Button3" runat="server" CommandName="Update" Font-Size="7pt" meta:resourcekey="Button3Resource1"
                        Text="Update" Width="35px" />
                    <asp:Button ID="Button4" runat="server" CommandName="Cancel" Font-Size="7pt" meta:resourcekey="Button4Resource1"
                        Text="Cancel" Width="35px" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button6" runat="server" meta:resourcekey="Button6Resource1" OnClick="Button6_Click"
                        Text="ACEPTAR" /><br>
                    <asp:Button ID="Button5" runat="server" Font-Size="8pt" meta:resourcekey="Button5Resource1"
                         Style="margin-top: 22px" Text="Caida" Width="75px" OnClick="Button5_Click1" />
                </FooterTemplate>
                <ItemStyle Width="75px" />
                <FooterStyle BackColor="#E0E0E0" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <br />
</asp:Content>

