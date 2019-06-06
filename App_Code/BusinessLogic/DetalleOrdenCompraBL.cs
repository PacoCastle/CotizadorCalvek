using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using OrdenCompraTableAdapters;
using System.Collections;

/// <summary>
/// Summary description for OrdenCompra
/// </summary>
public class DetalleOrdenCompraBL:IBusinessLogic
{
	public DetalleOrdenCompraBL()
	{
		//
		// TODO: Add constructor logic here
		//

	}

    private set_insertaDatosDetalleOrdenCompraTableAdapter insertDetalleOrdenCompra = new set_insertaDatosDetalleOrdenCompraTableAdapter();
    private get_datosDetalleOrdenCompraTableAdapter datosDetalleOrdenCompra = new get_datosDetalleOrdenCompraTableAdapter();
    private set_actualizaIdDetalleOrdenCompraTableAdapter actualizaIdDetalleOrdenCompra = new set_actualizaIdDetalleOrdenCompraTableAdapter();
    private set_insertaSeguimientoDetalleOrdenCompraTableAdapter insertaSeguimientoDetalle = new set_insertaSeguimientoDetalleOrdenCompraTableAdapter();
    


    private DataTable datos = null;
    private DetalleOrdenCompraVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (DetalleOrdenCompraVO)O;

        if (VOReg.Operacion == DetalleOrdenCompraVO.ACTUALIZAR)
        {
            return actualizaDetalleOrdenCompraId();
        }
        else if (VOReg.Operacion == DetalleOrdenCompraVO.INSERTAR)
        {
            return insertaDetalleOrdenCompra();
        }
        else if (VOReg.Operacion == DetalleOrdenCompraVO.BUSCAR)
        {
            return buscarDetalleOrdenCompra();
        }
        else if (VOReg.Operacion == DetalleOrdenCompraVO.ACTUALIZA_ID_DETALLEORDENCOMPRA)
        {
            return actualizaDetalleOrdenCompra();
        }
        else if (VOReg.Operacion == DetalleOrdenCompraVO.INSERTA_SEGUIMIENTO_DETALLE)
        {
            return InsertaSeguimientoDetalleOrdenCompra();
        }

        return VOReg;
    }

    private object actualizaDetalleOrdenCompraId()
    {
        //int? res = -1;

        //updateOrdenCompra.GetData(VOReg.OrdenCompraId, VOReg.ProveedorId, VOReg.FechaEntrega, VOReg.Contacto, VOReg.ViaEmbarque, VOReg.Fob, VOReg.UsuarioId, ref res);
        //if (res == 0)
        //{
        //    VOReg.Resultado = res;
        //}
        //return VOReg;
        return null;
    }

    private object insertaDetalleOrdenCompra()
    {
        int? res = -1;
        insertDetalleOrdenCompra.GetData(VOReg.OrdenCompraId, VOReg.Cantidad, VOReg.Descripcion, VOReg.PrecioUnitario, VOReg.UsuarioId, VOReg.Descuento, VOReg.TipoDetalleOrdenCompraId, VOReg.FechaEntrega, VOReg.BanderaExceptoIva, VOReg.TiempoEntrega, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object buscarDetalleOrdenCompra()
    {

        int b = 0;
        String[,] arrDetalleOrdenCompra = null;

        datos = null;
        datos = datosDetalleOrdenCompra.GetData(VOReg.OrdenCompraId,VOReg.UsuarioId);
        if (datos.Rows.Count > 0)
        {
            arrDetalleOrdenCompra = new String[5, (datos.Rows.Count)];
            while (b < datos.Rows.Count)
            {
                arrDetalleOrdenCompra[0, b] = datos.Rows[b]["detalleOrdenCompraId"].ToString();
                arrDetalleOrdenCompra[1, b] = datos.Rows[b]["OrdenCompraId"].ToString();
                arrDetalleOrdenCompra[2, b] = datos.Rows[b]["cantidad"].ToString();
                arrDetalleOrdenCompra[3, b] = datos.Rows[b]["descripcion"].ToString();
                arrDetalleOrdenCompra[4, b] = datos.Rows[b]["precioUnitario"].ToString();
                b++;
            }
        }

        VOReg.ArrDetalleOrdenCompra = arrDetalleOrdenCompra;

        return VOReg;
    }

    private object actualizaDetalleOrdenCompra()
    {
        int? res = -1;
        actualizaIdDetalleOrdenCompra.GetData(VOReg.OrdenCompraId,VOReg.UsuarioId, ref res);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object InsertaSeguimientoDetalleOrdenCompra()
    {

        if (VOReg.ArrPendientes != null && VOReg.ArrPendientes.Count > 0)
        {
            int ai = 0;
            int intDetalleOrdenCompraId;
            Double dblValor;

            for (ai = 0; ai < VOReg.ArrPendientes.Count; ai++)
            {
                intDetalleOrdenCompraId = Int32.Parse((VOReg.ArrPendientes[ai] as ArrayList)[0].ToString().Trim());   // detellaOrdenCompraId
                dblValor = Double.Parse((VOReg.ArrPendientes[ai] as ArrayList)[1].ToString().Trim());  //cantidad a surtir

                int? res = -1;
                insertaSeguimientoDetalle.GetData(VOReg.SeguimientoOrdenCompraId, intDetalleOrdenCompraId, VOReg.OrdenCompraId, dblValor, VOReg.UsuarioId, ref res);
                //if (res>0)
                //{
                    VOReg.Resultado = res;
                //}
            }

        }

        return VOReg;
    }


}
