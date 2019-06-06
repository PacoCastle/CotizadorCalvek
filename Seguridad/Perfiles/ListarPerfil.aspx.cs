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

public partial class Seguridad_Perfiles_ListarPerfil : System.Web.UI.Page
{
    private static int NUMFUNCION = 6;

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
        ObjectDataSource2.DataBind();
        ObjectDataSource2.Select();

        GridView1.EmptyDataText = "No se encontro el registro.";
        GridView1.DataSourceID = "ObjectDataSource2";
    }
    protected void ObjectDataSource2_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (txtNombreP.Text.Equals(""))
        {
            ObjectDataSource2.SelectParameters["nombre"].DefaultValue = "%";
        }
    }
}
