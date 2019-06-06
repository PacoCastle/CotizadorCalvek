using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using AdministracionTableAdapters;
using System.Collections;

/// <summary>
/// Summary description for CotizacionBL
/// </summary>
public class AdmPedidosPendientesCompraBL : IBusinessLogic
{   
    private AdmPedidosPendientesCompraVO VOReg = new AdmPedidosPendientesCompraVO();
    private set_actualizaDatosSeguimientoPedidosTableAdapter actualizaDatosSeguimientoPedidos = new set_actualizaDatosSeguimientoPedidosTableAdapter();

    //private set_insertaDatosPedidosPendientesPrincipalTableAdapter setPedidosPendientesPrincipal = new set_insertaDatosPedidosPendientesPrincipalTableAdapter();
    //private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (AdmPedidosPendientesCompraVO)O;

        if (VOReg.Operacion == AdmPedidosPendientesCompraVO.ACTUALIZAR)
        {
            return actualizaPedidosSeguimiento();
        }
        else if (VOReg.Operacion == AdmPedidosPendientesCompraVO.INSERTAR)
        {
            return insertaPedidosSeguimiento();
        }
        else if (VOReg.Operacion == AdmPedidosPendientesCompraVO.BUSCAR)
        {
            return buscarPedidosSeguimiento();
        }
       return VOReg;
    }

    private object buscarPedidosSeguimiento()
    {
        //datos = datosDeposito.GetData(VOReg.DepositoId);
        //if (datos.Rows.Count > 0)
        //{
        //VOReg.Cliente_codigo = datos.Rows[0]["deposito_cliente_codigo"].ToString();
        //VOReg.Monto = Double.Parse(datos.Rows[0]["deposito_monto"].ToString());
        //VOReg.MonedaId = Int32.Parse(datos.Rows[0]["deposito_monedaId"].ToString());
        //VOReg.FechaDeposito = DateTime.Parse(datos.Rows[0]["deposito_fecha_deposito"].ToString());
        //VOReg.OficinaId = Int32.Parse(datos.Rows[0]["deposito_oficinaId"].ToString());
        //VOReg.CuentaDepositoId = Int32.Parse(datos.Rows[0]["deposito_cuentaDepositoId"].ToString());
        //VOReg.Archivo = datos.Rows[0]["deposito_archivo"].ToString();
        
        //return VOReg;
        //}
        return null;
    }

    private object insertaPedidosSeguimiento()
    {
        //int? reg = 0;
        //setPedidosSeguimiento.GetData(VOReg.SeriePedido, VOReg.FolioPedido, VOReg.Mensaje, VOReg.EstatusPedidoAlmacenId, VOReg.UsuarioId, ref reg);
        //if (reg > 0)
        //{
        //    VOReg.EstatusPedidoAlmacenId = (int)reg;
        //}
        //return VOReg;
        return null;
    }

    private object actualizaPedidosSeguimiento()
    {

        int monvimientoIdTmp = 0;
        String serieDocumento = "";
        int oficinaId = 0;
        int folioDocumento = 0;
        //int intDocumentoFolioPedido = 0;
        String strDocumentoFolioPedido = "";

        if (VOReg.ArrMovimientos != null && VOReg.ArrMovimientos.Count > 0)
        {
            int ai = 0;
            
            for (ai = 0; ai < VOReg.ArrMovimientos.Count; ai++)
            {
                monvimientoIdTmp = Int32.Parse((VOReg.ArrMovimientos[ai] as ArrayList)[0].ToString().Trim());   //movimientoId
                serieDocumento = (VOReg.ArrMovimientos[ai] as ArrayList)[1].ToString().Trim();  //serie
                oficinaId = Int32.Parse((VOReg.ArrMovimientos[ai] as ArrayList)[2].ToString().Trim());
                folioDocumento = Int32.Parse((VOReg.ArrMovimientos[ai] as ArrayList)[3].ToString().Trim());

                //intDocumentoFolioPedido = VOReg.DocumentoFolioPedido.Length > 0 ? Int32.Parse(VOReg.DocumentoFolioPedido) : 0;
                strDocumentoFolioPedido = VOReg.DocumentoFolioPedido.Length > 0 ? VOReg.DocumentoFolioPedido : "";

                int? res = -1;
                //actualizaDatosSeguimientoPedidos.GetData(monvimientoIdTmp, serieDocumento.Trim(), folioDocumento, VOReg.DocumentoSeriePedido.Trim(), intDocumentoFolioPedido, VOReg.FechaEntrega.Trim(), VOReg.Comentarios, VOReg.UsuarioId, VOReg.FechaConfirmada.Trim(), ref res);
                actualizaDatosSeguimientoPedidos.GetData(monvimientoIdTmp, serieDocumento, oficinaId, folioDocumento, VOReg.DocumentoSeriePedido.Trim(), strDocumentoFolioPedido, VOReg.FechaEntrega.Trim(), VOReg.Comentarios, VOReg.UsuarioId, VOReg.FechaConfirmada.Trim(), VOReg.ProvContactado, VOReg.CodigoProd, VOReg.UsuarioIdAsignado, ref res);
                if (res == 0)
                {
                    VOReg.Resultado = res;
                }
            }
        }
        
        return VOReg;
    }

}
