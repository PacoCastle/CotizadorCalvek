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
             <td colspan="4" style="height: 42px">
             </td>
        </tr>
         <tr>            
            <td colspan="4" valign="top">
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="oficinaID,ID_PRODUCTO,cidmovim01,cfolio" 
                    DataSourceID="SqlDataSource1" Font-Size="9pt" ForeColor="#333333" 
                    GridLines="None" Width="100%" 
                    Caption="&lt;font color=&quot;#0000FF&quot; size=&quot;3&quot;&gt; DETALLES STOCK &lt;/font&gt;" 
                    CaptionAlign="Left">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="cidmovim01" HeaderText="Id" ReadOnly="True" 
                            SortExpression="cidmovim01" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="sucursal" HeaderText="Sucursal" ReadOnly="True" 
                            SortExpression="sucursal" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cfolio" HeaderText="Folio" ReadOnly="True" 
                            SortExpression="cfolio" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha" HeaderText="FechaAlta" ReadOnly="True" 
                            SortExpression="fecha" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pendientes" HeaderText="Pendientes" ReadOnly="True" 
                            SortExpression="pendientes" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                       <%-- <asp:TemplateField HeaderStyle-HorizontalAlign="Left" 
                            HeaderText="Fecha Entrega" SortExpression="FECHA_ENTREGA">
                            <EditItemTemplate>
                                <asp:TextBox ID="fecha_Entrega" runat="server" CssClass="date-pick" 
                                    Font-Size="Small" Text='<%# Bind("FECHA_ENTREGA") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revFechaEntrega" runat="server" 
                                    ControlToValidate="fecha_Entrega" Display="Dynamic" EnableClientScript="true" 
                                    Enabled="true" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt" 
                                    ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" 
                                    ValidationGroup="procesa" Width="190px">
                            </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("FECHA_ENTREGA") %>'></asp:Label>
                            </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" 
                            HeaderText="Fecha Confirmada" SortExpression="FECHA_CONFIRMADA">
                            <EditItemTemplate>
                                <asp:TextBox ID="fecha_Confirmada" runat="server" CssClass="date-pick" 
                                    Font-Size="Small" Text='<%# Bind("FECHA_CONFIRMADA") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revFechaConfirmada" runat="server" 
                                    ControlToValidate="fecha_Confirmada" Display="Dynamic" 
                                    EnableClientScript="true" Enabled="true" 
                                    ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="8pt" 
                                    ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" 
                                    ValidationGroup="procesa" Width="190px">
                            </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFechaConfirmada" runat="server" 
                                    Text='<%# Bind("FECHA_CONFIRMADA") %>'></asp:Label>
                            </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommand="get_listaProductosStock_Detalles" 
                    SelectCommandType="StoredProcedure" UpdateCommand="set_fechaConfirmadaStock" 
                    UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strCod_prod" 
                            QueryStringField="Modelo" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="oficinaID" Type="String" />
                        <asp:Parameter Name="ID_PRODUCTO" Type="String" />
                        <asp:Parameter Name="cidmovim01" Type="String" />
                        <asp:Parameter Name="cfolio" Type="String" />
                        <asp:Parameter Name="fecha_Entrega" Type="datetime" />
                        <asp:Parameter Name="fecha_Confirmada" Type="datetime" />
                        <asp:Parameter Name="factura" Type="String" />
                        <asp:Parameter Name="fecha_factura" Type="datetime" />
                        <asp:Parameter Name="noGuia" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
             <td colspan="4" style="height: 42px">
             </td>
        </tr>
        <tr>            
            <td colspan="4" valign="top">
        <asp:GridView ID="gvReservados" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnRowCreated="GridView1_RowCreated" Font-Size="9pt"   
        Caption="&lt;font color=&quot;#0000FF&quot; size=&quot;3&quot;&gt; RESERVADOS &lt;/font&gt;" >
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
            <asp:BoundField DataField="Almacen" HeaderText="Alm" SortExpression="Almacen" />
            <asp:BoundField DataField="Instruccion2" HeaderText="Instruccion" SortExpression="Instruccion2" />
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

