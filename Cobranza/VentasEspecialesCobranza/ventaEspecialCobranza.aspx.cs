using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cobranza_VentasEspecialesCobranza_ventaEspecialCobranza : System.Web.UI.Page
{
    private static int NUMFUNCION = 69;

    public static string valorOld;
    public static double isFirst = 0;
    public static string color;
    public static string colorNew;
    public static int iColor = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

    }

    protected void gvDocDestino_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string[] coloresArr = new string[2];
        coloresArr[0] = "#D8D8D8";
        coloresArr[1] = "#FAFAFA";

        string valor;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl = (Label)e.Row.FindControl("Label5");
            //valor = double.Parse(lbl.Text);
            valor = lbl.Text;
            if (isFirst == 0)
            {
                valorOld = lbl.Text;
                color = coloresArr[iColor];
                isFirst = 1;
            }

            if (valor == valorOld)
            {
                e.Row.BackColor = Color.FromName(color);
                valorOld = valor;
            }
            else
            {
                iColor = iColor + 1;
                if (iColor > 1)
                {
                    iColor = 0;
                }
                color = coloresArr[iColor];
                e.Row.BackColor = Color.FromName(color);
                valorOld = valor;
            }
        }
    }
}