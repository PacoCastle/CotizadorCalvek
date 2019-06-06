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
using saludos;

//' Registro para Documentos
struct tDocumento
{
   public Double aFolio;
   public long aNumMoneda;
   public Double aTipoCambio;
   public Double aImporte; //Importe se asigna solamente cuando se va crear un documento de CxC o CxP, en otro su valor es cero.
   public Double aDescuentoDoc1; // No tiene uso, valor de omision = 0
   public Double aDescuentoDoc2; // No tiene uso, valor de omision = 0
   public long aSistemaOrigen; // Valor mayor a 5 que indica una aplicación diferente a los PAQ's
   public String aCodConcepto;
   public String aSerie;
   public String aFecha; // Formato mm/dd/aaaa. Las diagonales "/" son parte del formato
   public String aCodigoCteProv;
   public String aCodigoAgente;
   public String aReferencia;
   public long aAfecta; // No tiene uso, valor de omision = 0
}

//' Registro para Movimientos
struct tMovimiento
{
  public long aConsecutivo;   //' Valor inicial debe ser 100 con incrementos de 100 en 100, por si es necesario insertar movtos intermedios
  public Double aUnidades;    //' En caso de producto con series, lotes y/o pedimentos y carcateristicas este valor es cero
  public Double aPrecio;      //' Usado para docuementos de venta
  public Double aCosto;       //' Usado para docuemtnos de compra y/o inventarios
  public String aCodProdSer;
  public String aCodAlmacen;
  public String aReferencia;
  public String aCodClasificacion;  //' No tiene uso, valor omision en blancos
}

public partial class Cotizador_RevisionDetalle : System.Web.UI.Page
{
    private static int NUMFUNCION = 9;

    int intEstatusCotizacion = 0;
    //int intTipoMoneda = 0;
    String strTipoMonedaDescripcion = null;
    //Double dblConversionCambio = 0;
    Boolean blnBanderaAceptaCotizacion = false;
    Boolean blnBanderaAceptaCotizacionDescuento = false;
    Boolean blnBanderaCotizacionDescuento = false;

