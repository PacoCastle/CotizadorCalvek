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

public partial class Almacen_Etiquetas_formularioOrdenEntrada : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ckbImprimirTodos_CheckedChanged(object sender, EventArgs e)
    {
            CheckBox ckbImprimirTodos = (CheckBox)gdvDetalleOrdenEntrada.HeaderRow.FindControl("ckbImprimirTodos");

            if (ckbImprimirTodos.Checked)
            {
                foreach (GridViewRow row in gdvDetalleOrdenEntrada.Rows)
                {
                    ((CheckBox)row.FindControl("ckbImprimir")).Checked=true;
                }
            }
            else
            {
                foreach (GridViewRow row in gdvDetalleOrdenEntrada.Rows)
                {
                    ((CheckBox)row.FindControl("ckbImprimir")).Checked = false;
                }
            }
    }
    protected void btnContinuar_Click(object sender, EventArgs e)
    {

    }

    public String sucurId
    {
        get
        {
            return Request.QueryString["sucurId"];
        }
    }
    
    public String folio
    {
        get
        {
            return Request.QueryString["folio"];
        }
    }

    public String idtipo
    {
        get
        {
            return Request.QueryString["idtipo"];
        }
    }

    ArrayList listaProductos = new ArrayList();
    ArrayList listaProdCantidad = new ArrayList();
    ArrayList listaProdDescripcion = new ArrayList();
    ArrayList listaProdUnidad = new ArrayList();

    public ArrayList Productos
    {
        get
        {
            try
            {
                if (gdvDetalleOrdenEntrada.Rows.Count > 0)
                {
                    
                    foreach (GridViewRow row in gdvDetalleOrdenEntrada.Rows)
                    {
                        if (((CheckBox)row.FindControl("ckbImprimir")).Checked == true)
                            {
                            listaProductos.Add(row.Cells[0].Text);
                            listaProdCantidad.Add(row.Cells[1].Text);
                            listaProdDescripcion.Add(row.Cells[2].Text);
                            listaProdUnidad.Add(row.Cells[3].Text);
                            }
                    }
                }
                return listaProductos;
            }
            catch (Exception exc)
            {
                return null;
            }
        }
    }

    public ArrayList Cantidad
    {
        get
        {
            return listaProdCantidad;
        }
    }

    public ArrayList Descripcion
    {
        get
        {
            return listaProdDescripcion;
        }
    }

    public ArrayList Unidad
    {
        get
        {
            return listaProdUnidad;
        }
    }

    public String Serie
    {
        get
        {
            return ((Label)frmOrdenEntrada.FindControl("lblSerie")).Text.Trim();
        }
    }

    public String Folio
    {
        get
        {
            return ((Label)frmOrdenEntrada.FindControl("lblFolio")).Text.Trim();
        }
    }

}
