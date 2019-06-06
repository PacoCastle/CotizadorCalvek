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

public partial class Error_UsuarioNoValido : System.Web.UI.Page
{
    private static String NOAUTORIZADO = "No esta Autorizado a ver esta pagina.";
    private static String NOGRUPO = "El usuario no tiene asignado un grupo de seguridad.";
    private static String NOSESSION = "El usuario necesita iniciar sesion. <A HREF='../Default.aspx' >Inicio</A>";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["mensaje"].Equals("1"))
        {
            Mensaje01.Text = NOAUTORIZADO;
        }
        else if (Request["mensaje"].Equals("2"))
        {
            Mensaje01.Text = NOGRUPO;
        }
        else if (Request["mensaje"].Equals("3"))
        {
            Mensaje01.Text = NOSESSION;
        }
    }
}
