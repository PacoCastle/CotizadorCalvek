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

/// <summary>
/// Summary description for OrdenCompra
/// </summary>
public class OrdenCompraBL : IBusinessLogic
{
	public OrdenCompraBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private set_insertaDatosOrdenCompraTableAdapter insertOrdenCompra = new set_insertaDatosOrdenCompraTableAdapter();
    private get_datosOrdenCompraTableAdapter datosOrdenCompra = new get_datosOrdenCompraTableAdapter();
    private set_actualizaDatosOrdenCompraTableAdapter updateOrdenCompra = new set_actualizaDatosOrdenCompraTableAdapter();
    private set_insertaFolioOrdenCompraTableAdapter insertFolioOC = new set_insertaFolioOrdenCompraTableAdapter();
    private set_insertaOrdenCompraDuplicaTableAdapter duplicaOrdenCompra = new set_insertaOrdenCompraDuplicaTableAdapter();
    private set_insertaSeguimientoOrdenCompraTableAdapter insertaSeguimiento = new set_insertaSeguimientoOrdenCompraTableAdapter();


    private DataTable datos = null;
    private OrdenCompraVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (OrdenCompraVO)O;

        if (VOReg.Operacion == OrdenCompraVO.ACTUALIZAR)
        {
            return actualizaOrdenCompra();
        }
        else if (VOReg.Operacion == OrdenCompraVO.INSERTAR)
        {
            return insertaOrdenCompra();
        }
        else if (VOReg.Operacion == OrdenCompraVO.BUSCAR)
        {
            return buscarOrdenCompra();
        }
        else if (VOReg.Operacion == OrdenCompraVO.INSERTAR_FOLIOFACTURA)
        {
            return insertaFolioFacturaCompra();
        }
        else if (VOReg.Operacion == OrdenCompraVO.DUPLICAORDENCOMPRA)
        {
            return insertaOrdenCompraDuplicada();
        }
        else if (VOReg.Operacion == OrdenCompraVO.INSERTA_SEGUIMIENTO)
        {
            return insertaSeguimientoOrdenCompra();
        }
        return VOReg;
    }

    private object actualizaOrdenCompra()
    {
        int? res = -1;

        updateOrdenCompra.GetData(VOReg.OficinaId,VOReg.OrdenCompraId, VOReg.ProveedorId, VOReg.FechaEntrega, VOReg.Contacto, VOReg.ViaEmbarque, VOReg.Fob, VOReg.UsuarioId, VOReg.MonedaId, VOReg.NombreProyecto, VOReg.NombreJob, VOReg.PorcentajeDescuento, VOReg.CostoEnvio, VOReg.PorcentajeImpuesto, VOReg.CostoImportacion, VOReg.DatosTransferencia, VOReg.InstruccionesEmbarque, VOReg.Terminos, VOReg.EstatusOrdenCompraId, VOReg.Factura, VOReg.OtroDocumento, VOReg.DocRecibido, VOReg.OrigenId, VOReg.AccountName, VOReg.Address, VOReg.AccountNumber, VOReg.BankName, VOReg.BankAddress, VOReg.Aba, VOReg.PagoDeContado, VOReg.OrdenServicio, VOReg.Pedimento, VOReg.FechaPedimento, VOReg.OtroClasificacionOC, ref res);

        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object insertaOrdenCompra()
    {
        int? res = -1;

        insertOrdenCompra.GetData(VOReg.OficinaId,VOReg.ProveedorId, VOReg.FechaEntrega, VOReg.Contacto, VOReg.ViaEmbarque, VOReg.Fob, VOReg.UsuarioId, VOReg.MonedaId, VOReg.NombreProyecto, VOReg.NombreJob, VOReg.PorcentajeDescuento, VOReg.CostoEnvio, VOReg.PorcentajeImpuesto, VOReg.CostoImportacion, VOReg.DatosTransferencia, VOReg.InstruccionesEmbarque, VOReg.Terminos, VOReg.EstatusOrdenCompraId, VOReg.Factura, VOReg.OtroDocumento, VOReg.DocRecibido, VOReg.OrigenId, VOReg.AccountName, VOReg.Address, VOReg.AccountNumber, VOReg.BankName, VOReg.BankAddress, VOReg.Aba, VOReg.PagoDeContado, VOReg.OrdenServicio, VOReg.Pedimento, VOReg.FechaPedimento, VOReg.OtroClasificacionOC, ref res);
        
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object buscarOrdenCompra()
    {
        datos = datosOrdenCompra.GetData(VOReg.OrdenCompraId);
        if (datos.Rows.Count > 0)
        {
        VOReg.OficinaId = Int32.Parse(datos.Rows[0]["idOficinaFacturar"].ToString());
        VOReg.ProveedorId = Int32.Parse(datos.Rows[0]["proveedorId"].ToString());
		VOReg.FechaEntrega = datos.Rows[0]["fechaEntrega"].ToString();
		VOReg.Contacto = datos.Rows[0]["contacto"].ToString();
		VOReg.ViaEmbarque = datos.Rows[0]["viaEmbarque"].ToString();
		VOReg.Fob = datos.Rows[0]["fob"].ToString();
		VOReg.FechaAlta = DateTime.Parse(datos.Rows[0]["fechaAlta"].ToString());
		VOReg.UsuarioId = Int32.Parse(datos.Rows[0]["UsuarioId"].ToString());
		VOReg.UsuarioIdActualizo = Int32.Parse(datos.Rows[0]["UsuarioIdActualizo"].ToString());
		VOReg.FechaModificacion = DateTime.Parse(datos.Rows[0]["fechaModificacion"].ToString());
        VOReg.EstatusOrdenCompraId = Int32.Parse(datos.Rows[0]["estatusOrdenCompraId"].ToString());
        VOReg.MonedaId = Int32.Parse(datos.Rows[0]["MonedaId"].ToString());
        VOReg.NombreProyecto = datos.Rows[0]["NombreProyecto"].ToString();
        VOReg.NombreJob = datos.Rows[0]["NombreJob"].ToString();
        VOReg.PorcentajeDescuento = Double.Parse(datos.Rows[0]["PorcentajeDescuento"].ToString());
        VOReg.CostoEnvio = Double.Parse(datos.Rows[0]["CostoEnvio"].ToString());
        VOReg.PorcentajeImpuesto = Double.Parse(datos.Rows[0]["PorcentajeImpuesto"].ToString());
        VOReg.CostoImportacion = Double.Parse(datos.Rows[0]["CostoImportacion"].ToString());
        VOReg.DatosTransferencia = datos.Rows[0]["DatosTransferencia"].ToString();
        VOReg.InstruccionesEmbarque = datos.Rows[0]["InstruccionesEmbarque"].ToString();
        VOReg.Terminos = datos.Rows[0]["Terminos"].ToString();
        VOReg.Factura = datos.Rows[0]["factura"].ToString();
        VOReg.OtroDocumento = datos.Rows[0]["otroDocumento"].ToString();
        VOReg.DocRecibido = byte.Parse(datos.Rows[0]["docRecibido"].ToString());
        VOReg.OrigenId = Int32.Parse(datos.Rows[0]["origenId"].ToString());
        VOReg.IdNacional = Int32.Parse(datos.Rows[0]["IdNacional"].ToString());
        VOReg.IdInternacional = Int32.Parse(datos.Rows[0]["IdInternacional"].ToString());
        VOReg.AccountName = datos.Rows[0]["NB_ACCOUNTNAME"].ToString();
        VOReg.Address = datos.Rows[0]["NB_ADDRESS"].ToString();
        VOReg.AccountNumber = datos.Rows[0]["NU_ACCOUNTNUMBER"].ToString();
        VOReg.BankName = datos.Rows[0]["NB_BANKNAME"].ToString();
        VOReg.BankAddress = datos.Rows[0]["NB_BANKADDRESS"].ToString();
        VOReg.Aba = datos.Rows[0]["NU_ABA"].ToString();
        VOReg.PagoDeContado = byte.Parse(datos.Rows[0]["pagoDeContado"].ToString());
        VOReg.OrdenServicio = datos.Rows[0]["OrdenServicio"].ToString();
        VOReg.Pedimento = datos.Rows[0]["pedimento"].ToString();
        VOReg.FechaPedimento = datos.Rows[0]["fechaPedimento"].ToString();
        VOReg.OtroClasificacionOC = datos.Rows[0]["OtroClasificacionOC"].ToString();
        VOReg.NombreJefe = datos.Rows[0]["nombreJefe"].ToString();
        VOReg.NombreProveedor = datos.Rows[0]["nombreProveedor"].ToString();
        VOReg.NombreEstatusOrdenCompra = datos.Rows[0]["nombreEstatusOrdenCompra"].ToString();
        VOReg.NombreMoneda = datos.Rows[0]["nombreMoneda"].ToString();
        VOReg.NombreOrigen = datos.Rows[0]["nombreOrigen"].ToString();
            
        return VOReg;
        }
        return VOReg;
    }

    private object insertaFolioFacturaCompra()
    {
        int? res = -1;

        insertFolioOC.GetData(VOReg.FolioFacturaCompra, VOReg.OrdenCompraId, VOReg.UsuarioId, ref res);
        
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
        
    }

    private object insertaOrdenCompraDuplicada()
    {
        int? res = -1;

        duplicaOrdenCompra.GetData(VOReg.OrdenCompraId, VOReg.UsuarioId, ref res);
        
        if (res > 0)
        {
            VOReg.Resultado = res;
            VOReg.OrdenCompraId = (int)VOReg.Resultado;
        }
        return VOReg;
    }

    private object insertaSeguimientoOrdenCompra()
    {
        int? res = -1;

        insertaSeguimiento.GetData(VOReg.OrdenCompraId,VOReg.Factura, VOReg.Comentario,VOReg.UsuarioId, ref res);
    
       if (res > 0)
        {
            VOReg.Resultado = res;
            VOReg.SeguimientoOrdenCompraId = (int)VOReg.Resultado;
        }
        return VOReg;
    }

}
