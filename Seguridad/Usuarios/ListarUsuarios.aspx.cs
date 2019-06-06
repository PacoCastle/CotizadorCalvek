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

public partial class Seguridad_Usuarios_ListarUsuarios : System.Web.UI.Page
{
    private static int NUMFUNCION = 2;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ObjectDataSource3.DataBind();
        ObjectDataSource3.Select();

        GridView1.EmptyDataText = "No se encontro el registro.";
        GridView1.DataSourceID = "ObjectDataSource3";
        //Mensaje01.Text = "si entra aquin";
        //GridView1.DataBind();
    }
    protected void ObjectDataSource3_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (txtNombre.Text.Equals(""))
        {
            //txtNombre.Text = "%";
            ObjectDataSource3.SelectParameters["login"].DefaultValue = "%";
        }
        if(txtUsuarioId.Text.Equals(""))
        {
            //txtUsuarioId.Text = "%";
            ObjectDataSource3.SelectParameters["nombre"].DefaultValue = "%";
        }
    }

}