    protected void Page_Load(object sender, EventArgs e)
    {

    String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //String carpetaEmpresa = "C:/Compacw/Empresas/CALVEK";
        //saludo nuevo = new saludo();
        //nuevo.fInicializaSDKW();
        //nuevo.fAbreEmpresaW(carpetaEmpresa);
        //long resultadoAdminpaq;
        //String strRazonSocial = "                                   ";

        //// determinar si el usuario tiene los permisos para aceptar una cotizacion.
        //String error1 = Utilis.validaPermisos(Session, 14);
        //if (error1.Equals(""))
        //    {
        //    blnBanderaAceptaCotizacion = true;
        //    }
        
        //// determinar si el usuario tiene los permisos para aceptar una cotizacion con descuento.
        //String error2 = Utilis.validaPermisos(Session, 15);
        //if (error2.Equals(""))
        //    {
        //    blnBanderaAceptaCotizacionDescuento = true;
        //    }

        Double dblDescuento = 0;

        cotizacionVO VOcotizacion = new cotizacionVO();
        CotizacionBL BLcotizacion = new CotizacionBL();

        ClienteVO VOcliente = new ClienteVO();
        ClienteBL BLcliente = new ClienteBL();

        TipoCambioVO VOtipoCambio = new TipoCambioVO();
        TipoCambioBL BLtipoCambio = new TipoCambioBL();

        usuarioVO VOUsuario = new usuarioVO();
        UsuarioBL BLUsuario = new UsuarioBL();

        if (Request["cotizacionid"] != null)
        {
            Session["OrderNumber"] = Request["cotizacionid"];
            VOcotizacion.Operacion = cotizacionVO.BUSCAR;
            VOcotizacion.CotizacionId = Int32.Parse(Request["cotizacionid"]);
            VOcotizacion = (cotizacionVO)BLcotizacion.execute(VOcotizacion);
        }

        if (!Page.IsPostBack)
        {
            OrderNumberLabel.Text = (String)Session["OrderNumber"];
        }

        lbEstatusCotizacion.Text = VOcotizacion.EstatusCotizacionNombre;//Request["Estatus"];
        intEstatusCotizacion = VOcotizacion.EstatusCotizacionId;

        //resultadoAdminpaq = nuevo.fBuscaCteProvW(VOcotizacion.CodigoCliente); 
        //resultadoAdminpaq = nuevo.fLeeDatoCteProvW("CRAZONSO01", ref strRazonSocial, 30);
        //lblRazonSocial.Text = strRazonSocial;

        lblRazonSocial.Text = VOcotizacion.ClienteIdNuevo.ToString();

        VOcliente.Cliente_codigo = VOcotizacion.CodigoCliente;
        VOcliente.Operacion = ClienteVO.BUSCAR_ADMIN_CODIGO;
        VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        if (VOcliente.Cliente_rfc != null)
        {
            lblRazonSocial.Text = VOcliente.Cliente_razonSocial;
            dblDescuento = VOcliente.Cliente_descuento;
        }
        else
        {
            if (VOcotizacion.ClienteIdNuevo > 0)
            {
                VOcliente.Clienteid = VOcotizacion.ClienteIdNuevo;
                VOcliente.Operacion = ClienteVO.BUSCAR;
                VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
                if (VOcliente.Cliente_razonSocial != null)
                {
                    lblRazonSocial.Text = VOcliente.Cliente_razonSocial;
                    dblDescuento = 0;
                }
            }
        }

        //nuevo.fCierraEmpresaW();
        //nuevo.fTerminaSDKW();

        VOtipoCambio.MonedaId = VOcotizacion.TipoMoneda;
        VOtipoCambio.Operacion = TipoCambioVO.BUSCAR;
        VOtipoCambio = (TipoCambioVO)BLtipoCambio.execute(VOtipoCambio);

        if (VOtipoCambio.Descripcion != null)
        {
            strTipoMonedaDescripcion = VOtipoCambio.Descripcion;
            //dblConversionCambio = VOtipoCambio.Cambio;
            lblMoneda.Text = strTipoMonedaDescripcion;
        }

        lblNumMoneda.Text = (VOcotizacion.TipoMoneda).ToString();

        if (VOcotizacion.TipoMoneda == 1)
        {
            lblTipoCambio.Text = "1";
        }
        else
        {

            VOtipoCambio.Operacion = TipoCambioVO.BUSCAR_TIPOS_CAMBIOS;
            VOtipoCambio.FechaTipoCambio = VOcotizacion.Fecha;
            VOtipoCambio.MonedaId = 1;
            VOtipoCambio = (TipoCambioVO)BLtipoCambio.execute(VOtipoCambio);
            String[,] conversionMoneda = VOtipoCambio.ArrCambios;

            for (int i = 0; i <= conversionMoneda.GetLength(1) - 1; i++)
            {
                if (Int32.Parse(conversionMoneda[0, i]) == VOcotizacion.TipoMoneda)
                {
                    lblTipoCambio.Text = conversionMoneda[1, i];
                }
            }
        }

        lblFechaCotizacion.Text = VOcotizacion.Fecha.ToString();
        lblCodigoCliente.Text = VOcotizacion.CodigoCliente;

        VOUsuario.Usuarioid = VOcotizacion.UsuarioId;
        VOUsuario.Operacion=usuarioVO.BUSCAR;
        VOUsuario = (usuarioVO) BLUsuario.execute(VOUsuario);

        lblCodigoAgente.Text = VOUsuario.Usuario_codigoUsuarioAdmin;
        

    }

    protected void ShopCartGrid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //if (intEstatusCotizacion > 0)
            //{
                Button btnEditar = (Button)e.Row.FindControl("Button1");
                Button btnBorrar = (Button)e.Row.FindControl("Button2");

