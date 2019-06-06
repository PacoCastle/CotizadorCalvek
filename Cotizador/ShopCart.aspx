<%@ Page Language="C#" MasterPageFile="~/Cotizador/Cotizador.master" AutoEventWireup="true" CodeFile="ShopCart.aspx.cs" Inherits="Cotizador_ShopCart" Title="SICK - Cotizador" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content id="ShopCart" ContentPlaceHolderID="CONTENT" Runat="Server">
    <link href="../Estilos/Grid_AMI.css" rel="stylesheet" />
    <style type="text/css">
           .modalBackground 
            {
                background-color: Black;
                filter: alpha(opacity=90);
                opacity: 0.8;
                z-index: 10001;
            }
            .modalBackgroundd
            {
                
                z-index: 10002
            }
           .modalpopup
           {
               min-width:200px;
               min-height:150px;
               background:white;
               -webkit-border-radius: 5px;
               -moz-border-radius: 5px;
               border-radius: 5px;
               -webkit-box-shadow: 1px 1px 16px 0px rgba(255, 255, 255, 0.55);
               -moz-box-shadow:    1px 1px 16px 0px rgba(255, 255, 255, 0.55);
               
               
           }
           .modalpopupd
           {
               min-width:200px;
               min-height:150px;
               background:white;
               -webkit-border-radius: 5px;
               -moz-border-radius: 5px;
               border-radius: 5px;
               -webkit-box-shadow: 1px 1px 16px 0px rgba(255, 255, 255, 0.55);
               -moz-box-shadow:    1px 1px 16px 0px rgba(255, 255, 255, 0.55);
               
               
           }
           
    .style1
    {
        height: 18px;
        width: 569px;
    }
    .style3
    {
        height: 18px;
        width: 569px;
    }
    .style26
    {
        width: 569px;
    }
    .style29
    {
        height: 18px;
        width: 142px;
    }
    .style30
    {
        width: 142px;
    }
    .style33
    {
        width: 470px;
        height:18px;
    }
        .style34
        {
            width: 18px;
        }
        .style35
        {
            width: 18px;
            height: 28px;
        }
        .style36
        {
            height: 28px;
        }
        .auto-style1 {
        width: 156px;
        height: 20px;
    }
    .auto-style2 {
        width: 39px;
        height: 20px;
    }
    .auto-style3 {
        width: 59px;
        height: 20px;
    }
    .auto-style4 {
        width: 98px;
        height: 20px;
    }
    .auto-style5 {
        width: 24px;
        height: 20px;
    }
    .auto-style6 {
        height: 20px;
    }
        </style>
    <%--<asp:Label id="ErrMessage" Text=" " EnableViewState="False" Runat="server" meta:resourcekey="ErrMessageResource1"/--%>


<script type="text/javascript" language="javascript" charset="je">

    $(function () {
        $('#<%=txtFechaCaida.ClientID%>').datePicker({ startDate: '01/01/2006' });
    });
    /*Modifica FJCA 20/02/2015 Cambio este fragmento |2[1-9]| por este |2[0-9]| para que acepte el segundo digito del día con 0*/
    /*Modifica FJCA 10/03/2015 Cambio este fragmento |(0|1)[1-9]| por este (0|1)[0-9] para que acepte el primer digito del día con 0*/
    function ValidateDate(sender, args) {
        var dateString = document.getElementById(sender.controltovalidate).value;
        var regex = /(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[1-2])\/((19|20)\d\d))$/;
        if (regex.test(dateString)) {
            var parts = dateString.split("/");
            var dt = new Date(parts[1] + "/" + parts[0] + "/" + parts[2]);
            args.IsValid = (dt.getDate() == parts[0] && dt.getMonth() + 1 == parts[1] && dt.getFullYear() == parts[2]);
        } 
        else {args.IsValid = false;}
    }

    </script>


<br />   
<asp:Label ID="Label1" Text="Detalle de Cotizacion" Font-Size="14pt" ForeColor="#341C5E" 
Runat="Server" meta:resourcekey="Label1Resource1"/>
            <br/>
    <asp:Label ID="lblUsuarioId" runat="server" Visible="False"></asp:Label>
    <br/>
<table border="0">
<tr>
  <td style="text-align: right; " class="auto-style1"><b><span style="font-size: 8pt">Unidad Negocio:</span></b></td>
  <td class="auto-style2"><asp:Label id="UnidadNegocio" Runat="Server" meta:resourcekey="OrderNumberLabelResource1" Font-Size="9pt"/></td>
  <td style="text-align: right; " class="auto-style3"></td>
  <td style="text-align: left; " class="auto-style4">
      </td>
    <td style="text-align: right; " class="auto-style5">
        </td>
    <td colspan="2" class="auto-style6">
        </td>
</tr>
<tr>
  <td style="width: 156px; text-align: right; height: 20px;">&nbsp;</td>
  <td style="width: 39px; height: 20px;">&nbsp;</td>
  <td style="width: 59px; text-align: right; height: 20px;">&nbsp;</td>
  <td style="width: 98px; text-align: left; height: 20px;">
      &nbsp;</td>
    <td style="width: 24px; text-align: right; height: 20px;">
        &nbsp;</td>
    <td style="height: 20px; " colspan="2">
        &nbsp;</td>
</tr>
<tr>
  <td style="width: 156px; text-align: right; height: 20px;"><b><span style="font-size: 8pt">Cotización No.:</span></b></td>
  <td style="width: 39px; height: 20px;"><asp:Label id="OrderNumberLabel" Runat="Server" meta:resourcekey="OrderNumberLabelResource1" Font-Size="9pt"/></td>
  <td style="width: 59px; text-align: right; height: 20px;"><b><span style="font-size: 8pt">Moneda:</span></b></td>
  <td style="width: 98px; text-align: left; height: 20px;">
      <asp:Label ID="lblMoneda" runat="server" meta:resourcekey="lblMonedaResource1" Font-Size="9pt"></asp:Label>&nbsp;
      <asp:DropDownList ID="lstTipoCambio" runat="server" DataSourceID="odsTipoCambio" DataTextField="descripcion" DataValueField="tipoCambioId" Visible="False" Font-Size="9pt" Height="16px" Width="81px">
      </asp:DropDownList>
      <asp:Label ID="hdnMoneda" runat="server" Font-Size="9pt" meta:resourcekey="lblMonedaResource1"
          Visible="False"></asp:Label>&nbsp;
  </td>
    <td style="width: 24px; text-align: right; height: 20px;">
        <strong><span style="font-size: 8pt">Estatus:</span></strong></td>
    <td style="height: 20px; " colspan="2">
        <asp:Label id="lbEstatusCotizacion" Runat="Server" meta:resourcekey="lbEstatusCotizacionResource1" Font-Size="9pt"/></td>
</tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Cliente:</span></strong></td>
        <td colspan="3" style="height: 20px">
            <asp:TextBox ID="txtRazonSocial" runat="server" Enabled="False" Font-Size="9pt" Visible="False" Width="344px" MaxLength="200"></asp:TextBox>
      <asp:Label ID="lblRazonSocial" runat="server" Text="razonSocial" meta:resourcekey="lblRazonSocialResource1" Font-Size="10pt"></asp:Label></td>
        <td style="width: 24px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">t/Cambio:</span></strong></td>
        <td colspan="2" style="height: 20px">
            <asp:Label ID="lblTipoCambio" runat="server" Font-Bold="False" Font-Size="9pt" 
                Width="150px"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Contacto:</span></strong></td>
        <td colspan="4" style="height: 20px; text-align: left">
            <asp:TextBox ID="txtRepresentanteLegal" runat="server" Visible="False" Width="348px" Font-Size="9pt"></asp:TextBox>
            <asp:Label ID="lblRepresentanteLegal" runat="server" Font-Size="9pt"></asp:Label></td>
        <td colspan="1" style="height: 20px; text-align: left; width: 64px;">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Condiciones de pago:</span></strong></td>
        <td colspan="5" style="height: 20px; text-align: left">
            <asp:TextBox ID="txtCondicionesPago" runat="server" Visible="False" Width="347px" Font-Size="9pt"></asp:TextBox>
            <asp:Label ID="lblCondicionesPago" runat="server" Font-Size="9pt"></asp:Label></td>
        <td colspan="1" style="height: 20px; text-align: left; width: 96px;">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Asunto:</span></strong></td>
        <td colspan="5" style="height: 20px; text-align: left">
            <asp:TextBox ID="txtLAB" runat="server" Visible="False" Width="347px" Font-Size="9pt"></asp:TextBox>
            <asp:Label ID="lblLAB" runat="server" Font-Size="9pt"></asp:Label></td>
        <td colspan="1" style="height: 20px; text-align: left; width: 96px;">
      <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Editar"
          Visible="False" BorderStyle="None" Font-Size="9pt" /></td>
    </tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Vencimiento:</span></strong></td>
        <td colspan="5" style="height: 20px; text-align: left">
            <%--<asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
            TargetControlID="PaneLPedido" Radius="5" Corners="All">
        </asp:RoundedCornersExtender>--%>
                <asp:TextBox ID="txtVencimiento" runat="server" Font-Size="9pt" Visible="False" Enabled="False"></asp:TextBox>
            <%--<asp:ImageButton ID="imgCalendario" runat="server" Height="16px" ImageUrl="~/Imagenes/10129.ico"
                OnClick="imgCalendario_Click" Visible="False" Width="22px" />--%>
            <asp:Label ID="lblVencimiento" runat="server" Font-Size="9pt"></asp:Label>
            <asp:Label ID="lblbdnFechVenc" runat="server" Text="0" Visible="False"></asp:Label></td>
        <td colspan="1" style="width: 96px; height: 20px; text-align: left">
      <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar"
          Visible="False" BorderStyle="None" Font-Size="9pt" />
        </td>
    </tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Fecha Cotización:</span>
            </strong>
            </td>
        <td colspan="5" style="height: 20px; text-align: left">        
            <asp:TextBox ID="txtFechaAlta" runat="server" Font-Size="9pt" Visible="False" Enabled="False"></asp:TextBox>
            <asp:Label ID="lblFechaAlta" runat="server" Font-Size="9pt"></asp:Label>
            <asp:Label ID="lblbdnFechAlta" runat="server" Text="0" Visible="False"></asp:Label></td>
        <td colspan="1" style="width: 96px; height: 20px; text-align: left">
      <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar"
          Visible="False" BorderStyle="None" Font-Size="9pt" />
        </td>
    </tr>
    <tr>
        <td style="width: 156px; height: 20px; text-align: right">
            <strong><span style="font-size: 8pt">Fecha Caída:</span>
            </strong>
            </td>
        <td colspan="5" style="height: 20px; text-align: left">        
            <asp:TextBox ID="txtFechaCaida" runat="server" Font-Size="9pt" Visible="False"></asp:TextBox>
            <asp:Label ID="lblFechaCaida" runat="server" Font-Size="9pt"></asp:Label>
            <asp:Label ID="lblbdnFechaCaida" runat="server" Text="0" Visible="False"></asp:Label>
                                        <strong><span style="font-size: 9pt">
               <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator9" 
                runat="server" ControlToValidate="txtFechaCaida"
                                            Display="Dynamic" 
                ErrorMessage="x" Font-Size="7pt" 
                
                ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" 
                Height="16px" Width="16px" Enabled="False"></asp:RegularExpressionValidator>--%>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ClientValidationFunction="ValidateDate" ControlToValidate="txtFechaCaida" 
                ErrorMessage="CustomValidator" Font-Size="7pt" Enabled="False">fecha invalida: dd/mm/aaaa</asp:CustomValidator>
            </span></strong></td>
        <td colspan="1" style="width: 96px; height: 20px; text-align: left">
        </td>
    </tr>
    <tr>
        <td style="width: 156px; height: 40px; text-align: right">
            <strong><span style="font-size: 8pt">Notas:</span></strong></td>
        <td colspan="5" style="height: 40px; text-align: left">
            <asp:TextBox ID="txtNotas" runat="server" Font-Size="9pt" Height="34px" Rows="2"
                TextMode="MultiLine" Visible="False" Width="487px"></asp:TextBox>
            <asp:Label ID="lblNotas" runat="server" Font-Size="10pt"></asp:Label></td>
        <td colspan="1" style="width: 96px; height: 40px; text-align: left">
        </td>
    </tr>

    <tr>
        <td style="width: 156px; height: 21px; text-align: right">
            <strong><span style="font-size: 8pt">Iva:</span></strong></td>
        <td colspan="5" style="height: 21px; text-align: left">    
            <asp:DropDownList ID="cbiva" runat="server" Visible="False">
                <asp:ListItem Selected="True" Value="16">16</asp:ListItem>
                <asp:ListItem Value="0">0</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblIva" runat="server" Font-Size="10pt"></asp:Label>    
        </td>
        <td colspan="1" style="font-size: 8pt; width: 96px; height: 21px;">
            <br />
        </td>
    </tr>
    
    <tr>
        <td style="width: 156px; height: 5px; text-align: right">
          <strong><span style="font-size: 8pt">Descuento:</span></strong></td>
        <td colspan="5" style="height: 5px; text-align: left">
            <asp:TextBox ID="txtDescuento" runat="server" Width="38px" Visible="False" 
                MaxLength="5"></asp:TextBox>
            <asp:Label ID="lblDescuento" runat="server" Font-Size="9pt"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                ControlToValidate="txtDescuento" ErrorMessage="Valor numérico" 
                Font-Size="Small" ValidationExpression="[+]?[0-9]{0,3}\.?[0-9]{1,2}"></asp:RegularExpressionValidator>
            <asp:RangeValidator ID="RVvalidaDescGral" runat="server" 
                ControlToValidate="txtDescuento" ErrorMessage="Se necesita autorización" 
                Font-Size="Small" MaximumValue="15" MinimumValue="0" Type="Integer"></asp:RangeValidator>
        <td colspan="1" style="width: 96px; height: 5px; text-align: left">
            &nbsp;</td>
    </tr>
<tr>
  <td colspan="6" style="height: 35px">
  <asp:Label id="NoItemsMessage" Runat="Server"
  Text="No hay Productos en la cotización." EnableViewState="False" Visible="False"
  Width="300px" Height="20px" BackColor="#E0E0E0" ForeColor="#0000C0"
  BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" 
   meta:resourcekey="NoItemsMessageResource1"/>
    </td>
    <td colspan="1" style="width: 96px; height: 35px;">
        </td>
</tr>
</table>
 
<asp:ObjectDataSource ID="odsTipoCambio" runat="server" OldValuesParameterFormatString="original_{0}"
          SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaTipoCambioTableAdapter">
    <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="intOrdenar" Type="Int32" />
    </SelectParameters>
      </asp:ObjectDataSource>
 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:ImageButton ID="Imgbtnpedidokepler" runat="server" Height="43px" 
                ImageUrl="~/Imagenes/logoKepler.png" 
                Width="52px" onclick="Imgbtnpedidokepler_Click" Visible="False" />
            <asp:LinkButton ID="MasCotizaciones" runat="server" Font-Size="Small" 
                Visible="False" onclick="MasCotizaciones_Click">Más Cotizaciones</asp:LinkButton>
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </ContentTemplate>
    </asp:UpdatePanel>
 
