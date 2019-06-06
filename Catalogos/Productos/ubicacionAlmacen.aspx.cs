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
using ConsultasConKeplerTableAdapters;

public partial class Catalogos_Productos_ubicacionAlmacen : System.Web.UI.Page
{
    private get_productoXcodKeplerTableAdapter getProdKepler = new get_productoXcodKeplerTableAdapter();

    private set_ubicacionProductoKeplerTableAdapter setUbicacionProd = new set_ubicacionProductoKeplerTableAdapter();

    private DataTable datos = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        datos = getProdKepler.GetData(txtCodProd.Text.Trim());
        if (datos.Rows.Count > 0)
        {
            //txtCodProd.Text = datos.Rows[0]["Codigo"].ToString();
            txtDescripcion.Text = datos.Rows[0]["Descripcion"].ToString();
            lblUbicacion.Text = datos.Rows[0]["Ubicacion"].ToString().Trim();
            txtComentario.Text = datos.Rows[0]["Comentario"].ToString().Trim();
        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        String[] arrUbicacion = lblUbicacion.Text.Split('-');
        String strCadenaUbicacion = "";
        String strAnaquel = "";
        String strColumna = "";
        String strFila = "";
        String strNoCaja = "";
        String index = gvUbicacion.DataKeys[gvUbicacion.EditIndex].Value.ToString().Trim();
        DropDownList lstAnaquel = (DropDownList)gvUbicacion.Rows[gvUbicacion.EditIndex].FindControl("lstAnaquel");
        DropDownList lstColumna = (DropDownList)gvUbicacion.Rows[gvUbicacion.EditIndex].FindControl("lstColumna");
        DropDownList lstFila = (DropDownList)gvUbicacion.Rows[gvUbicacion.EditIndex].FindControl("lstFila");
        DropDownList lstNoCaja = (DropDownList)gvUbicacion.Rows[gvUbicacion.EditIndex].FindControl("lstNoCaja");

        if(lstAnaquel.SelectedIndex > 0)
            strAnaquel = lstAnaquel.SelectedItem.Value;
        else
            strAnaquel = "AA";

        if(lstColumna.SelectedIndex > 0)
            strColumna = lstColumna.SelectedItem.Value;
        else
            strColumna = "RR";

        if(lstFila.SelectedIndex > 0)
            strFila = lstFila.SelectedItem.Value;
        else
            strFila = "FF";

        if(lstNoCaja.SelectedIndex > 0)
            strNoCaja = "C" + lstNoCaja.SelectedItem.Value;
        else
            strNoCaja = "CC";

        strCadenaUbicacion = index + strAnaquel + strColumna + strFila + strNoCaja;

        arrUbicacion[(Int32.Parse(index) - 1)] = strCadenaUbicacion;
        lblUbicacion.Text = String.Join("-", arrUbicacion);

        setUbicacionProd.GetData(txtCodProd.Text.Trim(), lblUbicacion.Text, txtComentario.Text);

        gvUbicacion.EditIndex = -1;
    }

}