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

public partial class Admin_SeguimientoPedidos_Default : System.Web.UI.Page
{
    private static int NUMFUNCION = 24;  
    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //lblCodigoProducto.Visible = true;
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Update")
        {

            DataKey data = GridView2.DataKeys[Convert.ToInt32(e.CommandArgument)];

            SqlDataSource1.UpdateParameters[0].DefaultValue = data.Values["oficinaID"].ToString(); // Sucursal
            SqlDataSource1.UpdateParameters[1].DefaultValue = data.Values["ID_PRODUCTO"].ToString(); // Cliente
            SqlDataSource1.UpdateParameters[2].DefaultValue = data.Values["cidmovim01"].ToString(); // Sucursal
            SqlDataSource1.UpdateParameters[3].DefaultValue = data.Values["cfolio"].ToString(); // Cliente            
            //SqlDataSource1.UpdateParameters[4].DefaultValue = ((TextBox)GridView2.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("fecha_Entrega")).Text.Trim(); // Fecha Pago
            SqlDataSource1.UpdateParameters[4].DefaultValue = ((TextBox)GridView2.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("fecha_Confirmada")).Text.Trim(); // Fecha Pago
            
           

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
