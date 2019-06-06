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

public partial class Admin_ControlFacturacion_formularioRevisionFacturas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CheckBox intClienteAgente = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("intClienteAgente");
            //lblValorCheck.Text = CheckBox2.Checked.ToString();
            DropDownList intAgenteId = (DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("intAgenteId");

            if (intClienteAgente.Checked)
            {
                intAgenteId.Visible = false;
            }
            else
            {
                intAgenteId.Visible = true;
            }

            intClienteAgente.Dispose();
            intAgenteId.Dispose();


        }
        catch (Exception ee)
        {
        }
        
                 
    }

    public String get_textoBandera(string blValor)
    {
        return blValor.ToString();
    }

    protected void ckbCliente_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void gvwRevision_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox intClienteAgente = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("intClienteAgente");
        DropDownList intAgenteId = (DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("intAgenteId");

        if (intClienteAgente.Checked)
        {
            intAgenteId.Visible = false;
            //intAgenteId.SelectedIndex = -1;
        }
        else
        {
            intAgenteId.Visible = true;

        }

        intClienteAgente.Dispose();
        intAgenteId.Dispose();

    }

    protected void ckRevision_CheckedChanged(object sender, EventArgs e)
    {
        
    }
    protected void ckHojaVerde_CheckedChanged(object sender, EventArgs e)
    {

    }

    public void Valida_check(Object Src, GridViewUpdateEventArgs Args)
    {

        //// validacion cantidad
        //String blnBookQty = Args.NewValues["intRevision"].ToString();
        
        ////Int32 bookQty = 0;

        //lblValorCheck.Text = blnBookQty;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        controlFacturasVO VO = new controlFacturasVO();
        controlFacturasBL BL = new controlFacturasBL();
        VO.Operacion = controlFacturasVO.ACTUALIZAR;

        CheckBox intFirmaHojaVerde = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("intFirmaHojaVerde");
       //CheckBox intRevision = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("intRevision");
        //CheckBox intClienteAgente = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("intClienteAgente");
        //DropDownList intAgenteId = (DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("intAgenteId");
        TextBox strFechaProgramada = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("strFechaProgramada");
        TextBox strComentarios = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("strComentarios");

        VO.IntUsuarioId = Int32.Parse(Session["usuarioID"].ToString());

        DataKey data = GridView1.DataKeys[GridView1.EditIndex];
        VO.IntControlFacturaId = Int32.Parse(data.Values["intControlFacturaId"].ToString());
        VO.StrIDKEPLER = data.Values["IDKEPLER"].ToString();

        if (intFirmaHojaVerde.Checked)
        {
            VO.IntFirmaHojaVerde = 1;
        }
        else
        {
            VO.IntFirmaHojaVerde = 0;
        }

       //if (intRevision.Checked)
       //{
            VO.IntRevision = 1;
       //}
       //else
       //{
       //    VO.IntRevision = 0;
       //}

        //if (intClienteAgente.Checked)
        //{
        //    VO.IntClienteAgente = 1;
        //    VO.IntAgenteId = 0;
        //}
        //else
        //{
        //    VO.IntClienteAgente = 0;

        //    if (intAgenteId.SelectedValue == "")
        //        VO.IntAgenteId = 0;
        //    else
        //        VO.IntAgenteId = Int32.Parse(intAgenteId.SelectedItem.Value);
        //}


        VO.StrFechaProgramada = strFechaProgramada.Text;
        VO.StrComentarios = strComentarios.Text;
        VO.StrSucursal = data.Values["sucursal"].ToString();
        VO = (controlFacturasVO)BL.execute(VO);
        //if (VO.Resultado == 0)

        intFirmaHojaVerde.Dispose();
       //intRevision.Dispose();
        //intClienteAgente.Dispose();
        //intAgenteId.Dispose();
        strFechaProgramada.Dispose();
        strComentarios.Dispose();
        GridView1.EditIndex = -1;
    }

    protected void intAgenteId_SelectedIndexChanged(object sender, EventArgs e)
    {
    //DropDownList intAgenteId = (DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("intAgenteId");
    //if(Int32.Parse(intAgenteId.SelectedItem.Value)>0)
    //    {
    //        CheckBox intClienteAgente = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("intClienteAgente");
    //        intClienteAgente.Checked = false;
    //        intClienteAgente.Dispose();
    //    }
    //intAgenteId.Dispose();
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        lblBanderaBusqueda.Text = "1";

    }
    protected void btnRepSinAcuse_Click(object sender, EventArgs e)
    {
        lblBanderaBusqueda.Text = "2";
        limpiaCampBusqueda();
    }
    protected void btnVencidoFechaRev_Click(object sender, EventArgs e)
    {
        lblBanderaBusqueda.Text = "3";
        limpiaCampBusqueda();
    }
    protected void btnFoliosProgramados_Click(object sender, EventArgs e)
    {
        lblBanderaBusqueda.Text = "20";
        limpiaCampBusqueda();
        lstSemana.Visible = true;
        lblEtiSemana.Visible = true;
        btnFoliosProgramados.Visible = false;
        btnConFolProg.Visible = true;
        
        DateTime dtFecha = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
        lstSemana.DataBind();
        lstSemana.SelectedValue = System.Globalization.CultureInfo.CurrentUICulture.Calendar.GetWeekOfYear(dtFecha, System.Globalization.CalendarWeekRule.FirstDay, dtFecha.DayOfWeek).ToString();
    }

    public void limpiaCampBusqueda()
    {
        txtFolio.Text = "";
        txtFecha.Text = "";
        lstClientes.SelectedIndex = -1;
        lstSemana.Visible = false;
        lblEtiSemana.Visible = false;
        btnFoliosProgramados.Visible = true;
        btnConFolProg.Visible = false;
    }
    protected void cambiaEstatus_click(object sender, EventArgs e)
    {
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        guardaListadoPendientes(getValoreslistaPendiente());
    }

    protected void btnGuardar2_Click(object sender, EventArgs e)
    {
        guardaListadoPendientes(getValoreslistaPendiente());
    }

    private ArrayList getValoreslistaPendiente()
    {
        ArrayList listaPendiente = new ArrayList();
        DataKey data;
        DropDownList lstEstatus;

        foreach (GridViewRow row in GridView1.Rows)
        {
            data = GridView1.DataKeys[row.RowIndex];
            lstEstatus = (DropDownList)row.FindControl("lstEstatus");

            if (Int32.Parse(lstEstatus.SelectedValue)==2)
            {
                listaPendiente.Add(data.Values["IDKEPLER"].ToString() + "-" + data.Values["sucursal"].ToString().Trim() + "-" + data.Values["intControlFacturaId"].ToString() + "-" + lstEstatus.SelectedValue.ToString());
            }
        }
        //lstEstatus.Dispose();
        return listaPendiente;
    }

    private void guardaListadoPendientes(ArrayList arrPendientes)
    {
        if (arrPendientes != null && arrPendientes.Count > 0)
        {
        controlFacturasVO VO = new controlFacturasVO();
        controlFacturasBL BL = new controlFacturasBL();
        VO.Operacion = controlFacturasVO.ACTUALIZAPENDIENTES;
        VO.ArrPendientes = arrPendientes;
        VO.IntUsuarioId = Int32.Parse(Session["usuarioID"].ToString());
        VO = (controlFacturasVO)BL.execute(VO);
        //if (VO.Resultado == 0)
        }
    }
    protected void btnConFolProg_Click(object sender, EventArgs e)
    {
        lblBanderaBusqueda.Text = "4";
        limpiaCampBusqueda();
        
    }
    protected void imgCalendario_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        btnRepSinAcuse.Visible = false;
        btnVencidoFechaRev.Visible = false;
        btnFoliosProgramados.Visible = false;

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtFecha.Text = Calendar1.SelectedDate.Date.ToString("d");
        Calendar1.Visible = false;
        btnRepSinAcuse.Visible = true;
        btnVencidoFechaRev.Visible = true;
        btnFoliosProgramados.Visible = true;
        btnRepSinAcuse.Visible = true;
        btnVencidoFechaRev.Visible = true;
        btnFoliosProgramados.Visible = true;
    }
}
