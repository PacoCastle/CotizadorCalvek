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
using System.Data.SqlClient;
using System.Text;
using System.Collections.Generic;

public partial class Cobranza_pagosEfectivo : System.Web.UI.Page
{
    private static int NUMFUNCION = 53;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }   

        if (!IsPostBack)
        {
            ImageButton mp_imgBtnHelp = (ImageButton)Master.FindControl("imgBtnHelp");
            //Label mpLabel = (Label)Master.FindControl("masterPageLabel");
            if (mp_imgBtnHelp != null)
            {
                mp_imgBtnHelp.Enabled = true;
                mp_imgBtnHelp.Visible = true;
                //mp_imgBtnHelp.Attributes.Add("OnClick", "Ayuda('Help.aspx')");
                mp_imgBtnHelp.Attributes.Add("OnClick", "openwindow()");
                
            }
        }
        //if (Page.IsValid)
        //{
 
        //}
        
    }  

    public static class GlobalVars
    {
        public static int valFoliosMixtos = 0;
        public static int valFacturas = 0;
    }

    protected void cbxIdCliente_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxClienteId.Checked == true)
        {
            cbxClienteDesc.Checked = false;
            txtClienteId.Text = "";
            txtClienteId.Enabled = true;
            txtClienteId.Focus();
            txtClienteDesc.Enabled = false;
            txtClienteDesc.Text = "";
            lblResultado.Text = "";
        }
        else
        {
            cbxClienteId.Checked = false;
            cbxClienteDesc.Checked = true;
            txtClienteId.Text = "";
            txtClienteDesc.Enabled = true;
            txtClienteDesc.Focus();
            
        }
    }
    protected void cbxClienteDesc_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxClienteId.Checked == true)
        {
            cbxClienteId.Checked = false;
            txtClienteDesc.Text = "";
            txtClienteDesc.Enabled = true;
            txtClienteDesc.Focus();
            txtClienteId.Enabled = false;
            txtClienteId.Text = "";
            lblResultado.Text = "";
        }
        else
        {
            cbxClienteDesc.Checked = false;
            cbxClienteId.Checked = true;
            txtClienteDesc.Text = "";
            txtClienteId.Enabled = true;
            txtClienteId.Focus();
        }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if (lstSucBusqueda.SelectedValue.ToString() != "0")
        {
            this.dgvClientes.Columns[4].Visible = false;
            GlobalVars.valFacturas = 0;
        }
        else
        {
            this.dgvClientes.Columns[4].Visible = true;
            GlobalVars.valFacturas = 1;
            dgvClientes.DataBind();
        }
        
        pnlControles.Visible = false;
        limpiaControles();
    }

    protected void limpiaControles()
    {
        txtFecha.Text = "";
        //lstOficinaInserta.SelectedValue = "001";
        lstFormasPago.SelectedValue = "1";
        lstMoneda.SelectedValue = "1";
        txtImporte.Text = "";
        txtReferencia.Text = "";
        txtReferencia.Enabled = false;
        txtTC.Text = "";
        lblFolios.Text = "";
        //lblResultado.Text = "";
        lblTC.Text = "";
        lblTC0.Visible = false;
        lstBancos.Items.Clear();
        lstBancos.Enabled = false;
        GlobalVars.valFoliosMixtos = 0;
        cbxFoliosMixtos.Checked = false;
        dgvClientes0.Dispose();
        txtTC.Enabled = false;
        

        
        //lblResultado.Visible = false;
    }
    protected void dgvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblProducto.Visible = true;
        GridViewRow row = dgvClientes.SelectedRow;
        lblIdCte.Text = row.Cells[1].Text;
        lblCte.Text = row.Cells[2].Text;
        pnlControles.Visible = true;
        limpiaControles();
        lblResultado.Text = "";

        if ( GlobalVars.valFacturas == 1)
        {
            DropDownList dropdown = row.FindControl("lstSucAsigna") as DropDownList;
            lblSuc.Text = "00" + dropdown.SelectedValue.ToString();
            cbxFacturaNG.Checked = true;
            //lstFolios.Enabled = false;
            dgvClientes0.DataBind();
        }
        else
        {
            cbxFacturaNG.Checked = false;
            lblSuc.Text = row.Cells[3].Text;
            //lstFolios.Enabled = true;
        }
    }

    protected void cbxFacturaNG_CheckedChanged(object sender, EventArgs e)
    {
        //Boolean docGenerado Boolean;

        if (cbxFacturaNG.Checked == true)
        {
            //lstFolios.Items.Clear();
            //lstFolios.Enabled = false;
            dgvClientes0.Visible = false;
            lblFolios.Text = "";
            //docGenerado = false;
        }
        else
        {
            //lstFolios.DataBind();
            //lstFolios.Enabled = true;
            dgvClientes0.Visible = true;
            
        }
    }

    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        int docGenerado = 0;
        if (dgvClientes0.Visible == true)
        {
            lblFolios.Text = "";
            foreach (GridViewRow grd_Row in this.dgvClientes0.Rows)
            {
                    CheckBox chk_Publicar = (CheckBox)grd_Row.Cells[0].Controls[1];
                    if (chk_Publicar.Checked)
                    {
                        docGenerado = 1;
                        lblFolios.Text += grd_Row.Cells[1].Text +  "," ;
                    }
            }
        }

        string connString = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
        SqlConnection Cnn = new SqlConnection(connString);
        string sError = null;
        int valResultado = 0;

        try
        {
            //Cnn = new SqlConnection(cstrConnectBD);
            SqlCommand cmd = new SqlCommand("set_Inserta_PagoFacturas", Cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CD_SUCURSAL", SqlDbType.VarChar, 3);
            cmd.Parameters["@CD_SUCURSAL"].Value = lblSuc.Text;

            cmd.Parameters.Add("@CD_CTE", SqlDbType.VarChar, 4);
            cmd.Parameters["@CD_CTE"].Value = lblIdCte.Text;

            cmd.Parameters.Add("@NB_CLIENTE", SqlDbType.VarChar, 100);
            cmd.Parameters["@NB_CLIENTE"].Value = lblCte.Text;

            cmd.Parameters.Add("@CD_FORMAPAGO", SqlDbType.Int);
            cmd.Parameters["@CD_FORMAPAGO"].Value = lstFormasPago.SelectedValue;

            if (lstFormasPago.SelectedValue.ToString() == "3")
            {
                cmd.Parameters.Add("@CD_BANCO", SqlDbType.Int);
                cmd.Parameters["@CD_BANCO"].Value = lstBancos.SelectedValue;

                cmd.Parameters.Add("@NU_REFERENCIA", SqlDbType.VarChar, 50);
                cmd.Parameters["@NU_REFERENCIA"].Value = txtReferencia.Text;

            }

            if (lstMoneda.SelectedValue.ToString() != "1")
            {
                cmd.Parameters.Add("@NU_TIPOCAMBIO", SqlDbType.Float);
                cmd.Parameters["@NU_TIPOCAMBIO"].Value = lblTC.Text;

                cmd.Parameters.Add("@NU_TIPOCAMBIO_PAGO", SqlDbType.Float);
                cmd.Parameters["@NU_TIPOCAMBIO_PAGO"].Value = txtTC.Text;
                
            }

            cmd.Parameters.Add("@CD_MONEDA", SqlDbType.Int);
            cmd.Parameters["@CD_MONEDA"].Value = lstMoneda.SelectedValue;

            cmd.Parameters.Add("@NU_FOLIOSMIXTOS", SqlDbType.Int);
            cmd.Parameters["@NU_FOLIOSMIXTOS"].Value = GlobalVars.valFoliosMixtos;
            
            cmd.Parameters.Add("@NU_IMPORTE", SqlDbType.Float);
            cmd.Parameters["@NU_IMPORTE"].Value = txtImporte.Text;

            if (docGenerado == 1)
            {
                cmd.Parameters.Add("@strFolio", SqlDbType.VarChar, 250);
                cmd.Parameters["@strFolio"].Value = lblFolios.Text;
            }
            cmd.Parameters.Add("@CD_DOCUMENTO_GENERADO", SqlDbType.Int);
            cmd.Parameters["@CD_DOCUMENTO_GENERADO"].Value = docGenerado;

            cmd.Parameters.Add("@FH_MODIFICACION", SqlDbType.DateTime);
            cmd.Parameters["@FH_MODIFICACION"].Value = txtFecha.Text;

            cmd.Parameters.Add("@FH_PAGO", SqlDbType.DateTime);
            cmd.Parameters["@FH_PAGO"].Value = txtFecha.Text;

            cmd.Parameters.Add("@NB_COMENTARIOS", SqlDbType.VarChar, 250);
            cmd.Parameters["@NB_COMENTARIOS"].Value = txtComentarios.Text;

            cmd.Parameters.Add("@CD_USUARIO", SqlDbType.Int);
            cmd.Parameters["@CD_USUARIO"].Value = Session["usuarioID"].ToString();

            cmd.Parameters.Add("@Resultado", SqlDbType.VarChar, 50);
            cmd.Parameters["@Resultado"].Direction = ParameterDirection.Output;

            Cnn.Open();

            cmd.ExecuteReader();

            valResultado = Convert.ToInt32(cmd.Parameters["@Resultado"].Value.ToString());

            if (valResultado == 0)
            {
                lblResultado.Text = "El pago se registro correctamente";
                lblResultado.Visible = true;
                limpiaControles();
                pnlControles.Visible = false;

            }
            else
            {
                lblResultado.Visible = true;
                lblResultado.Text = "Error al insertar el pago, contacte a su Administrador";
            }
        }
        catch (SqlException ex)
        {
            sError = ex.Number + "-" + ex.Message;
        }
        catch (Exception ex)
        {
            sError = ex.Source + "-" + ex.Message;
        }
        finally
        {
            if ((Cnn != null))
            {
                if (Cnn.State == ConnectionState.Open)
                {
                    Cnn.Close();
                    //cerrar conexion
                    Cnn = null;
                    //destruir objeto
                }
            }
        }
    }

    protected void lstFormasPago_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (lstFormasPago.SelectedValue.ToString() == "3")
        {
            txtReferencia.Enabled = true;
            lstBancos.DataBind();
            lstBancos.Enabled = true;
        }
        else {
            txtReferencia.Text = "";
            txtReferencia.Enabled = false;
            lstBancos.Items.Clear();
            lstBancos.Enabled = false;
        }
    }
    

    protected void getTipoCambio(int baseMoneda, int cambioMoneda,string fecha)
    {
        string connString = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
        SqlConnection Cnn = new SqlConnection(connString);
        string sError = null;
        

        try
        {
            //Cnn = new SqlConnection(cstrConnectBD);
            SqlCommand cmd = new SqlCommand("get_buscaTiposCambioXParametros", Cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@monedaBase", SqlDbType.Int);
            cmd.Parameters["@monedaBase"].Value = baseMoneda;

            cmd.Parameters.Add("@monedaCambio", SqlDbType.Int);
            cmd.Parameters["@monedaCambio"].Value = cambioMoneda;

            cmd.Parameters.Add("@fecha", SqlDbType.DateTime);
            cmd.Parameters["@fecha"].Value = fecha;

            Cnn.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblTC.Visible = true;
                lblTC0.Visible = true;
                lblTC.Text = reader[1].ToString();
                txtTC.Enabled = true;
                txtTC.Text = reader[1].ToString();
            }
            else 
            {
                lblTC.Visible = false;
                lblTC0.Visible = false;
                lblTC.Text = "";
                txtTC.Enabled = false;
                
            }

            reader.Close();
            
        }
        catch (SqlException ex)
        {
            lblTC.Visible = false;
            lblTC0.Visible = false;
            lblTC.Text = "";
            txtTC.Enabled = false;
            txtTC.Text = "";
            sError = ex.Number + "-" + ex.Message;
        }
        catch (Exception ex)
        {
            lblTC.Visible = false;
            lblTC0.Visible = false;
            lblTC.Text = "";
            txtTC.Enabled = false;
            txtTC.Text = "";
            sError = ex.Source + "-" + ex.Message;
        }
        finally
        {
            if ((Cnn != null))
            {
                if (Cnn.State == ConnectionState.Open)
                {
                    Cnn.Close();
                    //cerrar conexion
                    Cnn = null;
                    //destruir objeto
                }
            }
        }      
    }

    protected void cbxFoliosMixtos_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxFoliosMixtos.Checked == true)
        {
            GlobalVars.valFoliosMixtos = 1;
        }
        else
        {
            GlobalVars.valFoliosMixtos = 0;
        }
    }
    
    protected void txtFecha_TextChanged(object sender, EventArgs e)
    {

        getTipoCambio(1, 2, txtFecha.Text.ToString());

    }   
    protected void dgvClientes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //GridViewRow row = e.Row;
        if (lstSucBusqueda.SelectedValue.ToString() == "0")
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                lblSuc_Aux.Text = e.Row.Cells[3].Text;
                DropDownList dropdown = e.Row.FindControl("lstSucAsigna") as DropDownList;
                if (dropdown != null)
                {
                    dropdown.DataBind();
                    lblSuc_Aux.Text = "";
                    e.Row.Cells[3].Visible = false;
                }
            }             
        }        
    }    
}


