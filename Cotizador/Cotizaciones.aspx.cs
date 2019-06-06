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


public partial class Cotizador_Cotizaciones_Cotizaciones : System.Web.UI.Page
{
    private static int NUMFUNCION = 8;
    Boolean blnBanderaAceptaCotizacionDescuento=false;
    Boolean blnBanderaIncPrecio = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        GridView1.EmptyDataText = "No se encontro el registro.";
        GridView1.AllowPaging = true;
        GridView1.PageSize = 10;
        Button1.Attributes["OnClick"] = "new_window('creaCotizacion.aspx');return false;";

        InfoSessionVO infoSession;
        infoSession = (InfoSessionVO)Session["InfoSession"];

        if(Session["usuarioIDCotizacion"]==null)
            {
            lblUsuarioId.Text = (infoSession.getValor(InfoSessionVO.USUARIOID)).ToString();
            }
        else
            {
            lblUsuarioId.Text = Session["usuarioIDCotizacion"].ToString();
            }

        // Ddeterminar si el usuario tiene los permisos para aceptar una cotizacion con descuento.
        String error2 = Utilis.validaPermisos(Session, 15);
        if (error2.Equals(""))
        {
            blnBanderaAceptaCotizacionDescuento = true;
        }

        // Ddeterminar si el usuario tiene los permisos para aceptar un incremento de precio.
        String error3 = Utilis.validaPermisos(Session, 17);
        if (error3.Equals(""))
        {
            blnBanderaIncPrecio= true;
        }


    }

    protected void busqueda_Click(object sender, EventArgs e)
    {
        //falta recuperar la fecha
        /*String fecha = Calendar1.SelectedDate.Year.ToString();
        fecha += Calendar1.SelectedDate.Month.ToString();
        fecha += Calendar1.SelectedDate.Day.ToString();
        ObjectDataSource3.SelectParameters["fecha"].DefaultValue = fecha;

        ObjectDataSource3.DataBind();
        ObjectDataSource3.Select();

        GridView1.EmptyDataText = "No se encontro el registro.";
        GridView1.DataSourceID = "ObjectDataSource3";*/
    }

    protected void cotizadorGrid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (!blnBanderaAceptaCotizacionDescuento)
            {
                LinkButton btnAceptaDescuento = (LinkButton)e.Row.FindControl("lnkAceptaDescuento");
                btnAceptaDescuento.Visible = false;
            }
            if (!blnBanderaIncPrecio)
            {
                LinkButton btnAceptaIncPrecio = (LinkButton)e.Row.FindControl("lnkAceptaIncPrecio");
                btnAceptaIncPrecio.Visible = false;
            }
        }
    }

    protected void lnkAceptaDescuento_Click(object sender, CommandEventArgs As)
    {        
        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();
        VO.Operacion = cotizacionVO.ACTUALIZARBANDESC;
        VO.CotizacionId = Int32.Parse(As.CommandName);
        VO.BanderaDescuento = 1;
        //VO.FechaVencimiento = DateTime.Now.ToString("d");
	    //VO.Fecha = DateTime.Now;
        //VO.DesctoGral=0;
        VO = (cotizacionVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            //return true;
        }
        else
        {
            //return false;
        }

        ObjectDataSource1.DataBind();
        ObjectDataSource1.Select();
        GridView1.DataBind();
    }

    protected void cancelaCotizacion_Click(object sender, CommandEventArgs As)
    {        
        
        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();
        VO.Operacion = cotizacionVO.ACTUALIZAR;
        VO.CotizacionId = Int32.Parse(As.CommandName);
        VO.EstatusCotizacionId = 4;
        VO.Activo = 0;
        VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());
        VO.FechaVencimiento = DateTime.Now.ToString("d");
        VO.FechaCaida = DateTime.Now.ToString("d");
        VO.Fecha = DateTime.Now;
        VO.DesctoGral = 1;
        VO.CondicionesPago = "";
        VO.Notas = "";
        VO = (cotizacionVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            //return true;
        }
        else
        {
            //return false;
        }

        GridView1.DataBind();
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        // Wire up the event (MoodChanged) to the event handler (MoodChangedFromMasterPage)
        //((Cotizador_Cotizador)Master).AgentesChanged += new CommandEventHandler(AgentesChangedFromMasterPage);

    }

    private void AgentesChangedFromMasterPage(object sender, CommandEventArgs e)
    {
        string AgenteText = e.CommandName;
        string AgenteValue = e.CommandArgument.ToString();

        lblUsuarioId.Text=AgenteValue;
        GridView1.DataBind();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "odsListaCotizacionBusqueda";
    }


   
    protected void btnDuplicar_Command(object sender, CommandEventArgs As)
    {
        int usuarioIDCotizacion = 0;
        int usuarioID = 0;
        int cotizaciondup = 0;
        //String mensajeOk = "<script>javascript:alert('Cotizacion creada exitosamente');</script> ";
        //String mensajeFail = "<script>javascript:alert('La Cotizacion no se creo');</script> ";
        usuarioIDCotizacion = Int32.Parse(Session["usuarioIDCotizacion"].ToString());
        usuarioID = Int32.Parse(Session["usuarioID"].ToString());
        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();
        VO.Operacion = cotizacionVO.BUSCAR;
        VO.CotizacionId = Int32.Parse(As.CommandName);
        VO = (cotizacionVO)BL.execute(VO);
        cotizacionVO VOdup = new cotizacionVO();
        CotizacionBL BLdup = new CotizacionBL();

        VOdup.CotizacionId = 0;
        
        VOdup.Fecha = Convert.ToDateTime(hdnCotizadorDate.Value);  //DateTime.Now;
                   
        VOdup.UsuarioId = usuarioIDCotizacion;
        VOdup.Activo = 1;
        VOdup.PreAprovado = 0;
        VOdup.EstatusCotizacionId = 0;
        VOdup.CodigoCliente = VO.CodigoCliente;
        VOdup.TipoMoneda = VO.TipoMoneda;
        VOdup.TipoDocumento = VO.TipoDocumento;
        VOdup.Documento = VO.Documento;
        VOdup.UsuarioIdInserto = usuarioID;
        VOdup.CondicionesPago = VO.CondicionesPago;
        VOdup.UnidadNegocio = VO.UnidadNegocio;
        VOdup.LAB = VO.LAB;
        VOdup.RepresentanteLegal = VO.RepresentanteLegal;
        //VOdup.DesctoGral = 0;
        VOdup.LAB = VO.LAB;
        VOdup.BanderaDescuento = 0;
        if ((VO.DesctoGral >= 1) && (VO.DesctoGral <= 15))
        {
            VOdup.DesctoGral = VO.DesctoGral;
        }
        else
        {
            VOdup.DesctoGral = 0;
        }
        VOdup.Notas = VO.Notas;
        VOdup.Operacion = cotizacionVO.INSERTARCP;
        VOdup = (cotizacionVO)BL.execute(VOdup);
        cotizaciondup = Int32.Parse(VOdup.CotizacionId.ToString());
        set_detalleCotizacionDuplicadoTableAdapter setdupCotizacion = new set_detalleCotizacionDuplicadoTableAdapter();
        setdupCotizacion.GetData(Int32.Parse(As.CommandName), cotizaciondup);
        if (VOdup.Resultado == 0)
        {
            //Controls.Add(new LiteralControl(mensajeOk));
            //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Your Message');", true);
            //ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Hello');</script>");
            //Response.Write(@"<script language='javascript'>alert('The following errors have occurred: \n.');</script>");
        }
        else
        {
            //Controls.Add(new LiteralControl(mensajeFail));
        }
        //insertaCotizacion(VO.CodigoCliente, 0, intTipoCambio, VO.TipoDocumento, VO.Documento);

        GridView1.DataBind();
    }


    protected void lnkAceptaIncPrecio_Click(object sender, CommandEventArgs As)
    {
        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();
        VO.Operacion = cotizacionVO.ACTUALIZARBANINCPREC;
        VO.CotizacionId = Int32.Parse(As.CommandName);
        VO.BanderaIncPrecio = 1;
        //VO.FechaVencimiento = DateTime.Now.ToString("d");
        //VO.Fecha = DateTime.Now;
        //VO.DesctoGral=0;
        VO = (cotizacionVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            //return true;
        }
        else
        {
            //return false;
        }

        ObjectDataSource1.DataBind();
        ObjectDataSource1.Select();
        GridView1.DataBind();

    }
}
