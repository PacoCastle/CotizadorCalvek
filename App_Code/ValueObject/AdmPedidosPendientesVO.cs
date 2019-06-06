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

/// <summary>
/// Summary description for DetalleCotizaVO
/// </summary>
public class AdmPedidosPendientesVO
{
    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;

    private int pedidoSeguimientoId = 0;
    private String seriePedido = "";
    private int folioPedido = 0;
    private String mensaje = "";
    private int estatusPedidoAlmacenId = 0;
    private int usuarioId = 0;
    private int estatusPendienteId = 0;
    private int oficinaId = 0;

    private int operacion = 0;
    private int? resultado = 0;

    public AdmPedidosPendientesVO()
	{
    pedidoSeguimientoId = 0;
    seriePedido = "";
    folioPedido = 0;
    mensaje = "";
    estatusPedidoAlmacenId = 0;
    usuarioId = 0;
    estatusPendienteId = 0;
    oficinaId = 0;
    operacion = 0;
    resultado = 0;
	}

    public int PedidoSeguimientoId
    {
        get
        {
            return pedidoSeguimientoId;
        }
        set
        {
            pedidoSeguimientoId = value;
        }
    }
    
    public String SeriePedido
    {
        get
        {
            return seriePedido;
        }
        set
        {
            seriePedido = value;
        }
    }
    
    public int FolioPedido
    {
        get
        {
            return folioPedido;
        }
        set
        {
            folioPedido = value;
        }
    }

    public String Mensaje
    {
        get
        {
            return mensaje;
        }
        set
        {
            mensaje = value;
        }
    }

    public int EstatusPedidoAlmacenId
    {
        get
        {
            return estatusPedidoAlmacenId;
        }
        set
        {
            estatusPedidoAlmacenId = value;
        }
    }
    
    public int UsuarioId
    {
        get
        {
            return usuarioId;
        }
        set
        {
            usuarioId = value;
        }
    }

    public int EstatusPendienteId
    {
        get
        {
            return estatusPendienteId;
        }
        set
        {
            estatusPendienteId = value;
        }
    }
    public int OficinaId
    {
        get
        {
            return oficinaId;
        }
        set
        {
            oficinaId = value;
        }
    }
    public int Operacion
    {
        get
        {
            return operacion;
        }
        set
        {
            operacion = value;
        }
    }

    public int? Resultado
    {
        get
        {
            return resultado;
        }
        set
        {
            resultado = value;
        }
    }
}