<asp:Panel ID="Panel1" Width="550px" Runat="Server"
ForeColor="#990000" HorizontalAlign="Right" meta:resourcekey="Panel1Resource1">
  <%--<asp:Label id="ErrMessage" Text=" " EnableViewState="False" Runat="server" meta:resourcekey="ErrMessageResource1"/--%>
</asp:Panel>
    <asp:SqlDataSource ID="ShopCartSource" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
  OnSelected="Get_Rows"
  SelectCommand="select distinct d.cotizacionid as OrderNumber,
d.productoRef as BookID,
d.productodesc as BookTitle,
d.cantidad as BookQty,
c.tipoMoneda as moneda,
isnull(Descuento,0.0) as descu,
isnull(TiempoEntrega,0) as TiempoEntrega,
isnull(unidadMedida_nombre,0) as unidadMedida,
round((round(d.productoprecio,2) * isnull(t.cambio,1)),2) as precioCambio,
isnull(incrementoPrecio,0) as incrementoPrecio,
round(((round(d.productoprecio,2) * isnull(t.cambio,1)) + isnull(incrementoPrecio,0) ),2) as BookPrice,
15 as descuentoLimite,
detalleId ,
d.orden Orden,
isnull(p.embalaje,0) as embalaje,
RTRIM(d.suc) as suc,
RTRIM(d.folio) as pedido,
d.comentario as comentario,
p.AplicaRango as aplicarango,
p.tipoproducto as tipoproducto,
c.unidadnegocio as unidadnegocio
--0 as orden2
into #temporal
from cotizaciones c inner join detalles d on c.cotizacionid = d.cotizacionid
	inner join unidadMedida u on u.unidadMedida_Id = d.unidadMedida_Id
	left join tipoCambio t on datediff(day,c.fecha,t.fecha) = 0 and t.base_monedaId = c.tipoMoneda and t.cambio_monedaId = d.tipoMoneda
	left join productos p on d.ProductoRef = p.modelo
where c.cotizacionid = @OrderNumber 
order by d.orden,d.detalleId

