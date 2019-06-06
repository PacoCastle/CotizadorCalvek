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

public partial class Cobranza_Depositos_AplicacionDepositos : System.Web.UI.Page
{
    private static int NUMFUNCION = 19;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtFecha.Text = Calendar1.SelectedDate.Date.ToString("d");
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "ObjectDataSource3";
    }
}
