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

public partial class Admin_Polizas_busquedaPolizas : System.Web.UI.Page
{
    private static int NUMFUNCION = 33;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        //Server.transfer 'caidaPolizas.aspx';
    }

    public String sucursalId
    {
        get
        {
            return lstSucursal.SelectedValue;
        }
    }

    public String mesId
    {
        get
        {
            return lstMes.SelectedValue;
        }
    }

    public String clienteId
    {
        get
        {
            return lstCliente.SelectedValue;
        }
    }

    public String fechaDe
    {
        get
        {
            return txtFechaDe.Text;
        }
    }

    public String fechaA
    {
        get
        {
            return txtFechaA.Text;
        }
    }

    protected void txtFechaDe_TextChanged(object sender, EventArgs e)
    {
        txtFechaA.Text = txtFechaDe.Text;
    }
    protected void imgCalendario_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        lblTurnoCampo.Text = "1";
    }
    protected void imgCalendario2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        lblTurnoCampo.Text = "2";
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if(lblTurnoCampo.Text.Equals("1"))
        {
            txtFechaDe.Text = Calendar1.SelectedDate.Date.ToString("d");
        }
        if (lblTurnoCampo.Text.Equals("2"))
        {
            txtFechaA.Text = Calendar1.SelectedDate.Date.ToString("d");
        }
     
        Calendar1.Visible = false;
    }

    public String tipoPoliza
    {
        get
        {
            return lstTipoPoliza.SelectedValue;
        }
    }

}
