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

public partial class Seguridad_Usuarios_CambioContrasena : System.Web.UI.Page
{
    private static int NUMFUNCION = 3;

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
        int usuarioId = 0;
        usuarioVO VO = new usuarioVO();
        UsuarioBL BL = new UsuarioBL();

        if (!txtPassword.Text.Equals(txtConformaPaswword.Text))
        {
            Label2.Text = "El password no coincide.";
        }
        else
        {
            if (Request["usuarioId"] != null)
            {
                usuarioId = Int32.Parse(Request["usuarioId"]);
                VO.ActualizarPassword = 1;
                VO.Usuario_contrasena = txtPassword.Text;
                VO.Usuarioid = usuarioId;
                VO.Operacion = usuarioVO.CAMBIARPASSWORD;

                VO = (usuarioVO)BL.execute(VO);
                if (VO.Resultado == 0)
                {
                    Label2.Text = "El password se cambio correctamente <br><a href='javascript:window.close();'>Cerrar</a>";
                }
                else
                {
                    Label2.Text = "El password NO se cambio correctamente. Intentalo mas tarde";
                }
            }
        }
    }
}
