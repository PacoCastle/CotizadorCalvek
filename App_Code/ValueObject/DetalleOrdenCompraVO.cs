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
/// Summary description for ClienteVO
/// </summary>
public class DetalleOrdenCompraVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int ACTUALIZA_ID_DETALLEORDENCOMPRA = 4;
    public static int INSERTA_SEGUIMIENTO_DETALLE = 5;
    
    private int detalleOrdenCompraId = 0;
    private int ordenCompraId = 0;
    private Double cantidad = 0;
    private String descripcion = null;
    private Double precioUnitario = 0;
    private String[,] arrDetalleOrdenCompra = null;
    private int usuarioId = 0;

    private Double descuento = 0;

    private int tipoDetalleOrdenCompraId = 0;

    private String fechaEntrega = null;
    private int banderaExceptoIva = 0;
    private String tiempoEntrega = null;

    private Double pendiente = 0;
    private ArrayList arrPendientes = null;
    private int seguimientoOrdenCompraId = 0;

    private int operacion;
    private int? resultado;

    public DetalleOrdenCompraVO()
    {
    detalleOrdenCompraId = 0;
    ordenCompraId = 0;
    cantidad = 0;
    descripcion = null;
    precioUnitario = 0;
    arrDetalleOrdenCompra = null;
    usuarioId = 0;
    descuento = 0;
    tipoDetalleOrdenCompraId = 0;

    fechaEntrega = null;
    banderaExceptoIva = 0;
    tiempoEntrega = null;
    pendiente = 0;
    ArrayList arrPendientes = null;

    operacion = 0;
    resultado = 0;
    }

    public int DetalleOrdenCompraId
    {
        get
        {
            return detalleOrdenCompraId;
        }
        set
        {
            detalleOrdenCompraId = value;
        }
    }

    public int OrdenCompraId
    {
        get
        {
            return ordenCompraId;
        }
        set
        {
            ordenCompraId = value;
        }
    }

    public Double Cantidad
    {
        get
        {
            return cantidad;
        }
        set
        {
            cantidad = value;
        }
    }

    public String Descripcion
    {
        get
        {
            return descripcion;
        }
        set
        {
            descripcion = value;
        }
    }

    public Double PrecioUnitario
    {
        get
        {
            return precioUnitario;
        }
        set
        {
            precioUnitario = value;
        }
    }

    public String[,] ArrDetalleOrdenCompra
    {
        get
        {
            return arrDetalleOrdenCompra;
        }
        set
        {
            arrDetalleOrdenCompra = value;
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

    public Double Descuento
    {
        get
        {
            return descuento;
        }
        set
        {
            descuento = value;
        }
    }

    public int TipoDetalleOrdenCompraId
    {
        get
        {
            return tipoDetalleOrdenCompraId;
        }
        set
        {
            tipoDetalleOrdenCompraId = value;
        }
    }

    public String FechaEntrega
    {
        get
        {
            return fechaEntrega;
        }
        set
        {
            fechaEntrega = value;
        }
    }

    public String TiempoEntrega
    {
        get
        {
            return tiempoEntrega;
        }
        set
        {
            tiempoEntrega = value;
        }
    }

    public int BanderaExceptoIva
    {
        get
        {
            return banderaExceptoIva;
        }
        set
        {
            banderaExceptoIva = value;
        }
    }

    public Double Pendiente
    {
        get
        {
            return pendiente;
        }
        set
        {
            pendiente = value;
        }
    }

    public ArrayList ArrPendientes
    {
        get
        {
            return arrPendientes;
        }
        set
        {
            arrPendientes = value;
        }
    }

    public int SeguimientoOrdenCompraId
    {
        get
        {
            return seguimientoOrdenCompraId;
        }
        set
        {
            seguimientoOrdenCompraId = value;
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