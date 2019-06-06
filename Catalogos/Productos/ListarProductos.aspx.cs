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

public partial class Catalogos_Productos_ListarProductos : System.Web.UI.Page
{
    private static int NUMFUNCION = 11;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }

    /*
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        
        if (!txtNombre.Text.Equals(""))
        {
            txtNombre.Text = "%" + txtNombre.Text + "%";
            //ObjectDataSource3.SelectParameters["login"].DefaultValue = "%";
        }
        if (!txtDescripcion.Text.Equals(""))
        {
            txtDescripcion.Text = "%" + txtDescripcion.Text + "%";
            //ObjectDataSource3.SelectParameters["nombre"].DefaultValue = "%";
        }
         
    }
    */


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Enabled = true;
        GridView1.Visible = true;
    }
}
