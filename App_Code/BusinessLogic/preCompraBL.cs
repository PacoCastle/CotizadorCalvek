using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ComprasTableAdapters;

/// <summary>
/// Summary description for preCompraBL
/// </summary>
public class preCompraBL : IBusinessLogic
{
    private preCompraVO VOReg = new preCompraVO();
    private set_insertaPreCompraTableAdapter insertaPreCompra = new set_insertaPreCompraTableAdapter();
    private set_insertaPreCompraDetalleTableAdapter insertaPreCompraDetalle = new set_insertaPreCompraDetalleTableAdapter();
    //private DataTable datos = null;

	public preCompraBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Object execute(Object O)
    {
        VOReg = (preCompraVO)O;

        if (VOReg.Operacion == preCompraVO.ACTUALIZAR)
        {
            return actualizaPreCompra();
        }
        else if (VOReg.Operacion == preCompraVO.INSERTAR)
        {
            return funInsertaPreCompra();
        }
        else if (VOReg.Operacion == preCompraVO.BUSCAR)
        {
            return buscarPreCompra();
        }

        return VOReg;
    }

    private object buscarPreCompra()
    {
        //datos = ProductoBusqueda.GetData(VOReg.CotizacionId);
        //if (datos.Rows.Count > 0)
        //{
        //}
        //return VOReg;
        return null;
    }

    private object funInsertaPreCompra()
    {
        int? reg = 0;
        int? res = 0;
        insertaPreCompra.GetData(VOReg.ComprasId, VOReg.TipoDocumentoId, VOReg.MonedaId, VOReg.CveLinea, VOReg.Sucursal, VOReg.CveAgente, VOReg.FolioPedido, VOReg.FolioOrdenCompra, VOReg.ClaveProveedor, VOReg.Comentario, VOReg.UsuarioId, ref reg);
        if (reg > 0)
        {
            VOReg.ComprasId = (int)reg;
            String[] strCadena;
            foreach (String item in VOReg.ArrProductos)
            {
                strCadena = item.Split('|'); // strCadena[0]=ProductoId, strCadena[1]=cantidad
                insertaPreCompraDetalle.GetData(VOReg.ComprasId, strCadena[0] /*VOReg.Idproducto*/, Int32.Parse(strCadena[1])/*VOReg.Cantidad*/,float.Parse(strCadena[2])/*Costo*/,VOReg.UsuarioId, ref res);
                if (res > 0)
                    {
                    }
            }
        }
        return VOReg;
    }

    private object actualizaPreCompra()
    {
        //int? reg = 0;

        //setProducto.GetData(VOReg.Producto_Codigo, VOReg.Producto_Nombre, VOReg.Producto_Marca, VOReg.Producto_Precio, VOReg.Producto_Moneda, VOReg.Producto_Categoria, VOReg.Producto_Descripcion, VOReg.Producto_TiempoEntrega, ref reg);
        //if (reg > 0)
        //{
        //    VOReg.Producto_ID = reg;
        //}
        //return VOReg;
        return null;
    }

}