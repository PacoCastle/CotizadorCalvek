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
using log4net;
///using saludos;
using InterfaceAdminPaqTableAdapters;
using cotizadorTableAdapters;
using System.Drawing;

public partial class Cotizador_Search : System.Web.UI.Page
{
    private int vistaMode = 0;
    private int contadorMsjActivos = 0;
    private int contadorMsjObsoleto = 0;

    private static int NUMFUNCION = 8;
    
    private static readonly ILog log = LogManager.GetLogger(typeof(Cotizador_Search));

    private buscaExistenciaProductoTableAdapter getExistencia = new buscaExistenciaProductoTableAdapter();
    private DataTable datos = null;

    //String agno = DateTime.Today.Year.ToString();
    //String mes = DateTime.Today.Month.ToString().PadLeft(2, '0');
    //String dia = DateTime.Today.Day.ToString().PadLeft(2, '0');
    Double existencia = new Double();
    //String carpetaEmpresa = "C:/CompacW/Empresas/CALVEK";
    //long prueba = 0;
    //saludo nuevo = new saludo();
    
    //Double dblDescuento = 0;
    int intEstatusCotizacion = 0;

    String[,] conversionMoneda;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        log.Info("Entrando en la busqueda de productos");
        String Criterion = Request.QueryString["Criterion"];
        String textoCat = Request.QueryString["textoCat"];
        Books.EmptyDataText = "No se encontro el registro.";

        String Category = Request.QueryString["Categoria"];
        Books.DataSourceID = ""; 
        Books.PagerSettings.Mode = PagerButtons.NextPreviousFirstLast;
        Books.AllowPaging = true;
        
        //-----------------------------

        if (Session["OrderNumber"] != null)
        {

            cotizacionVO VOcotizacion = new cotizacionVO();
            CotizacionBL BLcotizacion = new CotizacionBL();

            //ClienteVO VOcliente = new ClienteVO();
            //ClienteBL BLcliente = new ClienteBL();

            TipoCambioVO VOTipoCambio = new TipoCambioVO();
            TipoCambioBL BLTipoCambio = new TipoCambioBL();

            VOcotizacion.Operacion = cotizacionVO.BUSCAR;
            VOcotizacion.CotizacionId = Int32.Parse(Session["OrderNumber"].ToString());
            VOcotizacion = (cotizacionVO)BLcotizacion.execute(VOcotizacion);

            intEstatusCotizacion = VOcotizacion.EstatusCotizacionId;

            VOTipoCambio.MonedaId = VOcotizacion.TipoMoneda;
            VOTipoCambio.FechaTipoCambio = VOcotizacion.Fecha;
            VOTipoCambio.Operacion = TipoCambioVO.BUSCAR_TIPOS_CAMBIOS;
            VOTipoCambio = (TipoCambioVO)BLTipoCambio.execute(VOTipoCambio);

            conversionMoneda = VOTipoCambio.ArrCambios;

            lblTipoMoneda.Text = get_tipoMoneda(VOcotizacion.TipoMoneda);
                

            //for (int i =0; i<=conversionMoneda.GetLength(1)-1;i++)
            //{
            //    lblTipoMoneda.Text = lblTipoMoneda.Text + "<BR>" + conversionMoneda[0,i] +"-"+ conversionMoneda[1,i];
            //}

            if (!IsPostBack) {
                Session["vistaMode"] = 0;
            }
        }


        //-----------------------------

        Books.PageSize = 10;

        if (Category != null)
        {
            Type.Text = " Productos: " + textoCat;
            Books.DataSourceID = "ObjectDataSourceProd";
        }
        else if(Criterion != null)
        {
            Type.Text = "Resultados de la Busqueda: " + Criterion;
            Books.DataSourceID = "ObjectDataSourceProd2";
        }

