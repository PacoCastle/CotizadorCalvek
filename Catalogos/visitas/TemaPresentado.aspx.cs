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
    
    protected void GridViewInsert(object  sender, EventArgs e)
    {
        TextBox nombre = (TextBox)gvwSolicitudApoyo.FooterRow.FindControl("nombre");
        
        //TextBox nombre = (TextBox)gvwDepartamentos.FindControl("nombre");
        if (nombre!=null)
            {
                if (nombre.Text.Trim().Length > 0)
                    {
                    sdsTemaPresentadoVisitas.InsertParameters[0].DefaultValue = nombre.Text.ToUpper();
                    sdsTemaPresentadoVisitas.Insert();
                    lblMensaje.Text = "Alta exitosa";
                    lblMensaje2.Text = lblMensaje.Text;
                    nombre.Dispose();
                    }
            }
    }

   protected void  GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
   {
       if (e.CommandName == "EmptyInsert")
          {
           TextBox nombre = gvwSolicitudApoyo.Controls[0].Controls[0].FindControl("nombre") as TextBox;
           //lblMensaje2.Text = string.Format("haz insertado Nombre : <b>{0}</b> para el emptydatatemplate", nombre.Text);
           if (nombre != null)
             {
               if (nombre.Text.Trim().Length > 0)
               {
                   sdsTemaPresentadoVisitas.InsertParameters[0].DefaultValue = nombre.Text.ToUpper();
                   sdsTemaPresentadoVisitas.Insert();
                   lblMensaje.Text = "Alta exitosa";
                   lblMensaje2.Text = lblMensaje.Text;
               }
               nombre.Dispose();
             }
          }
   }

}
