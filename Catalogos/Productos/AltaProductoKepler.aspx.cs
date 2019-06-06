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

public partial class Catalogos_Productos_AltaProductoKepler : System.Web.UI.Page
{

    private static int NUMFUNCION = 9;

    [WebMethod]
    public static List<string> GetProductoCFDI(string strProductoCFDI)
    {
        List<string> empResult = new List<string>();
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("get_ProductoCFDIKepler", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@strProductoCFDI", strProductoCFDI);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        empResult.Add(dr["cveProductoCFDI"].ToString());
                    }
                    con.Close();
                    return empResult;
                }
            }
        }
        catch (Exception ex)
        {
            return empResult = null;
        }
    }
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
            if (!Page.IsPostBack)
            {
                divCosto.Visible = false;
                divRentabilidad.Visible = false;
            }
        }
        catch (Exception ex)
        {

        }
    }



    protected void btnGuardar_Click1(object sender, EventArgs e)
    {
        string[] productCFDI;
        try
        {
            if (rbtTipoProducto.SelectedValue == "1")
            {
                txtPrecioLista.Text = "0";
                if (rdbCostoIgual.Checked)
                {
                    if (string.IsNullOrEmpty(txtCostoIgual.Text))
                    {
                        txtCostoIgual.Text = "0";
                    }
                    txtCostoQueretaro.Text = txtCostoIgual.Text;
                    txtCostoMarques.Text = txtCostoIgual.Text;
                    txtCostoCelaya.Text = txtCostoIgual.Text;
                }
                else
                {
                    if (string.IsNullOrEmpty(txtCostoMarques.Text))
                    {
                        txtCostoQueretaro.Text = "0";
                    }
                    if (string.IsNullOrEmpty(txtCostoMarques.Text))
                    {
                        txtCostoMarques.Text = "0";
                    }
                    if (string.IsNullOrEmpty(txtCostoCelaya.Text))
                    {
                        txtCostoCelaya.Text = "0";
                    }
                }
                if (rdbRentabilidadIgual.Checked)
                {
                    if (string.IsNullOrEmpty(txtRentabilidadIgual.Text))
                    {
                        txtRentabilidadIgual.Text = "0";
                    }
                    txtRentabilidadQueretaro.Text = txtRentabilidadIgual.Text;
                    txtRentabilidadMarques.Text = txtRentabilidadIgual.Text;
                    txtRentabilidadCelaya.Text = txtRentabilidadIgual.Text;
                }
                else
                {
                    if (string.IsNullOrEmpty(txtCostoMarques.Text))
                    {
                        txtRentabilidadQueretaro.Text = "0";
                    }
                    if (string.IsNullOrEmpty(txtCostoMarques.Text))
                    {
                        txtRentabilidadMarques.Text = "0";
                    }
                    if (string.IsNullOrEmpty(txtCostoCelaya.Text))
                    {
                        txtRentabilidadCelaya.Text = "0";
                    }
                }
            }
            
            productCFDI = Regex.Split(txtProductoCFDI.Text, "---"); 
            sdsInsertaProducto.InsertParameters[0].DefaultValue = txtClaveProducto.Text.Trim();
            sdsInsertaProducto.InsertParameters[1].DefaultValue = txtDescripcionProducto.Text.Trim();
            sdsInsertaProducto.InsertParameters[2].DefaultValue = lstMarcaKepler.SelectedItem.Value;
            sdsInsertaProducto.InsertParameters[3].DefaultValue = "PZA";
            sdsInsertaProducto.InsertParameters[4].DefaultValue = lstMoneda.SelectedItem.Value;
            sdsInsertaProducto.InsertParameters[5].DefaultValue = txtPrecioLista.Text.Trim();
            sdsInsertaProducto.InsertParameters[6].DefaultValue = productCFDI[0].ToString().Trim();
            sdsInsertaProducto.InsertParameters[7].DefaultValue = lstUnidadMedidaCFDIKepler.SelectedItem.Value; ;
            sdsInsertaProducto.InsertParameters[8].DefaultValue = (Session["usuarioID"].ToString());
            sdsInsertaProducto.InsertParameters[9].DefaultValue = rbtTipoProducto.SelectedValue;
            sdsInsertaProducto.InsertParameters[10].DefaultValue = rbtRango.SelectedValue;
            sdsInsertaProducto.InsertParameters[11].DefaultValue = txtCostoQueretaro.Text.Trim();
            sdsInsertaProducto.InsertParameters[12].DefaultValue = txtCostoMarques.Text.Trim();
            sdsInsertaProducto.InsertParameters[13].DefaultValue = txtCostoCelaya.Text.Trim();
            sdsInsertaProducto.InsertParameters[14].DefaultValue = txtRentabilidadQueretaro.Text.Trim();
            sdsInsertaProducto.InsertParameters[15].DefaultValue = txtRentabilidadMarques.Text.Trim();
            sdsInsertaProducto.InsertParameters[16].DefaultValue = txtRentabilidadCelaya.Text.Trim();

            sdsInsertaProducto.Insert();
        }
        catch (Exception ex)
        {
            //lblMensaje.Text = "ERROR EN EL ALTA";
            lblModalBody.Text = "ERROR EN EL ALTA";
            //habilitaCampos(true);
        }


    }

    protected void limpiarDatos()
    {
        txtClaveProducto.Text = "";
        txtDescripcionProducto.Text = "";
        lstMarcaKepler.SelectedIndex = -1;
        lstMoneda.SelectedIndex = -1;
        txtPrecioLista.Text = "";
        txtProductoCFDI.Text = "";
        lstUnidadMedidaCFDIKepler.SelectedIndex = -1;
        lstUnidadMedidaKepler.SelectedIndex = -1;
        txtCostoIgual.Text = "";
        txtCostoQueretaro.Text = "";
        txtCostoMarques.Text = "";
        txtCostoCelaya.Text = "";
        txtRentabilidadIgual.Text = "";
        txtRentabilidadQueretaro.Text = "";
        txtRentabilidadMarques.Text = "";
        txtRentabilidadCelaya.Text = "";


        //btnLimpiar.Text = "Limpiar";
        //lblMensaje.Text = "";
    }

    protected void habilitaCampos(bool blBandera)
    {
        txtClaveProducto.Enabled = blBandera;
        txtDescripcionProducto.Enabled = blBandera;
        lstMarcaKepler.Enabled = blBandera;
        //lstUnidadMedida.Enabled = blBandera;
        lstMoneda.Enabled = blBandera;
        txtPrecioLista.Enabled = blBandera;
        btnGuardar.Enabled = blBandera;

    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        limpiarDatos();
        //habilitaCampos(true);
    }

    protected void sdsInsertaProducto_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        try
        {
            lblTitle.Text = "Alta Producto";
            int? res = -1;
            res = int.Parse(e.Command.Parameters["@resultado"].Value.ToString());
            if (res == 0)
            {
                //lblMensaje.Text = "ALTA CORRECTA";
                lblModalBody.Text = "Alta Correcta";
                //btnLimpiar.Text = "NUEVO";
                //habilitaCampos(false);
                limpiarDatos();
            }
            else
            {
                if (res == -2)
                {
                    lblModalBody.Text = "CLAVE DE SAT NO VALIDA";
                }
                else
                {
                    lblModalBody.Text = "YA EXISTE EL PRODUCTO";
                }
            }
        }
        catch (Exception ex)
        {
            lblModalBody.Text = "ERROR EN EL ALTA";
            //habilitaCampos(true);
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
    }
    protected void rbtTipoProducto_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtTipoProducto.SelectedValue == "0")
        {
            divPrecioLista.Visible = true;
            divCosto.Visible = false;
            divRentabilidad.Visible = false;
            txtCostoIgual.Enabled = true;
        }
        else
        {
            divPrecioLista.Visible = false;
            divCosto.Visible = true;
            divRentabilidad.Visible = true;
        }
    }
    protected void rdbCostoIgual_CheckedChanged(object sender, EventArgs e)
    {
        rdbCostoIgual.Checked = true;
        rdbCostoDiferente.Checked = false;
        txtCostoIgual.Enabled = true;
        txtCostoQueretaro.Enabled = false;
        txtCostoMarques.Enabled = false;
        txtCostoCelaya.Enabled = false;
    }
    protected void rdbCostoDiferente_CheckedChanged(object sender, EventArgs e)
    {
        rdbCostoIgual.Checked = false;
        rdbCostoDiferente.Checked = true;
        txtCostoIgual.Enabled = false;
        txtCostoQueretaro.Enabled = true;
        txtCostoMarques.Enabled = true;
        txtCostoCelaya.Enabled = true;
    }
    protected void rdbRentabilidadIgual_CheckedChanged(object sender, EventArgs e)
    {
        rdbRentabilidadIgual.Checked = true;
        rdbRentabilidadDiferente.Checked = false;
        txtRentabilidadIgual.Enabled = true;
        txtRentabilidadQueretaro.Enabled = false;
        txtRentabilidadMarques.Enabled = false;
        txtRentabilidadCelaya.Enabled = false;
    }
    protected void rdbRentabilidadDiferente_CheckedChanged(object sender, EventArgs e)
    {
        rdbRentabilidadIgual.Checked = false;
        rdbRentabilidadDiferente.Checked = true;
        txtRentabilidadIgual.Enabled = false;
        txtRentabilidadQueretaro.Enabled = true;
        txtRentabilidadMarques.Enabled = true;
        txtRentabilidadCelaya.Enabled = true;
    }
}
