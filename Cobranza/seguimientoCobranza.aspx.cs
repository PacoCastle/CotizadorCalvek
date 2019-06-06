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

public partial class Cobranza_seguimientoCobranza : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        //GridView2.DataSourceID = "sdslistadoCobranzaRangos2";

        sdslistadoCobranzaRangos.SelectParameters[0].DefaultValue = " ";
        sdslistadoCobranzaRangos.SelectParameters[1].DefaultValue = lstSucursal.SelectedValue.ToString();
        sdslistadoCobranzaRangos.SelectParameters[2].DefaultValue = lstAgente.SelectedValue.ToString();

        sdslistadoCobranzaRangos.Select(new DataSourceSelectArguments());
        GridView2.DataBind();

    }

    protected void gvCobranza_rowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Actualizar")
        {

            sdslistadoCobranzaRangos.UpdateParameters[0].DefaultValue = GridView2.DataKeys[GridView2.EditIndex][0].ToString().Trim(); // Sucursal
            sdslistadoCobranzaRangos.UpdateParameters[1].DefaultValue = GridView2.DataKeys[GridView2.EditIndex][1].ToString().Trim(); // Cliente
            sdslistadoCobranzaRangos.UpdateParameters[2].DefaultValue = GridView2.DataKeys[GridView2.EditIndex][2].ToString().Trim(); // Folio
            sdslistadoCobranzaRangos.UpdateParameters[3].DefaultValue = ((CheckBox)GridView2.Rows[GridView2.EditIndex].FindControl("Recepcion")).Checked.ToString(); // Bandera Recepción
            sdslistadoCobranzaRangos.UpdateParameters[4].DefaultValue = ((CheckBox)GridView2.Rows[GridView2.EditIndex].FindControl("Revision")).Checked.ToString(); // Bandera Revision
            sdslistadoCobranzaRangos.UpdateParameters[5].DefaultValue = ((CheckBox)GridView2.Rows[GridView2.EditIndex].FindControl("Completo")).Checked.ToString(); // Bandera Revision
        sdslistadoCobranzaRangos.UpdateParameters[6].DefaultValue = Session["usuarioID"].ToString();
        sdslistadoCobranzaRangos.Update();

        GridView2.EditIndex = -1;
        GridView2.DataBind();
            
        }

     }
}
