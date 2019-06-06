using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using cobranzaTableAdapters;

/// <summary>
/// Summary description for OrdenCompra
/// </summary>
public class DetalleDepositosSinIdentificarBL : IBusinessLogic
{
	public DetalleDepositosSinIdentificarBL()
	{
		//
		// TODO: Add constructor logic here
		//

	}

    private set_insertaDatosDocumentosDepositosPendientesTableAdapter insertDocumentosDepositosPendientes = new set_insertaDatosDocumentosDepositosPendientesTableAdapter();
    //private get_datosDetalleOrdenCompraTableAdapter datosDetalleOrdenCompra = new get_datosDetalleOrdenCompraTableAdapter();
    //private set_actualizaIdDetalleOrdenCompraTableAdapter actualizaIdDetalleOrdenCompra = new set_actualizaIdDetalleOrdenCompraTableAdapter();

    private DataTable datos = null;
    private DetalleDepositosSinIdentificarVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (DetalleDepositosSinIdentificarVO)O;

        if (VOReg.Operacion == DetalleDepositosSinIdentificarVO.ACTUALIZAR)
        {
            return actualizaDetalleOrdenCompraId();
        }
        else if (VOReg.Operacion == DetalleDepositosSinIdentificarVO.INSERTAR)
        {
            return insertaDetalleOrdenCompra();
        }
        else if (VOReg.Operacion == DetalleDepositosSinIdentificarVO.BUSCAR)
        {
            return buscarDetalleOrdenCompra();
        }
        else if (VOReg.Operacion == DetalleDepositosSinIdentificarVO.ACTUALIZA_ID_DETALLEORDENCOMPRA)
        {
            return actualizaDetalleOrdenCompra();
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
        insertDocumentosDepositosPendientes.GetData(VOReg.DepositosPendientesId, VOReg.SerieFactura, VOReg.FolioFactura, VOReg.UsuarioId, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object buscarDetalleOrdenCompra()
    {

        //int a = 0, b = 0, c = 0;
        //String[,] arrDetalleOrdenCompra = null;

        //datos = null;
        //datos = datosDetalleOrdenCompra.GetData(VOReg.OrdenCompraId,VOReg.UsuarioId);
        //if (datos.Rows.Count > 0)
        //{
        //    arrDetalleOrdenCompra = new String[5, (datos.Rows.Count)];
        //    while (b < datos.Rows.Count)
        //    {
        //        arrDetalleOrdenCompra[0, b] = datos.Rows[b]["detalleOrdenCompraId"].ToString();
        //        arrDetalleOrdenCompra[1, b] = datos.Rows[b]["OrdenCompraId"].ToString();
        //        arrDetalleOrdenCompra[2, b] = datos.Rows[b]["cantidad"].ToString();
        //        arrDetalleOrdenCompra[3, b] = datos.Rows[b]["descripcion"].ToString();
        //        arrDetalleOrdenCompra[4, b] = datos.Rows[b]["precioUnitario"].ToString();
        //        b++;
        //    }
        //}

        //VOReg.ArrDetalleOrdenCompra = arrDetalleOrdenCompra;

        //return VOReg;
        return null;
    }

    private object actualizaDetalleOrdenCompra()
    {
        //int? res = -1;
        //actualizaIdDetalleOrdenCompra.GetData(VOReg.OrdenCompraId,VOReg.UsuarioId, ref res);
        //if (res == 0)
        //{
        //    VOReg.Resultado = res;
        //}
        //return VOReg;
        return null;
    }

}