        if (Session["OrderNumber"]==null)
        {
            lkbAltaProductoComodin.Visible = false;
            Books.Columns[3].Visible = false;
        }
       
    }

    public Double Get_Existencia(String ProdId,int intAlmacen)
    {

        if (ProdId != null)
        {
            //prueba = nuevo.fRegresaExistenciaW(ProdId, strAlmacen, agno, mes, dia, ref existencia);
            existencia = 0;
            datos = null;
            
            datos = getExistencia.GetData(ProdId,intAlmacen);
            if (datos.Rows.Count > 0)
            {
                existencia = Double.Parse(datos.Rows[0]["existencia"].ToString());
            }

            ////nuevo.cerrar();
        }

        return existencia;
        //return 0;
    }

    public String Get_Sale_Price(Double Sale,int intMoneda)
    {
        Double valorCambio=1;
        if( Sale != 0)
        {
            if (conversionMoneda != null)
            {
                for (int i = 0; i <= conversionMoneda.GetLength(1) - 1; i++)
                {
                    if (Int32.Parse(conversionMoneda[0, i]) == intMoneda)
                    {
                        valorCambio = Double.Parse(conversionMoneda[1, i]);
                    }
                }
            }
                Sale = Sale * valorCambio;
        }
        return String.Format("{0:N}", Sale);
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
                return intMoneda.ToString();
        }
    }

    public void View_Details(Object Src, CommandEventArgs As)
    {
        Response.Redirect("Details.aspx?" + As.CommandName);
    }

    //public String Get_prefijo(int intMoneda)
    //{
    //    conversionMoneda
    //}

    protected void Books_RowCreated(object sender, GridViewRowEventArgs e)
    {
        

        if (e.Row.RowType == DataControlRowType.Header)
        {
            
            if (vistaMode == 0)
            {
                /*
                e.Row.Cells[6].Text = "DISPONIBILIDAD:" + "<br>" + "<br>" + "Inmediata" + "<br>";
                
                e.Row.Cells[10].Visible = false;
                e.Row.Cells[11].Visible = false;
                e.Row.Cells[12].Visible = false;
                e.Row.Cells[13].Visible = false;
                e.Row.Cells[14].Visible = false;
                e.Row.Cells[15].Visible = false;
                e.Row.Cells[16].Visible = false;
                e.Row.Cells[17].Visible = false;
                */
            }
            else if (vistaMode == 1)
            {
                /*
                e.Row.Cells[6].Visible = false;
                e.Row.Cells[7].Visible = false;
                e.Row.Cells[8].Visible = false;
                e.Row.Cells[9].Visible = false;

                e.Row.Cells[10].Visible = true;
                e.Row.Cells[11].Visible = true;
                e.Row.Cells[12].Visible = true;
                e.Row.Cells[13].Visible = true;
                e.Row.Cells[14].Visible = true;
                e.Row.Cells[15].Visible = true;
                e.Row.Cells[16].Visible = true;
                e.Row.Cells[17].Visible = true;
                */
            }
           
            //DataKey data = Books.DataKeys[Convert.ToInt32(e.Row.RowIndex)];
            //if (Convert.ToInt16(data["QROBJ"].ToString()) == 0)
            //{
            //    e.Row.Cells[21].Visible = false;
            //}

            //nuevo.fInicializaSDKW();
            //try {
            //    lblError.Visible = false;
            //    nuevo.fAbreEmpresaW(carpetaEmpresa);
            //    }
            //catch (System.ApplicationException ex)
            //    {
            //    lblError.Visible = true;
            //    lblError.Text = ex.Message;
            //    nuevo.fCierraEmpresaW();
            //    nuevo.fTerminaSDKW();
            //    nuevo.fAbreEmpresaW(carpetaEmpresa);
            //    }
        }
    
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /*e.Row.Cells[22].Visible = false;*/

            if (vistaMode == 0)
            {   /*
                e.Row.Cells[10].Visible = false;
                e.Row.Cells[11].Visible = false;
                e.Row.Cells[12].Visible = false;
                e.Row.Cells[13].Visible = false;
                e.Row.Cells[14].Visible = false;
                e.Row.Cells[15].Visible = false;
                e.Row.Cells[16].Visible = false;
                e.Row.Cells[17].Visible = false;
                */
            }
            else if (vistaMode == 1)
            {
                /*
                e.Row.Cells[6].Visible = false;
                e.Row.Cells[7].Visible = false;
                e.Row.Cells[8].Visible = false;
                e.Row.Cells[9].Visible = false;

                e.Row.Cells[10].Visible = true;
                e.Row.Cells[11].Visible = true;
                e.Row.Cells[12].Visible = true;
                e.Row.Cells[13].Visible = true;
                e.Row.Cells[14].Visible = true;
                e.Row.Cells[15].Visible = true;
                e.Row.Cells[16].Visible = true;
                e.Row.Cells[17].Visible = true;
                */
            }
            /*
            DataKey data = Books.DataKeys[Convert.ToInt32(e.Row.RowIndex)];
            if (Convert.ToInt16(data["m_Slp"].ToString()) > 0
                || Convert.ToInt16(data["m_SlpII"].ToString()) > 0
                || Convert.ToInt16(data["m_Qro"].ToString()) > 0
                || Convert.ToInt16(data["m_QroBj"].ToString()) > 0
                || Convert.ToInt16(data["m_Cly"].ToString()) > 0
                || Convert.ToInt16(data["m_ClyBj"].ToString()) > 0
                || Convert.ToInt16(data["m_Ira"].ToString()) > 0
                || Convert.ToInt16(data["m_IraBj"].ToString()) > 0
                )
                e.Row.Cells[22].Visible = true;
            */
            //valida obsoletos
            /*
            String productoBuscar = "";
            DataRowView oDataRowView = (DataRowView)e.Row.DataItem;
            if (oDataRowView != null)
            {
                productoBuscar = oDataRowView.Row["modelo"].ToString();
                String mensajeObsoleto = "";
                String validaobsoleto = "";
                String actMensaje = "";
                String Mensaje = "";

                get_buscaObsoletosTableAdapter getObsoletos = new get_buscaObsoletosTableAdapter();
                getObsoletos.GetData(productoBuscar, ref mensajeObsoleto, ref validaobsoleto);

                if (validaobsoleto == "S")
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Obsoleto" + contadorMsjObsoleto.ToString() + "", "alert('" + mensajeObsoleto.ToString() + "');", true);
                    contadorMsjObsoleto++;
                }
                //Activar mensaje en la busqueda de productos EJF
                get_buscaMensaje_ProductosTableAdapter get_buscaMensaje_Producto = new get_buscaMensaje_ProductosTableAdapter();
                get_buscaMensaje_Producto.GetData(productoBuscar, ref Mensaje, ref actMensaje);

                if (actMensaje == "1")
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "MensajeProd"+contadorMsjActivos.ToString()+"", "alert('El producto " + productoBuscar.ToString() + " " + Mensaje.ToString() + "');", true);
                    contadorMsjActivos++;
                    //cambiar color
                    e.Row.BackColor = Color.FromName("LightSkyBlue");
                }

            }
            */
            if (Session["OrderNumber"] == null || intEstatusCotizacion >= 2)
                {
                    /*
                    LinkButton lnkVerDetalle = (LinkButton)e.Row.FindControl("LinkButton1");
                    lnkVerDetalle.Visible = false;
                    */

                    LinkButton lnkAgregaProducto = (LinkButton)e.Row.FindControl("lnkAgregaProducto");
                    lnkAgregaProducto.Visible = false;
                    
                }
                lkbAltaProductoComodin.Visible = false;

            //if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "haySustituto")) > 0)
            //{
            //    LinkButton lnkbSustituto = (LinkButton)e.Row.FindControl("lnkbSustituto");
            //    lnkbSustituto.Visible = true;
            //}

            if (Session["OrderNumber"] != null) {
                DataKey data = Books.DataKeys[Convert.ToInt32(e.Row.RowIndex)];
                
                if (Convert.ToDecimal(data["Precio"].ToString()) <= 0)
                {
                    LinkButton lnkAgregaProducto = (LinkButton)e.Row.FindControl("lnkAgregaProducto");
                    lnkAgregaProducto.Visible = false;
                }
                
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            //nuevo.fCierraEmpresaW();
            //nuevo.fTerminaSDKW();
        }
    }

    protected void lkbAltaProductoComodin_Click(object sender, EventArgs e)
    {
        if (Session["OrderNumber"] != null)
        {
            Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + Session["OrderNumber"] + "&productoComodin=1");
        }
        else
        {
            lblError.Text = "DEBES TENER UNA COTIZACION ACTIVA.";
            lkbAltaProductoComodin.Visible = false;
        }
    }

    public void add_product(Object Src, CommandEventArgs As)
    {
        DetalleCotizaVO VO = new DetalleCotizaVO();
        DetalleCotizaBL BL = new DetalleCotizaBL();

        VO.ProductoRef = As.CommandName.ToString().Split('|')[0];
        VO.CotizacionId = Int32.Parse(Session["OrderNumber"].ToString());
        VO.ProductoDesc = As.CommandName.ToString().Split('|')[2] + " - " + As.CommandArgument.ToString().Split('|')[0];
        VO.ProductoPrecio = Double.Parse(As.CommandName.ToString().Split('|')[3]);
        VO.Cantidad = 1;
        VO.TiempoEntrega = 0;
        VO.UnidadMedida = Int32.Parse(As.CommandArgument.ToString().Split('|')[1]);
        VO.TipoMoneda = Int32.Parse(As.CommandArgument.ToString().Split('|')[2]);
        VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());
        VO.ProductoComodin = 0;
        VO.AplicaRango = Int32.Parse(As.CommandName.ToString().Split('|')[4]); ;
        //VO.Descuento = Double.Parse(As.CommandArgument.ToString().Split('|')[3]);
        VO.Operacion = DetalleCotizaVO.INSERTAR;
        VO = (DetalleCotizaVO)BL.execute(VO);

        if (VO.Resultado == 0)
        {
            Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + Session["OrderNumber"]);
        }
        else
        {
            lblError.Text = VO.MensajeError;
        }

    }

  
   
    protected void lnkDisponibles_Click(object sender, EventArgs e)
    {
        vistaMode = 0;
    }

    protected void lnkDetalles_Click(object sender, EventArgs e)
    {
        vistaMode = 1;
    }
}
