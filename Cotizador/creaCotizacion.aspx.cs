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
using System.IO;


public partial class Cotizador_creaCotizacion : System.Web.UI.Page
{
    private static int NUMFUNCION = 8;
    //int intConteo=0;
    //Boolean blnClienteComodin = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
        //Button2.Attributes.Add("onclick", "javascript:document.form1.btnTraeFecha.style.display='none';");
        //btnTFecha.Attributes.Add("onclick", "javascript:muestraCalendario();");
        
        //if (txtRazon.Text.Length != 0)
        //    {
        //    String strTemp = txtRazon.Text;
        //    txtRazon.Text = strTemp.Replace("%","");
        //    }
        //if (txtRFC.Text.Length != 0)
        //    {
        //    String strTemp = txtRFC.Text;
        //    txtRFC.Text = strTemp.Replace("%", "");
        //    }
        
        //hdCodigoUsuarioAdmin.Text = (String)((Int32.Parse((String)Session["Usuario_codigoUsuarioAdmin"])).ToString());

        btnContinuar.Visible = false;
        btnHabilitaNuevo.Visible = false;
        //btnClienteComodin.Visible = false;

        lblMoneda.Visible = false;
        lblTipoDocumento.Visible = false;
        lblDocumento.Visible = false;
        //lblFecha.Visible = false;
        //lblArchivo.Visible = false;

        lstTipoCambio.Visible = false;
        txtDocumento.Visible = false;
        lstTipoDocumento.Visible = false;
        lstUnidadNegocio.Visible = false;
        lblunidadnegocio.Visible = false;
        //txtFechaDocumento.Visible = false;
        //fplArchivo.Visible = false;
        //btnSubir.Visible = false;
        

