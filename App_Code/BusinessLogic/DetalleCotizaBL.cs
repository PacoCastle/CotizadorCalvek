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
/// Summary description for DetalleCotizaBL
/// </summary>
public class DetalleCotizaBL:IBusinessLogic
{
    private DetalleCotizaVO VOReg = null;
    private set_insertaDatosDetalleCotizaTableAdapter detalles = new set_insertaDatosDetalleCotizaTableAdapter();
    private get_detalleCotizacionTableAdapter getDetalles = new get_detalleCotizacionTableAdapter();

    private DataTable datos = null;

    public object execute(object o)
    {
        VOReg = (DetalleCotizaVO)o;

        if (VOReg.Operacion == DetalleCotizaVO.ACTUALIZAR)
        {
            return actualizaDetalles();
        }
        else if (VOReg.Operacion == DetalleCotizaVO.INSERTAR)
        {
            return insertaDetalles();
        }
        else if (VOReg.Operacion == DetalleCotizaVO.BUSCAR)
        {
            return buscarDetalle();
        }
        else if (VOReg.Operacion == DetalleCotizaVO.BUSCAR_DETALLES_COTIZACION)
        {
            return buscarDetallesCotizacion();
        }

        return VOReg;
    }

    private object buscarDetalle()
    {
        throw new Exception("The method or operation is not implemented.");
    }

    private object insertaDetalles()
    {
        int? res = 0;

        detalles.GetData(VOReg.ProductoRef, VOReg.CotizacionId, VOReg.ProductoDesc, VOReg.ProductoPrecio, VOReg.Cantidad, VOReg.TiempoEntrega, VOReg.UnidadMedida, VOReg.TipoMoneda, VOReg.UsuarioIdActualiza, VOReg.ProductoComodin, VOReg.AplicaRango, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
            VOReg.MensajeError = "Se inserto correctamente";
        }
        else
        {
            if (res == -1)
                VOReg.MensajeError = "El producto existe en el catalogo Base de Datos";
            if (res == -2)
                VOReg.MensajeError = "E - No se puede Insertar el registro";
            if (res == -3)
                VOReg.MensajeError = "No se puede Insertar el registro";
            VOReg.Resultado = res;
        }

        return VOReg;
    }

    private object actualizaDetalles()
    {
        throw new Exception("The method or operation is not implemented.");
    }

    private object buscarDetallesCotizacion()
    {
        datos = getDetalles.GetData(VOReg.CotizacionId);
        int a = 0;

        if (datos.Rows.Count > 0)
        {
            String[,] arrDetalles = new String[6, (datos.Rows.Count)];
            //for (int a=1; a <= datos.Rows.Count; a++)
            while (a < datos.Rows.Count)
            {
                arrDetalles[0, a] = datos.Rows[a]["IdProducto"].ToString();
                arrDetalles[1, a] = datos.Rows[a]["Descripcion"].ToString();
                arrDetalles[2, a] = datos.Rows[a]["Precio"].ToString();
                arrDetalles[3, a] = datos.Rows[a]["Cantidad"].ToString();
                arrDetalles[4, a] = datos.Rows[a]["moneda"].ToString();
                arrDetalles[5, a] = datos.Rows[a]["Descuento"].ToString();
                //arrDetalles[5, a] = datos.Rows[a]["unidadMedida_Id"].ToString();
                a++;
            }
            VOReg.ArrDetalles = arrDetalles;
            return VOReg;
        }
        return VOReg;
    }
}
