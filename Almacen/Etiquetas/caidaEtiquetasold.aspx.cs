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

public partial class Almacen_Etiquetas_caidaEtiquetas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList listaProductos = PreviousPage.Productos;
        ArrayList listaProdCantidad = PreviousPage.Cantidad;
        ArrayList listaProdDescripcion = PreviousPage.Descripcion;
        ArrayList listaProdUnidad = PreviousPage.Unidad;
        String strSerie = PreviousPage.Serie;
        String strFolio = PreviousPage.Folio;

        Response.Write("HOla");
    }
}