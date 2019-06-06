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
        row.ForeColor = Color.White;
        row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
        row.Cells[0].Text = "[ Total para:  " + groupName + " " + values[0] + " ]";

    }

    protected void gvReporteRemisiones_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[1].Text = "Total general:";
            e.Row.Font.Bold = true;
            e.Row.HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;
        }
    }
    protected void rblVista_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblVista.SelectedValue.ToString() == "1")
        {
            gvReporteRemisionesDetalle.Visible = false;
            gvReporteRemisionesBusqueda.Visible = false;
            gvReporteRemisiones.Visible = true;
            txtFolio.Text = "";
            txtParametro.Text = "";
        }
        else if (rblVista.SelectedValue.ToString() == "2")
        {
            gvReporteRemisiones.Visible = false;
            gvReporteRemisionesBusqueda.Visible = false;
            gvReporteRemisionesDetalle.Visible = true;
        }
    }
    double totalDetalles = 0;
    protected void gvReporteRemisionesDetalle_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totalDetalles += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TOTAL_DETALLES"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotal = (Label)e.Row.FindControl("lblTOTALDetalles");
            lblTotal.Text = "TOTAL DETALLES :   " + String.Format("$ {0:#,##0.00}", totalDetalles); 
            
        }

        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
        {
            e.Row.Cells.RemoveAt(4);
            e.Row.Cells.RemoveAt(3);
            e.Row.Cells.RemoveAt(2);
            e.Row.Cells.RemoveAt(1);
            e.Row.Cells[0].ColumnSpan = 5;
        }
    }

    double totalPlaza = 0;
    protected void gvReporteRemisionesAsesor0_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totalPlaza += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TOTAL_PLAZA"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTOTAL_PLAZA = (Label)e.Row.FindControl("lblTOTAL_PLAZA");
            lblTOTAL_PLAZA.Text = "TOTAL PLAZA :   " + String.Format("$ {0:#,##0.00}", totalPlaza);
            e.Row.HorizontalAlign = HorizontalAlign.Center;
            lblTOTAL_PLAZA.ForeColor = Color.White;
            
        }

        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
        {
            e.Row.Cells.RemoveAt(4);
            e.Row.Cells.RemoveAt(3);
            e.Row.Cells.RemoveAt(2);
            e.Row.Cells.RemoveAt(1);
            e.Row.Cells[0].ColumnSpan = 5;
        }
    }
 
    double totalAsesor = 0;
    protected void gvReporteRemisionesAsesor_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totalAsesor += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TOTAL_ASESOR"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTOTAL_ASESOR = (Label)e.Row.FindControl("lblTOTAL_ASESOR");
            lblTOTAL_ASESOR.Text = "TOTAL ASESOR:  " + String.Format("$ {0:#,##0.00}", totalAsesor);
            e.Row.HorizontalAlign = HorizontalAlign.Center;
            lblTOTAL_ASESOR.BackColor = Color.White;
        }

        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
        {
            //e.Row.Cells.RemoveAt(0);
            e.Row.Cells.RemoveAt(1);
            e.Row.Cells.RemoveAt(2);
            e.Row.Cells.RemoveAt(3);
           //e.Row.Cells.RemoveAt(4);
            //e.Row.Cells.RemoveAt(5);
            //e.Row.Cells.RemoveAt(6);
            e.Row.Cells[0].ColumnSpan = 10;
        }
    }
    double totalCliente = 0;
    protected void gvReporteRemisionesCliente_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow){

            totalCliente += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TOTAL_CLIENTE"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTOTAL_CLIENTE = (Label)e.Row.FindControl("lblTOTAL_CLIENTE");
            lblTOTAL_CLIENTE.Text = "TOTAL CLIENTE " + String.Format("$ {0:#,##0.00}", totalCliente);
            e.Row.HorizontalAlign = HorizontalAlign.Center;
            lblTOTAL_CLIENTE.Font.Bold = true;
        }
        //if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
        //{
        //    DataRowView drview = e.Row.DataItem as DataRowView;
        //    DropDownList lstAccionAuditor = (DropDownList)e.Row.FindControl("lstAccionAuditor");
        //    DropDownList lstAccionAsesor = (DropDownList)e.Row.FindControl("lstAccionAsesor");
        //    TextBox txtFecha = (TextBox)e.Row.FindControl("txtFecha");
           
        //    InfoSessionVO infoSession;
        //    infoSession = (InfoSessionVO)Session["InfoSession"];

        //    if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "2")
        //    {
        //        lstAccionAuditor.Enabled = false;
        //        txtFecha.Enabled = false;
        //    }
        //    else if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "24")
        //    {
        //        lstAccionAsesor.Enabled = false;
        //    }            
        //}        
    }
   
    protected void gvReporteRemisionesCliente_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView gv = (GridView)(Object)sender;

        if (e.CommandName == "Update")
        {
            DataKey data = gv.DataKeys[Convert.ToInt32(e.CommandArgument)];
            
            string connString = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
            SqlConnection Cnn = new SqlConnection(connString);
            string sError = null;
            //int valResultado = 0;

            try
            {               
                
                SqlCommand cmd = new SqlCommand("set_insertRemisionesRevision", Cnn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@CD_FOLIO", SqlDbType.VarChar, 7);
                cmd.Parameters["@CD_FOLIO"].Value = data.Values["CD_FOLIO"].ToString();

                cmd.Parameters.Add("@CD_SUCURSAL", SqlDbType.VarChar, 5);
                cmd.Parameters["@CD_SUCURSAL"].Value = data.Values["CD_SUCURSAL"].ToString();

                cmd.Parameters.Add("@CD_PRODUCTO", SqlDbType.VarChar, 65);
                cmd.Parameters["@CD_PRODUCTO"].Value = data.Values["CD_PRODUCTO"].ToString();

                cmd.Parameters.Add("@NU_PARTIDA", SqlDbType.Int);
                cmd.Parameters["@NU_PARTIDA"].Value = data.Values["NU_PARTIDA"].ToString();

                cmd.Parameters.Add("@CD_ESTATUS", SqlDbType.Int);
                cmd.Parameters["@CD_ESTATUS"].Value = ((DropDownList)gv.Rows[gv.EditIndex].FindControl("lstEstatus")).SelectedValue;

                
                string a = ((TextBox)gv.Rows[gv.EditIndex].FindControl("txtFecha")).Text;
                if (a != "")
                {
                    cmd.Parameters.Add("@FH_PLAZO", SqlDbType.DateTime);
                    cmd.Parameters["@FH_PLAZO"].Value = ((TextBox)gv.Rows[gv.EditIndex].FindControl("txtFecha")).Text;
                }
                else
                {
                    cmd.Parameters.Add("@FH_PLAZO", SqlDbType.DateTime);
                    cmd.Parameters["@FH_PLAZO"].Value = "01/01/1900";
                }

                cmd.Parameters.Add("@NB_COMENTARIOS", SqlDbType.VarChar, 300);
                cmd.Parameters["@NB_COMENTARIOS"].Value = ((TextBox)gv.Rows[gv.EditIndex].FindControl("txtComentarios")).Text.Trim();

                cmd.Parameters.Add("@CD_USUARIO", SqlDbType.Int);
                cmd.Parameters["@CD_USUARIO"].Value = Session["usuarioID"].ToString();

                cmd.Parameters.Add("@CD_AGENTE", SqlDbType.VarChar, 7);
                cmd.Parameters["@CD_AGENTE"].Value = data.Values["CD_AGENTE"].ToString();

                cmd.Parameters.Add("@NB_AGENTE", SqlDbType.VarChar, 65);
                cmd.Parameters["@NB_AGENTE"].Value = data.Values["NB_AGENTE"].ToString();

                Cnn.Open();

                cmd.ExecuteNonQuery();
              
                
            }
            catch (SqlException ex)
            {
                sError = ex.Number + "-" + ex.Message;
            }
            catch (Exception ex)
            {
                sError = ex.Source + "-" + ex.Message;
            }
            finally
            {
                if ((Cnn != null))
                {
                    if (Cnn.State == ConnectionState.Open)
                    {
                        Cnn.Close();
                        //cerrar conexion
                        Cnn = null;
                        //destruir objeto
                    }
                }
            }
            
        }
    }
    protected void gvReporteRemisionesCliente_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gv = (GridView)(Object)sender;
        int index = gv.SelectedIndex;
        DataKey data = gv.DataKeys[index];

        sdsHistorialRemisiones.SelectParameters[0].DefaultValue = data.Values["CD_FOLIO"].ToString();
        sdsHistorialRemisiones.SelectParameters[1].DefaultValue = data.Values["CD_SUCURSAL"].ToString();
        sdsHistorialRemisiones.SelectParameters[2].DefaultValue = data.Values["CD_PRODUCTO"].ToString();
        sdsHistorialRemisiones.SelectParameters[3].DefaultValue = data.Values["NU_PARTIDA"].ToString();
        gvHistorialRemisiones.DataBind();
        this.btnPopUp_ModalPopupExtender.Show();
    }
    protected void btnCerrarPopUp_Click(object sender, ImageClickEventArgs e)
    {
        this.btnPopUp_ModalPopupExtender.Hide();
    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        gvReporteRemisiones.Visible = false;
        gvReporteRemisionesDetalle.Visible = false;
        gvReporteRemisionesBusqueda.Visible = true;
        gvReporteRemisionesBusqueda.DataBind();


        rblVista.Items.FindByValue("1").Selected = false;
        rblVista.Items.FindByValue("2").Selected = false;
    }
    protected void gvReporteRemisionesBusqueda_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            totalCliente += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TOTAL_CLIENTE"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTOTAL_CLIENTE = (Label)e.Row.FindControl("lblTOTAL_CLIENTE");
            lblTOTAL_CLIENTE.Text = "TOTAL CLIENTE " + String.Format("$ {0:#,##0.00}", totalCliente);
            e.Row.HorizontalAlign = HorizontalAlign.Center;
            lblTOTAL_CLIENTE.Font.Bold = true;
        }
        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
        {
            DataRowView drview = e.Row.DataItem as DataRowView;
            DropDownList lstAccionAuditor = (DropDownList)e.Row.FindControl("lstAccionAuditor");
            DropDownList lstAccionAsesor = (DropDownList)e.Row.FindControl("lstAccionAsesor");
            TextBox txtFecha = (TextBox)e.Row.FindControl("txtFecha");

            InfoSessionVO infoSession;
            infoSession = (InfoSessionVO)Session["InfoSession"];

            if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "2")
            {
                lstAccionAuditor.Enabled = false;
                txtFecha.Enabled = false;
            }
            else if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "24")
            {
                lstAccionAsesor.Enabled = false;
            }
        }    
    }
    protected void lstEstatus_SelectedIndexChanged(object sender, EventArgs e)
    {           
         DropDownList lstEstatus = (DropDownList)(Object)sender;
         GridViewRow row = (GridViewRow)lstEstatus.Parent.Parent;
         int idx = row.RowIndex;
         TextBox txtFecha = (TextBox)row.FindControl("txtFecha");

         if (lstEstatus.SelectedValue.ToString() == "8" || lstEstatus.SelectedValue.ToString() == "9" || (lstEstatus.SelectedValue.ToString() == "10"))
         {
             txtFecha.Enabled = true;
         }
         else if (lstEstatus.SelectedValue.ToString() == "3" || lstEstatus.SelectedValue.ToString() == "5" || lstEstatus.SelectedValue.ToString() == "6")
         {
             txtFecha.Text = DateTime.Now.AddDays(30).ToString();
             txtFecha.Enabled = false;
         }
         else if (lstEstatus.SelectedValue.ToString() == "4")
         {
             txtFecha.Text = DateTime.Now.AddDays(21).ToString();
             txtFecha.Enabled = false;
         }
         else if (lstEstatus.SelectedValue.ToString() == "7")
         {
             txtFecha.Text = DateTime.Now.AddDays(7).ToString();
             txtFecha.Enabled = false;
         }
    }
}
