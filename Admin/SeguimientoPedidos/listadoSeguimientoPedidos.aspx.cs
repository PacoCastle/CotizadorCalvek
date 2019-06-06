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

public partial class Admin_SeguimientoPedidos_listadoSeguimientoPedidos : System.Web.UI.Page
{

    private static int NUMFUNCION = 22;
    private static int NUMFUNCION2 = 24;
    private static int NUMFUNCION3 = 25;
    private static int NUMFUNCION4 = 26;
    private static int NUMFUNCION5 = 27;

    protected void Page_Load(object sender, EventArgs e)
    {

        //Response.AddHeader("REFRESH", "300"); // se refresca la pagina cada 5 min

        // // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        String error2 = Utilis.validaPermisos(Session, NUMFUNCION2);
        String error3 = Utilis.validaPermisos(Session, NUMFUNCION3);
        String error4 = Utilis.validaPermisos(Session, NUMFUNCION4);
        String error5 = Utilis.validaPermisos(Session, NUMFUNCION5);

        if (!error.Equals("") && !error2.Equals("") && !error3.Equals("") && !error4.Equals("") && !error5.Equals(""))
        {
            Response.Redirect(error);
        }
        
      
        //else if ((Utilis.validaPermisos(Session, 24)).Equals(""))
        //{
        //    Response.Redirect(error);
        //}

        InfoSessionVO infoSession;
        infoSession = (InfoSessionVO)Session["InfoSession"];
        if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "1")
        {
            lblCodigoAdmin.Text = " ";
        }
        else
        {
            lblCodigoAdmin.Text = infoSession.getValor(InfoSessionVO.CODIGOUSUARIOADMIN).ToString();
        }

    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        InfoSessionVO infoSession;
        infoSession = (InfoSessionVO)Session["InfoSession"];
        lblCodigoAdmin.Text = infoSession.getValor(InfoSessionVO.CODIGOUSUARIOADMIN).ToString();

        GridView1.DataSourceID = "odsPedidosPendientesBusqueda";

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    if(e.Row.RowType==DataControlRowType.DataRow)
        {
            if (Convert.ToString(DataBinder.Eval(e.Row.DataItem, "color")).Trim().Length >0 )
                {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml(Convert.ToString(DataBinder.Eval(e.Row.DataItem, "color")));
                }
        }

        //switch (e.Row.RowType)
        //{
        //    case DataControlRowType.Header:

        //        e.Row.Cells[8].ColumnSpan = 5;
        //        e.Row.Cells[9].Visible = false;
        //        e.Row.Cells[10].Visible = false;
        //        e.Row.Cells[11].Visible = false;
        //        e.Row.Cells[12].Visible = false;
        //        e.Row.Cells[8].Text = "<table border=0 cellpadding=0 cellspacing=0><tr><td colspan=5>CONTEO PARTIDAS</td></tr><tr><td width=60px>Surtido</td><td width=60px>Compra</td><td width=60px>Traspaso</td><td width=60px>Surtir</td><td width=60px>Total</td></tr></table>";
        //        break;
        //}

    }
}
