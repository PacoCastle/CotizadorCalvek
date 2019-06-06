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

public partial class OrdenesCompra_reporteTipoOrdenCompra : System.Web.UI.Page
{
    private static int NUMFUNCION = 41;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        int intTipo = Int32.Parse(Request.QueryString["tipo"].ToString());
        int intMonedaId = Int32.Parse(Request.QueryString["monedaId"].ToString());
        String strValor = Request.QueryString["valor"].ToString();
        lblTitulo.Text = ((intTipo == 0) ? "JOB: " : "ORDEN DE SERVICIO: ")+ strValor;
            
        switch (intMonedaId)
        {
            case 1:
               lblTitulo.Text = lblTitulo.Text + " PESOS";
                break;
            case 2:
                lblTitulo.Text = lblTitulo.Text + " DOLARES";
                break;
            case 3:
                lblTitulo.Text = lblTitulo.Text + " EUROS";
                break;

        }

    }
}
