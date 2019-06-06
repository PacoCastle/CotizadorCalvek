using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for DetalleCotizaVO
/// </summary>
public class DetalleCotizaVO
{
    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int BUSCAR_DETALLES_COTIZACION = 4;

    private String productoRef = "";
    private int cotizacionId = 0;
    private String productoDesc = "";
    private Double productoPrecio = 0;
    private int cantidad = 0;
    private Double descuento = 0;
    private int tiempoEntrega = 0;
    private int unidadMedida = 0;
    private int tipoMoneda = 0;
    private int usuarioIdActualiza = 0;
    private int productoComodin = 0;
    private int aplicaRango = 0;

    private String[,] arrDetalles = null; 

    private int operacion = 0;
    private int? resultado = 0;
    private String mensajeError = null;

	public DetalleCotizaVO()
	{
    productoRef = "";
    cotizacionId = 0;
    productoDesc = "";
    productoPrecio = 0;
    cantidad = 0;
    //descuento = 0;
    tiempoEntrega = 0;
    arrDetalles = null;
    operacion = 0;
    resultado = 0;
    mensajeError = null;
    unidadMedida = 0 ;
    tipoMoneda = 0;
    usuarioIdActualiza = 0;
    productoComodin = 0;
    aplicaRango = 0;
    }

    public String ProductoRef
    {
        get
        {
            return productoRef;
        }
        set
        {
            productoRef = value;
        }
    }

    public int CotizacionId
    {
        get
        {
            return cotizacionId;
        }
        set
        {
            cotizacionId = value;
        }
    }
    
    public String ProductoDesc
    {
        get
        {
            return productoDesc;
        }
        set
        {
            productoDesc = value;
        }
    }
    
    public Double ProductoPrecio
    {
        get
        {
            return productoPrecio;
        }
        set
        {
            productoPrecio = value;
        }
    }
    
    public int Cantidad
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

    public int TiempoEntrega
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

    public int UnidadMedida
    {
        get
        {
            return unidadMedida;
        }
        set
        {
            unidadMedida = value;
        }
    }

    public int TipoMoneda
    {
        get
        {
            return tipoMoneda;
        }
        set
        {
            tipoMoneda = value;
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

    public String MensajeError
    {
        get
        {
            return mensajeError;
        }
        set
        {
            mensajeError = value;
        }
    }

    public String[,] ArrDetalles
    {
        get
        {
            return arrDetalles;
        }
        set
        {
            arrDetalles = value;
        }
    }

    public int UsuarioIdActualiza
    {
        get
        {
            return usuarioIdActualiza;
        }
        set
        {
            usuarioIdActualiza = value;
        }
    }

    public int ProductoComodin
    {
        get
        {
            return productoComodin;
        }
        set
        {
            productoComodin = value;
        }
    }
    public int AplicaRango
    {
        get
        {
            return aplicaRango;
        }
        set
        {
            aplicaRango = value;
        }
    }
}
