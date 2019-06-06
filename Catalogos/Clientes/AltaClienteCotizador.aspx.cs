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

public partial class Catalogos_Clientes_AltaClienteCotizador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblTemporal.Text = Request.Form["ltsTipoCambio"];
        //btnAltaCliente.Attributes.Add("onclick", "javascript: return muestraDatos();");
    }

    protected void btnAltaCliente_Click(object sender, EventArgs e)
    {
        //Panel2.Visible = true;
        lblMensaje.Visible = false;
        //btnHabilitaNuevo.Visible = true;

        int clienteId = 0;
        ClienteVO VO = new ClienteVO();
        ClienteBL BL = new ClienteBL();

        VO.Cliente_rfc = txtAltaRfc.Text.Trim().ToUpper();
        VO.Operacion = ClienteVO.BUSCAR_ADMIN_RFC;

        //VO = (ClienteVO)BL.execute(VO);
        if (VO.Cliente_razonSocial == null)
        {


            //VO.Cliente_codigo = Request.QueryString["txtAltaCodigo"];
            //VO.Cliente_codigo = txtAltaRfc.Text.Trim().ToUpper();
            //VO.Cliente_codigo = txtAltaCodigo.Text.Trim().ToUpper();
            
            //fisica
            if(lstTipoCliente.SelectedValue == "1")
            {
                VO.Cliente_codigo=VO.Cliente_rfc.Substring(0,4) + "-" + VO.Cliente_rfc.Substring(4,6) + "-" + VO.Cliente_rfc.Substring(10);
            }
            else //moral
            {
                VO.Cliente_codigo = VO.Cliente_rfc.Substring(0, 3) + "-" + VO.Cliente_rfc.Substring(3, 6) + "-" + VO.Cliente_rfc.Substring(9);
            }

            //lblMensaje.Text = VO.Cliente_rfc;
            VO.Cliente_razonSocial = txtAltaRazonSocial.Text.Trim().ToUpper();
            VO.Cliente_calle = txtAltaCalle.Text.Trim().ToUpper();
            VO.Cliente_usuarioId = Int32.Parse(Session["usuarioID"].ToString());

            VO.Cliente_Representante = txtAltaRepresentante.Text.Trim().ToUpper();
            VO.Cliente_TelefonoContacto = txtAltaTelefonoContacto.Text.Trim().ToUpper();
            VO.Cliente_CorreoElectronico = txtAltaCorreo.Text.Trim().ToUpper();
            VO.Cliente_Fax = txtAltaFax.Text.Trim().ToUpper();
            VO.Cliente_noExterno = txtAltaNoExterno.Text.Trim().ToUpper();
            VO.Cliente_noInterno = txtAltaNoInterno.Text.Trim().ToUpper();
            VO.Cliente_CodigoPostal = txtAltaCodigoPostal.Text.Trim().ToUpper();
            VO.Cliente_Estado = lstAltaEstado.SelectedValue;
            VO.Cliente_Municipio = lstAltaMunicipio.SelectedValue;
            VO.Cliente_colonia = lstColonia.SelectedValue;
            VO.Cliente_tipoCliente =Int32.Parse(lstTipoCliente.SelectedValue);

            VO.Operacion = ClienteVO.INSERTAR;  

            VO = (ClienteVO)BL.execute(VO);
            if (VO.Resultado >= 0)
            {
                clienteId = (int)VO.Resultado;
                lblClienteId.Text = clienteId.ToString();
                lblMensaje.Text = "Los datos se insertaron correctamente.";
                btnAltaCliente.Visible = false;

                //int intTipoCambio = Int32.Parse(ltsTipoCambio.SelectedValue);
                int intTipoCambio = Int32.Parse(Request.QueryString["ltsTipoCambio"]);
                int intTipoDocumento = Int32.Parse(Request.QueryString["ltsTipoDocumento"]);
                String strDocumento = Request.QueryString["Documento"];
                insertaCotizacion(VO.Cliente_codigo, clienteId, intTipoCambio, intTipoDocumento, strDocumento, VO.Cliente_Representante);

            }
            else if (VO.Resultado == -1)
            {
                //btnHabilitaNuevo.Visible = false;
                lblMensaje.Visible = true;
                lblMensaje.Text = "Ya Existe el cliente, Los datos NO se insertaron.";
                //Panel2.Visible = false;
                Panel1.Visible = true;
            }
            else
            {
                //btnHabilitaNuevo.Visible = false;
                lblMensaje.Visible = true;
                lblMensaje.Text = "Los datos NO se insertaron";
                //Panel2.Visible = false;
                Panel1.Visible = true;
            }
        }
        else
        {
            //btnHabilitaNuevo.Visible = false;
            lblMensaje.Visible = true;
            lblMensaje.Text = "Ya Existe el cliente: " + VO.Cliente_razonSocial + ", Los datos NO se insertaron.";
            //Panel2.Visible = false;
            Panel1.Visible = true;
        }
    }


    protected void insertaCotizacion(String strCodigoCliente, int intClienteNuevo, int tipoCambio, int tipoDocumento, String strDocumento, String strRepresentante)
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
        VO.Fecha = DateTime.Now;
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
        VO.RepresentanteLegal = strRepresentante;
        VO.Operacion = cotizacionVO.INSERTAR;
        VO = (cotizacionVO)BL.execute(VO);
        Session["OrderNumber"] = VO.CotizacionId;
        if (Session["OrderNumber"] != null)
        {
            //Panel2.Visible = false;
            //Panel1.Visible = false;
            lblMensaje.Visible = true;
            lblMensaje.Text = "Los datos se insertaron correctamente.";
            Controls.Add(new LiteralControl(mensajeOk));
        }
        else
        {
            Controls.Add(new LiteralControl(mensajeFail));
        }
    }

    protected void lstTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(lstTipoCliente.SelectedItem.Value=="1")
            {
                lblRfc.Text = "AAAA123456###";
            }
        else if (lstTipoCliente.SelectedItem.Value == "2")
            {
                lblRfc.Text = "AAA123456###";
            } 
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
