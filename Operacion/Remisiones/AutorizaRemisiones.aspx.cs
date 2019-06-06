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
using System.Drawing;
using System.Data.SqlClient;

public partial class Operacion_AutorizaRemisiones : System.Web.UI.Page
{
    private static int NUMFUNCION = 64;

    protected void Page_Load(object sender, EventArgs e)
    {
        lstAutorizaRemision.Attributes.Add("onchange", "javascript:confirm_message()");
        
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }
    protected void lstAsesores_SelectedIndexChanged(object sender, EventArgs e)
    {
        lstAutorizaRemision.DataBind();
    }
    protected void lstAutorizaRemision_SelectedIndexChanged(object sender, EventArgs e)
    {
        sdsAutoriza.UpdateParameters[2].DefaultValue = lstAsesores.SelectedItem.ToString();
        sdsAutoriza.Update();
    }
}