        if(IsPostBack)
            {
                //if (txtRazon.Text.Length != 0)
                //    txtRazon.Text = txtRazon.Text.Replace("%", "");
                //if (txtRFC.Text.Length != 0)
                //    txtRFC.Text = txtRFC.Text.Replace("%", "");
            }

    }


    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        if (SuppliersSelectedIndex < 0)
            {
            //lblMensaje.Text = "TIENE QUE SELECCIONAR A UN CLIENTE";
            //lblMensaje.Visible = true;
            //btnContinuar.Visible = false;
            }
        else
            {

            String strCodigoCliente = (String)GridView1.DataKeys[SuppliersSelectedIndex].Value;
            //Random roller = new Random();
            //Session["OrderNumber"] = (1 + roller.Next() % 9999999);

            int intTipoCambio = Int32.Parse(lstTipoCambio.SelectedValue);

            int intTipoDocumento = Int32.Parse(lstTipoDocumento.SelectedValue);

            string unidad_negocio = lstUnidadNegocio.SelectedValue;

            insertaCotizacion(strCodigoCliente, 0, intTipoCambio, intTipoDocumento, txtDocumento.Text, unidad_negocio);

            }
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //btnHabilitaNuevo.Visible = false;
            btnContinuar.Visible = true;

            lblMoneda.Visible = true;
            lblTipoDocumento.Visible = true;
            lblDocumento.Visible = true;
            //lblFecha.Visible = true;
            //lblArchivo.Visible = true;

            lstTipoCambio.Visible = true;
            txtDocumento.Visible = true;
            lstTipoDocumento.Visible = true;
            lstUnidadNegocio.Visible = true;
            lblunidadnegocio.Visible = true;
            //txtFechaDocumento.Visible = true;
            //fplArchivo.Visible = true;
            //btnSubir.Visible = true;

            //btnTraeFecha.Enabled = true;
            // Controls.Add(new LiteralControl("<script>document.form1.btnTraeFecha.disabled=false;</script> "));

            //if (txtRazon.Text.Length != 0)
            //    txtRazon.Text = txtRazon.Text.Replace("%", "");
            //if (txtRFC.Text.Length != 0)
            //    txtRFC.Text = txtRFC.Text.Replace("%", "");

            // Grab a reference to the Literal control
            Literal output = (Literal)e.Row.FindControl("RadioButtonMarkup");

            // Output the markup except for the "checked" attribute
            
            output.Text = string.Format(@"<input type=""radio"" name=""rdoSeleccion"" id=""RowSelector{0}"" value=""{0}""", e.Row.RowIndex);
            
            // OPTIONAL: If you want to have the first radio button selected on the first
            // page load, use the following if statement instead of the one below
            //if (SuppliersSelectedIndex == e.Row.RowIndex || (!Page.IsPostBack && e.Row.RowIndex == 0))

            // See if we need to add the "checked" attribute
            if (SuppliersSelectedIndex == e.Row.RowIndex)
                output.Text += @" checked=""checked""";

            // Add the closing tag
            output.Text += " />";
            //intConteo = e.Row.RowIndex;
        }
    }

    private int SuppliersSelectedIndex
    {
        get
        {
            if (string.IsNullOrEmpty(Request.Form["rdoSeleccion"]))
                return -1;
            else
                return Convert.ToInt32(Request.Form["rdoSeleccion"]);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    //if (txtRazon.Text.Length != 0)
    //    txtRazon.Text = "%" + txtRazon.Text.ToUpper() + "%";
    //if (txtRFC.Text.Length != 0)
    //    txtRFC.Text = "%" + txtRFC.Text.ToUpper() + "%";

        //btnContinuar.Visible = true;
        GridView1.Visible = true;
        //btnHabilitaNuevo.Visible = true;
        //btnClienteComodin.Visible = true;

        lblMoneda.Visible = true;
        lblTipoDocumento.Visible = true;
        lblDocumento.Visible = true;
        //lblFecha.Visible = true;
        //lblArchivo.Visible = true;

        lstTipoCambio.Visible = true;
        txtDocumento.Visible = true;
        lstTipoDocumento.Visible = true;
        lstUnidadNegocio.Visible = true;
        lblunidadnegocio.Visible = true;
        //txtFechaDocumento.Visible = true;
        //fplArchivo.Visible = true;
        //btnSubir.Visible = true;

        //btnTraeFecha.Enabled = true;
        //Controls.Add(new LiteralControl("<script>document.form1.btnTraeFecha.style.display='block';</script> "));


    }

    protected void btnHabilitaNuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Catalogos/Clientes/AltaClienteCotizador.aspx?ltsTipoCambio=" + lstTipoCambio.SelectedValue + "&ltsTipoDocumento=" + lstTipoDocumento.SelectedValue + "&Documento=" + txtDocumento.Text);
    }

    public void Get_Rows(Object Src, SqlDataSourceStatusEventArgs Args)
    {
        if (Args.AffectedRows == 0)
        {
            //NoItemsMessage.Visible = true;
            btnHabilitaNuevo.Visible = true;

            lblMoneda.Visible = false;
            lblTipoDocumento.Visible = false;
            lblDocumento.Enabled = false;
            //lblFecha.Visible = false;
            //lblArchivo.Visible = true;

            lstTipoCambio.Visible = false;
            txtDocumento.Visible = false;
            lstTipoDocumento.Visible = false;
            lblunidadnegocio.Visible = false;
            //txtFechaDocumento.Visible = false;
            //fplArchivo.Visible = true;
            //btnSubir.Visible = true;

            //btnTraeFecha.Enabled = false;
            //Controls.Add(new LiteralControl("<script>document.form1.btnTraeFecha.style.display='none';</script> "));
        }
    }

    protected void insertaCotizacion(String strCodigoCliente, int intClienteNuevo, int tipoCambio, int tipoDocumento, String strDocumento, String unidadnegocio)
    {
        String mensajeOk = "<script>javascript:alert('Cotizacion creada exitosamente');window.opener.location.reload();window.close();</script> ";
        String mensajeFail = "<script>javascript:alert('La Cotizacion no se creo');</script> ";
        int usuarioIDCotizacion = 0;
        int usuarioID = 0;
        usuarioIDCotizacion = Int32.Parse(Session["usuarioIDCotizacion"].ToString());
        usuarioID = Int32.Parse(Session["usuarioID"].ToString());
        cotizacionVO VO = new cotizacionVO();
        CotizacionBL BL = new CotizacionBL();

        VO.CotizacionId = 0;
        //VO.Fecha = DateTime.Now;
        //VO.Fecha = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);
        VO.Fecha = Convert.ToDateTime(hdnDate.Value);
        VO.UsuarioId = usuarioIDCotizacion;
        VO.Activo = 1;
        VO.PreAprovado = 0;
        VO.EstatusCotizacionId = 0;
        VO.CodigoCliente = strCodigoCliente;
        VO.ClienteIdNuevo = intClienteNuevo;
        VO.TipoMoneda = tipoCambio;
        VO.TipoDocumento = tipoDocumento;
        VO.Documento = strDocumento;
        VO.UsuarioIdInserto = usuarioID;
        VO.UnidadNegocio = unidadnegocio;
        VO.Operacion = cotizacionVO.INSERTAR;
        VO = (cotizacionVO)BL.execute(VO);
        Session["OrderNumber"] = VO.CotizacionId;
        if (Session["OrderNumber"] != null)
        {
            //Panel2.Visible = false;
            //Panel1.Visible = false;
            //lblMensaje.Visible = true;
            //lblMensaje.Text = "Los datos se insertaron correctamente.";
            Controls.Add(new LiteralControl(mensajeOk));
            //ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucess(''," + (int)EnumMessage.Message.ShowAlertCotizadorSucess + ");", true);


        }
        else
        {
            Controls.Add(new LiteralControl(mensajeFail));
        }
    }

    protected void lnkCrearClienteComodin_Click(object sender, EventArgs e)
    {

    }

    protected void lnkClienteComodin_Click(object sender, EventArgs e)
    {
        //blnClienteComodin = true;
        //GridView1.DataSourceID = "odsClienteComodin";
        //hdCodigoUsuarioAdmin.Visible = true;

        
        //txtRazonSocial.Visible = true;
        //Label5.Visible = true;
        //txtRepresentante.Visible = true;
        //Label6.Visible = true;
        //txtEstado.Visible = true;
        //Label7.Visible = true;
        //DropDownList1.Visible = true;

    }

    protected void btnAltaClienteComodin_Click(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnClienteComodin_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Catalogos/Clientes/AltaClienteComodin.aspx?ltsTipoCambio=" + lstTipoCambio.SelectedValue + "&ltsTipoDocumento=" + lstTipoDocumento.SelectedValue + "&Documento=" + txtDocumento.Text);       
    }
    protected void txtRazon_TextChanged(object sender, EventArgs e)
    {
        Button2_Click(sender, e);
    }
}