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
/// Summary description for CotizacionBL
/// </summary>
public class CotizacionBL : IBusinessLogic
{
    private cotizacionVO VOReg = new cotizacionVO();
    private set_insertaDatosCotizacionTableAdapter setCotizacion = new set_insertaDatosCotizacionTableAdapter();
    private set_insertaDatosCotizacion_copiaTableAdapter setCotizacionCP = new set_insertaDatosCotizacion_copiaTableAdapter();
    private get_datosCotizacionTableAdapter Cotizacion = new get_datosCotizacionTableAdapter();
    private set_actualizaDatosCotizacionTableAdapter setUCotizacion = new set_actualizaDatosCotizacionTableAdapter();
    private set_actualizaDatosCotizacionBanderaTableAdapter setUBCotizacion = new set_actualizaDatosCotizacionBanderaTableAdapter();
    private set_actualizaDatosCotizacionBanderaIncPrecTableAdapter setUBIPCotizacion = new set_actualizaDatosCotizacionBanderaIncPrecTableAdapter();
    private DataTable datos = null;


    public Object execute(Object O)
    {
        VOReg = (cotizacionVO)O;

        if (VOReg.Operacion == cotizacionVO.ACTUALIZAR)
        {
            return actualizaCotizacion();
        }
        else if (VOReg.Operacion == cotizacionVO.INSERTAR)
        {
            return insertaCotizacion();
        }
        else if (VOReg.Operacion == cotizacionVO.BUSCAR)
        {
            return buscarCotizacion();
        }
        else if (VOReg.Operacion == cotizacionVO.INSERTARCP)
        {
            return insertaCotizacionCP();
        }
        else if (VOReg.Operacion == cotizacionVO.ACTUALIZARBANDESC)
        {
            return actualizaCotizacionBandera();
        }
        else if (VOReg.Operacion == cotizacionVO.ACTUALIZARBANINCPREC)
        {
            return actualizaCotizacionBanderaIncPrec();
        }


        return VOReg;
    }

    private object buscarCotizacion()
    {
        datos = Cotizacion.GetData(VOReg.CotizacionId);
        if (datos.Rows.Count > 0)
        {
            VOReg.CotizacionId = Int32.Parse(datos.Rows[0]["CotizacionId"].ToString());
            VOReg.Fecha = DateTime.Parse(datos.Rows[0]["Fecha"].ToString());
            //VOReg.Fecha = datos.Rows[0]["Fecha"].ToString();
            VOReg.UsuarioId = Int32.Parse(datos.Rows[0]["UsuarioId"].ToString());
            VOReg.Activo = Int32.Parse(datos.Rows[0]["Activo"].ToString());
            VOReg.PreAprovado = Int32.Parse(datos.Rows[0]["PreAprovada"].ToString());
            VOReg.EstatusCotizacionId = Int32.Parse(datos.Rows[0]["estatusCotizacionId"].ToString());
            VOReg.CodigoCliente = datos.Rows[0]["codigoCliente"].ToString();
            VOReg.ClienteIdNuevo = Int32.Parse(datos.Rows[0]["clienteIdNuevo"].ToString());
            VOReg.EstatusCotizacionNombre = datos.Rows[0]["estatusCotizacionNombre"].ToString();
            VOReg.TipoMoneda = Int32.Parse(datos.Rows[0]["tipoMoneda"].ToString());
            VOReg.TC_DOLAR = Decimal.Parse(datos.Rows[0]["TC_DOLAR"].ToString());
            VOReg.TC_EURO = Decimal.Parse(datos.Rows[0]["TC_EURO"].ToString());
            VOReg.TipoDocumento = Int32.Parse(datos.Rows[0]["tipoDocumento"].ToString());
            VOReg.Documento = datos.Rows[0]["documento"].ToString();
            VOReg.CondicionesPago = datos.Rows[0]["condicionesPago"].ToString();
            VOReg.LAB = datos.Rows[0]["LAB"].ToString();
            VOReg.RepresentanteLegal = datos.Rows[0]["representanteLegal"].ToString();
            VOReg.BanderaDescuento = Int32.Parse(datos.Rows[0]["banderaDescuento"].ToString());
            VOReg.LimitePorcentaje = Int32.Parse(datos.Rows[0]["limitePorcentaje"].ToString());
            VOReg.FechaVencimiento = datos.Rows[0]["fechaVencimiento"].ToString();
            VOReg.FechaCaida = datos.Rows[0]["fechaCaida"].ToString();
            VOReg.Notas = datos.Rows[0]["notas"].ToString();
            VOReg.Iva = Int32.Parse(datos.Rows[0]["iva"].ToString());
            VOReg.DesctoGral = Double.Parse(datos.Rows[0]["desctogral"].ToString());
            VOReg.UnidadNegocio = datos.Rows[0]["unidadnegocio"].ToString();
            VOReg.RazonSocial = datos.Rows[0]["razonSocial"].ToString();
            VOReg.BanderaIncPrecio = Int32.Parse(datos.Rows[0]["banderaIncPrecio"].ToString());


            habilitaEdicion();
            return VOReg;
        }
        return VOReg;
    }

