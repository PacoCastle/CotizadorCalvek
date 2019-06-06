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
using ConsultasConKeplerTableAdapters;
using System.Web.Services;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class Catalogos_Productos_AltaClienteKepler : System.Web.UI.Page
{

    private static int NUMFUNCION = 10;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!error.Equals(""))
            {
                Response.Redirect(error);
            }

            error = Utilis.validaPermisos(Session, NUMFUNCION); // Se valida que el usuario tiene el permiso para Seguimiento
            //if (!error.Equals(""))
            //{
            //    lnkSeguimiento.Visible = false;
            //}

            //lstUnidadMedida.SelectedValue = "PZA";
        }
        catch (Exception ex)
        {

        }
    }



    protected void btnGuardar_Click1(object sender, EventArgs e)
    {
        try
        {
            sdsInsertaCliente.InsertParameters["rfc"].DefaultValue = txtRFC.Text;
            sdsInsertaCliente.InsertParameters["nombre_comp"].DefaultValue = txtNombreCompleto.Text.Trim();
            sdsInsertaCliente.InsertParameters["calle"].DefaultValue = txtCalle.Text.Trim();
            sdsInsertaCliente.InsertParameters["num"].DefaultValue = txtNumeroInt.Text.Trim();
            sdsInsertaCliente.InsertParameters["colonia"].DefaultValue = txtColonia.Text.Trim();
            sdsInsertaCliente.InsertParameters["poblacion"].DefaultValue = txtPoblacion.Text.Trim();
            sdsInsertaCliente.InsertParameters["telefono1"].DefaultValue = txtTelefono.Text.Trim();
            sdsInsertaCliente.InsertParameters["telefono2"].DefaultValue = txtTelefono2.Text.Trim();
            
            sdsInsertaCliente.InsertParameters["correo"].DefaultValue = txtEmail.Text.Trim();
            sdsInsertaCliente.InsertParameters["vendedor"].DefaultValue = lstVendedor.SelectedValue.ToString();
            sdsInsertaCliente.InsertParameters["lim_credito"].DefaultValue = txtLimiteCredito.Text.Trim();
            sdsInsertaCliente.InsertParameters["plazo"].DefaultValue = txtPlazo.Text.Trim();
            sdsInsertaCliente.InsertParameters["descuentos"].DefaultValue = txtDescuento.Text.Trim();
            sdsInsertaCliente.InsertParameters["descuentos2"].DefaultValue = txtDescuento2.Text.Trim();
            sdsInsertaCliente.InsertParameters["cp"].DefaultValue = txtCP.Text.Trim();
            sdsInsertaCliente.InsertParameters["calleFiscal"].DefaultValue = txtCalleFiscales.Text.Trim();
            sdsInsertaCliente.InsertParameters["numFiscal"].DefaultValue = txtNumeroIntFiscales.Text.Trim();
            sdsInsertaCliente.InsertParameters["coloniaFiscal"].DefaultValue = txtColoniaFiscales.Text.Trim();
            sdsInsertaCliente.InsertParameters["poblacionFiscal"].DefaultValue = txtPoblacionFiscales.Text.Trim();
            sdsInsertaCliente.InsertParameters["cpFiscal"].DefaultValue = txtCPFiscales.Text.Trim();
            sdsInsertaCliente.InsertParameters["metodoPago"].DefaultValue = lstMetodoPago.SelectedValue.ToString().Trim();
            sdsInsertaCliente.InsertParameters["cuentaPago"].DefaultValue = txtCuentaPagoFiscales.Text.Trim();
            sdsInsertaCliente.InsertParameters["usoComprobante"].DefaultValue = lstUsoComprobante.SelectedValue.ToString().Trim();
            sdsInsertaCliente.InsertParameters["idUsuario"].DefaultValue = (Session["usuarioID"].ToString());
            sdsInsertaCliente.Insert();
        }
        catch (Exception ex)
        {
            //lblMensaje.Text = "ERROR EN EL ALTA";
        }


    }

    protected void limpiarDatos()
    {
        txtRFC.Text = "";
        txtNombreCompleto.Text = "";
        txtCalle.Text = "";
        txtNumeroInt.Text = "";
        txtColonia.Text = "";
        txtPoblacion.Text = "";
        txtTelefono.Text = "";
        txtTelefono2.Text = "";
        txtRFC.Text = "";
        txtEmail.Text = "";
        lstVendedor.SelectedIndex = -1;
        txtLimiteCredito.Text = "";
        txtPlazo.Text = "";
        txtDescuento.Text = "";
        txtDescuento2.Text = "";
        txtCP.Text = "";
        txtCalleFiscales.Text = "";
        txtNumeroIntFiscales.Text = "";
        txtColoniaFiscales.Text ="";
        txtPoblacionFiscales.Text = "";
        txtCPFiscales.Text = "";
        lstMetodoPago.SelectedIndex = -1;
        txtCuentaPagoFiscales.Text = "";
        lstUsoComprobante.SelectedIndex = -1;
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        limpiarDatos();
    }

    protected void sdsInsertaProducto_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        try
        {
            lblTitle.Text = "Alta Cliente";
            
            string res = "";
            res = e.Command.Parameters["@resultado"].Value.ToString();
            if (res == "")
            {
                lblModalBody.Text = "Alta Correcta";
                limpiarDatos();
            }
            else
            {
                lblModalBody.Text = res; 
            }
        }
        catch (Exception ex)
        {
            lblModalBody.Text = ex.ToString();
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
    }
    
    protected void chkDatosFiscales_CheckedChanged(object sender, EventArgs e)
    {
        if (chkDatosFiscales.Checked == true){
            txtCalleFiscales.Text = txtCalle.Text;
            txtNumeroIntFiscales.Text = txtNumeroInt.Text;
            txtColoniaFiscales.Text = txtColonia.Text;
            txtPoblacionFiscales.Text = txtPoblacion.Text;
            txtCPFiscales.Text = txtCP.Text;
        }
        else {
            txtCalleFiscales.Text = "";
            txtNumeroIntFiscales.Text =  "";
            txtColoniaFiscales.Text =  "";
            txtPoblacionFiscales.Text =  "";
            txtCPFiscales.Text =  "";
        }
            
    }   
    //protected void btnValidaRFC_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("get_ProductoCFDIKepler", con))
    //            {

    //                cmd.CommandType = CommandType.StoredProcedure;
    //                con.Open();
    //                cmd.Parameters.AddWithValue("@pRFC", txtRFC);
    //                SqlDataReader dr = cmd.ExecuteReader();
    //                if (dr.Read())
    //                {
    //                    if (dr["RFC"].ToString() != "")
    //                    {
    //                        lblModalBody.Text = "El RFC que intenta ingresar existe";
    //                    }
    //                    else
    //                    {
    //                        lblModalBody.Text = "Continunar";
    //                    }
    //                }
    //                con.Close();
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        lblModalBody.Text = ex.ToString();
    //    }
    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
    //}
}
