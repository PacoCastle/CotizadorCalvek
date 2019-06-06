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

public partial class Almacen_Etiquetas_caidaEtiquetas2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList listaProductos = PreviousPage.Productos;
        ArrayList listaProdCantidad = PreviousPage.Cantidad;
        ArrayList listaProdDescripcion = PreviousPage.Descripcion;
        ArrayList listaProdUnidad = PreviousPage.Unidad;
        String strSerie = PreviousPage.Serie;
        String strFolio = PreviousPage.Folio;

        String strUrlCodigoBarras = "";
        //Response.Write("HOla");
        for (int b = 0; b < listaProductos.Count;b++)
        {
            int intCantidad = 0;
            for (intCantidad = 1; intCantidad <= Int32.Parse(listaProdCantidad[b].ToString()); intCantidad++)
            {
                strUrlCodigoBarras = "http://www.mbcestore.com.mx/generador_codigo_de_barras/codigo_de_barras.html?code=" + Int32.Parse(strFolio).ToString() + ".." + listaProductos[b].ToString().Trim() + ".." + intCantidad.ToString()  + "&style=165&type=C128B&width=250&height=80&xres=1&font=3";
            Response.Write("<img src=" + strUrlCodigoBarras + "></img><BR>");
            //Response.Write(listaProductos[b] + " (" + listaProdUnidad[b] + ")<BR>");
            Response.Write(listaProdDescripcion[b]+"<BR>");
            Response.Write(strSerie + strFolio + "<BR>");
            Response.Write("----------------------------------------------<BR>");
            }
        }

    }
}
