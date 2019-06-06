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
using System.Data.OleDb;
using System.Drawing;
//using log4net;
using InterfaceAdminPaqTableAdapters;
//using saludos;
using System.Text;

public partial class Cotizador_Details : System.Web.UI.Page
{

    private buscaExistenciaProductoTableAdapter getExistencia = new buscaExistenciaProductoTableAdapter();

    private static int NUMFUNCION = 8;

   // private static readonly ILog log = LogManager.GetLogger(typeof(Cotizador_Details));
    //Double dblDescuento = 0;
    String[,] conversionMoneda;

    protected void Page_Load(object sender, EventArgs e)
    {

        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //ClienteVO VOcliente = new ClienteVO();
        //ClienteBL BLcliente = new ClienteBL();

        //VOcliente.Cliente_codigo = VOcotizacion.CodigoCliente;
        //VOcliente.Operacion = ClienteVO.BUSCAR_ADMIN_CODIGO;
        //VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        //if (VOcliente.Cliente_rfc != null)
        //{
        //    dblDescuento = VOcliente.Cliente_descuento;
        //}

        // ---------------------
        if (Session["OrderNumber"] != null)
        {
            cotizacionVO VOcotizacion = new cotizacionVO();
            CotizacionBL BLcotizacion = new CotizacionBL();

            VOcotizacion.Operacion = cotizacionVO.BUSCAR;
            VOcotizacion.CotizacionId = Int32.Parse(Session["OrderNumber"].ToString());
            VOcotizacion = (cotizacionVO)BLcotizacion.execute(VOcotizacion);

            TipoCambioVO VOTipoCambio = new TipoCambioVO();
            TipoCambioBL BLTipoCambio = new TipoCambioBL();

            VOTipoCambio.MonedaId = VOcotizacion.TipoMoneda;
            VOTipoCambio.FechaTipoCambio = VOcotizacion.Fecha;
            VOTipoCambio.Operacion = TipoCambioVO.BUSCAR_TIPOS_CAMBIOS;
            VOTipoCambio = (TipoCambioVO)BLTipoCambio.execute(VOTipoCambio);

            conversionMoneda = VOTipoCambio.ArrCambios;

            //Label FVlblTipoMoneda = (Label)FormViewDisplay.FindControl("lblTipoMoneda");
            //FVlblTipoMoneda.Text = get_tipoMoneda(VOcotizacion.TipoMoneda);

        }

        // ---------------------

        if (!IsPostBack)
        {

//        String prodId = Request.QueryString["Modelo"];
//        DataTable datos = null;
//        //String agno = DateTime.Today.Year.ToString();
//        //String mes = DateTime.Today.Month.ToString().PadLeft(2, '0');
//        //String dia = DateTime.Today.Day.ToString().PadLeft(2, '0');
//        //Double existencia = new Double();
//        //String carpetaEmpresa = "C:/Compacw/Empresas/CALVEK";
//        StringBuilder salida = new StringBuilder();
//        if(prodId != null)
//        {
//            listaAlmacenTableAdapter tabla = new listaAlmacenTableAdapter();
//            datos = tabla.GetData();
//            ArrayList listaNueva = new ArrayList();
//            int index = 0;
////            long prueba = 0;

//            //saludo nuevo = new saludo();
//            //nuevo.fInicializaSDKW();
//            //nuevo.fAbreEmpresaW(carpetaEmpresa);
            
//            salida.Append("<table cellspacing='0' cellpadding='5' rules='all' border='1' style='border-collapse:collapse;margin-top:10px>");
//            salida.Append("<tr style='color:White;background-color:#990000;'>");
//            salida.Append("<td>");
//            salida.Append("Codigo Almacen.");
//            salida.Append("</td>");
//            salida.Append("<td>");
//            salida.Append("Almacen.");
//            salida.Append("</td>");
//            salida.Append("<td>");
//            salida.Append("Existencias.");
//            salida.Append("</td>");
//            salida.Append("</tr>");
//            while (index < datos.Rows.Count)
//            {
//                salida.Append("<tr>");
//                salida.Append("<td>");
//                salida.Append(datos.Rows[index]["CCODIGOA01"].ToString());
//                salida.Append("</td>");
//                salida.Append("<td>");
//                salida.Append(datos.Rows[index]["CNOMBREA01"].ToString());
//                salida.Append("</td>");
//                salida.Append("<td>");
//                //prueba = nuevo.fRegresaExistenciaW(prodId, datos.Rows[index]["CCODIGOA01"].ToString(), agno, mes, dia, ref existencia);
//                //salida.Append(existencia);

//                salida.Append(Get_Existencia(prodId, Int32.Parse(datos.Rows[index]["CIDALMACEN"].ToString().Trim())));
//                salida.Append("</td>");
//                index++;
//                salida.Append("</tr>");
//            }
//            salida.Append("</table>");
            
//            //nuevo.fCierraEmpresaW();
//            //nuevo.fTerminaSDKW();
//            tablaExistencia.Text = salida.ToString();
//        }

        }
    }

