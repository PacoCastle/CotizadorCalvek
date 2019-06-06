<%@ Page Language="C#" MasterPageFile="~/Cotizador/Cotizador.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Cotizador_Details" Title="Untitled Page" %>
<asp:Content id="Details" ContentPlaceHolderID="CONTENT" Runat="Server">

<asp:Label ID="Label1" Text="Detalle del Producto" Runat="Server"
Font-Size="14pt" ForeColor="#0000C0"/><asp:FormView id="FormViewDisplay" DataSourceID="ObjectDataSourceDet" Runat="Server" Style="margin-top:10px" >

  <ItemTemplate>
    <table border="0">
    <tr>
      <td style="width:60px">
        <asp:Image ID="Image1" Runat="Server"
          ImageUrl='<%# "BookPictures/" + Eval("Modelo") + ".jpg" %>'
          Style="float:left; margin-right:10px"/>
      </td>
      <td style="width:440px">
        <asp:Label id="BookID" Runat="Server"
          Text='<%# Eval("Modelo") %>'
          Font-Bold="True"/><br/>
        <asp:Label id="BookTitle" Runat="Server"
          Text='<%# Eval("Descripcion") %>'
          Font-Bold="True" Font-Size="14pt"/><br/>
        <asp:Label id="BookAuthor" Runat="Server"
          Text='<%# Eval("BookAuthor") %>'/><br />
          <asp:Label ID="Label5" runat="server" Text="Precio:"></asp:Label>
        <asp:Label id="BookSalePrice" Runat="Server"
          Text='<%# Get_Sale_Price(Double.Parse(Eval("Precio").ToString()), Int32.Parse(Eval("moneda").ToString())) %>'
          Font-Bold="True" ForeColor="#0000C0" />
          <asp:Label ID="lblTipoMoneda" runat="server" ForeColor="#8080FF"></asp:Label><asp:Label
              ID="lblMoneda" runat="server" Text='<%# Eval("moneda") %>' Visible="False"></asp:Label>
          <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("Precio") %>' Visible="False"></asp:Label><br/>
          <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Cantidad"></asp:Label>
          <asp:TextBox ID="txtCantidad" runat="server" Width="30px">1</asp:TextBox>
          <asp:DropDownList ID="lstUnidadMedida" runat="server" DataSourceID="ObjectDataSource3"
              DataTextField="unidadMedida_nombre" DataValueField="unidadMedida_Id" SelectedValue='<%# Eval("unidadEmpaque") %>'>
          </asp:DropDownList>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCantidad"
              ErrorMessage="Solo Digitos" ValidationExpression="[0-9]{1,100}" Font-Size="7pt"></asp:RegularExpressionValidator><br />
          <asp:Label ID="Label6" runat="server" Text="Tiempo entrega: "></asp:Label>
          <asp:TextBox ID="txtTiempoEntrega" runat="server" Text='<%# Bind("tiempoEntrega") %>' Width="30px"></asp:TextBox>
          <asp:Label ID="Label7" runat="server" Text="días hábiles." Font-Size="9pt"></asp:Label>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTiempoEntrega"
              ErrorMessage="Solo Digitos" ValidationExpression="[0-9]{1,100}" Font-Size="7pt"></asp:RegularExpressionValidator><br />
          <asp:Label ID="Label8" runat="server" Text="Descuento:" Visible="False"></asp:Label>
          <asp:Label ID="lblDescuento" runat="server" Text='<%# Eval("descuento") %>' Visible="False"></asp:Label><asp:Label
              ID="lblEtiPorcentaje" runat="server" Text="%" Visible="False" Font-Size="10pt"></asp:Label><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
              SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUnidadMedidaTableAdapter">
          </asp:ObjectDataSource>
      </td>	
    </tr>
        <tr>
            <td style="width: 60px">
            </td>
            <td align="center" style="width: 440px" valign="top">
                <br />
          <asp:Button ID="Button1" Text="Agregar" OnClick="Add_To_Cart" Runat="Server" BorderStyle="None" Font-Size="10pt" Width="80px"/></td>
        </tr>
    <tr>
      <td colspan="2">
        <br/>
        <asp:Label ID="Label2" Width="500px" Runat="Server"
          Text='<%# Eval("BookDescription") %>'/>
      </td>
    </tr>
    </table>

  </ItemTemplate>
</asp:FormView>
  <asp:ObjectDataSource ID="ObjectDataSourceDet" runat="server" OldValuesParameterFormatString="original_{0}"
   SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaProdDetalleTableAdapter">
      <SelectParameters>
          <asp:QueryStringParameter DefaultValue="0" Name="producto" QueryStringField="Modelo"
              Type="String" />
          <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
          <asp:SessionParameter Name="intCotizacionId" SessionField="OrderNumber" Type="Int32" />
      </SelectParameters>
   </asp:ObjectDataSource>
    <br />
    <table>
        <tr>
            <td valign="top">
            </td>
            <td valign="top">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource2" Font-Size="8pt" ForeColor="#333333" GridLines="None" Caption="EXISTENCIA" CaptionAlign="Left" EmptyDataText="NO HAY EXISTENCIA" RowHeaderColumn="oficina">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="oficina" HeaderText="Oficina" ReadOnly="True" SortExpression="oficina">
                <ItemStyle Font-Bold="True" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Almacen" HeaderText="Almacen" ReadOnly="True" SortExpression="Almacen" />
            <asp:BoundField DataField="Existencia" HeaderText="Existencia" ReadOnly="True" SortExpression="Existencia">
                <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_buscaExistenciaProductoDetalleTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="strCodigo" QueryStringField="modelo" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
            </td>
            <td style="width: 102px" valign="top">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdsStockEnTransito" Font-Size="8pt" ForeColor="#333333" GridLines="None" Caption="COMPRAS DE STOCK" CaptionAlign="Left">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                        <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" SortExpression="Sucursal" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsStockEnTransito" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    SelectCommand="get_productoEnStock" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strProducto" QueryStringField="modelo" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Caption="TIEMPO DE ENTREGA"
                    CaptionAlign="Left" CellPadding="4" DataSourceID="odsTiempoEntrega" Font-Size="8pt"
                    ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="num_dias_promedio" HeaderText="D&#237;as Prom." ReadOnly="True"
                            SortExpression="num_dias_promedio">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="num_dias_maximo" HeaderText="D&#237;as M&#225;ximo" ReadOnly="True"
                            SortExpression="num_dias_maximo">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsTiempoEntrega" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_tiempoEntregaKEPLERTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strCodigo" QueryStringField="modelo" Type="String" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top">
            </td>
            <td colspan="3" valign="top">
    <asp:GridView ID="gvReservados" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnRowCreated="GridView1_RowCreated" Font-Size="9pt" Caption="RESERVADOS" CaptionAlign="Left" Width="100%">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="Folio" HeaderText="Folio" ReadOnly="True" SortExpression="Folio" />
            <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
            <asp:BoundField DataField="Reservados" HeaderText="Reservados" SortExpression="Reservados">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Oficina" HeaderText="Oficina" SortExpression="Oficina" />
            <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
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
    <br />
    &nbsp;&nbsp;<br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaPendientesProductosTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="strCodigoProd" QueryStringField="Modelo" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />

</asp:Content>

