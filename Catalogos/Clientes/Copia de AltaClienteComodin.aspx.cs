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
        int clienteId = 0;

        ClienteVO VO = new ClienteVO();
        ClienteBL BL = new ClienteBL();

        VO.Operacion = ClienteVO.BUSCAR_SQL_CODIGO;
        VO.Cliente_codigo = "COMODIN" + ("000" + Session["usuarioID"].ToString()).PadRight(3);
        //Label1.Text = VO.Cliente_codigo;
        VO = (ClienteVO)BL.execute(VO);
	//Label1.Text = VO.Cliente_razonSocial;
	Label1.Text="";
        if (VO.Cliente_razonSocial != null && !Page.IsPostBack)  
        {
        txtAltaRazonSocial.Text = VO.Cliente_razonSocial;
        txtAltaCalle.Text = VO.Cliente_calle;
        txtAltaRepresentante.Text = VO.Cliente_Representante;
        txtAltaCalle.Text = VO.Cliente_calle;
        txtAltaNoExterno.Text = VO.Cliente_noExterno;
        txtAltaNoInterno.Text = VO.Cliente_noInterno;
        lstAltaEstado.SelectedValue = VO.Cliente_Estado;
        clienteId = VO.Clienteid;
        }

    }

    protected void btnAltaCliente_Click(object sender, EventArgs e)
    {
        //Panel2.Visible = true;
        lblMensaje.Visible = false;
        //btnHabilitaNuevo.Visible = true;

        int clienteId = 0;
        ClienteVO VO = new ClienteVO();
        ClienteBL BL = new ClienteBL();
       
            VO.Cliente_rfc = "COMODIN-" + ("000"+Session["usuarioID"].ToString()).PadRight(3);
            VO.Cliente_codigo = "COMODIN" + ("000" + Session["usuarioID"].ToString()).PadRight(3);
            VO.Cliente_razonSocial = txtAltaRazonSocial.Text.Trim().ToUpper();
            VO.Cliente_calle = txtAltaCalle.Text.Trim().ToUpper();
            VO.Cliente_usuarioId = Int32.Parse(Session["usuarioID"].ToString());
            VO.Cliente_Representante = txtAltaRepresentante.Text.Trim().ToUpper();
            VO.Cliente_TelefonoContacto = "";
            VO.Cliente_CorreoElectronico = "";
            VO.Cliente_Fax = "";
            VO.Cliente_calle = txtAltaCalle.Text.Trim().ToUpper();
            VO.Cliente_noExterno = txtAltaNoExterno.Text.Trim().ToUpper();
            VO.Cliente_noInterno = txtAltaNoInterno.Text.Trim().ToUpper();
            VO.Cliente_CodigoPostal = "";
            VO.Cliente_Estado = lstAltaEstado.SelectedValue;
            VO.Cliente_Municipio = "";
            VO.Cliente_colonia = "";
            VO.Cliente_tipoCliente =1;

            VO.Operacion = ClienteVO.INSERTAR;  

            VO = (ClienteVO)BL.execute(VO);
            if (VO.Resultado >= 0)
            {
                clienteId = (int)VO.Resultado;
                lblClienteId.Text = clienteId.ToString();
                lblMensaje.Text = "Los datos se guardaron correctamente.";
                btnAltaCliente.Visible = false;

                int intTipoCambio = Int32.Parse(lstTipoCambio.SelectedValue);
                int intTipoDocumento = Int32.Parse(lstTipoDocumento.SelectedValue);

                insertaCotizacion(VO.Cliente_codigo, clienteId, intTipoCambio, intTipoDocumento, txtDocumento.Text.Trim().ToUpper(), VO.Cliente_Representante);
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
            lblMensaje.Text = "Los datos se Guardaron correctamente.";
            Controls.Add(new LiteralControl(mensajeOk));
        }
        else
        {
            Controls.Add(new LiteralControl(mensajeFail));
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