    public Double Get_Existencia(String ProdId, int intAlmacen)
    {
        DataTable datos2 = null;
        Double existencia = new Double();
        if (ProdId != null)
        {
            //prueba = nuevo.fRegresaExistenciaW(ProdId, strAlmacen, agno, mes, dia, ref existencia);
            existencia = 0;

            datos2 = getExistencia.GetData(ProdId, intAlmacen);
            if (datos2.Rows.Count > 0)
            {
                existencia = Double.Parse(datos2.Rows[0]["existencia"].ToString());
            }

            ////nuevo.cerrar();
        }

        return existencia;
        //return 0;
    }

    //public String Get_Sale_Price(Double Price, Double Sale)
    //{
    //    if (Sale != 0)
    //    {
    //        //Price = Price * Double.Parse(Application["Discount"].ToString());
    //        if (dblDescuento > 0)
    //        {
    //            Double calculoDescuento = dblDescuento / 100;
    //            Price = Price - (calculoDescuento * Price);
    //        }
    //    }
    //    //return String.Format("Precio Especial: {0:N}", Price);
    //    return String.Format("{0:N}", Price);
    //}

    public String Get_Sale_Price(Double Sale, int intMoneda)
    {
        Double valorCambio = 1;
        if (Sale != 0)
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
        return String.Format("{0:#,0.00##}", Sale);
    }

    public void Add_To_Cart(Object Src, EventArgs Args)
    {
        Label FVBookID = (Label)FormViewDisplay.FindControl("BookID");
        Label FVBookTitle = (Label)FormViewDisplay.FindControl("BookTitle");
        
        //Decimal BookPrice = Decimal.Parse(FVBookPrice.Text.Replace("$",""));
        //Label FVBookSalePrice = (Label)FormViewDisplay.FindControl("BookSalePrice");
        Label FVBookSalePrice = (Label)FormViewDisplay.FindControl("lblPrecio");

        Label FVBookAuthor = (Label)FormViewDisplay.FindControl("BookAuthor");

        Decimal BookPrice;
        TextBox FVCantidad = (TextBox)FormViewDisplay.FindControl("txtCantidad");
        TextBox FVTiempoEntrega = (TextBox)FormViewDisplay.FindControl("txtTiempoEntrega");
        Label FVDescuento = (Label)FormViewDisplay.FindControl("lblDescuento");

        if (FVBookSalePrice.Text != "")
        {
            //BookPrice = Decimal.Parse(FVBookSalePrice.Text.Replace("Special Price: $", ""));
            BookPrice = Decimal.Parse(FVBookSalePrice.Text);
        }

        //DropDownList FVunidadMedida = (DropDownList)FormViewDisplay.FindControl("lstUnidadMedida");
        Label FVTipoMoneda = (Label)FormViewDisplay.FindControl("lblMoneda");
        

        DetalleCotizaVO VO = new DetalleCotizaVO();
        DetalleCotizaBL BL = new DetalleCotizaBL();

        //log.Info("numero de sesion = " + Session["OrderNumber"].ToString());

        VO.ProductoRef = FVBookID.Text;
        VO.CotizacionId = Int32.Parse(Session["OrderNumber"].ToString());
        VO.ProductoDesc = FVBookTitle.Text + " - " + FVBookAuthor.Text;
        //VO.productoPrecio = FVBookPrice.Text;
        VO.ProductoPrecio = Double.Parse(FVBookSalePrice.Text);
        VO.Cantidad = Int32.Parse(FVCantidad.Text);
        VO.TiempoEntrega = Int32.Parse(FVTiempoEntrega.Text);
        VO.UnidadMedida = Int32.Parse(((DropDownList)FormViewDisplay.FindControl("lstUnidadMedida")).SelectedValue);
        VO.TipoMoneda = Int32.Parse(FVTipoMoneda.Text);
        VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());
        VO.ProductoComodin = 0;
        VO.Descuento = Double.Parse(FVDescuento.Text);
        VO.Operacion = DetalleCotizaVO.INSERTAR;
        VO = (DetalleCotizaVO)BL.execute(VO);

            Button botonTemp = (Button)Src;
        if(VO.Resultado == 0)
        {
            botonTemp.Text = "Producto Añadido";
            botonTemp.ForeColor = Color.FromName("#00C000");
            botonTemp.BackColor = Color.FromName("#E0E0E0");
            botonTemp.Font.Bold = true;
            Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + Session["OrderNumber"]);
        }
        else
        {
            botonTemp.Text = VO.MensajeError;
            botonTemp.ForeColor = Color.FromName("#990000");
            botonTemp.BackColor = Color.FromName("#E0E0E0");
            botonTemp.Font.Bold = true;
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

    public String get_tipoUnidad(int intTipoUnidad)
    {
        switch (intTipoUnidad)
        {
            case 1:
                return "Pza";
            case 2:
                return "Mts";
            default:
                return "";
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        gvReservados.Visible = true;
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
       if (e.Row.RowType == DataControlRowType.DataRow)
       {
           
       }
    }

}

