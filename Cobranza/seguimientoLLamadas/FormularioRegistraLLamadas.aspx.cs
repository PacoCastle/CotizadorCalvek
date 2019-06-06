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

public partial class Cobranza_seguimientoLLamadas_FormularioRegistraLLamadas : System.Web.UI.Page
{

    private static int NUMFUNCION = 32;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }


    protected void rdilstTipoContacto_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblTemselec.Text = rdilstTipoContacto.SelectedValue;
        if (rdilstTipoContacto.SelectedValue=="1")
            {
            pnlLlamada.Visible = true;
            pnlVisita.Visible = false;
            }
        else
            {
            pnlVisita.Visible = true;
            pnlLlamada.Visible = false;
            }
            lblEtiEstatusLlamada.Visible = false;
            lblEtiquetaResultado.Text = "";

    }
    protected void ckbNoExitosa_CheckedChanged(object sender, EventArgs e)
    {
        if(ckbNoExitosa.Checked)
            {
                lstEstatusNoExitosa.Visible = true;
                //lblEtiComentario.Visible = true;
                //txtComentario.Visible = true;
                lblEtiEstatusLlamada.Visible = true;

                ckbExitosa.Checked = false;
                lstEstatusExitosa.Visible = false;
                lblEtiComentario.Visible = false;
                txtComentario.Text = "";
                txtComentario.Visible = false;
                btnGuardar.Visible = false;
                calProxLlamada.Visible = false;
                
            }
        else
            {
                lstEstatusNoExitosa.Visible = false;
                //lblEtiComentario.Visible = false;
                //txtComentario.Visible = false;
            }

    }

    protected void ckbExitosa_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbExitosa.Checked)
        {
            lstEstatusExitosa.Visible = true;
            //lblEtiComentario.Visible = true;
            //txtComentario.Visible = true;
            lblEtiEstatusLlamada.Visible = true;

            ckbNoExitosa.Checked = false;
            lstEstatusNoExitosa.Visible = false;
            lblEtiComentario.Visible = false;
            txtComentario.Text = "";
            txtComentario.Visible = false;
            btnGuardar.Visible = false;
            calProxLlamada.Visible = false;
        }
        else
        {
            lstEstatusExitosa.Visible = false;
            //lblEtiComentario.Visible = false;
            //txtComentario.Visible = false;
        }

    }
    protected void lstClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlBotones.Visible = true;
        pnlDatosCliente.Visible = true;
        lblEtiquetaResultado.Text = "";
        lblEtiTipoContacto.Visible = true;
        rdilstTipoContacto.Visible = true;
        pnlDatosContacto.Visible = false;
        pnlHistorial.Visible = false;

        btnCliente.BorderStyle = BorderStyle.Groove;
        btnContacto.BorderStyle = BorderStyle.Solid;
        btnHistorial.BorderStyle = BorderStyle.Solid;
        btnCliente.Font.Bold = true;
        btnContacto.Font.Bold = false;
        btnHistorial.Font.Bold = false;

        ClienteVO VOcliente = new ClienteVO();
        ClienteBL BLcliente = new ClienteBL();

        //VOcliente.Clienteid = Int32.Parse(lstClientes.SelectedItem.Value);
        VOcliente.Cliente_idAdmin = (lstClientes.SelectedItem.Value.ToString());
        
        VOcliente.Operacion = ClienteVO.BUSCAR_ADMIN_ID;
        VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        if (VOcliente.Cliente_razonSocial != null)
        {
            //lblRazonSocial.Text = VOcliente.Cliente_razonSocial;
            lblRFC.Text = VOcliente.Cliente_rfc;
            lblRepreLegal.Text = VOcliente.Cliente_Representante;
            //lblMoneda.Text = VOcliente.moneda;
            lblLimCredito.Text = VOcliente.Cliente_LimiteCredito.ToString();
            lblDiasCredito.Text = VOcliente.Cliente_DiasCredito.ToString();
            //lblDiaPago.Text = VOcliente.diaPago;
            lblDireccion.Text = VOcliente.Cliente_calle;
            lblNumeroExt.Text = VOcliente.Cliente_noExterno;
            lbNumeroInt.Text = VOcliente.Cliente_noInterno;
            lblColonia.Text = VOcliente.Cliente_colonia;
            lblCodigoPostal.Text = VOcliente.Cliente_CodigoPostal;
            lblTelefono1.Text = VOcliente.Cliente_TelefonoContacto;
            lblEstado.Text = VOcliente.Cliente_Estado;
            //lblCiudad.Text = VOcliente.ciudad;
            //lblTelefono2.Text = VOcliente.Cliente_TelefonoContacto2;
            //lblTelefono3.Text = VOcliente.Cliente_TelefonoContacto3;
        }

        
        lstEstatusNoExitosa.Visible = false;
        lstEstatusExitosa.Visible = false;
        lblEtiComentario.Visible = false;
        txtComentario.Text = "";
        txtComentario.Visible = false;
        lblEtiEstatusLlamada.Visible = false;
        ckbExitosa.Checked = false;
        ckbNoExitosa.Checked = false;
        btnGuardar.Visible = false;
        calProxLlamada.Visible = false;
        
    }
    protected void lstEstatusNoExitosa_SelectedIndexChanged(object sender, EventArgs e)
    {
            txtComentario.Visible = true;
            lblEtiComentario.Visible = true;
            btnGuardar.Visible = true;
            calProxLlamada.Visible = false;
    }

    protected void lstEstatusExitosa_SelectedIndexChanged(object sender, EventArgs e)
    {
        //id_estatus 
        //7  agenda
        if (lstEstatusExitosa.SelectedItem.Value != "7")
            {
            txtComentario.Visible = true;
            lblEtiComentario.Visible = true;
            btnGuardar.Visible = true;
            calProxLlamada.Visible = false;
            }
        else if(lstEstatusExitosa.SelectedItem.Value == "7")
            {
                txtComentario.Visible = true;
                lblEtiComentario.Visible = true;
                btnGuardar.Visible = false;
                calProxLlamada.Visible = true;
            }
        else
            {
                txtComentario.Visible = false;
                lblEtiComentario.Visible = false;
                btnGuardar.Visible = false;
                calProxLlamada.Visible = false;
            }
    }
    protected void calProxLlamada_SelectionChanged(object sender, EventArgs e)
    {
        btnGuardar.Visible = true;
    }
    protected void btnCliente_Click(object sender, EventArgs e)
    {
        btnCliente.BorderStyle = BorderStyle.Groove;
        btnContacto.BorderStyle = BorderStyle.Solid;
        btnHistorial.BorderStyle = BorderStyle.Solid;
        btnCliente.Font.Bold = true;
        btnContacto.Font.Bold = false;
        btnHistorial.Font.Bold = false;

        pnlDatosCliente.Visible = true;
        pnlDatosContacto.Visible = false;
        pnlHistorial.Visible = false;
    }
    protected void btnContacto_Click(object sender, EventArgs e)
    {
        btnContacto.BorderStyle = BorderStyle.Groove;
        btnCliente.BorderStyle = BorderStyle.Solid;
        btnHistorial.BorderStyle = BorderStyle.Solid;
        btnContacto.Font.Bold = true;
        btnCliente.Font.Bold = false;
        btnHistorial.Font.Bold = false;

        pnlDatosContacto.Visible = true;
        pnlDatosCliente.Visible = false;
        pnlHistorial.Visible = false;
        // refresca los contactos
        GridView1.DataBind();
    }
    protected void btnHistorial_Click(object sender, EventArgs e)
    {
        GridView2.DataBind();
        btnHistorial.BorderStyle = BorderStyle.Groove;
        btnCliente.BorderStyle = BorderStyle.Solid;
        btnContacto.BorderStyle = BorderStyle.Solid;
        btnHistorial.Font.Bold = true;
        btnContacto.Font.Bold = false;
        btnCliente.Font.Bold = false;

        pnlHistorial.Visible = true;
        pnlDatosContacto.Visible = false;
        pnlDatosCliente.Visible = false;
    }
    protected void btnNuevoContacto_Click(object sender, EventArgs e)
    {
        ((Panel)GridView1.FooterRow.FindControl("pnlAltaContacto")).Visible = true;
        ((Button)GridView1.FooterRow.FindControl("btnNuevoContacto")).Visible = false;
    }

    protected void btnGuardarContacto_Click(object sender, EventArgs e)
    {
        seguimientoCobranzaBL segCobBL = new seguimientoCobranzaBL();
        seguimientoCobranzaVO segCobVO = new seguimientoCobranzaVO();
        segCobVO.Operacion = seguimientoCobranzaVO.INSERTAR;

        segCobVO.NombreResponsable = ((TextBox)GridView1.FooterRow.FindControl("txtNombreResponsable")).Text.ToUpper();
        segCobVO.Telefono = ((TextBox)GridView1.FooterRow.FindControl("txtTelefono")).Text;
        segCobVO.Extension = ((TextBox)GridView1.FooterRow.FindControl("txtExtension")).Text;
        segCobVO.CorreoElectronico = ((TextBox)GridView1.FooterRow.FindControl("txtCorreo")).Text;
        segCobVO.TelefonoCelular = ((TextBox)GridView1.FooterRow.FindControl("txtTelCelular")).Text;
        segCobVO.Comentarios = ((TextBox)GridView1.FooterRow.FindControl("txtContComentarios")).Text;
        //segCobVO.ClienteId = Int32.Parse(lstClientes.SelectedItem.Value);
        segCobVO.ClienteId = (lstClientes.SelectedValue.ToString());
        segCobVO.UsuarioIdModificacion = Int32.Parse(Session["usuarioID"].ToString());

        segCobVO = (seguimientoCobranzaVO)segCobBL.execute(segCobVO);
        if (segCobVO.Resultado > 0)
        {
            ((Button)GridView1.FooterRow.FindControl("btnNuevoContacto")).Visible = true;
            ((TextBox)GridView1.FooterRow.FindControl("txtNombreResponsable")).Text = "";
            ((TextBox)GridView1.FooterRow.FindControl("txtTelefono")).Text = "";
            ((TextBox)GridView1.FooterRow.FindControl("txtExtension")).Text = "";
            ((TextBox)GridView1.FooterRow.FindControl("txtCorreo")).Text = "";
            ((TextBox)GridView1.FooterRow.FindControl("txtTelCelular")).Text = "";
            ((TextBox)GridView1.FooterRow.FindControl("txtContComentarios")).Text = "";
            GridView1.DataBind();
        }


        
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        seguimientoCobranzaBL segCobBL = new seguimientoCobranzaBL();
        seguimientoCobranzaVO segCobVO = new seguimientoCobranzaVO();
        segCobVO.Operacion = seguimientoCobranzaVO.INSERTAR_EVENTO;
        segCobVO.Origen = rdilstTipoContacto.SelectedItem.ToString();
        segCobVO.ClienteId = lstClientes.SelectedValue.ToString();

        if (ckbExitosa.Checked)
            {
            segCobVO.Tipo = "LLAMADA EXITOSA";
            }
        else if(ckbNoExitosa.Checked)
            {
            segCobVO.Tipo = "LLAMADA NO EXITOSA";
            }
        
        if (ckbExitosa.Checked)
            {
            segCobVO.Estatus = Int32.Parse(lstEstatusExitosa.SelectedItem.Value);

            }
        else if(ckbNoExitosa.Checked)
            {
            segCobVO.Estatus = Int32.Parse(lstEstatusNoExitosa.SelectedItem.Value);
            }

        //7  agenda
            try
                {
                    if (lstEstatusExitosa.SelectedItem.Value != "7")
                    {
                        segCobVO.Cambio = txtComentario.Text.ToUpper();
                        segCobVO.FechaAgenda = "";
                    }
                    else if (lstEstatusExitosa.SelectedItem.Value == "7")
                    {
                        segCobVO.FechaAgenda = calProxLlamada.SelectedDate.Date.ToString("d");
                        segCobVO.Cambio = "FechaAgendada:" + segCobVO.FechaAgenda + " - " + txtComentario.Text.ToUpper();
                    }
                }
        catch(Exception ec)
                {
                    segCobVO.Cambio = txtComentario.Text.ToUpper();
                    segCobVO.FechaAgenda = "";
                }

        segCobVO.UsuarioIdModificacion = Int32.Parse(Session["usuarioID"].ToString());

        segCobVO = (seguimientoCobranzaVO)segCobBL.execute(segCobVO);
        if (segCobVO.Resultado > 0)
        {
            lblEtiquetaResultado.Text = "INFORMACION GUARDADA.";
            pnlLlamada.Visible = false;
        }
    }
}
