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

public partial class VisitasVentas_listadoVisitas : System.Web.UI.Page
{
    private static int NUMFUNCION = 39;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD Acceso a Visitas Ventas
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }



        if(!Page.IsPostBack)
        {
            try
            {
                lblUsuario.Text = Session["usuarioID"].ToString();
            }
            catch (Exception ee)
            {
                Response.Redirect("~/Seguridad/Login.aspx");
            }

            Boolean blnPerfilAdministradorVisitas = false;
            Boolean blnPerfilSupervisorVisitas = false;
            Boolean blnPerfilAgenteVisitas = false;

            // determinar si el usuario tiene los permisos como administrador de Visitas Ventas.
            String error2 = Utilis.validaPermisos(Session, 36);
            if (error2.Equals(""))
            {
                blnPerfilAdministradorVisitas = true;
                lblEtiquetaAgentes.Visible = true;
                lstAgentes.Visible = true;
                ObjectDataSource2.EnableViewState = true;
                //lblUsuario.Text = "-1";
            }

            // determinar si el usuario tiene los permisos como supervisor de Visitas Ventas.
            error2 = Utilis.validaPermisos(Session, 37);
            if (error2.Equals(""))
            {
                blnPerfilSupervisorVisitas = true;
                lblEtiquetaAgentes.Visible = true;
                lstAgentes.Visible = true;
                ObjectDataSource2.EnableViewState = true;
            }

            // determinar si el usuario tiene los permisos como Agente de Visitas Ventas.
            error2 = Utilis.validaPermisos(Session, 38);
            if (error2.Equals(""))
            {
                blnPerfilAgenteVisitas = true;
            }
        }
      
    }

    protected void lstAgentes_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblUsuario.Text = lstAgentes.SelectedItem.Value;
    }


    protected void GridView1_rowCommand(Object sender, GridViewCommandEventArgs e)
    {

    }

}