    private object insertaCotizacion()
    {
        int? reg=0;
        setCotizacion.GetData(VOReg.CotizacionId, VOReg.Fecha, VOReg.UsuarioId, VOReg.Activo, VOReg.PreAprovado, VOReg.EstatusCotizacionId, VOReg.CodigoCliente, VOReg.ClienteIdNuevo, VOReg.TipoMoneda, VOReg.TipoDocumento, VOReg.UnidadNegocio, VOReg.Documento, VOReg.UsuarioIdInserto, VOReg.RepresentanteLegal,VOReg.Iva,VOReg.DesctoGral, ref reg);
        if (reg > 0)
        {
            VOReg.CotizacionId = reg;
        }
        return VOReg;
    }

    private object insertaCotizacionCP()
    {
        int? reg = 0;
        setCotizacionCP.GetData(VOReg.CotizacionId, VOReg.Fecha, VOReg.UsuarioId, VOReg.Activo, VOReg.PreAprovado, VOReg.EstatusCotizacionId, VOReg.CodigoCliente, VOReg.ClienteIdNuevo, VOReg.TipoMoneda,VOReg.TipoDocumento, VOReg.UnidadNegocio, VOReg.Documento, VOReg.UsuarioIdInserto, VOReg.RepresentanteLegal, VOReg.Iva, VOReg.DesctoGral,VOReg.LAB,VOReg.CondicionesPago,VOReg.Notas, ref reg);
        if (reg > 0)
        {
            VOReg.CotizacionId = reg;
        }
        return VOReg;
    }
    private object actualizaCotizacion()
    {
        int? res = -1;
        setUCotizacion.GetData(VOReg.CotizacionId, VOReg.EstatusCotizacionId, VOReg.TipoMoneda, VOReg.CondicionesPago, VOReg.LAB, VOReg.RepresentanteLegal, VOReg.BanderaDescuento, VOReg.UsuarioIdActualiza, VOReg.Activo, VOReg.FechaVencimiento,  VOReg.FechaCaida, VOReg.Fecha, VOReg.Notas, VOReg.Iva, VOReg.DesctoGral, VOReg.RazonSocial, VOReg.BanActCliente, ref res);
        if (res == 0)
        {
            habilitaEdicion();
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object actualizaCotizacionBandera()
    {
        int? res = -1;
        
        setUBCotizacion.GetData(VOReg.CotizacionId, VOReg.BanderaDescuento, ref res); 
        if (res == 0)
        {
            habilitaEdicion();
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object actualizaCotizacionBanderaIncPrec()
    {
        int? res = -1;

        setUBIPCotizacion.GetData(VOReg.CotizacionId, VOReg.BanderaIncPrecio, ref res);
        if (res == 0)
        {
            habilitaEdicion();
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private Boolean habilitaEdicion()
    {
        if(VOReg.EstatusCotizacionId > 1)
            {
                VOReg.EditaCotizacion = false;
            }
        else
            {
                VOReg.EditaCotizacion = true;
            }
            return VOReg.EditaCotizacion;
    }
}