--select * from #temporal
--select top 1 count(0) from #temporal group by orden having count(0)&gt; 1 
if ( select top 1 count(0) from #temporal group by orden having count(0)&gt; 1 ) &gt; 1
	BEGIN

		ALTER table #temporal add orden2 int identity(1,1)

		--select d.detalleId,d.orden,d.ProductoRef,t.BookID,t.orden2
		update detalles set orden = t.orden2
		from detalles d,
			 #temporal t
		where d.cotizacionId = @OrderNumber
		and d.cotizacionId = t.OrderNumber
		and d.detalleId = t.detalleId
		--order by t.orden,t.detalleId
		select OrderNumber,BookID,BookTitle,BookQty,moneda,descu,TiempoEntrega,unidadMedida,precioCambio,incrementoPrecio,BookPrice,descuentoLimite,detalleId,orden2 as orden, embalaje,suc,pedido,comentario,aplicarango,tipoproducto,unidadnegocio
		from #temporal
		order by orden
	END
else
	BEGIN
		select OrderNumber,BookID,BookTitle,BookQty,moneda,descu,TiempoEntrega,unidadMedida,precioCambio,incrementoPrecio,BookPrice,descuentoLimite,detalleId,orden,embalaje,suc,pedido,comentario,aplicarango,tipoproducto,unidadnegocio
		from #temporal
		order by orden
	END
drop table #temporal"

  UpdateCommand="declare @porcentaje float
declare @precio real
declare @precioaux real

if (@aplicarango = 1)
begin
	--Porcentaje de descuento
	select top 1 @porcentaje=porcentaje from rangoproducto where @BookQty between l_inferior and l_superior
	if (@porcentaje is null) set @porcentaje=0;

	--Precio

	if (@tipoproducto = 1)
	begin
		select @precio=ROUND(isnull(cu.costo,0)/(1-(isnull(cu.utilidad,0)/100)),4)
		from productos p
		left join unidad_negocio un on un.unidad_negocio=@unidadnegocio
		left join productos_costutil cu on p.ID = cu.idproducto and cu.id_unidad_negocio=un.id		
		where p.modelo=@BookID

	end 
	else
	begin
		select @precio=ROUND(p.precio,4)
		from productos p
		where modelo=@BookID
	end

	if (@precio is null) set @precio=0

	set @precioaux = @precio-(@precio*@porcentaje);

	
	UPDATE detalles SET ProductoPrecio=@precioaux,Cantidad = @BookQty, Descuento = @descu, ProductoDesc = @BookTitle, TiempoEntrega = @TiempoEntrega, incrementoPrecio = @incrementoPrecio, comentario=@Comentario WHERE (CotizacionId = @OrderNumber) AND (ProductoRef = @BookID) AND (detalleId = @detalleId);
	update cotizaciones set fechaActualizacion=getdate(),UsuarioIdActualiza=@UsuarioId where cotizacionId =  @OrderNumber
	
end
else
begin
    
	UPDATE detalles SET Cantidad = @BookQty, Descuento = @descu, ProductoDesc = @BookTitle, TiempoEntrega = @TiempoEntrega, incrementoPrecio = @incrementoPrecio, comentario=@Comentario WHERE (CotizacionId = @OrderNumber) AND (ProductoRef = @BookID) AND (detalleId = @detalleId);
	update cotizaciones set fechaActualizacion=getdate(),UsuarioIdActualiza=@UsuarioId where cotizacionId =  @OrderNumber
	
end"

  
        DeleteCommand="DELETE FROM detalles&#13;&#10;                 WHERE cotizacionid=@OrderNumber AND productoRef=@BookID AND detalleId = @detalleId" 
        InsertCommand="set_actualizaOrdenDetalleCotizacion" 
        InsertCommandType="StoredProcedure"
  >
  <SelectParameters>
    <asp:ControlParameter Name="OrderNumber" ControlId="OrderNumberLabel"
    PropertyName="Text"/>
  </SelectParameters>
  <UpdateParameters>
      <asp:Parameter Name="BookQty" />
      <asp:Parameter Name="descu" />
      <asp:Parameter Name="BookTitle" />
      <asp:Parameter Name="TiempoEntrega" />
      <asp:Parameter Name="incrementoPrecio" />
    <asp:ControlParameter Name="OrderNumber" ControlId="OrderNumberLabel" PropertyName="Text"/>
      <asp:Parameter Name="BookID" />
      <asp:Parameter Name="detalleId" />
    <asp:ControlParameter Name="UsuarioId" ControlId="lblUsuarioId" PropertyName="Text"/>
      <asp:Parameter Name="Comentario" />
      <asp:Parameter Name="aplicarango" />
      <asp:Parameter Name="tipoproducto" />
      <asp:Parameter Name="unidadnegocio" />
  </UpdateParameters>
  <DeleteParameters>
    <asp:ControlParameter Name="OrderNumber" ControlId="OrderNumberLabel"
    PropertyName="Text"/>
      <asp:Parameter Name="BookID" />
      <asp:Parameter Name="detalleId" />
  </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="intCotizacionId" Type="Int32" />
            <asp:Parameter Name="intDetalleId" Type="Int32" />
            <asp:Parameter Name="intOrden" Type="Int32" />
            <asp:Parameter Name="intDetalleIdPostAnt" Type="Int32" />
            <asp:Parameter Name="intOrdenPostAnt" Type="Int32" />
            <asp:Parameter Name="intUsuarioId" Type="Int32" />
        </InsertParameters>
      </asp:SqlDataSource>
      
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
    <ContentTemplate>
    <asp:Label id="ErrMessage" Text=" " EnableViewState="False" Runat="server" meta:resourcekey="ErrMessageResource1" />
            <asp:GridView id="ShopCartGrid" DataSourceID="ShopCartSource" Runat="Server"
      AutoGenerateColumns="False"
      DataKeyNames="OrderNumber,BookID,detalleId,orden,embalaje,aplicarango,tipoproducto,unidadnegocio"
      OnRowUpdating="Validate_Quantity"
      ShowFooter="True"
      HeaderStyle-BackColor="#990000"
      HeaderStyle-ForeColor="#FFFFFF"
      EditRowStyle-BackColor="#E0E0E0"
      CellPadding="4" ForeColor="#333333" GridLines="None" 
               meta:resourcekey="ShopCartGridResource1"  Width="1077px" Font-Size="8pt" 
      OnRowCreated="ShopCartGrid_RowCreated"
      onrowcommand="ShopCartGrid_rowCommand" 
            onrowdatabound="ShopCartGrid_RowDataBound" >
      <Columns>
  
          <asp:TemplateField>
              <HeaderTemplate>
                  <asp:CheckBox ID="chkallCotizacion" runat="server" AutoPostBack="True" 
                      oncheckedchanged="chkallCotizacion_CheckedChanged" />
              </HeaderTemplate>
              <ItemTemplate>
                  <asp:CheckBox ID="chkproductos" runat="server" Font-Size="7pt" />
              </ItemTemplate>
              <FooterStyle BackColor="#E0E0E0" />
          </asp:TemplateField>
  
          <asp:TemplateField>
              <ItemTemplate>
                  <asp:Label ID="Label21" runat="server"  
                   Font-Size="7pt" meta:resourcekey="Label21Resource1" 
                      Text='<%# Eval("orden") %>' ForeColor="Black"/>
              </ItemTemplate>
              <HeaderStyle Font-Size="9pt" />
              <FooterStyle BackColor="#E0E0E0" />
              <ItemStyle Font-Size="7pt" />
          </asp:TemplateField>
  
      <asp:TemplateField
        HeaderText="Cve Prod" meta:resourcekey="TemplateFieldResource1">
        <ItemTemplate>
          <asp:Label ID="Label2" Runat="server"
            Text='<%# Eval("BookID") %>' Font-Size="8pt" 
                meta:resourcekey="Label2Resource1" ForeColor="Black"/>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:Label ID="Label3" Runat="server"
            Text='<%# Eval("BookID") %>' Font-Size="7pt" 
                meta:resourcekey="Label3Resource1" ForeColor="Black"/>
        </EditItemTemplate>
          <ItemStyle Font-Size="7pt" />
          <FooterStyle BackColor="#E0E0E0" />
          <HeaderStyle Font-Size="10pt" HorizontalAlign="Left" />
      </asp:TemplateField>
  
      <asp:TemplateField
        HeaderText="Nombre" meta:resourcekey="TemplateFieldResource2">
        <ItemTemplate>
          <asp:Label ID="Label4" Runat="server"
            Text='<%# Eval("BookTitle") %>' Font-Size="8pt" 
                meta:resourcekey="Label4Resource1" ForeColor="Black"/>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookTitle") %>' Width="212px" Font-Size="8pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="Campo requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("comentario") %>' 
                Font-Size="8pt" Width="212px" 
                MaxLength="60"></asp:TextBox>
            <asp:Label ID="Label39" runat="server" Font-Size="7pt" ForeColor="Black" 
                Text="Comentario" Enabled="False"></asp:Label>
        </EditItemTemplate>
          <ItemStyle Font-Size="7pt" />
          <FooterStyle BackColor="#E0E0E0" />
          <HeaderStyle Font-Size="10pt" />
      </asp:TemplateField>
  
      <asp:TemplateField
        HeaderText="$" meta:resourcekey="TemplateFieldResource3">
        <ItemTemplate>
          <asp:Label ID="Label6" Runat="server"
            Text='<%# String.Format("{0:#,##0.00}", Eval("BookPrice")) %>' Font-Size="10pt" meta:resourcekey="Label6Resource1" ForeColor="Black"/>
            <asp:Label ID="Label16" runat="server" Font-Size="7pt" Text='<%# get_tipoMoneda(Int32.Parse(Eval("moneda").ToString())) %>' meta:resourcekey="Label16Resource1" ForeColor="Black"></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:Label ID="Label22" runat="server" Text='<%# String.Format("{0:#,##0.00}", Eval("precioCambio")) %>' Font-Size="8pt" ForeColor="Black"></asp:Label><br />
            <span style="font-size: 8pt">
            +</span><asp:TextBox ID="incrementoPrecio" runat="server" Text='<%# Bind("incrementoPrecio") %>' Width="40px" Font-Size="8pt" Enabled="False"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="incrementoPrecio"
                ErrorMessage="campo requerido" Display="Dynamic" Font-Size="7pt"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator5" runat="server" ControlToValidate="incrementoPrecio"
                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^-?\d{1,9}(\.\d{1,2})?$"></asp:RegularExpressionValidator>
        </EditItemTemplate>
          <ItemStyle HorizontalAlign="Right" Width="100px" />
          <FooterStyle BackColor="#E0E0E0" />
          <HeaderStyle Font-Size="10pt" />
      </asp:TemplateField>
  
      <asp:TemplateField
        HeaderText="Ctd" meta:resourcekey="TemplateFieldResource4">
        <ItemTemplate>
          <asp:Label ID="Label8" Runat="server"
            Text='<%# String.Format("{0:D}", Eval("BookQty")) %>'
            Width="25px" Font-Size="10pt" Style="text-align:right" meta:resourcekey="Label8Resource1" ForeColor="Black"/>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:TextBox id="BookQty" Runat="server"
            Text='<%# Bind("BookQty") %>'
            MaxLength="6" Width="25px" Height="17px" Font-Size="8pt"
            Style="padding:0px; text-align:right" meta:resourcekey="BookQtyResource1" /><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="BookQty"
                ErrorMessage="Campo requerido" Font-Size="7pt" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="BookQty"
                ErrorMessage="valor no valido" Font-Size="7pt" ValidationExpression="^\d{1,10}$" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="BookQty"
                ControlToValidate="lblEmbalaje" ErrorMessage="Es menor al embalaje" Operator="LessThanEqual"
                SetFocusOnError="True" Display="Dynamic" Font-Size="7pt" Type="Integer" 
                ValidationGroup="a"></asp:CompareValidator><br />
            Embalaje:<asp:TextBox ID="lblEmbalaje" runat="server" BorderStyle="None" BorderWidth="1px"
                Enabled="False" EnableTheming="True" Font-Size="8pt" ReadOnly="True" Text='<%# Bind("embalaje") %>'
                Width="30px"></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
          <br />
            <br />
            <br/>
            &nbsp;
        </FooterTemplate>
    
          <ItemStyle HorizontalAlign="Right" />
          <FooterStyle HorizontalAlign="Right" BackColor="#E0E0E0" />
          <HeaderStyle Font-Size="10pt" />
      </asp:TemplateField>
          <asp:TemplateField HeaderText="U. M." SortExpression="unidadMedida">
              <EditItemTemplate>
                  <asp:Label ID="Label23" runat="server" Text='<%# Eval("unidadMedida") %>' Font-Size="8pt" ForeColor="Black"></asp:Label>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("unidadMedida") %>' 
                      Font-Size="8pt" ForeColor="Black"></asp:Label>
              </ItemTemplate>
              <FooterStyle BackColor="#E0E0E0" />
              <HeaderStyle Font-Size="10pt" />
              <ItemStyle Font-Size="10pt" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Desc" meta:resourcekey="TemplateFieldResource5">
              <EditItemTemplate>
                  <asp:Label ID="lblEtiquetaDescuento" runat="server" Text="Descuento Limite:" ForeColor="Black"></asp:Label>
                  <asp:Label ID="lblLimiteDescuento" runat="server" Text='<%# Eval("descuentoLimite") %>' ForeColor="Black"></asp:Label>
                  <br />
                  <asp:TextBox ID="descu" runat="server" Text='<%# Bind("descu") %>' Width="22px" MaxLength="4" Font-Size="8pt" ></asp:TextBox>
                  <asp:Label ID="Label18" runat="server" Font-Size="8pt" Text="%"></asp:Label>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="descu"
                      Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^-?\d+(.\d+)?$"></asp:RegularExpressionValidator>&nbsp;
                  <asp:RequiredFieldValidator
                          ID="RequiredFieldValidator1" runat="server" ControlToValidate="descu" Display="Dynamic"
                          ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("descu") %>' Font-Size="10pt" ForeColor="Black" ></asp:Label>
                  <asp:Label ID="Label7" runat="server" Font-Size="8pt" Text="%"></asp:Label>
              </ItemTemplate>
              <ItemStyle HorizontalAlign="Center" />
              <FooterStyle BackColor="#E0E0E0" />
              <HeaderStyle Font-Size="10pt" />
          </asp:TemplateField>
      
          <asp:TemplateField HeaderText="T.  E." SortExpression="TiempoEntrega">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TiempoEntrega") %>' Font-Size="8pt" Width="24px"></asp:TextBox>
                  <asp:Label ID="Label20" runat="server" Font-Size="8pt" Text="días"></asp:Label>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox2"
                      ErrorMessage="Campo requerido" Font-Size="7pt" Display="Dynamic"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox2"
                      Display="Dynamic" ErrorMessage="Valor no valido" Font-Size="7pt" ValidationExpression="^\d{1,10}$"></asp:RegularExpressionValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("TiempoEntrega") %>' Font-Size="10pt" ForeColor="Black"></asp:Label>
                  <asp:Label ID="Label19" runat="server" Font-Size="8pt" Text="días" ForeColor="Black"></asp:Label>
              </ItemTemplate>
              <ItemStyle HorizontalAlign="Center" />
              <FooterTemplate>
          <asp:Label ID="Label9" Text="SubTotal:" Runat="server" BorderStyle="Solid" BorderWidth="0px" Font-Size="10pt" Height="20px" Width="80px" meta:resourcekey="Label9Resource1" ForeColor="White"/><br />
                  <asp:Label ID="Label38" runat="server" Text="Desc :" ForeColor="White"></asp:Label>
                  <br />
            <asp:Label ID="Label35" Text="Subtotal :" Runat="server" BorderStyle="Solid" 
                      BorderWidth="0px" Height="12px" Width="78px" Font-Size="8pt" 
                      meta:resourcekey="Label35Resource1" ForeColor="White"/><br />
            <asp:Label ID="Label14" Text="Iva :" Runat="server" BorderStyle="Solid" 
                      BorderWidth="0px" Height="12px" Width="78px" Font-Size="8pt" 
                      meta:resourcekey="Label14Resource1" ForeColor="White"/><br />
          <asp:Label ID="Label10" Text="Total:" Runat="server"
            Font-Bold="True" Width="50px" BorderStyle="Solid" BorderWidth="0px" 
            Style="padding:2px; margin-top:5px" Font-Size="10pt" meta:resourcekey="Label10Resource1" ForeColor="White"/>
              </FooterTemplate>
              <HeaderStyle Font-Size="10pt" />
          
          </asp:TemplateField>
  
      <asp:TemplateField HeaderText="Importe" meta:resourcekey="TemplateFieldResource6">
        <ItemTemplate>
          <asp:Label ID="Label11" Runat="server"
            Text='<%# Get_Amount(Eval("BookPrice").ToString(),Int32.Parse(Eval("BookQty").ToString()),Double.Parse(Eval("descu").ToString())) %>' Font-Size="10pt" ForeColor="Black" />
            <asp:Label ID="Label17" runat="server" Font-Size="7pt" 
                Text='<%# get_tipoMoneda(Int32.Parse(Eval("moneda").ToString())) %>' ForeColor="Black" ></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:Label ID="Label12" Runat="server"
            Text='<%# Get_Amount(Eval("BookPrice").ToString(),Int32.Parse(Eval("BookQty").ToString()),Double.Parse(Eval("descu").ToString())) %>' Font-Size="8pt" ForeColor="Black" />
        </EditItemTemplate>
        <FooterTemplate>
          <asp:Label ID="Label15" Runat="server"
            Text='<%# String.Format("{0:N}", Get_Shipping()) %>' Font-Size="10pt" ForeColor="White" /><br />
            <asp:Label ID="Label34" runat="server" ForeColor="White"></asp:Label>
            <br />
            <asp:Label ID="Label36" Runat="server"
            Text='<%# String.Format("{0:N}", Get_Descuento()) %>' Font-Size="8pt" ForeColor="White" /><br/>
            <asp:Label ID="Label37" Runat="server"
            Text='<%# String.Format("{0:N}",Get_ShippingSinDesc()) %>' Font-Size="8pt" ForeColor="White" /><br/>
            <asp:Label ID="Label13" Runat="server"
            Text='<%# String.Format("{0:N}", Get_Interes()) %>' Font-Size="8pt" ForeColor="White" /><br/>
          <asp:Label id="OrderTotal" Runat="server"
            Text='<%# String.Format("{0:N}", Get_Order_Total()) %>' 
            Width="80px" Font-Bold="True" BorderStyle="Solid" BorderWidth="1px"
            BorderColor="Silver" Style="padding:2px; margin-top:5px" Font-Size="8pt" ForeColor="White" />
        </FooterTemplate>
          <ItemStyle HorizontalAlign="Right" Width="120px" />
          <FooterStyle HorizontalAlign="Right" />
          <HeaderStyle Font-Size="10pt" />
      </asp:TemplateField>
  
      <asp:TemplateField meta:resourcekey="TemplateFieldResource7">
        <ItemTemplate>
          <asp:Button ID="Button1" Text="Editar" CommandName="Edit" Runat="server" 
                Font-Size="7pt" Width="38px" meta:resourcekey="Button1Resource1" 
                OnClick="Button1_Click" BorderStyle="None" 
                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="16px" />
          <asp:Button ID="Button2" Text="Borrar" CommandName="Delete" Runat="server" 
                Font-Size="7pt" Width="41px" meta:resourcekey="Button2Resource1" 
                BorderStyle="None" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                  <asp:ImageButton ID="imgbDown" runat="server" Height="15px" ImageUrl="~/Imagenes/arrow_down_48.png"
                      Width="17px" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="bajaOrden" Visible="False" /><asp:ImageButton ID="imgbUp" runat="server" Height="15px" ImageUrl="~/Imagenes/arrow_up_48.png"
                      Width="17px" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="subeOrden" Visible="False" />
        </ItemTemplate>
        <EditItemTemplate>
          <asp:Button ID="Button3" Text="Actualiza" CommandName="Update" Runat="server"
            Font-Size="7pt" Width="52px" meta:resourcekey="Button3Resource1" 
                OnClick="Button3_Click" BorderStyle="None" 
                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="16px" />
          <asp:Button ID="Button4" Text="Cancelar" CommandName="Cancel" Runat="server"
            Font-Size="7pt" Width="52px" meta:resourcekey="Button4Resource1" 
                BorderStyle="None" 
                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="REVISION" 
                meta:resourcekey="Button6Resource1" BorderStyle="None" Font-Size="8pt" 
                Visible="False" Height="16px" Width="49px" /><asp:Button ID="Button5" 
                Text="CAIDA" OnClick="Submit_Form" Runat="server"
            Font-Size="8pt" Width="49px" Style="margin-top:22px" 
                meta:resourcekey="Button5Resource1" BorderStyle="None" Height="16px"/><br />
            <asp:CheckBox ID="ckbBanderaDescuento" runat="server" Font-Size="6pt" ForeColor="Black"
                Text="Precio c/desc" /><br />
            <asp:CheckBox ID="ckbPrecioSinDescuento" runat="server" Font-Size="6pt" ForeColor="Black"
                Text="Precio s/desc" Visible="False"/><br />
            <asp:CheckBox ID="ckbLogoComponentes" runat="server" Font-Size="6pt" ForeColor="Black"
                Text="Logo SLP Comp" Visible="False" />
             <asp:CheckBox ID="ckbLogoComponentesBajio" runat="server" Font-Size="6pt" ForeColor="Black"
                Text="Logo Calvek Bajio" Height="16px" Visible="False" Width="148px" />
            <br />
            <asp:CheckBox ID="ckbComentarios" runat="server" Font-Size="6pt" 
                ForeColor="Black" Text="Comentarios" Visible="False"/>
        </FooterTemplate>
          <FooterStyle BackColor="#E0E0E0" />
          <HeaderStyle Font-Size="10pt" />
          <ItemStyle Width="150px" />
      </asp:TemplateField>
  
          <asp:TemplateField HeaderText="Suc">
              <ItemTemplate>
                  <asp:Label ID="lblsucpedido" runat="server" Font-Size="8pt" 
                      Text='<%# Eval("suc") %>'></asp:Label>
              </ItemTemplate>
              <FooterStyle BackColor="#E0E0E0" />
              <HeaderStyle HorizontalAlign="Left" Font-Size="10pt" />
              <ItemStyle HorizontalAlign="Left" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Pedido">
              <ItemTemplate>
                  <asp:Label ID="lblfoliopedido" runat="server" Font-Size="8pt" 
                      Text='<%# Eval("pedido") %>'></asp:Label>
              </ItemTemplate>
              <FooterStyle BackColor="#E0E0E0" />
              <HeaderStyle HorizontalAlign="Left" Font-Size="10pt" />
              <ItemStyle HorizontalAlign="Left" />
          </asp:TemplateField>
  
      </Columns>
        <FooterStyle BackColor="#341C5E" Font-Bold="True" ForeColor="White" 
            Height="150px" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="6px" />
        <EditRowStyle BackColor="#189097" ForeColor="Black" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#341C5E" Font-Bold="True" ForeColor="White" 
            Height="8px" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  
    </asp:GridView>
    
    </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Panel ID="pnlAgregaProducto" runat="server" Height="50px" Width="125px" Visible="False">
        &nbsp;&nbsp;<asp:Label ID="lblMensaje" runat="server" Width="576px" Font-Size="8pt"></asp:Label>
        <table style="width: 892px; height: 157px">
            <tr>
                <td valign="bottom" style="height: 20px">
                    <asp:Label ID="Label24" runat="server" Font-Size="8pt" Text="Producto"></asp:Label></td>
                <td valign="bottom" style="width: 158px; height: 20px;">
                    <asp:Label ID="Label25" runat="server" Font-Size="8pt" Text="Nombre"></asp:Label></td>
                <td style="width: 68px; height: 20px;" valign="bottom">
                    <asp:Label ID="Label33" runat="server" Font-Size="8pt" Text="Marca"></asp:Label></td>
                <td style="width: 102px; height: 20px;" valign="bottom">
                    <asp:Label ID="Label26" runat="server" Font-Size="8pt" Text="Precio"></asp:Label></td>
                <td style="width: 1px; height: 20px;" valign="bottom">
                    <asp:Label ID="Label27" runat="server" Font-Size="8pt" Text="Cantidad"></asp:Label></td>
                <td valign="bottom" style="height: 20px">
                    <asp:Label ID="Label28" runat="server" Font-Size="8pt" Text="U.M."></asp:Label></td>
                <td valign="bottom" style="height: 20px">
                    <asp:Label ID="Label29" runat="server" Font-Size="8pt" Text="Descuento"></asp:Label></td>
                <td valign="bottom" style="width: 76px; height: 20px;">
                    <asp:Label ID="Label30" runat="server" Font-Size="8pt" Text="T. Entrega" Width="86px"></asp:Label></td>
                <td valign="bottom" style="width: 97px; height: 20px;">
                </td>
            </tr>
            <tr>
                <td valign="top" style="height: 130px">
                    <asp:TextBox ID="txtProductoAlta" runat="server" Font-Size="9pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtProductoAlta"
                        Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
                    <br />
                </td>
                <td valign="top" style="width: 158px; height: 130px;">
                    <asp:TextBox ID="txtNombreAlta" runat="server" Font-Size="9pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNombreAlta"
                        Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                <td style="width: 68px; height: 130px;" valign="top">
                    <asp:DropDownList ID="lstMarcaAlta" runat="server" DataSourceID="ObjectDataSource2"
                        DataTextField="marca" DataValueField="marcaId" Font-Size="9pt">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_BuscaMarcasTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <td style="width: 102px; height: 130px;" valign="top">
                    <asp:TextBox ID="txtPrecioAlta" runat="server" Width="88px" Font-Size="9pt"></asp:TextBox><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrecioAlta"
                        Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrecioAlta"
                            Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                <td style="width: 1px; height: 130px;" valign="top">
                    <asp:TextBox ID="txtCantidadAlta" runat="server" Width="85px" Font-Size="9pt"></asp:TextBox><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCantidadAlta"
                        Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d{1,10}$"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCantidadAlta"
                            Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                <td valign="top" style="height: 130px">
                    <asp:DropDownList ID="lstTipoMonedaAlta" runat="server" DataSourceID="ObjectDataSource1" DataTextField="unidadMedida_nombre" DataValueField="unidadMedida_Id" Font-Size="9pt">
                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUnidadMedidaTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <td valign="top" style="height: 130px">
                    <asp:TextBox ID="txtDescuentoAlta" runat="server" Width="36px" Font-Size="9pt"></asp:TextBox>
                    <asp:Label ID="Label31" runat="server" Font-Size="8pt" Text="%"></asp:Label><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDescuentoAlta"
                        Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescuentoAlta"
                        Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                <td valign="top" style="height: 130px; width: 76px;">
                    <asp:TextBox ID="txtTiempoEntregaAlta" runat="server" Width="25px" Font-Size="9pt"></asp:TextBox>&nbsp;<asp:Label
                        ID="Label32" runat="server" Font-Size="8pt" Text="días"></asp:Label><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtTiempoEntregaAlta"
                        Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d{1,2}$"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTiempoEntregaAlta"
                            Display="Dynamic" ErrorMessage="campo Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                <td valign="top" style="width: 97px; height: 130px;">
                    <asp:Button ID="btnAgregaProducto" runat="server" Text="Agregar" Height="24px" OnClick="btnAgregaProducto_Click" Width="66px" BorderStyle="None" /></td>
            </tr>
        </table>
    </asp:Panel>
    <div style="position: relative; top: 139px; left: 0px; width: 600px" >
    
    <asp:Button ID="Ficticio" runat="server" Text="Button" style="display:none" />
        <asp:ModalPopupExtender ID="Ficticio_ModalPopupExtender" runat="server" 
            BackgroundCssClass="modalBackground" PopupControlID="PaneLPedido" 
            TargetControlID="Ficticio" onload="Ficticio_ModalPopupExtender_Load">
        </asp:ModalPopupExtender>
    <asp:Panel ID="PaneLPedido" runat="server" 
            style="background:white; width:auto; height:80%" ScrollBars="Auto" 
            HorizontalAlign="Center" CssClass="modalpopup" DefaultButton="btnDefault">

        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <table style="width: 583px">
                <tr>
                    <td class="style3"0"; ;text-align: right; color: #FFFFFF; background-color: 
                        #5D7B9D; width: 100px; height: 10px; padding-top: inherit;" 
                        style="text-align: left; text-decoration: none;">
                        <asp:LinkButton ID="Cerrar" runat="server" Font-Bold="True" ForeColor="Gray" 
                            onclick="Cerrar_Click" BorderStyle="None">X</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td 
                        
                        
                        style="text-align: center; color: #FFFFFF; background-color: #341C5E; vertical-align: middle;" 
                        class="style26">
                        <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="16pt" 
                            ForeColor="White" Height="26px" Text="ALTA PEDIDO KEPLER" Width="263px"></asp:Label>
                    </td>
                </tr>
            <tr>
                <td style="text-align: left; font-family: Arial, Helvetica, sans-serif; font-size: 14pt; font-weight: bold;" 
                    class="style1">

                    Cotización:
                    <asp:Label ID="lblCotizacion" runat="server" Font-Bold="True" 
                        ForeColor="#003366" Font-Size="Large"></asp:Label>

                    <br />

                    </td>
            </tr>
            <tr>
                <td style="text-align: left; " class="style26">
                    <table style="width: 562px" id="tabla1">
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Sucursal:</td>
                            <td class="style33">
                                <asp:DropDownList ID="lstSucursal" runat="server" Height="20px" Width="235px" 
                                    DataSourceID="sdsSucBusqueda" DataTextField="texto" DataValueField="valor" 
                                    Font-Size="9pt" AutoPostBack="True" 
                                    onselectedindexchanged="lstSucursal_SelectedIndexChanged">
                                </asp:DropDownList>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Agente:</td>
                            <td class="style33">
                                <asp:DropDownList ID="lstAgente" runat="server" Height="20px" Width="151px" 
                                    DataSourceID="sdsAgente" DataTextField="agente" DataValueField="idagente">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style30">
                                Cliente:</td>
                            <td>
                                <asp:TextBox ID="txtCliente" runat="server" Font-Size="12px" Enabled="False" 
                                    Height="16px" Width="81px"></asp:TextBox>
                            &nbsp;<asp:Label ID="lblrazon" runat="server" Font-Size="9pt" ForeColor="#CC0000" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style30">
                                </td>
                            <td class="style33">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnBuscarCte" runat="server" BorderStyle="None" Height="17px" 
                                    Text="..." Width="40px" onclick="Button1_Click1" />
                                
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                
                                

                            </td>
                        </tr>
                        <tr>
                            <td class="style30" 
                                
                                
                                
                                style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:Panel ID="PanelCliente" runat="server" Visible="False" Width="419px">
                                    <table style="width:100%;">
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtParameter" runat="server" Width="127px" Height="21px"></asp:TextBox>
                                                <asp:Button ID="Button7" runat="server" Text="Buscar" Height="18px" 
                                                    BorderStyle="None" Width="71px" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                                                    runat="server" ControlToValidate="txtParameter" 
                                                    ErrorMessage="Mínimo 4 carácteres" Font-Size="8pt" 
                                                    ValidationExpression="[0-9a-zA-Z_, .-]{4,}"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblTipoBusqueda" runat="server" Font-Size="8pt" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="1">Id Cliente</asp:ListItem>
                                                    <asp:ListItem Value="2">Descripcion</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="dgvClientes" runat="server" 
                                    AutoGenerateColumns="False" DataKeyNames="id_Cte,NB_Cte,Suc" 
                                    DataSourceID="sdsClientes" Font-Size="7pt" ForeColor="#333333" GridLines="None" 
                                                    PageSize="4" Width="429px" AllowPaging="True" 
                                                    onselectedindexchanged="dgvClientes_SelectedIndexChanged">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="15px" />
                                    <FooterStyle BackColor="#341C5E" Font-Bold="True" ForeColor="White" />
                                        <PagerSettings PageButtonCount="5" />
                                    <PagerStyle BackColor="#341C5E" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#341C5E" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="√" Height="18px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id_Cte" HeaderText="Id Cliente" ReadOnly="True" 
                                            SortExpression="id_Cte">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NB_Cte" HeaderText="Cliente" ReadOnly="True" 
                                            SortExpression="NB_Cte">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NB_Calle" HeaderText="Calle" ReadOnly="True" 
                                            SortExpression="NB_Calle">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NB_Col" HeaderText="Colonia" ReadOnly="True" 
                                            SortExpression="NB_Col">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NB_Estado" HeaderText="Estado" ReadOnly="True" 
                                            SortExpression="NB_Estado">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Suc" HeaderText="Suc" ReadOnly="True" 
                                            SortExpression="Suc">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>   
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:SqlDataSource ID="sdsClientes" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                                    SelectCommand="get_buscaClienteRazonSocial_X_Parametro" 
                                                    SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txtParameter" Name="strParameter" 
                                                            PropertyName="Text" Type="String" />
                                                        <asp:ControlParameter ControlID="rblTipoBusqueda" Name="tipoBusqueda" 
                                                            PropertyName="SelectedValue" Type="Int32" />
                                                        <asp:ControlParameter ControlID="lstSucursal" Name="valSucursal" 
                                                            PropertyName="SelectedValue" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td class="style33">
                                
                                <asp:Label ID="lblnomcte" runat="server" Font-Size="9pt" ForeColor="#006600"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="style29" 
                                style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:Label ID="lblcalle" runat="server" Font-Size="9pt" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29" 
                                style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:Label ID="lblcol" runat="server" Font-Size="9pt" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29" 
                                style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:Label ID="lblestado" runat="server" Font-Size="9pt" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:Label ID="Label40" runat="server" Font-Size="9pt" Font-Bold="True" 
                                    ForeColor="#000099"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Días Crédito:</td>
                            <td 
                                class="style33" colspan="1">
                                <asp:Label ID="lbldcredito" runat="server" Font-Size="9pt"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Limite de Crédito:</td>
                            <td 
                                class="style33">
                                <asp:Label ID="lbllimcredito" runat="server" Font-Size="9pt"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Saldo:</td>
                            <td 
                                class="style33">
                                <asp:Label ID="lblsaldo" runat="server" Font-Size="9pt"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Saldo remisiones:</td>
                            <td 
                                class="style33">
                                <asp:Label ID="lblsremisiones" runat="server" Font-Size="9pt"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Credito Disponible:</td>
                            <td 
                                class="style33">
                                <asp:Label ID="lblcdisponible" runat="server" Font-Size="9pt" Font-Bold="True" 
                                    ForeColor="#000099"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Costo:</td>
                            <td 
                                class="style33">
                                <asp:Label ID="lblcosto" runat="server" Font-Size="9pt"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Utilidad:</td>
                            <td 
                                class="style33">
                                <asp:Label ID="lblutilidad" runat="server" Font-Size="9pt" Font-Bold="True" 
                                    ForeColor="#000099"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblporcutilidad" runat="server" Font-Size="9pt" Font-Bold="True" 
                                    ForeColor="#000099"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td 
                                class="style33">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Almacen:</td>
                            <td 
                                class="style33">
                                <asp:DropDownList ID="lstAlmacen" runat="server" DataSourceID="dsAlmacen" 
                                    DataTextField="Descripcion" DataValueField="Almacen" Font-Size="9pt" 
                                    Height="20px" Width="194px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="dsAlmacen" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                    SelectCommand="get_almacenes_pedidoSick" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lstSucursal" DefaultValue="" Name="sucursal" 
                                            PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="txtCliente" DefaultValue="Todos" 
                                            Name="cliente" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Referencia:</td>
                            <td class="style33">
                                <asp:TextBox ID="txtreferencia" runat="server" Font-Size="9pt" MaxLength="20" 
                                    Height="18px"></asp:TextBox>
                                &nbsp;<asp:Label ID="lblReqOcRef" runat="server" Font-Size="8pt" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                Comentarios:</td>
                            <td class="style33">
                                <asp:TextBox ID="txtcomentario1" runat="server" MaxLength="120" Width="286px" 
                                    Height="18px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style30">
                                </td>
                            <td class="style33">
                                <asp:TextBox ID="txtcomentario2" runat="server" MaxLength="120" Width="284px" 
                                    Height="18px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:TextBox ID="txtcomentario3" runat="server" MaxLength="120" 
                                    style="margin-top: 0px" Width="284px" Height="18px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td class="style33">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td class="style33">
                    <asp:Button ID="btnContinuar" runat="server" Text="Generar Pedido" BorderStyle="None" 
                                    onclick="btnContinuar_Click" BorderColor="Black" Enabled="False" />
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: 10pt; font-weight: bold;" 
                                class="style29">
                                &nbsp;</td>
                            <td class="style33">
                                <asp:Button ID="btnDefault" runat="server" Enabled="False" BorderStyle="None" style="display: none;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:SqlDataSource ID="sdsSucBusqueda" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                    SelectCommand="get_comboOficinasxusuario" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="activo" Type="Int32" />
                                        <asp:ControlParameter ControlID="lblUsuarioId" DefaultValue="" Name="usuarioid" 
                                            PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sdsAgente" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                    SelectCommand="get_agente_kepler" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lstSucursal" Name="sucursal" 
                                            PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="lblUsuarioId" Name="usuarioid" 
                                            PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                        
                    </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
            
        
         </ContentTemplate>
        </asp:UpdatePanel>
        
     
     </asp:Panel>
    </div>   
    <div style="position: relative; top: 139px; left: 0px; width: 590px">
    <asp:Button ID="btnMensajeOk" runat="server" Text="MensajeOk" style="display:none" />
    <asp:ModalPopupExtender ID="btnMensajeOk_ModalPopupExtender" runat="server" 
            TargetControlID="btnMensajeOk" 
            BackgroundCssClass="modalBackgroundd" PopupControlID="Panelok">
        </asp:ModalPopupExtender>
        <asp:Panel ID="Panelok" runat="server" style="background:silver"
            HorizontalAlign="Center" Width="247px" CssClass="modalpopupd" DefaultButton="btnDefault">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td style="text-align: center">
                        &nbsp;
                        <asp:Label ID="lblMensajeOk" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="text-align: center">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td style="text-align: center">
                        &nbsp;
                        <asp:Button ID="btnOkMensaje" runat="server" BorderStyle="None" 
                            onclick="btnOkMensaje_Click" Text="Aceptar" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            
            </ContentTemplate>
            </asp:UpdatePanel>
            
        
        </asp:Panel>
   
       </div>
    <div style="position: relative; top: 139px; left: 0px; width: 590px">
    <asp:Button ID="btnMasCotizaciones" runat="server" Text="MasCotizaciones" style="display:none" />
    <asp:ModalPopupExtender ID="MasCot_ModalPopupExtender" runat="server" 
            TargetControlID="btnMasCotizaciones" 
            BackgroundCssClass="modalBackground" PopupControlID="PanelMasCot">
        </asp:ModalPopupExtender>
        <asp:Panel ID="PanelMasCot" runat="server" style="background:white"
            HorizontalAlign="Center" Width="502px" CssClass="modalpopup" 
            DefaultButton="btnBuscaPartCot" Height="290px" ScrollBars="Auto">
            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <table style="width: 96%;">
                <tr>
                    <td class="style34">
                        <asp:LinkButton ID="Cerrar_MasCot" runat="server" BorderStyle="None" 
                            Font-Bold="True" ForeColor="Gray" onclick="Cerrar_MasCot_Click">X</asp:LinkButton>
                    </td>
                    <td style="text-align: left">
                        &nbsp;
                    </td>
                    <td class="style34">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style35">
                        &nbsp;
                    </td>
                    <td style="text-align: left; font-family: Arial, Helvetica, sans-serif;" 
                        class="style36">
                        <asp:Label ID="Label41" runat="server" Font-Bold="True" Text="Num. Cotización" 
                            ForeColor="#003366"></asp:Label>
                        &nbsp;
                    </td>
                    <td class="style35">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td style="text-align: left; font-family: Arial, Helvetica, sans-serif;">
                        <asp:TextBox ID="txtCotBuscar" runat="server" Width="46px" Height="17px" 
                            MaxLength="7"></asp:TextBox>
                        <asp:Button ID="btnBuscaPartCot" runat="server" BorderStyle="None" 
                            Height="16px" Text="..." Width="25px" />
                    </td>
                    <td class="style34">
                        &nbsp;</td>
                </tr>
                    <tr>
                        <td class="style34">
                            &nbsp;</td>
                        <td style="text-align: center; font-family: Arial;">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                                runat="server" ControlToValidate="txtCotBuscar" ErrorMessage="Solo Números" 
                                Font-Size="Smaller" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                        <td class="style34">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style34">
                            &nbsp;</td>
                        <td style="text-align: center">
                            <asp:GridView ID="dgvDetCot" runat="server" 
                                AutoGenerateColumns="False" DataSourceID="sdsCotDetalle" Font-Size="7pt" 
                                ForeColor="#333333" GridLines="None" PageSize="4" 
                                Width="429px" onrowcreated="dgvDetCot_RowCreated">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="15px" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings PageButtonCount="5" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#341C5E" Font-Bold="True" ForeColor="White" 
                                    Height="20px" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkPCotizaciones" runat="server" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkall" runat="server" AutoPostBack="True" Checked="True" 
                                                oncheckedchanged="chkall_CheckedChanged" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CotizacionId" HeaderText="Id Cotizacion" 
                                        ReadOnly="True" SortExpression="CotizacionId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                                        SortExpression="Cantidad">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ProductoRef" HeaderText="Producto" ReadOnly="True" 
                                        SortExpression="ProductoRef">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="monto" HeaderText="Precio" ReadOnly="True" 
                                        SortExpression="monto">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="moneda" HeaderText="Moneda" 
                                        SortExpression="moneda" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                        <td class="style34">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style34">
                            &nbsp;</td>
                        <td style="text-align: left">
                            <asp:Button ID="btnAgregaCot" runat="server" BorderStyle="None" 
                                onclick="btnAgregaCot_Click" Text="Agregar" />
                            <asp:SqlDataSource ID="sdsCotDetalle" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommand="get_detalleCotizacion_ajalar" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtCotBuscar" DefaultValue="0" 
                                        Name="intCotizacion" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="OrderNumberLabel" Name="intCotizacionorigen" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style34">
                            &nbsp;</td>
                    </tr>
            </table>
            
            </ContentTemplate>
            </asp:UpdatePanel>
            
        
        </asp:Panel>
   
       </div>
    
      
        
             


        

    


    
           
        
  
    
    
</asp:Content>


