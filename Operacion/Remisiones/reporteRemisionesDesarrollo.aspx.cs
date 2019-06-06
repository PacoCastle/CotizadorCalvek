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

public partial class Cobranza_reporteRemisiones : System.Web.UI.Page
{
    private static int NUMFUNCION = 46;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        GridViewHelper helper = new GridViewHelper(this.gvReporteRemisiones,true);

        helper.RegisterSummary("TOTAL", SummaryOperation.Sum);
        helper.RegisterSummary("SLP", SummaryOperation.Sum);
        //helper.RegisterSummary("SLP_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("SLP_CC", SummaryOperation.Sum);
        helper.RegisterSummary("QRO", SummaryOperation.Sum);
        //helper.RegisterSummary("QRO_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("QRO_BJ", SummaryOperation.Sum);
        helper.RegisterSummary("CEL", SummaryOperation.Sum);
        //helper.RegisterSummary("CEL_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("CEL_BJ", SummaryOperation.Sum);
        helper.RegisterSummary("IRA", SummaryOperation.Sum);
        //helper.RegisterSummary("IRA_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("IRA_BJ", SummaryOperation.Sum);
        helper.RegisterGroup("negociacion", true, true); //helper.SetSuppressGroup("negociacion");
        helper.RegisterSummary("SLP", SummaryOperation.Sum);
        //helper.RegisterSummary("SLP_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("SLP_CC", SummaryOperation.Sum);
        helper.RegisterSummary("QRO", SummaryOperation.Sum);
        //helper.RegisterSummary("QRO_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("QRO_BJ", SummaryOperation.Sum);
        helper.RegisterSummary("CEL", SummaryOperation.Sum);
        //helper.RegisterSummary("CEL_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("CEL_BJ", SummaryOperation.Sum);
        helper.RegisterSummary("IRA", SummaryOperation.Sum);
        //helper.RegisterSummary("IRA_SA", SummaryOperation.Sum);
        //helper.RegisterSummary("IRA_BJ", SummaryOperation.Sum);
        helper.RegisterSummary("TOTAL", SummaryOperation.Sum, "negociacion");
        helper.GroupHeader += new GroupEvent(helper_GroupHeader);
        helper.GroupSummary += new GroupEvent(helper_Bug);        
        helper.ApplyGroupSort();

    }
   
    private void helper_GroupHeader(string groupName, object[] values, GridViewRow row)
    {
        if (groupName == "negociacion")
        {
            row.BackColor = Color.LightSkyBlue;
            row.Cells[0].Text = "&nbsp;&nbsp;" + row.Cells[0].Text;
        }
        else if (groupName == "moneda")
        {
            row.BackColor = Color.FromArgb(236, 236, 236);
            row.Cells[0].Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + row.Cells[0].Text;
            
        }
    }
    private void helper_Bug(string groupName, object[] values, GridViewRow row)
    {
        if (groupName == null) return;

        row.BackColor = Color.LightSlateGray;
        row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
        row.Cells[0].Text = "[ Total para:  " + groupName + " " + values[0] + " ]";

    }

    protected void gvReporteRemisiones_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[1].Text = "Total general:";
            e.Row.Font.Bold = true;
        }
    }
    protected void gvReporteRemisionesAsesor_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
        {
            e.Row.Cells.RemoveAt(4);
            e.Row.Cells.RemoveAt(3);
            e.Row.Cells.RemoveAt(2);
            e.Row.Cells.RemoveAt(1);
            e.Row.Cells[0].ColumnSpan = 5;
        }
    }
    protected void rblVista_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblVista.SelectedValue.ToString() == "1")
        {
            gvReporteRemisionesDetalle.Visible = false;
            gvReporteRemisiones.Visible = true;
        }
        else if (rblVista.SelectedValue.ToString() == "2")
        {
            gvReporteRemisiones.Visible = false;
            gvReporteRemisionesDetalle.Visible = true;
        }
    }

    
}