                btnEditar.Visible = false;
                btnBorrar.Visible = false;
            //}
                
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {

            String error1 = Utilis.validaPermisos(Session, 14);
            if (error1.Equals(""))
            {
                blnBanderaAceptaCotizacion = true;
            }

            // determinar si el usuario tiene los permisos para aceptar una cotizacion con descuento.
            String error2 = Utilis.validaPermisos(Session, 15);
            if (error2.Equals(""))
            {
                blnBanderaAceptaCotizacionDescuento = true;
            }

            Button btnRevision = (Button)e.Row.FindControl("Button6");
            btnRevision.Visible = false;

            //cotizacion con descuento, solo supervisores la pueden aceptar
            if (blnBanderaCotizacionDescuento && blnBanderaAceptaCotizacionDescuento)
            {
                btnRevision.Visible = true;
            }
            else if (!blnBanderaCotizacionDescuento && (blnBanderaAceptaCotizacion || blnBanderaAceptaCotizacionDescuento))  //cotizacion sin descuento 
            {
                btnRevision.Visible = true;
             }
            else
                {
                    ErrMessage.Text = "NO SE TIENEN LOS PERMISOS PARA ACEPTAR UNA COTIZACION";
                if (blnBanderaCotizacionDescuento)
                    {
                     ErrMessage.Text += " CON DESCUENTO.";
                    }
                }
        }

    }
    public void Get_Rows(Object Src, SqlDataSourceStatusEventArgs Args)
    {
        if (Args.AffectedRows == 0)
        {
            NoItemsMessage.Visible = true;
        }
    }

    Double TotalAmount = 0.0;

    public Double Get_Amount(Double Price, int Quantity, int intDescuento)
    {
        Double preAmount = 0.0;
        Double Amount = 0.0;
        Double factorDescuento = 0;
        factorDescuento = Double.Parse(intDescuento.ToString()) / 100;
        preAmount = Price * Quantity;
        Amount = preAmount - (preAmount * factorDescuento);
        TotalAmount += Amount;
        return Amount;  
    }

    public Double Get_Shipping()
    {
        Double Shipping = TotalAmount;// *(Double)Application["Shipping"];
        //TotalAmount += Shipping;
        return Shipping;
    }
    public Double Get_Interes()
    {
        Double Interes = TotalAmount * (0.15);// *(Double)Application["Shipping"];
        TotalAmount += Interes;
        return Interes;
    }

    public Double Get_Order_Total()
    {
        return TotalAmount;
    }

    public void Validate_Quantity(Object Src, GridViewUpdateEventArgs Args)
    {
        String strBookQty = Args.NewValues["BookQty"].ToString();
        Int32 bookQty = 0;
        //Int32.TryParse(
        //if (!Double.IsNaN(Double.Parse(bookQty)))
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
        // --
        String strDescuento = Args.NewValues["descu"].ToString();
        Int32 descu = 0;
        //Int32.TryParse(
        //if (!Double.IsNaN(Double.Parse(bookQty)))
        if (!Int32.TryParse(strDescuento, out descu))
        {
            Args.Cancel = true;
            ErrMessage.Text = "El descuento debe ser numerico.";

        }
        else if (Int32.Parse(Args.NewValues["descu"].ToString()) < 0 || Int32.Parse(Args.NewValues["descu"].ToString()) > 20)
        {
            Args.Cancel = true;
            ErrMessage.Text = "Descuento fuera de rango.";
        }
    }



    protected void Button5_Click(object sender, EventArgs e)
    {
        //Response.Redirect("caidaCotizacion.aspx");
        Response.Redirect("caidaCotizacion.aspx?cotizacionId=" + Request["cotizacionid"]);
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        NoItemsMessage.Visible=false;

        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();
        VO.Operacion = cotizacionVO.ACTUALIZAR;
        VO.CotizacionId = Int32.Parse(Request["cotizacionid"]);
        VO.EstatusCotizacionId = 2;

        VO = (cotizacionVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            ErrMessage.Text = "COTIZACION APROBADA";
            intEstatusCotizacion = 2;
            //Button btnActualizar = (Button)ShopCartGrid.Row.FindControl("Button3");
            //btnActualizar.Visible = false;
        }
        else
        {
            ErrMessage.Text = "Los datos NO se actualizaron correctamente";
        }

        String carpetaEmpresa = "C:/CompacW/Empresas/CALVEK";
        int prueba = 0;
        int prueba2 = 0;
        saludo nuevo = new saludo();
        String lSerie="            ";
        Double lFolio = new Double();
        int gIdDocto = 0;

        String lCodigoConcepto = "";

        nuevo.fInicializaSDKW();
        nuevo.fAbreEmpresaW(carpetaEmpresa);
        prueba = nuevo.fSiguienteFolioW("1", lSerie, ref lFolio);

        nuevo.fPosPrimerConceptoDoctoW();

        nuevo.fLeeDatoConceptoDoctoW("cCodigoC01", lCodigoConcepto, 31);

        //nuevo.fCierraEmpresaW();
        //nuevo.fTerminaSDKW();

        String lFecha = lblFechaCotizacion.Text.Substring(3, 2) + "/" + lblFechaCotizacion.Text.Substring(0, 2) + "/" + lblFechaCotizacion.Text.Substring(6, 4);

        //lblComodin.Text += "<BR>Serie:" + lSerie;
        //lblComodin.Text += "<BR>Folio:" + lFolio.ToString();

        //lblEtiqueta.Visible = true;
        //lblEtiqueta.Text += "<BR>";
        //lblEtiqueta.Text += "<BR>Folio:" + lFolio;
        //lblEtiqueta.Text += "<BR>Serie:" + lSerie;
        //lblEtiqueta.Text += "<BR>NumMoneda:" + lblMoneda.Text;
        //lblEtiqueta.Text += "<BR>TipoCambio:" + lblTipoCambio.Text;
        //lblEtiqueta.Text += "<BR>concepto:" + f_RellenaConBlancos("1", 31);
        //lblEtiqueta.Text += "<BR>Serie:" + f_RellenaConBlancos(lSerie, 12);
        //lblEtiqueta.Text += "<BR>fecha:" + f_RellenaConBlancos(lFecha, 24);
        //lblEtiqueta.Text += "<BR>CodigoCteProv:" + f_RellenaConBlancos(lblCodigoCliente.Text, 31);
        //lblEtiqueta.Text += "<BR>CodigoAgente:" + f_RellenaConBlancos(lblCodigoAgente.Text, 31);
        //lblEtiqueta.Text += "<BR>Referencia:" + f_RellenaConBlancos(Session["OrderNumber"].ToString(), 21);

        //tDocumento EncabezadoDocumento = new tDocumento();
        //EncabezadoDocumento.aFolio = lFolio;
        //EncabezadoDocumento.aSerie = lSerie;
        //EncabezadoDocumento.aNumMoneda = Int32.Parse(lblNumMoneda.Text);
        //EncabezadoDocumento.aTipoCambio = Double.Parse(lblTipoCambio.Text);
        //EncabezadoDocumento.aImporte = 0;
        //EncabezadoDocumento.aDescuentoDoc1 = 0;
        //EncabezadoDocumento.aDescuentoDoc2 = 0;
        //EncabezadoDocumento.aSistemaOrigen = 55; //SDK ISV //aSistemaOrigen
        //EncabezadoDocumento.aCodConcepto = f_RellenaConBlancos("1",31);
        //EncabezadoDocumento.aSerie = f_RellenaConBlancos(lSerie,12);
        //EncabezadoDocumento.aFecha = f_RellenaConBlancos(lFecha,24);
        //EncabezadoDocumento.aCodigoCteProv = f_RellenaConBlancos(lblCodigoCliente.Text,31);
        //EncabezadoDocumento.aCodigoAgente = f_RellenaConBlancos(lblCodigoAgente.Text,31);
        //EncabezadoDocumento.aReferencia = f_RellenaConBlancos(Session["OrderNumber"].ToString(),21);
        //EncabezadoDocumento.aAfecta = 0;

        ////nuevo.fInicializaSDKW();
        ////nuevo.fAbreEmpresaW(carpetaEmpresa); 

        prueba = nuevo.fBuscaConceptoDoctoW("1");  //MGW100006 Tabla de Conceptos de Documento
        if (prueba == 0)
        {
            NoItemsMessage.Text = "SE ENCONTRO CONCEPTO. ";
        }
        else
        {
            NoItemsMessage.Text = "NO SE ENCONTRO CONCEPTO. ";
        }

        prueba = nuevo.fAltaDocumentoW(ref gIdDocto, lFolio, lSerie, Int32.Parse(lblNumMoneda.Text), Double.Parse(lblTipoCambio.Text), 0, 0, 0, 55, lCodigoConcepto, lFecha, lblCodigoCliente.Text, lblCodigoAgente.Text, Session["OrderNumber"].ToString(), 0);
        //prueba = nuevo.fAltaDocumentoW(ref gIdDocto);

        //tMovimiento RegMovimiento = new tMovimiento();
        Boolean gPrimerMovto = true;
        int lConsecutivoMovto;

        if (prueba == 0) 
            {
            // se agregan movimientos de los productos

            DetalleCotizaVO VODetalleCotiza = new DetalleCotizaVO();
            DetalleCotizaBL BLDetalleCotiza = new DetalleCotizaBL();
            VODetalleCotiza.Operacion = DetalleCotizaVO.BUSCAR_DETALLES_COTIZACION;
            VODetalleCotiza = (DetalleCotizaVO)BLDetalleCotiza.execute(VODetalleCotiza);

            String[,] arregloDetalles;
            arregloDetalles = VODetalleCotiza.ArrDetalles;
            int lIdMovimiento =0;
            String lValorConsecutivo="0";

                for (int i = 0; i <= arregloDetalles.GetLength(1) - 1; i++)
                {
                    if(gPrimerMovto)
                        {
                        lConsecutivoMovto = 100;
                        }
                    else
                        {
                        nuevo.fPosUltimoMovimientoW();
                        nuevo.fLeeDatoMovimientoW("cNumeroM01", lValorConsecutivo, 10);
                        lConsecutivoMovto = 100 + Int32.Parse(lValorConsecutivo);
                        //lConsecutivoMovto += 100;
                        }
                    gPrimerMovto = false;

                    //RegMovimiento.aConsecutivo = lConsecutivoMovto;
                    //RegMovimiento.aUnidades = Double.Parse(arregloDetalles[3, i]);//' En caso de producto con series, lotes y/o pedimentos y carcateristicas este valor es cero
                    //RegMovimiento.aPrecio = Double.Parse(arregloDetalles[2, i]) * Double.Parse(arregloDetalles[5, i]); //' Usado para docuementos de venta
                    //RegMovimiento.aCosto = 0;       //' Usado para docuemtnos de compra y/o inventarios
                    //RegMovimiento.aCodProdSer = arregloDetalles[0, i];
                    //RegMovimiento.aCodAlmacen = "QGEN001"; // Pendiente
                    //RegMovimiento.aReferencia = f_RellenaConBlancos(Session["OrderNumber"].ToString(),21);
                    //RegMovimiento.aCodClasificacion = "" + ((char)0);  //' No tiene uso, valor omision en blancos

                    prueba2 = nuevo.fAltaMovimientoW(gIdDocto, ref lIdMovimiento, lConsecutivoMovto, Double.Parse(arregloDetalles[3, i]), (Double.Parse(arregloDetalles[2, i]) * Double.Parse(arregloDetalles[5, i])), 0, arregloDetalles[0, i], "QGEN001", Session["OrderNumber"].ToString(), "" + ((char)0));
                    if (prueba2 == 0)
                        {
                            ErrMessage.Text += "COTIZACION EN ADMIN PAQ EXITOSA";
                        }
                    else
                        {
                            NoItemsMessage.Visible = true;
                            NoItemsMessage.Text = nuevo.MensajeError(prueba2);
                            nuevo.f_TerminaW(2); // 0.- Se cancelan los cambios documento   
                        }
                }
            }
            else
            {
                NoItemsMessage.Visible = true;
                NoItemsMessage.Text += nuevo.MensajeError( prueba);
                nuevo.f_TerminaW(0); // 0.- Se cancelan los cambios documento   
            }


            nuevo.fCierraEmpresaW();
            nuevo.fTerminaSDKW();

  //      //lblComodin.Text = "HOLA";
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

    public String getDescuento(String strDescuento)
        {

            if (strDescuento.Length > 0)
            {
                if (Int32.Parse(strDescuento) > 0)
                {
                    blnBanderaCotizacionDescuento = true;
                }
            }

            return strDescuento;
        }

   
    protected void Button5_Click1(object sender, EventArgs e)
    {
        Response.Redirect("caidaCotizacion.aspx?cotizacionId=" + Request["cotizacionid"]);
        

    }

    public String f_RellenaConBlancos(String strCadena, int inTamano)
    {
        String strEspacions = new String(' ',inTamano);
        int Tamanio;

        Tamanio = inTamano - (strCadena.Trim().Length) - 1;
        //lTamanio = aTamanio - Len(Trim(strCadena)) - 1

        strCadena = strCadena.Trim() + strEspacions.Substring(0, Tamanio) + ((char)0);

        return strCadena;
    }
}
