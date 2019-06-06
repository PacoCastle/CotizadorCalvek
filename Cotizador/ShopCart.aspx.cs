using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using cotizadorTableAdapters;
using System.Drawing;
using System.Xml;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Cotizador_ShopCart : System.Web.UI.Page
{
    private static int NUMFUNCION = 8;
    int intEstatusCotizacion = 0;
    Boolean habilitaEdicionCotizacion = false;
    Boolean habilitaEdicionCotizacionBotonPedido = false;
    //int intTipoMoneda = 0;
    String strTipoMonedaDescripcion = null;
    //Double dblConversionCambio = 0;
    int intNumeroPartida = 0;
    int intBanderaDescuento = 0;
    int intBanderaIncPrecio = 0;
    int intLimitePorcentaje = 0;
    int intOficina;
    int intCotizacion;
    int intUsuarioId;
    int intPerfil;
    String BanActRazonSocial;
    //ArrayList ListaPartida = new ArrayList());
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }


        //bool IsServerAvailable = (DateTime.Now.Second % 2 == 0);

        //if (!IsServerAvailable)
        //    Server.Transfer("creaPedido.aspx", true);


        //String carpetaEmpresa = "C:/Compacw/Empresas/CALVEK";
        //saludo nuevo = new saludo();
        //nuevo.fInicializaSDKW();
        //nuevo.fAbreEmpresaW(carpetaEmpresa);
        //long resultadoAdminpaq;
        //String strRazonSocial = "                                   ";
        Double dblDescuento = 0;
        habilitaEdicionCotizacion = false;
        habilitaEdicionCotizacionBotonPedido = false;
        int AceptaDescuento=0;
        
    
        cotizacionVO VOcotizacion = new cotizacionVO();
        CotizacionBL BLcotizacion = new CotizacionBL();

        ClienteVO VOcliente = new ClienteVO();
        ClienteBL BLcliente = new ClienteBL();

        TipoCambioVO VOtipoCambio = new TipoCambioVO();
        TipoCambioBL BLtipoCambio = new TipoCambioBL();

        if (Request["cotizacionid"] != null )
        {
                Session["OrderNumber"] = Request["cotizacionid"];
                VOcotizacion.Operacion = cotizacionVO.BUSCAR;
                VOcotizacion.CotizacionId = Int32.Parse(Request["cotizacionid"]);
                
                //Cambia estatus de cotizacion.
                set_actEstatusCotPedidosCanceladosTableAdapter set_actEstatusCotPedidosCancelados = new set_actEstatusCotPedidosCanceladosTableAdapter();
                set_actEstatusCotPedidosCancelados.GetData(Int32.Parse(Request["cotizacionid"]));
                
                VOcotizacion = (cotizacionVO)BLcotizacion.execute(VOcotizacion);
                AceptaDescuento = VOcotizacion.BanderaDescuento;
                if (AceptaDescuento == 1)
                {
                    //txtDescuento.Enabled = true;
                    RVvalidaDescGral.MaximumValue = "30";
                }
                else { RVvalidaDescGral.MaximumValue = "15"; }
              
        }

        if(!Page.IsPostBack)
        {
            OrderNumberLabel.Text = (String)Session["OrderNumber"];
            lblUsuarioId.Text = (String)Session["usuarioID"].ToString();
            lblCondicionesPago.Text = VOcotizacion.CondicionesPago;

        }


        InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
        intOficina = Int32.Parse(infoSession.getValor(InfoSessionVO.OFICINA).ToString());
        intPerfil = Int32.Parse(infoSession.getValor(InfoSessionVO.PERFIL).ToString());
        intCotizacion = Int32.Parse(Session["OrderNumber"].ToString());
        intUsuarioId = Int32.Parse(Session["usuarioID"].ToString());
        

        

        lbEstatusCotizacion.Text = VOcotizacion.EstatusCotizacionNombre;
        if (lbEstatusCotizacion.Text == "PENDIENTE")
        {
            habilitaEdicionCotizacion = true;
            if ((intOficina == 2 || intOficina == 5) && (intPerfil == 2))//solo los de slp componentes no se habilita el boton
            {
                habilitaEdicionCotizacionBotonPedido = false;
            }
            else
            {
                MasCotizaciones.Visible = true;
                habilitaEdicionCotizacionBotonPedido = true;
            }
        }
        else
        { habilitaEdicionCotizacion = false; }
        if (lbEstatusCotizacion.Text == "REFERENCIADO")
        {
            if ((intOficina == 2 || intOficina == 5) && (intPerfil == 2))//solo los de slp componentes no se habilita el boton
            {
                habilitaEdicionCotizacionBotonPedido = false;
            }
            else
            {
                habilitaEdicionCotizacionBotonPedido = true;
            }
        }
               
        

        lblTipoCambio.Text = "US " +  VOcotizacion.TC_DOLAR.ToString() + " /  EU " + VOcotizacion.TC_EURO.ToString();
        
        lblLAB.Text = VOcotizacion.LAB;
        lblRepresentanteLegal.Text = VOcotizacion.RepresentanteLegal;
        lblNotas.Text = VOcotizacion.Notas;
        lblIva.Text = VOcotizacion.Iva.ToString();
        lblDescuento.Text = VOcotizacion.DesctoGral.ToString();
        UnidadNegocio.Text = VOcotizacion.UnidadNegocio.ToString();
        lblVencimiento.Text = String.Format("{0:dd/MM/yyyy}", VOcotizacion.FechaVencimiento);
        lblFechaCaida.Text = String.Format("{0:dd/MM/yyyy}", VOcotizacion.FechaCaida);

        lblFechaAlta.Text = String.Format("{0:dd/MM/yyyy}", VOcotizacion.Fecha); 

        intBanderaDescuento = VOcotizacion.BanderaDescuento;
        intBanderaIncPrecio = VOcotizacion.BanderaIncPrecio;
        intLimitePorcentaje = VOcotizacion.LimitePorcentaje;

        if(habilitaEdicionCotizacion)
        {
            btnEditar.Visible = true;
        }
        if (habilitaEdicionCotizacionBotonPedido)
        {
            Imgbtnpedidokepler.Visible = true;
            //Imgbtnpedidokepler.Visible = false;//deshabiltar boton de pedido
            
        }

        lblRazonSocial.Text = VOcotizacion.ClienteIdNuevo.ToString();
        
        //VOcliente.Cliente_codigo = VOcotizacion.CodigoCliente;
        //VOcliente.Operacion = ClienteVO.BUSCAR_ADMIN_CODIGO;
        //VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        //if (VOcliente.Cliente_rfc != null)
        //{
        //    lblRazonSocial.Text = VOcliente.Cliente_razonSocial;
        //    dblDescuento = VOcliente.Cliente_descuento;
        //}
        //else
        //{
        VOcliente.Clienteid = VOcotizacion.ClienteIdNuevo;
        VOcliente.Operacion = ClienteVO.BUSCAR;
        VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        if (VOcliente.Cliente_razonSocial != null)
        {
            if (VOcotizacion.RazonSocial != "")
            {
                lblRazonSocial.Text = VOcotizacion.RazonSocial;
            }
            else
            {
                lblRazonSocial.Text = VOcliente.Cliente_razonSocial;
            }

            BanActRazonSocial = VOcliente.Cliente_ActRazon;
            if (BanActRazonSocial == "S") { txtRazonSocial.Enabled = true; } else { txtRazonSocial.Enabled = false; }
            if (lblCondicionesPago.Text.Length == 0)
            {
                if (!Page.IsPostBack)
                {
                    txtCondicionesPago.Text = VOcliente.Cliente_DiasCredito.ToString() + " DÍAS";
                    lblCondicionesPago.Text = VOcliente.Cliente_DiasCredito.ToString() + " DÍAS";
                }
            }
            dblDescuento = 0;
        }

        //}

        //intTipoMoneda = VOcotizacion.TipoMoneda;
        hdnMoneda.Text = (VOcotizacion.TipoMoneda).ToString();
        if (lblRepresentanteLegal.Text.Trim().Length == 0)
            {
                lblRepresentanteLegal.Text = VOcliente.Cliente_Representante;
            }

        VOtipoCambio.MonedaId = VOcotizacion.TipoMoneda;
        VOtipoCambio.Operacion = TipoCambioVO.BUSCAR;
        VOtipoCambio = (TipoCambioVO)BLtipoCambio.execute(VOtipoCambio);

        if (VOtipoCambio.Descripcion != null)
        {
            strTipoMonedaDescripcion = VOtipoCambio.Descripcion;
            //dblConversionCambio = VOtipoCambio.Cambio;
            lblMoneda.Text = strTipoMonedaDescripcion;
        }

        if (Request["productoComodin"] !=null && Request["productoComodin"].ToString() == "1")
        {
            pnlAgregaProducto.Visible = true;
        }
        //btnPedidoKepler.Attributes["OnClick"] = "new_window('creaPedido.aspx')";
    }

    protected void ShopCartGrid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (lbEstatusCotizacion.Text == "PENDIENTE")
            {
                habilitaEdicionCotizacion = true;
            }
            else
            { 
                habilitaEdicionCotizacion = false; 
            }
            
            if (!habilitaEdicionCotizacion)
            {
                Button btnEditarGrid = (Button)e.Row.FindControl("Button1");
                Button btnBorrarGrid = (Button)e.Row.FindControl("Button2");

                btnEditarGrid.Visible = false;//Reeeeeeeeeeeeeeevisar
                btnBorrarGrid.Visible = false;
            }



             if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
               // String strInstruccion = DataBinder.Eval(e.Row.DataItem, "orden").ToString();

                if (((GridView)sender).Rows.Count == 0)
                {
                ((ImageButton)e.Row.FindControl("imgbDown")).Visible = true;
                //((ImageButton)e.Row.FindControl("imgbUp")).Visible = true;
                }
                else
                {
                    ((ImageButton)e.Row.FindControl("imgbDown")).Visible = true;
                    ((ImageButton)e.Row.FindControl("imgbUp")).Visible = true;
                }
            }
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            //((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Checked = false;
            //((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Visible = false;
            //((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Checked = false;
            //((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Visible = false;

            //if (sender.Rows.Count > 1)
            //{
            ImageButton imgbDown = (ImageButton)ShopCartGrid.Rows[(ShopCartGrid.Rows.Count) - 1].FindControl("imgbDown");
            if (imgbDown!=null)
            imgbDown.Visible = false;

            //((ImageButton)ShopCartGrid.Rows[(ShopCartGrid.Rows.Count)-1].FindControl("imgbUp")).Visible = true;

            //}

            if (habilitaEdicionCotizacion)
            {
                Button btnRevision = (Button)e.Row.FindControl("Button6");
                //btnRevision.Visible = true;
            }

            //InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
            //Int32 intOficina = Int32.Parse(infoSession.getValor(InfoSessionVO.OFICINA).ToString());

            //if (intOficina == 2 || intOficina == 5 )
            //{
            //    ((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Checked = true;
            //    ((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Visible = true;

            //    //Image1.ImageUrl = "~/Imagenes/caida1.JPG";
            //}

            //if ( intOficina == 1 || intOficina == 3 || intOficina == 6 || intOficina == 7 || intOficina == 8 || intOficina == 9 )
            //{
            //    ((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Checked = true;
            //    ((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Visible = true;
            //    //Image1.ImageUrl = "~/Imagenes/caida1.JPG";
            //}


        }
    }


    public void Get_Rows(Object Src, SqlDataSourceStatusEventArgs Args)
    {
        String cmd = Args.Command.CommandText.ToString();
        if (Args.AffectedRows == 0)
        {
            NoItemsMessage.Visible = true;
            Imgbtnpedidokepler.Visible = false;
            MasCotizaciones.Visible = false;
        }
    }

    Double TotalAmount = 0.0;
    Double DesctoGral = 0.0;

    public String Get_Amount(String Price, int Quantity, Double dblDescuento)
    {
        Double preAmount = 0.0; 
        Double Amount = 0.0;
        Double factorDescuento = 0;
        
        //factorDescuento = Double.Parse(intDescuento.ToString()) / 100;
        factorDescuento = dblDescuento / 100;
        preAmount = Double.Parse(Price) * Double.Parse(Quantity.ToString());
        Amount = preAmount - (preAmount * factorDescuento);
        TotalAmount += Amount;
        //return String.Format("{0:#,###.00}", Amount.ToString());
        return String.Format("{0:#,##0.00}", Amount);  
        
    }

    public Double Get_Shipping()
    {
        Double Shipping = TotalAmount;// *(Double)Application["Shipping"];
        //TotalAmount += Shipping;
        return Shipping;
    }

    public Double Get_ShippingSinDesc()
    {
        //Double ShippingSinDesc = Math.Round(TotalAmount - TotalAmount * (float.Parse(lblDescuento.Text) / 100),2); // *(Double)Application["Shipping"];
        DesctoGral = Math.Round(TotalAmount * (float.Parse(lblDescuento.Text) / 100), 2);
        Double ShippingSinDesc = TotalAmount - DesctoGral;
        //TotalAmount += Shipping;
        return ShippingSinDesc;
    }


    public Double Get_Interes()
    {
        //Double Interes = TotalAmount * (0.16);// *(Double)Application["Shipping"];
        Double Interes = Math.Round((TotalAmount- Math.Round(TotalAmount * (float.Parse(lblDescuento.Text) / 100),2)) * (float.Parse(lblIva.Text)/100),2);
        TotalAmount =  TotalAmount- Math.Round(TotalAmount * (float.Parse(lblDescuento.Text) / 100),2)+Interes;
        //TotalAmount += Interes;
        return Interes;
    }

    public Double Get_Order_Total()
    {
        return Math.Round(TotalAmount,2);
    }

    public Double Get_Descuento()
    {
        //Double Interes = TotalAmount * (0.16);// *(Double)Application["Shipping"];
        DesctoGral = Math.Round(TotalAmount * (float.Parse(lblDescuento.Text) / 100),2);
        return DesctoGral;
    }

    public void Validate_Quantity(Object Src, GridViewUpdateEventArgs Args)
    {
        // validacion cantidad
        String strBookQty = Args.NewValues["BookQty"].ToString();
        Int32 bookQty = 0;
        if (!Int32.TryParse(strBookQty, out bookQty))
        {
            Args.Cancel = true;
            ErrMessage.Text = "La cantidad debe ser numerica. En cantidad";
        }
        else if (Int32.Parse(Args.NewValues["BookQty"].ToString()) < 1)
        {
            Args.Cancel = true;
            ErrMessage.Text = "Cantidad fuera de rango.";
        }
        // validacion descuento
        String strDescuento = Args.NewValues["descu"].ToString();
        Double descu = 0;

        //double descuento = Double.Parse(Args.OldValues["descuentoLimite"].ToString());
        int index = ShopCartGrid.EditIndex;
        GridViewRow row = ShopCartGrid.Rows[index];
        Label lblLimiteDescuento = (Label)row.FindControl("lblLimiteDescuento");
        

        if (!Double.TryParse(strDescuento, out descu))
        {
            Args.Cancel = true;
            ErrMessage.Text = "El descuento debe ser numerico.";
        }
        else if (Double.Parse(Args.NewValues["descu"].ToString()) < 0)
        {
            Args.Cancel = true;
            ErrMessage.Text = "Descuento fuera de rango.";
        }
        else if (Double.Parse(Args.NewValues["descu"].ToString()) > Double.Parse(lblLimiteDescuento.Text) && intBanderaDescuento == 0)
        {
             Args.Cancel = true;
             ErrMessage.Text = "Descuento fuera de rango. Necesita autorización";
        }

        // validacion Incremento Precio
        String strIncrementoPrecio = Args.NewValues["incrementoPrecio"].ToString();

        Double dblIncrementoPrecio = 0;

        if (!Double.TryParse(strIncrementoPrecio, out dblIncrementoPrecio))
        {
            Args.Cancel = true;
            ErrMessage.Text = "El Incremento debe ser numerico.";
        }
        /*
        else if (Double.Parse(strIncrementoPrecio) < 0)
        {
            Args.Cancel = true;
            ErrMessage.Text = "El Incremento debe ser mayor o igual a: 0.";
        }*/

        // validacion tiempo entrega
        String strTiempoEntrega = Args.NewValues["TiempoEntrega"].ToString();
        Int32 intTE = 0;

        if (!Int32.TryParse(strTiempoEntrega, out intTE))
        {
            Args.Cancel = true;
            ErrMessage.Text = "El Tiempo de Entrega debe ser numerico.";
        }
        else if (Int32.Parse(strTiempoEntrega) < 0)
        {
            Args.Cancel = true;
            ErrMessage.Text = "Tiempo de Entrega fuera de rango.";
        }

        lblLimiteDescuento.Dispose();

        // Embalaje > cantidad
        if (Int32.Parse(Args.Keys[4].ToString()) > Int32.Parse(Args.NewValues["BookQty"].ToString())) // Embalaje 
        {
            ErrMessage.Text = "EL EMBALAJE ES DE: " + Args.Keys[4].ToString();
        }
        //precio en 0

    }

    public void Submit_Form(Object Src, EventArgs Args)
    {
        CheckBox cKBBanderaDescuento = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbBanderaDescuento");
        String PathCaida = Request.Url.GetLeftPart(UriPartial.Path);
        PathCaida = PathCaida.Substring(0, PathCaida.LastIndexOf("/"));
        PathCaida = PathCaida.Replace("Cotizador", "Reportes");
        PathCaida = PathCaida + "/CaidaCotizador.aspx" + "?OrderNumber=" + OrderNumberLabel.Text + "&isDescuento=" + cKBBanderaDescuento.Checked + "&usuarioID=" + Session["usuarioID"];
        //Response.Write("<script type='text/javascript'>window.open('"+PathCaida+"','Popup','toolbar=no, location=yes,status=no,menubar=no,scrollbars=yes,resizable=no, width=700,height=700,left=350,top=23');</script>");
        Response.Redirect(PathCaida);


        /*
        CheckBox cKBBanderaDescuento = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbBanderaDescuento");
        CheckBox ckbPrecioSinDescuento = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbPrecioSinDescuento");
        CheckBox ckbLogoComponentes = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbLogoComponentes");
        CheckBox ckbLogoComponentesBajio = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbLogoComponentesBajio");
        CheckBox ckbComentarios = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbComentarios");
        int banderaMuestraDescuento = 0;
        int banderaPrecioSinDescuento = 0;
        int BanderaLogoComponentes = 0;
        int banderaMostrarComentarios = 0;

        if (cKBBanderaDescuento.Checked)
           {
               banderaMuestraDescuento = 1;
           }

           if (ckbPrecioSinDescuento.Checked)
           {
               banderaPrecioSinDescuento = 1;
           }

           if (ckbPrecioSinDescuento.Checked)
           {
               banderaPrecioSinDescuento = 1;
           }

           if (ckbLogoComponentes.Checked)
           {
               BanderaLogoComponentes = 1;
           }

           if (ckbLogoComponentesBajio.Checked)
           {
               BanderaLogoComponentes = 2;
           }
           if (ckbComentarios.Checked) 
           {
               banderaMostrarComentarios = 1;
           }

           Response.Redirect("caidaCotizacion.aspx?cotizacionId=" + Request["cotizacionid"] + "&intMostrarDescuento=" + banderaMuestraDescuento + "&intPrecioSinDescuento=" + banderaPrecioSinDescuento + "&intLogoComponentes=" + BanderaLogoComponentes + "&intMostrarComentarios=" + banderaMostrarComentarios);
           */
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        int intEstatusCotizacionOld = intEstatusCotizacion;
        intEstatusCotizacion = 1;
       
        // Int32.Parse(Request["cotizacionid"]);

        //cotizacionVO VO = new cotizacionVO();
        //CotizacionBL BL = new CotizacionBL();
        //VO.Operacion = cotizacionVO.ACTUALIZAR;
        //VO.CotizacionId = Int32.Parse(Request["cotizacionid"]);
        //VO.EstatusCotizacionId = 1;

        //VO = (cotizacionVO)BL.execute(VO);

        Boolean bldActualiza = actualizaCotizacion(Int32.Parse(Request["cotizacionid"]), intEstatusCotizacion, 0, "", "", "", DateTime.Now.ToString("d"), DateTime.Now.ToString("d"), "", 0, 0,"");

        if (bldActualiza)
        {
            ErrMessage.Text = "COTIZACION EN REVISION";
            Button btnActualizar = (Button)ShopCartGrid.FooterRow.FindControl("Button6");
            btnActualizar.Visible = false;
        }
        else
        {
            intEstatusCotizacion = intEstatusCotizacionOld;
            ErrMessage.Text = "Los datos NO se actualizaron correctamente";
        }

    }

    public String get_tipoMoneda(int intMoneda)
    {
        switch (intMoneda)
        {
            case 1:
                return "MN";
            case 2:
                return "US";
            case 3:
                return "EU";
            default:
                return "";
        }
    }

    public int get_numeroPartida()
    {
        intNumeroPartida += 1;

        return intNumeroPartida;
    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {

        Imgbtnpedidokepler.Visible = false;
        MasCotizaciones.Visible = false;
        btnEditar.Visible = false;
        lblCondicionesPago.Visible = false;
        lblLAB.Visible = false;
        lblRazonSocial.Visible = false;
        lblRepresentanteLegal.Visible = false;

        lstTipoCambio.Visible = true;
        txtCondicionesPago.Visible = true;
        txtLAB.Visible = true;
        txtRazonSocial.Visible = true;
        txtRepresentanteLegal.Visible = true;
        txtDescuento.Visible = true;
        cbiva.Visible = true;
        txtNotas.Visible = true;
        btnGuardar.Visible = true;
        btnCancelar.Visible = true;
        
        txtVencimiento.Visible = true;
        txtFechaCaida.Visible = true;
        //imgCalendario.Visible = true;
        txtFechaAlta.Visible = true;
        //ImgCalendario2.Visible = true;

        //lblMoneda.Visible = false;
        txtCondicionesPago.Text = lblCondicionesPago.Text;
        txtLAB.Text = lblLAB.Text;
        txtRazonSocial.Text = lblRazonSocial.Text;
        txtRepresentanteLegal.Text = lblRepresentanteLegal.Text;
        txtDescuento.Text = lblDescuento.Text;
        if (lblIva.Text == "16")
        {
            cbiva.SelectedIndex = 0;
        }
        else
        {
            cbiva.SelectedIndex = 1;
        }
        
        txtNotas.Text = lblNotas.Text;

        lstTipoCambio.SelectedValue = hdnMoneda.Text;
        //lstTipoCambio.SelectedItem = lblMoneda.Text;
        txtVencimiento.Text = lblVencimiento.Text;
        txtFechaCaida.Text = lblFechaCaida.Text;

        lblVencimiento.Visible = false;
        lblFechaCaida.Visible = false;

        txtFechaAlta.Text = lblFechaAlta.Text;

        lblFechaAlta.Visible = false;

        //txtNotas.Visible = false;
        lblNotas.Visible = false;
        lblIva.Visible = false;
        lblDescuento.Visible = false;

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {

        Boolean bldActualiza = actualizaCotizacion(Int32.Parse(Request["cotizacionid"]), 0, Int32.Parse(lstTipoCambio.SelectedValue), txtCondicionesPago.Text.Trim().ToUpper(), txtLAB.Text.Trim(), txtRepresentanteLegal.Text.Trim(), txtVencimiento.Text.Trim(),txtFechaCaida.Text.Trim(), txtNotas.Text.Trim().ToUpper(), Int32.Parse(cbiva.SelectedItem.Text), Double.Parse(txtDescuento.Text),txtRazonSocial.Text);
        if ((intOficina == 2 || intOficina == 5) && (intPerfil == 2))//solo los de slp componentes no se habilita el boton
        {
            Imgbtnpedidokepler.Visible = false;
            MasCotizaciones.Visible = false;
        }
        else
        {
            Imgbtnpedidokepler.Visible = true;
            //Imgbtnpedidokepler.Visible = false;//deshabilitar boton de pedido
            MasCotizaciones.Visible = true;
        }
        if (bldActualiza)
        {
            lblMoneda.Visible = true;
            btnEditar.Visible = true;
            lblCondicionesPago.Visible = true;
            lblLAB.Visible = true;
            lblRazonSocial.Visible = true;
            lblNotas.Visible = true;
            lblIva.Visible = true;
            lblDescuento.Visible = true;
            lblRepresentanteLegal.Visible = true;

            lstTipoCambio.Visible = false;
            txtCondicionesPago.Visible = false;
            txtLAB.Visible = false;
            txtRazonSocial.Visible = false;
            txtNotas.Visible = false;
            txtRepresentanteLegal.Visible = false;
            txtDescuento.Visible = false;
            cbiva.Visible = false;
            btnGuardar.Visible = false;
            btnCancelar.Visible = false;
            txtVencimiento.Visible = false;
            txtFechaCaida.Visible = false;
            //imgCalendario.Visible = false;
            lblVencimiento.Text = txtVencimiento.Text;
            lblFechaCaida.Text = txtFechaCaida.Text;
            lblFechaCaida.Visible = true;
            lblVencimiento.Visible = true;

            //ImgCalendario2.Visible = false;
            lblFechaAlta.Text = txtFechaAlta.Text;
            lblFechaAlta.Visible = true;
            txtFechaAlta.Visible = false;

            ErrMessage.Text = "COTIZACION ACTUALIZADA";
            lblMoneda.Text = lstTipoCambio.SelectedItem.Text;
            
            lblCondicionesPago.Text = txtCondicionesPago.Text.Trim().ToUpper();
            lblLAB.Text = txtLAB.Text.Trim();
            lblRazonSocial.Text = txtRazonSocial.Text.Trim();
            lblRepresentanteLegal.Text = txtRepresentanteLegal.Text.Trim();
            lblNotas.Text = txtNotas.Text.Trim().ToUpper();
            lblIva.Text = cbiva.SelectedItem.Text;
            lblDescuento.Text = txtDescuento.Text;
            ShopCartSource.DataBind();
            //ShopCartSource.Select();
            ShopCartGrid.DataBind();

        }
        else
        {
            ErrMessage.Text = "LOS DATOS NO SE ACTUALIZARON CORRECTAMENTE";
        }

    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {

        if (ShopCartGrid.Rows.Count > 0)
        {
            if ((intOficina == 2 || intOficina == 5) && (intPerfil == 2))//solo los de slp componentes no se habilita el boton
            {
                Imgbtnpedidokepler.Visible = false;
                MasCotizaciones.Visible = false;
            }
            else
            {
                Imgbtnpedidokepler.Visible = true;
                //Imgbtnpedidokepler.Visible = false;//deshabilitar boton pedido
                MasCotizaciones.Visible = true;
            }
        }
        else
        {
            Imgbtnpedidokepler.Visible = false;
            MasCotizaciones.Visible = false;
        }
        lblMoneda.Visible = true;
        btnEditar.Visible = true;
        lblCondicionesPago.Visible = true;
        lblLAB.Visible = true;
        lblRazonSocial.Visible = true;
        lblNotas.Visible = true;
        lblIva.Visible = true;
        lblDescuento.Visible = true;
        lblRepresentanteLegal.Visible = true;
        lstTipoCambio.Visible = false;
        txtCondicionesPago.Visible = false;
        txtLAB.Visible = false;
        txtRazonSocial.Visible = false;
        txtNotas.Visible = false;
        txtRepresentanteLegal.Visible = false;
        txtDescuento.Visible = false;
        cbiva.Visible = false;
        btnGuardar.Visible = false;
        btnCancelar.Visible = false;
        txtVencimiento.Visible = false;
        txtFechaCaida.Visible = false;
        //imgCalendario.Visible = false;
        lblVencimiento.Visible = true;
        lblFechaCaida.Visible = true;
        //imgCalendario.Visible = false;
        //FJCA 09/08/13 - Comento por que eliminare objeto que no se utiliza
        //cldCalendario.Visible = false;
        txtFechaAlta.Visible = false;
        lblFechaAlta.Visible = true;
        //ImgCalendario2.Visible = false;
    }

    private Boolean actualizaCotizacion(int intCotizacionId, int intEstatusCotizacion, int intTipoMoneda, String strCondicionesPago, String strLAB, String strRepresentanteLegal,String strFechaVencimiento, String strFechaCaida, String strNotas, int intIva, Double intDesc, String razonsocial)
    {
        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();
        VO.Operacion = cotizacionVO.ACTUALIZAR;
        VO.CotizacionId = intCotizacionId;
        VO.EstatusCotizacionId = intEstatusCotizacion;
        VO.TipoMoneda = intTipoMoneda;
        VO.CondicionesPago = strCondicionesPago;
        VO.LAB = strLAB;
        VO.RazonSocial = razonsocial;
        VO.BanActCliente = BanActRazonSocial;
        VO.RepresentanteLegal = strRepresentanteLegal;
        VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());
        VO.Fecha = DateTime.Parse(txtFechaAlta.Text + " " + System.DateTime.Now.ToString("hh:mm:ss"));
        VO.Notas = strNotas;
        VO.Iva = intIva;
        VO.DesctoGral = intDesc;
        if (strFechaVencimiento!="") 
            {
                VO.FechaVencimiento = strFechaVencimiento;
            }
        else
            {
                VO.FechaVencimiento = DateTime.Now.ToString("d");
            }
        VO.FechaCaida = strFechaCaida;

        VO = (cotizacionVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    protected void btnAgregaProducto_Click(object sender, EventArgs e)
    {

        DetalleCotizaVO VO = new DetalleCotizaVO();
        DetalleCotizaBL BL = new DetalleCotizaBL();

       // log.Info("numero de sesion = " + Session["OrderNumber"].ToString());

        VO.ProductoRef = txtProductoAlta.Text;
        VO.CotizacionId = Int32.Parse(Session["OrderNumber"].ToString());
        VO.ProductoDesc = txtNombreAlta.Text + " - " + lstMarcaAlta.SelectedItem.Text;
        //modificar clase con txtComentario
        VO.ProductoPrecio = Double.Parse(txtPrecioAlta.Text);
        VO.Cantidad = Int32.Parse(txtCantidadAlta.Text);
        VO.TiempoEntrega = Int32.Parse(txtTiempoEntregaAlta.Text);
        VO.UnidadMedida = Int32.Parse(lstTipoMonedaAlta.SelectedItem.Value);
        VO.TipoMoneda = Int32.Parse(hdnMoneda.Text);
        VO.Descuento = Double.Parse(txtDescuentoAlta.Text);
        VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());
        VO.ProductoComodin = 1;
        VO.Operacion = DetalleCotizaVO.INSERTAR;
        VO = (DetalleCotizaVO)BL.execute(VO);

        
        if (VO.Resultado == 0)
        {
            //lblMensaje.Text = "Producto Añadido";
            //lblMensaje.ForeColor = Color.FromName("#00C000");
            //lblMensaje.BackColor = Color.FromName("#E0E0E0");
            //lblMensaje.Font.Bold = true;
            ShopCartSource.DataBind();
            ShopCartGrid.DataBind();

            txtProductoAlta.Text = "";
            txtNombreAlta.Text = "";
            //txtComentario.Text = "";
            lstMarcaAlta.SelectedIndex = 0;
            txtPrecioAlta.Text = "";
            txtCantidadAlta.Text = "";
            lstTipoMonedaAlta.SelectedIndex = 0;
            txtDescuentoAlta.Text = "";
            txtTiempoEntregaAlta.Text = "";

            pnlAgregaProducto.Visible = false;
            Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + Session["OrderNumber"] );
        }
        else
        {
            lblMensaje.Text = VO.MensajeError;
            lblMensaje.ForeColor = Color.FromName("#990000");
            lblMensaje.BackColor = Color.FromName("#E0E0E0");
            lblMensaje.Font.Bold = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btnRevision = (Button)ShopCartGrid.FooterRow.FindControl("Button6");
        btnRevision.Visible = false;
        Button btnCaida = (Button)ShopCartGrid.FooterRow.FindControl("Button5");
        btnCaida.Visible = false;
        CheckBox chbDescuento = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbBanderaDescuento");
        chbDescuento.Visible = false;



    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btnRevision = (Button)ShopCartGrid.FooterRow.FindControl("Button6");
        btnRevision.Visible = true;
        Button btnCaida = (Button)ShopCartGrid.FooterRow.FindControl("Button5");
        btnCaida.Visible = true;
        CheckBox chbDescuento = (CheckBox)ShopCartGrid.FooterRow.FindControl("ckbBanderaDescuento");
        chbDescuento.Visible = true;
    }

    //FJCA 09/08/13 - Comento por que eliminare objeto que no se utiliza
    //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    //{
    //    if (lblbdnFechVenc.Text == "1")
    //        {
    //        txtVencimiento.Text = cldCalendario.SelectedDate.Date.ToString("d");
    //        }
    //    if (lblbdnFechAlta.Text == "1")
    //        {
    //        txtFechaAlta.Text = cldCalendario.SelectedDate.Date.ToString("d");
    //        }
    //    cldCalendario.Visible = false;
    //    //imgCalendario.Visible = true;
    //    //ImgCalendario2.Visible = true;
    //    lblbdnFechVenc.Text = "0";
    //    lblbdnFechAlta.Text = "0";

    //}

    protected void imgCalendario_Click(object sender, ImageClickEventArgs e)
    {

        //imgCalendario.Visible = false;
        //cldCalendario.Visible = true;
        ////cldCalendario.SelectedDate = System.DateTime.Today;
        //if (lblVencimiento.Text != "")
        //{
        //cldCalendario.SelectedDate = System.DateTime.Parse(lblVencimiento.Text);
        //}
        //lblbdnFechVenc.Text = "1";
        //lblbdnFechAlta.Text = "0";
        //btnEditar.Visible = false;
        
    }

    protected void imgCalendario2_Click(object sender, ImageClickEventArgs e)
    {

        //ImgCalendario2.Visible = false;
        //cldCalendario.Visible = true;
        ////cldCalendario.SelectedDate = System.DateTime.Today;
        //if (lblFechaAlta.Text != "")
        //{
        //    cldCalendario.SelectedDate = System.DateTime.Parse(lblFechaAlta.Text);
        //}
        //lblbdnFechVenc.Text = "0";
        //lblbdnFechAlta.Text = "1";
        //btnEditar.Visible = false;

    }

    protected void ShopCartGrid_rowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int intCmmArg = Convert.ToInt32(e.CommandArgument);
        string intDetalleId = ShopCartGrid.DataKeys[intCmmArg].Values["detalleId"].ToString().Trim();
        string intOrden = ShopCartGrid.DataKeys[intCmmArg].Values["orden"].ToString().Trim();
        string intCotizacionId = ShopCartGrid.DataKeys[intCmmArg].Values["OrderNumber"].ToString().Trim();
        string intDetalleIdAnterior;
        string intDetalleIdPosterior;
        string intOrdenPostAnt;

        if (e.CommandName == "subeOrden")
        {
        if (intCmmArg > 0)
            {
            intDetalleIdAnterior = ShopCartGrid.DataKeys[intCmmArg - 1].Values["detalleId"].ToString().Trim();
            intOrdenPostAnt = ShopCartGrid.DataKeys[intCmmArg - 1].Values["orden"].ToString().Trim();

            ShopCartSource.InsertParameters[0].DefaultValue = intCotizacionId;
            ShopCartSource.InsertParameters[1].DefaultValue = intDetalleId;
            ShopCartSource.InsertParameters[2].DefaultValue = intOrden;
            ShopCartSource.InsertParameters[3].DefaultValue = intDetalleIdAnterior;
            ShopCartSource.InsertParameters[4].DefaultValue = intOrdenPostAnt;
            ShopCartSource.InsertParameters[5].DefaultValue = Session["usuarioID"].ToString();
            ShopCartSource.Insert();

            }
        }

        if (e.CommandName == "bajaOrden")
        {
        if (intCmmArg < ShopCartGrid.Rows.Count)
            {
            intDetalleIdPosterior = ShopCartGrid.DataKeys[intCmmArg + 1].Values["detalleId"].ToString().Trim();
            intOrdenPostAnt = ShopCartGrid.DataKeys[intCmmArg + 1].Values["orden"].ToString().Trim();

            ShopCartSource.InsertParameters[0].DefaultValue = intCotizacionId;
            ShopCartSource.InsertParameters[1].DefaultValue = intDetalleId;
            ShopCartSource.InsertParameters[2].DefaultValue = intOrden;
            ShopCartSource.InsertParameters[3].DefaultValue = intDetalleIdPosterior;
            ShopCartSource.InsertParameters[4].DefaultValue = intOrdenPostAnt;
            ShopCartSource.InsertParameters[5].DefaultValue = Session["usuarioID"].ToString();
            ShopCartSource.Insert();

            }
        }
    }



 
 

    protected void Marca_Partida(int CotizacionId,int partida)
    {
        set_marcapartida_pedidoTableAdapter setMarcaPartida = new set_marcapartida_pedidoTableAdapter();
        setMarcaPartida.GetData(CotizacionId,partida);
    }

    protected void Limpia_Partida(int CotizacionId)
    {
        set_limpia_marcapartidaTableAdapter setLimpiaPartida = new set_limpia_marcapartidaTableAdapter();
        setLimpiaPartida.GetData(CotizacionId);
    }



    private int _resBusqueda;

    public int resBusqueda
    {
        get { return _resBusqueda; }
        set { _resBusqueda = value; }
    }

    protected void Imgbtnpedidokepler_Click(object sender, ImageClickEventArgs e)
    {
        //string mensaje = "";
        //PaneLPedido.DefaultButton = Button7.ID;
        string ProdBuscado = "";
        string UnidadMedidaSick = "";
        string strRazon = "";
        bool existe = false;
        bool valido = true;
        bool ProdValido = true;
        bool UnidadValida = true;
        int i = 0;
        int partfolioerroneo = 0;
        int partproderroneo = 0;
        //int intCotizacionId = Int32.Parse((String)Session["OrderNumber"]);
        Limpia_Partida(intCotizacion);
        while (i < ShopCartGrid.Rows.Count && valido == true && ProdValido == true)
        {
            if (((CheckBox)ShopCartGrid.Rows[i].FindControl("chkproductos")).Checked == true)
            {
                existe = true;
                if (((Label)ShopCartGrid.Rows[i].FindControl("lblfoliopedido")).Text != "")
                {
                    valido = false;
                    partfolioerroneo = Int32.Parse(((Label)ShopCartGrid.Rows[i].FindControl("label21")).Text);
                    break;
                }
                else
                {
                    //verifica codigo de producto en keplers
                    get_buscaProdEnkeplerTableAdapter BuscaProdKepler = new get_buscaProdEnkeplerTableAdapter();
                    ProdBuscado = ((Label)ShopCartGrid.Rows[i].FindControl("label2")).Text;
                    int? resBusqueda = 0;
                    BuscaProdKepler.GetData(ProdBuscado, ref resBusqueda);
                    if (resBusqueda > 0)
                    {
                        if (resBusqueda == 1) { strRazon = ""; }
                        
                        ProdValido = false;
                        partproderroneo = Int32.Parse(((Label)ShopCartGrid.Rows[i].FindControl("label21")).Text);
                        break;
                    }
                    else
                    {
                        UnidadMedidaSick = ((Label)ShopCartGrid.Rows[i].FindControl("label9")).Text;
                        int? resUnidad = 0;
                        get_buscaUnidadEnkeplerTableAdapter BuscaProdKeplerUnidad = new get_buscaUnidadEnkeplerTableAdapter();
                        BuscaProdKeplerUnidad.GetData(ProdBuscado, UnidadMedidaSick, ref resUnidad);

                        if (resUnidad == 1)
                        {
                            UnidadValida = false;
                            break;
                        }
                        else
                        {
                            Marca_Partida(intCotizacion, Int32.Parse(((Label)ShopCartGrid.Rows[i].FindControl("label21")).Text));
                        }
                    }
                }

            }

            i++;
        }
        if ((existe == true) && (valido == true) && (ProdValido == true) && (UnidadValida == true))
        {            
            Ficticio_ModalPopupExtender.Show();   

        }
        else
        if (existe == false)
        {
            
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "NingPartida", "alert('Niguna Partida Seleccionada');", true);

        }
        else
        if (valido == false)
        {
            
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "FolioErr", "alert('La partida " + partfolioerroneo.ToString() + " tiene pedido');", true);
        }
        else
        if ((ProdValido == false)&&(valido==true))
        {

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "ProdErr", "alert('La partida " + partproderroneo.ToString() + " no existe producto " + strRazon + "');", true);
        }
        else
            if ((UnidadValida == false) && (valido == true) && (ProdValido == true))
        {
            
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "ProdErr", "alert('Unidad de medida no coincide en Kepler');", true);
        }
    }

    protected void LimpiaCamposPeido()
    {
        lbldcredito.Text = "";
        lbllimcredito.Text = "";
        lblcdisponible.Text = "";
        lblsaldo.Text = "";
        lblsremisiones.Text = "";
        txtreferencia.Text = "";
        txtcomentario1.Text = "";
        txtcomentario2.Text = "";
        txtcomentario3.Text = "";
    }

    protected void lstSucursal_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        LimpiaCamposModal();
        dgvClientes.DataBind();
        dgvClientes.SelectedIndex = -1;
        rblTipoBusqueda.SelectedIndex = 0;
        PanelCliente.Visible = false;
        
    }
    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        if (txtCliente.Text != "")
        {

            if ((lstSucursal.SelectedItem.Value == "1"))
            {
                try
                {
                    string res = "";

                    SP_INSERTA_PEDIDO_SICK_CSATableAdapter SP_INSERTA_PEDIDO_SICK_CSA = new SP_INSERTA_PEDIDO_SICK_CSATableAdapter();
                    SP_INSERTA_PEDIDO_SICK_CSA.GetData(intCotizacion, lstSucursal.SelectedItem.Value, txtCliente.Text, lstAgente.SelectedItem.Value, txtreferencia.Text, txtcomentario1.Text, txtcomentario2.Text, txtcomentario3.Text, lstAlmacen.SelectedItem.Value, ref res);
                    if (res.ToString().Substring(2, 2) == "UD")
                    {


                        //Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());
                        lblMensajeOk.Text = res.ToString();
                        btnMensajeOk_ModalPopupExtender.Show();


                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "FolioErr", "alert('" + res.ToString() + "');", true);
                        txtCliente.Text = "";
                    }


                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "FolioErr2", "alert('Error Revisar Folio en Kepler SA');", true);

                }
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "FolioErr3", "alert('Cliente No seleccionado');", true);
        }




    }

    protected void LimpiaCamposModal()
    {
        txtCliente.Text = "";
        txtParameter.Text = "";
        PanelCliente.Visible = false;
        txtreferencia.Text = "";
        txtcomentario1.Text = "";
        txtcomentario2.Text = "";
        txtcomentario3.Text = "";
        rblTipoBusqueda.SelectedIndex = 0;
        btnContinuar.Enabled = false;
        dgvClientes.SelectedIndex = -1;
        lblrazon.Text = "";
        lbldcredito.Text = "";
        lbllimcredito.Text = "";
        lblsaldo.Text = "";
        lblsremisiones.Text = "";
        lblcdisponible.Text = "";
        Label40.Text = "";
        lblcosto.Text = "";
        lblporcutilidad.Text = "";
        lblutilidad.Text = "";
        lblnomcte.Text = "";
        lblcalle.Text = "";
        lblcol.Text = "";
        lblestado.Text = "";
        dgvClientes.DataBind();
        lblReqOcRef.Text = "";
        lblMensajeOk.Text = "";
    }

    protected void Cerrar_Click(object sender, EventArgs e)
    {
        Ficticio_ModalPopupExtender.Hide();
        LimpiaCamposModal();
        Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());
        //ShopCartGrid.DataBind();
    }
    protected void Ficticio_ModalPopupExtender_Load(object sender, EventArgs e)
    {
        lblCotizacion.Text = intCotizacion.ToString();
        
        
    }

   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        dgvClientes.SelectedIndex = -1;
        if (PanelCliente.Visible== false)
            PanelCliente.Visible = true;
        else
            PanelCliente.Visible = false;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        
    }
    protected void dgvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = dgvClientes.SelectedRow;
        txtCliente.Text = Convert.ToString(dgvClientes.DataKeys[row.RowIndex].Values["id_Cte"]);

        string plazo = "";
        string limite = "";
        string valida_bloqueo = "";
        string razon_bloqueo = "";
        string saldo = "";
        string saldorem = "";
        string creditodisp = "";
        string moneda = "";
        string costo_total = "";
        string subtotal = "";
        string utilidad = "";
        string porcutilidad = "";
        string sucursal = "";
        string agenteasignado = "";
        string requiereOC = null;
        float jutilidad=0;
        float jporcentaje=0;
        /*
        if ((lstSucursal.SelectedItem.Value == "1") || (lstSucursal.SelectedItem.Value == "2") ||
                (lstSucursal.SelectedItem.Value == "3") || (lstSucursal.SelectedItem.Value == "4") ||
                (lstSucursal.SelectedItem.Value == "9"))
        {
            if (lstSucursal.SelectedItem.Value == "1") sucursal = "003";
            if (lstSucursal.SelectedItem.Value == "2") sucursal = "002";
            if (lstSucursal.SelectedItem.Value == "3") sucursal = "004";
            if (lstSucursal.SelectedItem.Value == "4") sucursal = "001";
            get_info_cliente_keplerTableAdapter get_info_cliente_kepler = new get_info_cliente_keplerTableAdapter();
            get_info_cliente_kepler.GetData(txtCliente.Text.ToString(),sucursal, intCotizacion,ref plazo,ref limite,ref valida_bloqueo,ref razon_bloqueo,ref saldo, ref saldorem, ref creditodisp, ref moneda, ref costo_total, ref subtotal, ref utilidad, ref porcutilidad, ref agenteasignado);

        }
        if ((lstSucursal.SelectedItem.Value == "6") || (lstSucursal.SelectedItem.Value == "7") ||
                (lstSucursal.SelectedItem.Value == "8"))
        {
            if (lstSucursal.SelectedItem.Value == "6") sucursal = "006";
            if (lstSucursal.SelectedItem.Value == "7") sucursal = "007";
            if (lstSucursal.SelectedItem.Value == "8") sucursal = "008";
            get_info_cliente_keplerBJTableAdapter get_info_cliente_keplerBJ = new get_info_cliente_keplerBJTableAdapter();
            get_info_cliente_keplerBJ.GetData(txtCliente.Text, sucursal, intCotizacion, ref plazo, ref limite, ref valida_bloqueo, ref razon_bloqueo, ref saldo, ref saldorem, ref creditodisp, ref moneda, ref costo_total, ref subtotal, ref utilidad, ref porcutilidad, ref agenteasignado);

        }
        if (lstSucursal.SelectedItem.Value == "5")
        {
            sucursal = "005";
            get_info_cliente_keplerSLPTableAdapter get_info_cliente_keplerSLP = new get_info_cliente_keplerSLPTableAdapter();
            get_info_cliente_keplerSLP.GetData(txtCliente.Text, sucursal, Int32.Parse(Session["OrderNumber"].ToString()), ref plazo, ref limite, ref valida_bloqueo, ref razon_bloqueo, ref saldo, ref saldorem, ref creditodisp, ref moneda, ref costo_total, ref subtotal, ref utilidad, ref porcutilidad, ref agenteasignado);

        }


        lblrazon.Text = razon_bloqueo;
        */
        valida_bloqueo = "0";


        if (valida_bloqueo == "1")
        {
            btnContinuar.Enabled=false;
            txtCliente.Text = "";
        }
        else
        {
            /*
            lbldcredito.Text = plazo;
            lbllimcredito.Text = limite;
            lblsaldo.Text = saldo;
            lblsremisiones.Text = saldorem;
            lblcdisponible.Text = creditodisp;
            Label40.Text = moneda;
            lblcosto.Text = costo_total;
            lblporcutilidad.Text = porcutilidad+'%';
            lblutilidad.Text = utilidad;
            */
            lblnomcte.Text = dgvClientes.Rows[row.RowIndex].Cells[2].Text;
            lblcalle.Text = dgvClientes.Rows[row.RowIndex].Cells[3].Text;
            lblcol.Text = dgvClientes.Rows[row.RowIndex].Cells[4].Text;
            lblestado.Text = dgvClientes.Rows[row.RowIndex].Cells[5].Text;
            /*
            jutilidad = float.Parse(utilidad.Replace(",", ""));
            jporcentaje = float.Parse(porcutilidad.Replace(",", ""));
            lblutilidad.ForeColor=Color.FromArgb(00,00,99);
            lblporcutilidad.ForeColor=Color.FromArgb(00,00,99);

           
            if (jutilidad<0) lblutilidad.ForeColor=Color.Red;
            if (jporcentaje < 0) lblporcutilidad.ForeColor = Color.Red;
            */
            btnContinuar.Enabled = true;

            //Modifica el agente asignado dependiendo del cliente seleccionado
            /*
            if ((agenteasignado != "") && (intPerfil == 1 || intPerfil == 6 || intPerfil == 15 || intPerfil == 20 || intPerfil == 22))
            {
                //lstAgente.Items.FindByValue(agenteasignado).Selected = true;
                lstAgente.SelectedValue = agenteasignado;
                //agenteasignado = "";
            }

            //buscar si requiere ORDEN DE COMPRA el pedido
            
             get_requiere_ordencompraTableAdapter get_requiere_ordencompra = new get_requiere_ordencompraTableAdapter();
             get_requiere_ordencompra.GetData(lstSucursal.SelectedItem.Value, txtCliente.Text, ref requiereOC);
             */
           

        }
        PanelCliente.Visible = false;

    }




    protected void btnOkMensaje_Click(object sender, EventArgs e)
    {
        LimpiaCamposModal();
        Ficticio_ModalPopupExtender.Hide();
        Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());
    }
    protected void MasCotizaciones_Click(object sender, EventArgs e)
    {
        txtCotBuscar.Text = "";
        MasCot_ModalPopupExtender.Show();
    }
    protected void Cerrar_MasCot_Click(object sender, EventArgs e)
    {
        txtCotBuscar.Text = "";
        Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());
        MasCot_ModalPopupExtender.Hide();

    }
    protected void dgvDetCot_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((CheckBox)e.Row.FindControl("chkPCotizaciones")).Checked = true;
        }
    }
  
    protected void chkTodoPCotNada_Click(object sender, EventArgs e)
    {
        // Access the CheckBox
        foreach (GridViewRow row in dgvDetCot.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkPCotizaciones");
            if (cb != null)
            {
                cb.Checked = false;
            }
        }
    }
    protected void chkTodoPCotTodo_Click(object sender, EventArgs e)
    {
        // Access the CheckBox
        foreach (GridViewRow row in dgvDetCot.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkPCotizaciones");
            if (cb != null)
            {
                cb.Checked = true;
            }
        }
    }
    protected void chkall_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkSelectAll = sender as CheckBox;

        foreach (GridViewRow gvr in dgvDetCot.Rows)
        {
            CheckBox chkSelect = gvr.FindControl("chkPCotizaciones") as CheckBox;

            if (chkSelect != null)
            {
                chkSelect.Checked = chkSelectAll.Checked;
            }
        }

    }
    protected void chkallCotizacion_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkSelectAll = sender as CheckBox;

        foreach (GridViewRow gvr in ShopCartGrid.Rows)
        {
            CheckBox chkSelect = gvr.FindControl("chkproductos") as CheckBox;

            if (chkSelect != null)
            {
                chkSelect.Checked = chkSelectAll.Checked;
            }
        }
    }
    protected void btnAgregaCot_Click(object sender, EventArgs e)
    {
        int CotizacionOrigen = 0;
        int i = 0;
        bool marca = false;
        if (dgvDetCot.Rows.Count>0)
        {
            CotizacionOrigen = Convert.ToInt32(dgvDetCot.Rows[0].Cells[1].Text);
            Limpia_Partida(CotizacionOrigen);
            while (i < dgvDetCot.Rows.Count)
            {
               
                if (((CheckBox)dgvDetCot.Rows[i].FindControl("chkPCotizaciones")).Checked == true)
                {
                    Marca_Partida(CotizacionOrigen, Convert.ToInt32(dgvDetCot.Rows[i].Cells[2].Text));
                    marca = true;

                }
                i++;
            }
            if (marca == true)
            { 
                //inserta cotizacion
                set_inserta_detalleCotizacion_acotizacionTableAdapter set_inserta_detalleCotizacion_acotizacion = new set_inserta_detalleCotizacion_acotizacionTableAdapter();
                set_inserta_detalleCotizacion_acotizacion.GetData(CotizacionOrigen,intCotizacion,intUsuarioId);
                txtCotBuscar.Text = "";
                MasCot_ModalPopupExtender.Hide();
                Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());

                //LimpiaCamposModal();
                //Ficticio_ModalPopupExtender.Hide();
                //Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());

            }

        }
    }
   
    protected void ShopCartGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            ((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Checked = false;
            ((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Visible = false;
            ((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Checked = false;
            ((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Visible = false;

            if (intOficina == 2 || intOficina == 5)
            {
                //((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Checked = true;
                //((CheckBox)e.Row.FindControl("ckbLogoComponentes")).Visible = true;

                //Image1.ImageUrl = "~/Imagenes/caida1.JPG";
            }

            if (intOficina == 1 || intOficina == 3 || intOficina == 6 || intOficina == 7 || intOficina == 8 || intOficina == 9)
            {
                //((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Checked = true;
                //((CheckBox)e.Row.FindControl("ckbLogoComponentesBajio")).Visible = true;
                //Image1.ImageUrl = "~/Imagenes/caida1.JPG";
            }
        }
        
        
        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))
        {
            TextBox txtIncPrecio = ((TextBox)e.Row.FindControl("incrementoPrecio"));

            if (intBanderaIncPrecio == 1)
            {
                txtIncPrecio.Enabled = true;
            }
            else
            {
                txtIncPrecio.Enabled = false;
            }

        }


    }
    
   
}
