<%@ Page Language="C#" MasterPageFile="~/Cotizador/Cotizador.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Cotizador_Search" Title="SICK - Cotizador" %>
<asp:Content id="Search" ContentPlaceHolderID="CONTENT" Runat="Server">
    <link href="../Estilos/Grid_AMI.css" rel="stylesheet" />
    <style type="text/css">
    .btn{
cursor:pointer; /*forces the cursor to change to a hand when the button is hovered*/
padding:5px 25px; /*add some padding to the inside of the button*/
background:#35b128; /*the colour of the button*/
border:1px solid #33842a; /*required or the default border for the browser will appear*/
/*give the button curved corners, alter the size as required*/
-moz-border-radius: 10px;
-webkit-border-radius: 10px;
border-r
border-radius: 10px;
/*give the button a drop shadow*/
-webkit-box-shadow: 0 0 4px rgba(0,0,0, .75);
-moz-box-shadow: 0 0 4px rgba(0,0,0, .75);
box-shadow: 0 0 4px rgba(0,0,0, .75);
/*style the text*/
color:#f3f3f3;
font-size:1.1em;
}
/***NOW STYLE THE BUTTON'S HOVER AND FOCUS STATES***/
input#gobutton:hover, input#gobutton:focus{
background-color :#399630; /*make the background a little darker*/
/*reduce the drop shadow size to give a pushed button effect*/
-webkit-box-shadow: 0 0 1px rgba(0,0,0, .75);
-moz-box-shadow: 0 0 1px rgba(0,0,0, .75);
box-shadow: 0 0 1px rgba(0,0,0, .75);
}
        .auto-style1 {
            height: 22px;
        }
    </style>

<table style="width: 100%">
    <tr>
        <td class="auto-style1" >
            <asp:Label id="Type" Font-Size="12pt" ForeColor="Black" Runat="Server"/>&nbsp;&nbsp;
            <asp:Label ID="lblTipoMoneda" runat="server" Visible="False" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblError" runat="server" Visible="False" ForeColor="Black"></asp:Label>
        </td>
        <td style="vertical-align: sub; text-align: left" class="auto-style1">
            <asp:LinkButton ID="lnkDisponibles" runat="server" 
                onclick="lnkDisponibles_Click" Visible="False">Disponibilidad</asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="lnkDetalles" runat="server" onclick="lnkDetalles_Click" Visible="False">Detalles</asp:LinkButton>
        </td>
    </tr>
