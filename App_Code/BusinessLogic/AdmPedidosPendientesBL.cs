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

/// <summary>
/// Summary description for CotizacionBL
/// </summary>
public class AdmPedidosPendientesBL : IBusinessLogic
{   
    private AdmPedidosPendientesVO VOReg = new AdmPedidosPendientesVO();
    private set_insertaDatosPedidosSeguimientoTableAdapter setPedidosSeguimiento = new set_insertaDatosPedidosSeguimientoTableAdapter();

    //private set_insertaDatosPedidosPendientesPrincipalTableAdapter setPedidosPendientesPrincipal = new set_insertaDatosPedidosPendientesPrincipalTableAdapter();

    //private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (AdmPedidosPendientesVO)O;

        if (VOReg.Operacion == AdmPedidosPendientesVO.ACTUALIZAR)
        {
            return actualizaPedidosSeguimiento();
        }
        else if (VOReg.Operacion == AdmPedidosPendientesVO.INSERTAR)
        {
            return insertaPedidosSeguimiento();
        }
        else if (VOReg.Operacion == AdmPedidosPendientesVO.BUSCAR)
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
        int? reg = 0;
        setPedidosSeguimiento.GetData(VOReg.SeriePedido, VOReg.FolioPedido, VOReg.Mensaje, VOReg.EstatusPedidoAlmacenId, VOReg.UsuarioId, VOReg.EstatusPendienteId, VOReg.OficinaId, ref reg);
        if (reg > 0)
        {
            VOReg.EstatusPedidoAlmacenId = (int)reg;
        }
        return VOReg;
    }

    private object actualizaPedidosSeguimiento()
    {
        //int? res = -1;
        //actualizaDatosDeposito.GetData(VOReg.DepositoId, VOReg.Cliente_codigo, VOReg.Monto, VOReg.MonedaId, VOReg.FechaDeposito, VOReg.OficinaId, VOReg.CuentaDepositoId, VOReg.Archivo, VOReg.FolioAdmin1, VOReg.PorcentajeFolio1, VOReg.FolioAdmin2, VOReg.PorcentajeFolio2, VOReg.FolioAdmin3, VOReg.PorcentajeFolio3, VOReg.FolioAdmin4, VOReg.PorcentajeFolio4, VOReg.FolioAdmin5, VOReg.PorcentajeFolio5, VOReg.Afectado, VOReg.UsuarioIdActualiza, VOReg.Comentarios, ref res);
        //if (res == 0)
        //{
        //    VOReg.Resultado = res;
        //}
        //return VOReg;
        return null;
    }

}
