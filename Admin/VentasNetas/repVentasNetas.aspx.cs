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

public partial class Admin_VentasNetas_repVentasNetas : System.Web.UI.Page
{
    private static int NUMFUNCION = 48;

    protected void Page_Load(object sender, EventArgs e)
    {
        //String error = Utilis.validaPermisos(Session, NUMFUNCION);
        //if (!error.Equals(""))
        //{
        //    Response.Redirect(error);
        //}

        if (!IsPostBack)
        {
            lblAno.Text = DateTime.Now.Year.ToString();
            lblMes.Text = DateTime.Now.Month.ToString();

            lstMes.SelectedValue = DateTime.Now.Month.ToString();
        }
    }

    protected void lstMes_SelectedIndexChanged1(object sender, EventArgs e)
    {
        lblMes.Text = lstMes.SelectedItem.Value.ToString();
    }

    String strCadenaValores = "";
    String strAgenteTmp = "";

    public String armaSecuencia(String Importe, String Agente)
    {
        if (!strAgenteTmp.Equals(Agente))
        {
            strAgenteTmp = Agente;
            strCadenaValores = "";
        }

        strCadenaValores += "," + Importe ;
        //strCadenaValores = strCadenaValores.Substring(strCadenaValores.Length - 1);
        String strInicio = strCadenaValores.Substring(0,1);
        //String strFinal = strCadenaValores.Substring(strCadenaValores.Length - 1);
        if (strInicio.Equals(","))
        {
            strCadenaValores = strCadenaValores.Substring(1, strCadenaValores.Length - 1);
        }

        return strCadenaValores;
    }

}
