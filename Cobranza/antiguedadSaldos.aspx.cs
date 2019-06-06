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

public partial class Cobranza_estatusCobranza : System.Web.UI.Page
{
    //
    private static int NUMFUNCION = 46;

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

        int i=0;
        lblTmpEstaCobranza.Text = "";

        if (ckblstEstatusCobranza.Items.Count > 0)
            {
            for (i = 0; i <= ckblstEstatusCobranza.Items.Count - 1; i++)
                {
                if(ckblstEstatusCobranza.Items[i].Selected)
                    {
                        if (ckblstEstatusCobranza.Items[i].Text == "MOROSO")
                            {
                                lblTmpEstaCobranza.Text = ",MOROSO,MOROSO PARCIAL,";
                            }
                        else 
                            {
                        //lblTmpEstaCobranza.Text += ","+lblTmpEstaCobranza.Text + ckblstEstatusCobranza.Items[i].Text+",";
                        lblTmpEstaCobranza.Text += lblTmpEstaCobranza.Text + "," + ckblstEstatusCobranza.Items[i].Text + ",";
                        }                        
                    }
                }
                for (i = 0; i <= ckblstEstatusCobranzaOtros.Items.Count - 1; i++)
                {
                    if (ckblstEstatusCobranzaOtros.Items[i].Selected)
                    {
                        lblTmpEstaCobranza.Text += "," + ckblstEstatusCobranzaOtros.Items[i].Text + ",";
                    }
                }
            }

       
        //lblTmpEstaCobranza.Text = lblTmpEstaCobranza.Text.Substring(0, (lblTmpEstaCobranza.Text.Length - 1));
    }

    Double Total_1a30 = 0.0;

    public String sumaTotal_1a30(String strValor)
    {
        Double monto = 0.0;
        monto = double.Parse(strValor);
        Total_1a30 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

    Double Total_31a45 = 0.0;

    public String sumaTotal_31a45(String strValor)
    {
        Double monto = 0.0;
        monto = Double.Parse(strValor);
        Total_31a45 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

    Double Total_46a60 = 0.0;

    public String sumaTotal_46a60(String strValor)
    {
        Double monto = 0.0;
        monto = Double.Parse(strValor);
        Total_46a60 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

    Double Total_61a90 = 0.0;

    public String sumaTotal_61a90(String strValor)
    {
        Double monto = 0.0;
        monto = Double.Parse(strValor);
        Total_61a90 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

    Double Total_91a120 = 0.0;

    public String sumaTotal_91a120(String strValor)
    {
        Double monto = 0.0;
        monto = Double.Parse(strValor);
        Total_91a120 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

    Double Total_121a150 = 0.0;

    public String sumaTotal_121a150(String strValor)
    {
        Double monto = 0.0;
        monto = Double.Parse(strValor);
        Total_121a150 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

    Double Total_mas150 = 0.0;

    public String sumaTotal_mas150(String strValor)
    {
        Double monto = 0.0;
        monto = Double.Parse(strValor);
        Total_mas150 += monto;
        return String.Format("{0:#,##0.00}", monto);
    }

//----------------------------

    public String getTotal_1a30()
    {
        return String.Format("{0:#,##0.00}", Total_1a30);
    }

    public String getTotal_31a45()
    {
        return String.Format("{0:#,##0.00}", Total_31a45);
    }

    public String getTotal_46a60()
    {
        return String.Format("{0:#,##0.00}", Total_46a60);
    }

    public String getTotal_61a90()
    {
        return String.Format("{0:#,##0.00}", Total_61a90);
    }

    public String getTotal_91a120()
    {
        return String.Format("{0:#,##0.00}", Total_91a120);
    }

    public String getTotal_121a150()
    {
        return String.Format("{0:#,##0.00}", Total_121a150);
    }

    public String getTotal_mas150()
    {
        return String.Format("{0:#,##0.00}", Total_mas150);
    }

    public String getTotal_total()
    {
        return String.Format("{0:#,##0.00}", (Total_1a30 + Total_mas150 + Total_31a45 + Total_46a60 + Total_61a90 + Total_91a120 + Total_121a150 + Total_mas150));
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
            {
                e.Row.Cells.RemoveAt(9);
                e.Row.Cells.RemoveAt(8);
                e.Row.Cells.RemoveAt(7);
                e.Row.Cells.RemoveAt(6);
                e.Row.Cells.RemoveAt(5);
                e.Row.Cells.RemoveAt(4);
                e.Row.Cells.RemoveAt(3);
                e.Row.Cells.RemoveAt(2);
                e.Row.Cells.RemoveAt(1);
                e.Row.Cells[0].ColumnSpan = 10;
         
            }
        //}
    }



    protected void lstAgentes_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
