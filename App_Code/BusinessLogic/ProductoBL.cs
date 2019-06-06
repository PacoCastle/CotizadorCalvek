using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using cotizadorTableAdapters;

/// <summary>
/// Summary description for ProductoBL
/// </summary>
public class ProductoBL : IBusinessLogic
{
    private ProductoVO VOReg = new ProductoVO();
    private set_insertaDatosProductoTableAdapter setProducto = new set_insertaDatosProductoTableAdapter();
    private set_actualizaProductosArchivoTableAdapter actualizaProductosArchivo = new set_actualizaProductosArchivoTableAdapter();
    private DataTable datos = null;

	public ProductoBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Object execute(Object O)
    {
        VOReg = (ProductoVO)O;

        if (VOReg.Operacion == ProductoVO.ACTUALIZAR)
        {
            return actualizaProducto();
        }
        else if (VOReg.Operacion == ProductoVO.INSERTAR)
        {
            return insertaProducto();
        }
        else if (VOReg.Operacion == ProductoVO.BUSCAR)
        {
            return buscarProducto();
        }
        else if (VOReg.Operacion == ProductoVO.ACTUALIZARARCHIVO)
        {
            return actualizaProductoArchivo();
        }

        return VOReg;
    }

    private object buscarProducto()
    {
        //datos = ProductoBusqueda.GetData(VOReg.CotizacionId);
        //if (datos.Rows.Count > 0)
        //{
        //}
        //return VOReg;
        return null;
    }

    private object insertaProducto()
    {
        int? reg = 0;

        setProducto.GetData(VOReg.Producto_Codigo, VOReg.Producto_Nombre, VOReg.Producto_Marca, VOReg.Producto_Precio, VOReg.Producto_Moneda, VOReg.Producto_Categoria, VOReg.Producto_Descripcion, VOReg.Producto_TiempoEntrega, ref reg);
        if (reg > 0)
        {
            VOReg.Producto_ID = reg;
        }
        return VOReg;
    }

    private object actualizaProducto()
    {
        //int? res = -1;
        //setUProducto.GetData(VOReg.ProductoId, VOReg.Nombre, ref res);
        //if (res == 0)
        //{
        //    VOReg.Resultado = res;
        //}
        //return VOReg;
        return null;
    }

    private object actualizaProductoArchivo()
    {
        int? res = -1;
        actualizaProductosArchivo.GetData(VOReg.Producto_MarcaId,VOReg.Producto_CampDescripcion,VOReg.Producto_CampPrecio,VOReg.Producto_CampMoneda,VOReg.Producto_CampTE,VOReg.UsuarioIdActualiza, ref res);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

}







