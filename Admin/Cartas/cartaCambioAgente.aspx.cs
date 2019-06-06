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

public partial class Admin_Cartas_cartaCambioAgente : System.Web.UI.Page
{
    private static int NUMFUNCION = 28;

    protected void Page_Load(object sender, EventArgs e)
    {

        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        lblcliente.Text = Request["nombreCliente"].ToString();

        usuarioVO usVO= new usuarioVO();
        UsuarioBL usBL = new UsuarioBL();

        usVO.Usuarioid = Int32.Parse(Request["Agente"].ToString());
        usVO.Operacion = usuarioVO.BUSCAR;


        
        usVO = (usuarioVO)usBL.execute(usVO);
        if (usVO.Resultado == 0)
            {
                lblUnidadNegocioAgente.Text = usVO.Oficina_nombre.ToUpper();
                lblAtencion.Text = usVO.Usuario_nombrecompleto.ToUpper();
            }

        DateTime dt=DateTime.Now;

        // Get year, month, and day
        int year=dt.Year;
        int month=dt.Month;
        int day=dt.Day;

        lblFecha.Text = day.ToString() + "/" + Right("00"+month.ToString(),2) + "/" + year.ToString();

    }

    static string Right(string s, int count)
    {
        string newString = String.Empty;
        if (s != null && count > 0)
        {
            int startIndex = s.Length - count;
            if (startIndex > 0)
                newString = s.Substring(startIndex, count);
            else
                newString = s;
        }
        return newString;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    //if(e.Row.RowType==DataControlRowType.DataRow)
    //    {
    //        if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
    //                {
    //                    String strInstruccion = DataBinder.Eval(e.Row.DataItem, "agenteAnterior").ToString();
    //                    lblAgenteAnterior.Text = strInstruccion;
    //                    String strUnidadNegocio = DataBinder.Eval(e.Row.DataItem, "unidadnegocio").ToString();
    //                    lblUnidadNegocioAnterior.Text = strUnidadNegocio;
                
    //            }
    //    }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
        //    {
        //        String strInstruccion = DataBinder.Eval(e.Row.DataItem, "Agente").ToString();
        //        lblAgenteAnterior.Text = strInstruccion;

        //        //unidad_negocio
        //    }
        //}
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
