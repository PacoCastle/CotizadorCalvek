using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_compras_altaProdPrecioEspecial : System.Web.UI.Page
{
    private static int NUMFUNCION = 58;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }  
 
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        cleanControls();
        divBusqueda.Visible = true;
        divParametros.Visible = false;
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        sdsProductosSA.InsertParameters[0].DefaultValue = "89";
        sdsProductosSA.InsertParameters[1].DefaultValue = lstPlazas.SelectedValue.ToString();
        sdsProductosSA.InsertParameters[2].DefaultValue = lblCD_Producto.Text;
        sdsProductosSA.InsertParameters[3].DefaultValue = lblNB_Producto.Text;
        sdsProductosSA.InsertParameters[4].DefaultValue = lblCD_Marca.Text;
        sdsProductosSA.InsertParameters[5].DefaultValue = lblNB_Marca.Text;
        sdsProductosSA.InsertParameters[6].DefaultValue = txtNU_MaxCompra.Text;
        sdsProductosSA.InsertParameters[7].DefaultValue = txtMotivo.Text;
        sdsProductosSA.InsertParameters[8].DefaultValue = lstStSeguridad.SelectedValue.ToString();
        sdsProductosSA.InsertParameters[9].DefaultValue = Session["usuarioId"].ToString();
        sdsProductosSA.Insert();
    }
    protected void sdsProductosSA_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        System.Text.StringBuilder message = new System.Text.StringBuilder();
        message.Append(e.Command.Parameters["@msgResultado"].Value.ToString());
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + message + "');", true);
        divBusqueda.Visible = true;
        divParametros.Visible = false;
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        sdsProductosSA.SelectParameters[0].DefaultValue = txtCD_Producto.Text;
        DataView dv = (DataView)sdsProductosSA.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count > 0)
        {
            divParametros.Visible = true;
            divBusqueda.Visible = false;
            lblCD_Producto.Text = (string)dv.Table.Rows[0][0];
            lblNB_Producto.Text = (string)dv.Table.Rows[0][1];
            lblCD_Marca.Text = (string)dv.Table.Rows[0][2];
            lblNB_Marca.Text = (string)dv.Table.Rows[0][3];
        }
        else
        {
            string message = "No se encontro el producto en el catalogo";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + message + "');", true);

        }

    }
    protected void cleanControls()
    {
        txtCD_Producto.Text = "";
        lblCD_Producto.Text = "";
        lblNB_Producto.Text = "";
        lblCD_Marca.Text = "";
        lblNB_Marca.Text ="";
        txtMotivo.Text = "";
        txtNU_MaxCompra.Text = "";
        lstPlazas.SelectedIndex = 0;
        lstStSeguridad.SelectedValue = "0";
    }
   
}