</table>
<asp:GridView id="Books" Runat="Server"
          AutoGenerateColumns="False"
          HeaderStyle-BackColor="#990000"
          HeaderStyle-ForeColor="#FFFFFF"
          CellPadding="4"
          Style="margin-top:10px"
          OnRowCreated="Books_RowCreated" ForeColor="#336666" GridLines="None" Width="1100px" Font-Size="9pt" DataSourceID="ObjectDataSourceProd" Font-Names="Verdana" DataKeyNames="Precio"  >

  <Columns>
      <asp:BoundField DataField="Marca" HeaderText="Marca" Visible="False">
          <HeaderStyle Font-Size="10pt" />
          <ItemStyle Font-Size="10pt" />
      </asp:BoundField>
      <asp:TemplateField HeaderText="Modelo">
          <EditItemTemplate>
              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Modelo") %>'></asp:TextBox>
          </EditItemTemplate>
          <ItemTemplate>
              <asp:Label ID="Label8" runat="server" Text='<%# Bind("Modelo") %>' ForeColor="Black"></asp:Label>
          </ItemTemplate>
          <ControlStyle Font-Size="10pt" />
          <ItemStyle Font-Size="10pt" />
      </asp:TemplateField>

  <asp:BoundField
    HeaderText="Descripción"
    DataField="Descripcion">
      <ItemStyle Font-Size="10pt" />
      <ControlStyle Font-Size="10pt" />
      <HeaderStyle Font-Size="10pt" />
  </asp:BoundField>
      <asp:BoundField DataField="descuento" HeaderText="descuento" Visible="False" >

      <ItemStyle Font-Size="10pt" />
      </asp:BoundField>

  <asp:TemplateField 
    HeaderText="Precio">
    <ItemTemplate>
      <asp:Label ID="Label1" Runat="Server"
        Text='<%# String.Format("{0:N}", Eval("Precio")) %>' Font-Size="10pt" ForeColor="Black"/>
        <asp:Label ID="Label6" runat="server" Text='<%# get_tipoMoneda(Int32.Parse(Eval("moneda").ToString())) %>' Font-Size="8pt" Height="13px" Width="1px" ForeColor="Black"></asp:Label>
    </ItemTemplate>
      <ItemStyle HorizontalAlign="Right" Font-Size="10pt" />
      <ControlStyle ForeColor="Black" />
      <HeaderStyle Font-Size="10pt" HorizontalAlign="Center" />
  </asp:TemplateField>

  <asp:TemplateField HeaderText="Precio C">
    <ItemTemplate>
      <asp:Label ID="Label2" Runat="Server"
        Text='<%# Get_Sale_Price(Double.Parse(Eval("Precio").ToString()), Int32.Parse(Eval("moneda").ToString())) %>' Font-Size="10pt"/>
        <asp:Label ID="Label5" runat="server" Font-Size="8pt" Text="<%# lblTipoMoneda.Text %>" Width="10px" ForeColor="Black"></asp:Label>
    </ItemTemplate>
      <ItemStyle Font-Bold="True" HorizontalAlign="Right" Font-Size="10pt" />
      <ControlStyle ForeColor="Black" />
      <HeaderStyle Font-Size="10pt" HorizontalAlign="Center" />
  </asp:TemplateField>

      <asp:TemplateField>
          <ItemTemplate>
              <asp:LinkButton ID="lnkAgregaProducto" runat="server" CommandArgument='<%#Eval("Marca")+"|"+Eval("unidadEmpaque")+"|"+Eval("moneda")+"|"+Eval("descuento")%>' CommandName='<%#Eval("Modelo")+"|"+Eval("ID")+"|"+Eval("Descripcion")+"|"+Eval("Precio")+"|"+Eval("AplicaRango")%>' Font-Bold="True" Font-Size="11pt" ForeColor="#000099" OnCommand="add_product" Text="Agregar"></asp:LinkButton>
          </ItemTemplate>
          <ItemStyle Font-Size="10pt" HorizontalAlign="Right" />
      </asp:TemplateField>
		
      <asp:TemplateField HeaderText="Tipo">
          <EditItemTemplate>
              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
          </EditItemTemplate>
          <ItemTemplate>
              <asp:Label ID="Label3" runat="server" Text='<%# Bind("desctp") %>' ForeColor="Black"></asp:Label>
          </ItemTemplate>
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle Font-Size="10pt" ForeColor="Black" HorizontalAlign="Center" />
      </asp:TemplateField>
		
      <asp:BoundField DataField="unidad_negocio" HeaderText="UNegocio">
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" Font-Size="10pt" />
      </asp:BoundField>
      <asp:BoundField DataField="costo" HeaderText="Costo" Visible="False">
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
      </asp:BoundField>
      <asp:BoundField DataField="utilidad" HeaderText="%Util" Visible="False">
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
      </asp:BoundField>
		
      <asp:TemplateField HeaderText="Desctos" Visible="False">
          <EditItemTemplate>
              <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
          </EditItemTemplate>
          <ItemTemplate>
              <asp:Label ID="Label4" runat="server" Text='<%# Bind("aplicarango") %>' ForeColor="Black"></asp:Label>
          </ItemTemplate>
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle Font-Size="10pt" ForeColor="Black" HorizontalAlign="Center" />
      </asp:TemplateField>
		
      <asp:BoundField DataField="rango1" DataFormatString="{0:c}" HeaderText="0-24">
      <ItemStyle Font-Size="10pt" />
      </asp:BoundField>
      <asp:BoundField DataField="rango2" DataFormatString="{0:c}" HeaderText="25-50">
      <ItemStyle Font-Size="10pt" />
      </asp:BoundField>
      <asp:BoundField DataField="rango3" DataFormatString="{0:c}" HeaderText="51-120">
      <ItemStyle Font-Size="10pt" />
      </asp:BoundField>
      <asp:BoundField DataField="rango4" DataFormatString="{0:c}" HeaderText="121-250">
      <ItemStyle Font-Size="10pt" />
      </asp:BoundField>
		
  </Columns>
    <HeaderStyle ForeColor="White" Font-Bold="True" BackColor="#341C5E" />
    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;"
        NextPageText="Sig" PreviousPageText="Ant" />
    <FooterStyle BackColor="#341C5E" Font-Bold="True" ForeColor="White" />
    <RowStyle ForeColor="Black" CssClass="itemStyle" />
    <EditRowStyle BackColor="#999999" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#341C5E" ForeColor="White" HorizontalAlign="Center" />
    <AlternatingRowStyle ForeColor="Black" CssClass="alternateItemStyle" />

</asp:GridView>
        
           <asp:ObjectDataSource ID="ObjectDataSourceProd2" runat="server" OldValuesParameterFormatString="original_{0}"
           SelectMethod="GetData" 
        TypeName="cotizadorTableAdapters.get_buscaProdCriterio_CONSOLIDATableAdapter">
               <SelectParameters>
                   <asp:QueryStringParameter DefaultValue="" Name="criterio" QueryStringField="Criterion"
                       Type="String" />
                   <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
                   <%--<asp:QueryStringParameter Name="intAdminPaq" QueryStringField="filtroAdminPaq" Type="Int32" />--%>
                   <asp:SessionParameter Name="intCotizacionId" SessionField="OrderNumber" Type="Int32" DefaultValue="0" />
                   <asp:SessionParameter DefaultValue="1" Name="intOficina" 
                       SessionField="oficinaID" Type="Int32" />
               </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:LinkButton ID="lkbAltaProductoComodin" runat="server" OnClick="lkbAltaProductoComodin_Click" Enabled="False" Visible="False">Alta Producto Comodin</asp:LinkButton><br />
    
</asp:Content>


