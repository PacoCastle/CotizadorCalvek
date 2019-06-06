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
using cobranzaTableAdapters;

/// <summary>
/// Summary description for CotizacionBL
/// </summary>
public class DepositosBL : IBusinessLogic
{
    private DepositosVO VOReg = new DepositosVO();
    private set_insertaDatosDepositoTableAdapter setDeposito = new set_insertaDatosDepositoTableAdapter();
    private get_datosDepositoTableAdapter datosDeposito = new get_datosDepositoTableAdapter();
    private set_actualizaDatosDepositoTableAdapter actualizaDatosDeposito = new set_actualizaDatosDepositoTableAdapter();
    private set_actualizaDocumentoAfectadoDepositoTableAdapter actualizaDocAfectadoDeposito = new set_actualizaDocumentoAfectadoDepositoTableAdapter();
    private set_insertaFolioDepositoTableAdapter set_insertaFolioDeposito = new set_insertaFolioDepositoTableAdapter();

    private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (DepositosVO)O;

        if (VOReg.Operacion == DepositosVO.ACTUALIZAR)
        {
            return actualizaDeposito();
        }
        else if (VOReg.Operacion == DepositosVO.INSERTAR)
        {
            return insertaDeposito();
        }
        else if (VOReg.Operacion == DepositosVO.BUSCAR)
        {
            return buscarDeposito();
        }
        else if (VOReg.Operacion == DepositosVO.DOCUMENTOAFECTADO)
        {
            return actualizaDocumentoAfectadoDeposito();
        }
        else if (VOReg.Operacion == DepositosVO.INSERTAR_FOLIODEPOSITO)
        {
            return insertaDepositoFolio();
        }
       return VOReg;
    }

    private object buscarDeposito()
    {
        datos = datosDeposito.GetData(VOReg.DepositoId);
        if (datos.Rows.Count > 0)
        {
        VOReg.Cliente_codigo = datos.Rows[0]["deposito_cliente_codigo"].ToString();
        VOReg.Monto = Double.Parse(datos.Rows[0]["deposito_monto"].ToString());
        VOReg.MonedaId = Int32.Parse(datos.Rows[0]["deposito_monedaId"].ToString());
        VOReg.FechaDeposito = DateTime.Parse(datos.Rows[0]["deposito_fecha_deposito"].ToString());
        VOReg.OficinaId = Int32.Parse(datos.Rows[0]["deposito_oficinaId"].ToString());
        VOReg.CuentaDepositoId = Int32.Parse(datos.Rows[0]["deposito_cuentaDepositoId"].ToString());
        VOReg.Archivo = datos.Rows[0]["deposito_archivo"].ToString();
        VOReg.FolioAdmin1 = datos.Rows[0]["deposito_FolioAdmin1"].ToString();
        //VOReg.PorcentajeFolio1 = Int32.Parse(datos.Rows[0]["deposito_PorcentajeFolio1"].ToString());
        VOReg.FolioAdmin2 = datos.Rows[0]["deposito_FolioAdmin2"].ToString();
        //VOReg.PorcentajeFolio2 = Int32.Parse(datos.Rows[0]["deposito_PorcentajeFolio2"].ToString());
        VOReg.FolioAdmin3 = datos.Rows[0]["deposito_FolioAdmin3"].ToString();
        //VOReg.PorcentajeFolio3 = Int32.Parse(datos.Rows[0]["deposito_PorcentajeFolio3"].ToString());
        VOReg.FolioAdmin4 = datos.Rows[0]["deposito_FolioAdmin4"].ToString();
        //VOReg.PorcentajeFolio4 = Int32.Parse(datos.Rows[0]["deposito_PorcentajeFolio4"].ToString());
        VOReg.FolioAdmin5 = datos.Rows[0]["deposito_FolioAdmin5"].ToString();
        //VOReg.PorcentajeFolio5 = Int32.Parse(datos.Rows[0]["deposito_PorcentajeFolio5"].ToString());
        VOReg.Afectado = Int32.Parse(datos.Rows[0]["deposito_afectado"].ToString());
        VOReg.Comentarios = datos.Rows[0]["deposito_comentario"].ToString();
        return VOReg;
        }
        return VOReg;
    }

    private object insertaDeposito()
    {
        int? reg=0;
        setDeposito.GetData(VOReg.Cliente_codigo, VOReg.Monto, VOReg.MonedaId, VOReg.FechaDeposito, VOReg.OficinaId, VOReg.CuentaDepositoId, VOReg.Archivo,VOReg.Afectado, VOReg.UsuarioIdAlta, VOReg.UsuarioIdActualiza,VOReg.Comentarios, ref reg);
        if (reg > 0)
        {
            VOReg.DepositoId = reg;
        }
        return VOReg;
    }

    private object actualizaDeposito()
    {
        int? res = -1;
        actualizaDatosDeposito.GetData(VOReg.DepositoId, VOReg.Cliente_codigo, VOReg.Monto, VOReg.MonedaId, VOReg.FechaDeposito, VOReg.OficinaId, VOReg.CuentaDepositoId, VOReg.Archivo, VOReg.FolioAdmin1, VOReg.PorcentajeFolio1, VOReg.FolioAdmin2, VOReg.PorcentajeFolio2, VOReg.FolioAdmin3, VOReg.PorcentajeFolio3, VOReg.FolioAdmin4, VOReg.PorcentajeFolio4, VOReg.FolioAdmin5, VOReg.PorcentajeFolio5, VOReg.Afectado, VOReg.UsuarioIdActualiza, VOReg.Comentarios, ref res);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object actualizaDocumentoAfectadoDeposito()
    {
        int? res = -1;
        actualizaDocAfectadoDeposito.GetData(VOReg.DepositoId, VOReg.Afectado, VOReg.UsuarioIdActualiza, ref res);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object insertaDepositoFolio()
    {
        int? res = -1;
        set_insertaFolioDeposito.GetData(VOReg.FolioDocumento, VOReg.TipoDocumento, VOReg.DepositoId, VOReg.UsuarioIdActualiza, ref res);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }
    

}
