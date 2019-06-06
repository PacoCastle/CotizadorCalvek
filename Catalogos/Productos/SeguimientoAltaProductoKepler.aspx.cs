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

public partial class Catalogos_Productos_SeguimientoAltaProductoKepler : System.Web.UI.Page
{
    private static int NUMFUNCION = 50;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        

        if (e.CommandName == "Update")
        {
            DataKey data = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsProductosPendientes.UpdateParameters[0].DefaultValue = data.Values["Clave"].ToString();
            sdsProductosPendientes.UpdateParameters[1].DefaultValue = ((TextBox)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("Descripcion")).Text.Trim();
            sdsProductosPendientes.UpdateParameters[2].DefaultValue = ((DropDownList)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("ClaveMarca")).SelectedValue.ToString();
            sdsProductosPendientes.UpdateParameters[3].DefaultValue = ((DropDownList)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("ClaveUnidadMedida")).SelectedValue.ToString();
            sdsProductosPendientes.UpdateParameters[4].DefaultValue = ((DropDownList)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("Moneda")).SelectedValue.ToString();
            sdsProductosPendientes.UpdateParameters[5].DefaultValue = ((TextBox)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("PrecioListaProveedor")).Text.Trim();
            sdsProductosPendientes.UpdateParameters[6].DefaultValue = ((CheckBox)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("banderaImportacion")).Checked.ToString();
            sdsProductosPendientes.UpdateParameters[7].DefaultValue = Session["usuarioID"].ToString();

        }
            
    }
    protected void imgbtn_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
        //lblProductoId.Text = GridView1.DataKeys[gvrow.RowIndex].Value.ToString();
        lblProductoId.Text = gvrow.Cells[1].Text;
        this.btnPopUp_ModalPopupExtender.Show();
    }
    protected void sdsProductosPendientes_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        System.Text.StringBuilder message = new System.Text.StringBuilder();
        message.Append(e.Command.Parameters["@msgDelete"].Value.ToString());
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + message + "');", true);
        
    }  

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        btnPopUp_ModalPopupExtender.Hide();
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        
        sdsProductosPendientes.DeleteParameters[0].DefaultValue = lblProductoId.Text;
        sdsProductosPendientes.DeleteParameters[1].DefaultValue = txtMotivoBaja.Text;
        sdsProductosPendientes.DeleteParameters[2].DefaultValue = Session["UsuarioId"].ToString();
        sdsProductosPendientes.Delete();
        txtMotivoBaja.Text = "";
        this.btnPopUp_ModalPopupExtender.Hide();
    }

   
}
