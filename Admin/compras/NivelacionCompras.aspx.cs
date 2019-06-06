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

public partial class OrdenesCompra_NivelacionCompras : System.Web.UI.Page
{
    private static int NUMFUNCION = 54;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);            
        }       
    }
    protected void dgvMCNivelacionSLP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = dgvMCNivelacionSLP.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsMCNivelacionSLP.UpdateParameters[0].DefaultValue = data.Values["CD_Almacen"].ToString();
            sdsMCNivelacionSLP.UpdateParameters[1].DefaultValue = "002";
            sdsMCNivelacionSLP.UpdateParameters[2].DefaultValue = data.Values["CD_Prod"].ToString();
            sdsMCNivelacionSLP.UpdateParameters[3].DefaultValue = data.Values["NU_COMPRA_Ant"].ToString();
            sdsMCNivelacionSLP.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionSLP.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtCompra_Mod")).Text.Trim();
            sdsMCNivelacionSLP.UpdateParameters[5].DefaultValue = ((TextBox)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionSLP.UpdateParameters[6].DefaultValue = ((DropDownList)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("ddlVigencia")).SelectedValue;
            sdsMCNivelacionSLP.UpdateParameters[7].DefaultValue = ((TextBox)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("txtMotivo_Vig")).Text.Trim();
            sdsMCNivelacionSLP.UpdateParameters[8].DefaultValue = ((DropDownList)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("ddlStSeguridad")).SelectedValue;
            sdsMCNivelacionSLP.UpdateParameters[9].DefaultValue = Session["usuarioID"].ToString();

            //sdsMCNivelacion.Update();
            //dgvMCNivelacionSLP.DataBind();

        }
    }
    protected void dgvMCNivelacionQRO_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = dgvMCNivelacionQRO.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsMCNivelacionQRO.UpdateParameters[0].DefaultValue = data.Values["CD_Almacen"].ToString();
            sdsMCNivelacionQRO.UpdateParameters[1].DefaultValue = "003";
            sdsMCNivelacionQRO.UpdateParameters[2].DefaultValue = data.Values["CD_Prod"].ToString();
            sdsMCNivelacionQRO.UpdateParameters[3].DefaultValue = data.Values["NU_COMPRA_Ant"].ToString();
            //sdsMCNivelacion.UpdateParameters[3].DefaultValue = ((Label)dgvMCNivelacionSLP.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("lbl")).Text.Trim();
            //sdsMCNivelacion.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionQRO.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionQRO.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtCompra_Mod")).Text.Trim();
            sdsMCNivelacionQRO.UpdateParameters[5].DefaultValue = ((TextBox)dgvMCNivelacionQRO.Rows[dgvMCNivelacionQRO.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionQRO.UpdateParameters[6].DefaultValue = ((DropDownList)dgvMCNivelacionQRO.Rows[dgvMCNivelacionQRO.EditIndex].FindControl("ddlVigencia")).SelectedValue;
            sdsMCNivelacionQRO.UpdateParameters[7].DefaultValue = ((TextBox)dgvMCNivelacionQRO.Rows[dgvMCNivelacionQRO.EditIndex].FindControl("txtMotivo_Vig")).Text.Trim();
            sdsMCNivelacionQRO.UpdateParameters[8].DefaultValue = ((DropDownList)dgvMCNivelacionQRO.Rows[dgvMCNivelacionQRO.EditIndex].FindControl("ddlStSeguridad")).SelectedValue;
            sdsMCNivelacionQRO.UpdateParameters[9].DefaultValue = Session["usuarioID"].ToString();
        }

    }
    protected void dgvMCNivelacionCEL_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = dgvMCNivelacionCEL.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsMCNivelacionCEL.UpdateParameters[0].DefaultValue = data.Values["CD_Almacen"].ToString();
            sdsMCNivelacionCEL.UpdateParameters[1].DefaultValue = "004";
            sdsMCNivelacionCEL.UpdateParameters[2].DefaultValue = data.Values["CD_Prod"].ToString();
            sdsMCNivelacionCEL.UpdateParameters[3].DefaultValue = data.Values["NU_COMPRA_Ant"].ToString();
            //sdsMCNivelacion.UpdateParameters[3].DefaultValue = ((Label)dgvMCNivelacionSLP.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("lbl")).Text.Trim();
            //sdsMCNivelacion.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionCEL.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionCEL.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtCompra_Mod")).Text.Trim();
            sdsMCNivelacionCEL.UpdateParameters[5].DefaultValue = ((TextBox)dgvMCNivelacionCEL.Rows[dgvMCNivelacionCEL.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionCEL.UpdateParameters[6].DefaultValue = ((DropDownList)dgvMCNivelacionCEL.Rows[dgvMCNivelacionCEL.EditIndex].FindControl("ddlVigencia")).SelectedValue;
            sdsMCNivelacionCEL.UpdateParameters[7].DefaultValue = ((TextBox)dgvMCNivelacionCEL.Rows[dgvMCNivelacionCEL.EditIndex].FindControl("txtMotivo_Vig")).Text.Trim();
            sdsMCNivelacionCEL.UpdateParameters[8].DefaultValue = ((DropDownList)dgvMCNivelacionCEL.Rows[dgvMCNivelacionCEL.EditIndex].FindControl("ddlStSeguridad")).SelectedValue;
            sdsMCNivelacionCEL.UpdateParameters[9].DefaultValue = Session["usuarioID"].ToString();
        }
    }
    protected void dgvMCNivelacionIRA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = dgvMCNivelacionIRA.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsMCNivelacionIRA.UpdateParameters[0].DefaultValue = data.Values["CD_Almacen"].ToString();
            sdsMCNivelacionIRA.UpdateParameters[1].DefaultValue = "009";
            sdsMCNivelacionIRA.UpdateParameters[2].DefaultValue = data.Values["CD_Prod"].ToString();
            sdsMCNivelacionIRA.UpdateParameters[3].DefaultValue = data.Values["NU_COMPRA_Ant"].ToString();
            //sdsMCNivelacion.UpdateParameters[3].DefaultValue = ((Label)dgvMCNivelacionSLP.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("lbl")).Text.Trim();
            //sdsMCNivelacion.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionSLP.Rows[dgvMCNivelacionSLP.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionIRA.UpdateParameters[4].DefaultValue = ((TextBox)dgvMCNivelacionIRA.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtCompra_Mod")).Text.Trim();
            sdsMCNivelacionIRA.UpdateParameters[5].DefaultValue = ((TextBox)dgvMCNivelacionIRA.Rows[dgvMCNivelacionIRA.EditIndex].FindControl("txtMotivo")).Text.Trim();
            sdsMCNivelacionIRA.UpdateParameters[6].DefaultValue = ((DropDownList)dgvMCNivelacionIRA.Rows[dgvMCNivelacionIRA.EditIndex].FindControl("ddlVigencia")).SelectedValue;
            sdsMCNivelacionIRA.UpdateParameters[7].DefaultValue = ((TextBox)dgvMCNivelacionIRA.Rows[dgvMCNivelacionIRA.EditIndex].FindControl("txtMotivo_Vig")).Text.Trim();
            sdsMCNivelacionIRA.UpdateParameters[8].DefaultValue = ((DropDownList)dgvMCNivelacionIRA.Rows[dgvMCNivelacionIRA.EditIndex].FindControl("ddlStSeguridad")).SelectedValue;
            sdsMCNivelacionIRA.UpdateParameters[9].DefaultValue = Session["usuarioID"].ToString();
        }
    }
  
    protected void lstPlazas_SelectedIndexChanged(object sender, EventArgs e)
    {   
        
      
        string a = lstAlmacen.SelectedValue.ToString();
        string b = lstPlazas.SelectedValue.ToString();
        string c = lstMarcas.SelectedValue.ToString();
        string d = txtProductoBus.Text.ToString();
        string r = lstaCompra.SelectedValue.ToString();

        lstMarcas.DataBind();
        txtProductoBus.Text = "";
        setGridInfo(lstPlazas.SelectedValue.ToString());
    }
    protected void lstMarcas_SelectedIndexChanged(object sender, EventArgs e)
    {
        setGridInfo(lstPlazas.SelectedValue.ToString());
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        setGridInfo(lstPlazas.SelectedValue.ToString());
    }
    protected void setGridInfo(string Plaza)   {

        lblEstatusJob.Text = "";
        if (Plaza == "002")
        {
            dgvMCNivelacionSLP.DataBind();
            pnlCEL.Visible = false;
            pnlIRA.Visible = false;
            pnlSLP.Visible = true;
            pnlQRO.Visible = false;

        }
        else if (Plaza == "003")
        {
            dgvMCNivelacionQRO.DataBind();
            pnlCEL.Visible = false;
            pnlIRA.Visible = false;
            pnlSLP.Visible = false;
            pnlQRO.Visible = true;
        }
        else if (Plaza == "004")
        {
            dgvMCNivelacionCEL.DataBind();
            pnlCEL.Visible = true;
            pnlIRA.Visible = false;
            pnlSLP.Visible = false;
            pnlQRO.Visible = false;
        }
        else if (Plaza == "009")
        {
            dgvMCNivelacionIRA.DataBind();
            pnlCEL.Visible = false;
            pnlIRA.Visible = true;
            pnlSLP.Visible = false;
            pnlQRO.Visible = false;
        }
    }


    protected void btnRunJob_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
        SqlConnection Cnn = new SqlConnection(connString);
        //SqlDataReader rdr = new SqlDataReader;
        string sError = null;
        try
        {
            SqlCommand cmd = new SqlCommand("run_Job_byName", Cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@NB_JobName", SqlDbType.VarChar, 100);
            cmd.Parameters["@NB_JobName"].Value = "Nivelacion Almacenes Final";

            cmd.Parameters.Add("@result", SqlDbType.Int);
            cmd.Parameters["@result"].Direction = ParameterDirection.Output;
            
            Cnn.Open();
            cmd.ExecuteNonQuery();           

            if (Convert.ToInt16(cmd.Parameters["@result"].Value.ToString()) == 1)
            {
                lblEstatusJob.Text = "Job en ejecucion...";
            }
            else if (Convert.ToInt16(cmd.Parameters["@result"].Value.ToString()) == 0)
                lblEstatusJob.Text = "Ejecucion iniciada...";
          
        }
        catch (SqlException ex)
        {
            sError = ex.Number + "-" + ex.Message;
            lblEstatusJob.Text = sError + " Favor de reportar al depto de Sistemas";
        }
        catch (Exception ex)
        {
            sError = ex.Source + "-" + ex.Message;
            lblEstatusJob.Text = sError + " Favor de reportar al depto de Sistemas";
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
}
