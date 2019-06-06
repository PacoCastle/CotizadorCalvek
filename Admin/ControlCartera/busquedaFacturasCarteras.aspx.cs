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

public partial class Admin_ControlCartera_busquedaFacturasCarteras : System.Web.UI.Page
{
    private static int NUMFUNCION = 31;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        lblReloj.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm");
        //if(!Page.IsPostBack)
        // {   
        //    // determinar si el usuario tiene los permisos como administrador.
        //    //String error2 = Utilis.validaPermisos(Session, 29);
        //    //if (error2.Equals(""))
        //    //{
        //    //    GridView1.Columns[7].Visible = true; // campo Estatus
        //    //}

        //    // El usuario tiene permiso de Agente, solo muestra el resultado de la busqueda, no puede editar
        //    error2 = Utilis.validaPermisos(Session, 30);
        //    if (error2.Equals(""))
        //    {
        //        GridView2.Visible = false;
        //        GridView3.Visible = false;
        //        GridView4.Visible = false;
        //        GridView6.Visible = false;
        //        GridView7.Visible = false;
        //        Label7.Visible = false;
        //        Label8.Visible = false;
        //        Label6.Visible = false;
        //    }
        //    // Acceso, El usuario puede ver todas las tablas pero no puede editar
        //    error2 = Utilis.validaPermisos(Session, 31);
            
        //    if (error2.Equals(""))
        //    {
        //        //Response.Redirect(error);
        //    }

        //}
    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        //btnEdoCuenta.Visible = true;
    }

    public String get_formatoCantidad(int intConteo)
    {
        if (intConteo == 0)
            {
                return "";
            }
        else
            {
                return "(" + intConteo.ToString() + ")";
            }
    }

    protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
    {
        int index = GridView1.EditIndex;
        GridViewRow row = GridView1.Rows[index];
        DropDownList IdAdmin = (DropDownList)row.FindControl("idEstatus");
        e.NewValues["idEstatus"] = IdAdmin.SelectedItem.Value;

    }

    protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            String strRangoId = DataBinder.Eval(e.Row.DataItem, "rangoId").ToString();
            // cd_estatus = 3 moroso Parcial
            // unidadNegocio = 'CELAYA'
            // rango_dias 

            HyperLink lnkCtoCly = (HyperLink)e.Row.FindControl("lnkCtoCly");
            lnkCtoCly.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=2&unidadNegocio=CELAYA&rangoId={0}", strRangoId);
            lnkCtoCly.Dispose();

            HyperLink lnkCtoQro = (HyperLink)e.Row.FindControl("lnkCtoQro");
            lnkCtoQro.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=2&unidadNegocio=QUERETARO&rangoId={0}", strRangoId);
            lnkCtoQro.Dispose();

            HyperLink lnkCtoSlp = (HyperLink)e.Row.FindControl("lnkCtoSlp");
            lnkCtoSlp.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=2&unidadNegocio=SAN LUIS POTOSI&rangoId={0}", strRangoId);
            lnkCtoSlp.Dispose();

            HyperLink lnkCtoAuto = (HyperLink)e.Row.FindControl("lnkCtoAuto");
            lnkCtoAuto.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=2&unidadNegocio=CALVEK&rangoId={0}", strRangoId);
            lnkCtoAuto.Dispose();

            HyperLink lnkCtoIra = (HyperLink)e.Row.FindControl("lnkCtoIra");
            lnkCtoIra.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=2&unidadNegocio=IRAPUATO&rangoId={0}", strRangoId);
            lnkCtoIra.Dispose();
        }
    }

    protected void GridView7_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if(e.Row.RowType==DataControlRowType.DataRow)
        {

        String strRangoId = DataBinder.Eval(e.Row.DataItem, "rangoId").ToString();
        // cd_estatus = 3 moroso Parcial
        // unidadNegocio = 'CELAYA'
        // rango_dias 

        HyperLink lnkCtoCly = (HyperLink)e.Row.FindControl("lnkCtoCly");
        lnkCtoCly.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=3&unidadNegocio=CELAYA&rangoId={0}", strRangoId); 
        lnkCtoCly.Dispose();

        HyperLink lnkCtoQro = (HyperLink)e.Row.FindControl("lnkCtoQro");
        lnkCtoQro.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=3&unidadNegocio=QUERETARO&rangoId={0}", strRangoId);
        lnkCtoQro.Dispose();

        HyperLink lnkCtoSlp = (HyperLink)e.Row.FindControl("lnkCtoSlp");
        lnkCtoSlp.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=3&unidadNegocio=SAN LUIS POTOSI&rangoId={0}", strRangoId);
        lnkCtoSlp.Dispose();

        HyperLink lnkCtoAuto = (HyperLink)e.Row.FindControl("lnkCtoAuto");
        lnkCtoAuto.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=3&unidadNegocio=CALVEK&rangoId={0}", strRangoId);
        lnkCtoAuto.Dispose();

        HyperLink lnkCtoNing = (HyperLink)e.Row.FindControl("lnkCtoNing");
        lnkCtoNing.NavigateUrl = string.Format("~/Admin/ControlCartera/DetalleMorosos.aspx?estatus=3&unidadNegocio=(Ninguna)&rangoId={0}", strRangoId);
        lnkCtoNing.Dispose();
        }
    }

    protected void btnEdoCuenta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Catalogos/Clientes/caidaEdoCuenta.aspx?clienteAdminId=" + lstCliente.SelectedItem.Value.ToString() + "&nombreCliente=" + lstCliente.SelectedItem.Text);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
