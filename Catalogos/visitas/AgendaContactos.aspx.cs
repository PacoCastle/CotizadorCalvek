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

public partial class Catalogos_visitas_Departamentos : System.Web.UI.Page
{
    private static int NUMFUNCION = 36;
    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD Acceso a Visitas Ventas
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }
  


}
