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

public partial class ActualizaStatusProductosKepler : System.Web.UI.Page
{
    private static int NUMFUNCION = 59;  
    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }
    protected void gvProductosKepler_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = gvProductosKepler.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsEstatusProductosKepler.UpdateParameters[0].DefaultValue = data.Values["CD_PRODUCTO"].ToString();
            sdsEstatusProductosKepler.UpdateParameters[1].DefaultValue = ((DropDownList)gvProductosKepler.Rows[gvProductosKepler.EditIndex].FindControl("ddlEstatus")).SelectedValue;
            sdsEstatusProductosKepler.UpdateParameters[2].DefaultValue = Session["usuarioID"].ToString();
        }
    }
}
