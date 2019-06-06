using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using ControlFacturasTableAdapters;

/// <summary>
/// Summary description for controlFacturasBL
/// </summary>
public class controlFacturasBL : IBusinessLogic
{
    private controlFacturasVO VOReg = new controlFacturasVO();
    //private set_actualizaDatosTHFacturasTableAdapter setActualizaTHFacturas = new set_actualizaDatosTHFacturasTableAdapter();
    private set_insActualizaControFacturaTableAdapter setControlFactura = new set_insActualizaControFacturaTableAdapter();
    private set_actualizaPendientesControFacturaTableAdapter setPendienteControlFactura = new set_actualizaPendientesControFacturaTableAdapter();

    //private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (controlFacturasVO)O;

        if (VOReg.Operacion == controlFacturasVO.ACTUALIZAR)
        {
            return actualizaDatosControlCartera();
        }
        else if (VOReg.Operacion == controlFacturasVO.INSERTAR)
        {
            return insertaDatosControlCartera();
        }
        else if (VOReg.Operacion == controlFacturasVO.BUSCAR)
        {
            return buscarDatosControlCartera();
        }
        else if (VOReg.Operacion == controlFacturasVO.ACTUALIZAPENDIENTES)
        {
            actualizaPendientesControlCartera();
        }
       return VOReg;
    }

    private object buscarDatosControlCartera()
    {
        //datos = datosD.GetData(VOReg.DepositoId);
        //if (datos.Rows.Count > 0)
        //{
        //VOReg.codigo = datos.Rows[0]["codigo"].ToString();
        //VOReg.Monto = Double.Parse(datos.Rows[0]["monto"].ToString());
        //VOReg.MonedaId = Int32.Parse(datos.Rows[0]["monedaId"].ToString());
        //return VOReg;
        //}
        return null;
    }

    private object insertaDatosControlCartera()
    {
        //int? reg = 0;
        //setControlCartera.GetData(VOReg.IntIdAdmin, VOReg.IntFolio, VOReg.StrSerie, VOReg.UsuarioIdInserto,ref VOReg.Resultado);
        //return VOReg;
        return null;
    }

    private object actualizaDatosControlCartera()
    {
        setControlFactura.GetData(VOReg.IntUsuarioId, VOReg.IntControlFacturaId, VOReg.StrIDKEPLER, VOReg.IntFirmaHojaVerde, VOReg.IntRevision, VOReg.IntClienteAgente, VOReg.IntAgenteId, VOReg.StrFechaProgramada, VOReg.StrComentarios,VOReg.StrSucursal);
        return VOReg;
    }

    private object actualizaPendientesControlCartera()
    {
        //setControlFactura.GetData(VOReg.IntUsuarioId, VOReg.IntControlFacturaId, VOReg.StrIDKEPLER, VOReg.IntFirmaHojaVerde, VOReg.IntRevision, VOReg.IntClienteAgente, VOReg.IntAgenteId, VOReg.StrFechaProgramada, VOReg.StrComentarios, VOReg.StrSucursal);
        string[] pendienteTemp;
        ArrayList arrListaPendiente = VOReg.ArrPendientes;
        if (arrListaPendiente != null && arrListaPendiente.Count > 0)
        {
            foreach (String item in arrListaPendiente)
            {
                pendienteTemp = item.Split('-');
                //setPendienteControlFactura.GetData(VOReg.IntUsuarioId, VOReg.IntControlFacturaId, VOReg.StrIDKEPLER, VOReg.StrSucursal, VOReg.IntEstatusControlFactura);
                setPendienteControlFactura.GetData(VOReg.IntUsuarioId, Int32.Parse(pendienteTemp[2]), pendienteTemp[0], pendienteTemp[1], Int32.Parse(pendienteTemp[3]));
            }
        }

        return VOReg;
    }

}