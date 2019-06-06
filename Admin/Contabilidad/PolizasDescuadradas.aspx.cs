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
using ContabilidadTableAdapters;

public partial class Admin_Contabilidad_PolizasDescuadradas : System.Web.UI.Page
{
    private static int NUMFUNCION = 33;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMensaje.Text = "";
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        
        //BuscarPolizasDesc.EnableViewState = false;
        //BuscarPolizasDesc.EnableViewState = true;
        //GridPolizas.DataSource = BuscarPolizasDesc;
        lblMensaje.Text = "";
        GridPolizas.DataBind();
        GridPolizas.Visible = false;
        GridPolizas.Visible = true;
        

    }


    protected void btnAjustar_Click(object sender, EventArgs e)
    {
        try
        {
            int? res = -1;

            set_polizas_descuadradasTableAdapter setpolizasdescuadradas = new set_polizas_descuadradasTableAdapter();

            setpolizasdescuadradas.GetData(
                System.Convert.ToInt16(txtAno.Text),
                System.Convert.ToInt16(lstMes.SelectedItem.Value),
                txtrazonsocial.SelectedItem.Value,
                ref res);

            if (res == 0)
            {
                if (GridPolizas.Rows.Count == 0)
                {
                    lblMensaje.Text = "NADA QUE CUADRAR";
                }
                else
                {
                    lblMensaje.Text = "POLIZAS CUADRADAS";
                }
                GridPolizas.DataBind();
            }
            else
            {
                lblMensaje.Text = "ERROR";
            }
        }
        catch (Exception ex)
        {
            lblMensaje.Text = "ERROR CATCH";
            
        }

    }
    
}
