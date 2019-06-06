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
/// Summary description for cotizacionVO
/// </summary>
public class cotizacionVO
{
    private int? cotizacionId = 0;
    private DateTime fecha;
    private int usuarioId = 0;
    private int activo = 1;
    private int preAprovado = 0;
    private int estatusCotizacionId = 0;
    private String estatusCotizacionNombre = null;
    private int operacion = 0;
    private String codigoCliente = null;
    private int clienteIdNuevo = 0;
    private int tipoMoneda = 0;
    private Decimal tC_DOLAR = 0;
    private Decimal tC_EURO = 0;
    private int tipoDocumento = 0;
    private String documento = null;
    private String condicionesPago = null;
    private String lab = null;
    private String razonSocial = null;
    private String banactcliente = null;
    private String representanteLegal = null;
    private Boolean editaCotizacion = true;
    private int usuarioIdInserto;
    private int banderaDescuento;
    private int banderaIncPrecio;
    private int usuarioIdActualiza;
    private int limitePorcentaje;
    private String unidadNegocio;
    private String fechaVencimiento;
    private String fechaCaida;
    private String notas = null;
    private int iva = 0;
    private Double desctogral = 0;
    private int? resultado;


    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int INSERTARCP = 4;
    public static int ACTUALIZARBANDESC = 5;
    public static int ACTUALIZARBANINCPREC = 6;

    public cotizacionVO()
    {
        cotizacionId = 0;
        fecha = new DateTime();
        usuarioId = 0;
        activo = 1;
        preAprovado = 0;
        estatusCotizacionId = 0;
        estatusCotizacionNombre = null;
        codigoCliente = null;
        clienteIdNuevo = 0;
        tipoMoneda = 0;
        tC_DOLAR = 0;
        tC_EURO = 0;
        tipoDocumento = 0;
        documento = null;
        condicionesPago = null;
        lab = null;
        razonSocial = null;
        banactcliente = null;
        representanteLegal = null;
        editaCotizacion = true;
        UsuarioIdInserto = 0;
        banderaDescuento = 0;
        banderaIncPrecio = 0;
        usuarioIdActualiza = 0;
        limitePorcentaje = 0;
        unidadNegocio = null;
        fechaVencimiento = null;
        fechaCaida = null;
        operacion = 0;
        notas = null;
        iva = 16;
        desctogral = 0;
        resultado = 0;

    }

    public Double DesctoGral
    {
        get
        {
            return desctogral;
        }
        set
        {
            desctogral = value;
        }
    }

    public int Iva
    {
        get
        {
            return iva;
        }
        set
        {
            iva = value;
        }
    }
    public String Notas
    {
        get
        {
            return notas;
        }
        set
        {
            notas = value;
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
    public int? CotizacionId
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

    public DateTime Fecha
    {
        get
        {
            return fecha;
        }
        set
        {
            fecha = value;
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
    public int Activo
    {
        get
        {
            return activo;
        }
        set
        {
            activo = value;
        }
    }
    public int PreAprovado
    {
        get
        {
            return preAprovado;
        }
        set
        {
            preAprovado = value;
        }
    }

    public int EstatusCotizacionId
    {
        get
        {
            return estatusCotizacionId;
        }
        set
        {
            estatusCotizacionId = value;
        }
    }

    public String EstatusCotizacionNombre
    {
        get
        {
            return estatusCotizacionNombre;
        }
        set
        {
            estatusCotizacionNombre = value;
        }
    }

    public String CodigoCliente
    {
        get
        {
            return codigoCliente;
        }
        set
        {
            codigoCliente = value;
        }
    }

    public int ClienteIdNuevo
    {
        get
        {
            return clienteIdNuevo;
        }
        set
        {
            clienteIdNuevo = value;
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


    public Decimal TC_DOLAR
    {
        get
        {
            return tC_DOLAR;
        }
        set
        {
            tC_DOLAR = value;
        }
    }

    public Decimal TC_EURO
    {
        get
        {
            return tC_EURO;
        }
        set
        {
            tC_EURO = value;
        }
    }

    public int TipoDocumento
    {
        get
        {
            return tipoDocumento;
        }
        set
        {
            tipoDocumento = value;
        }
    }

    public String Documento
    {
        get
        {
            return documento;
        }
        set
        {
            documento = value;
        }
    }

    public Boolean EditaCotizacion
    {
        get
        {
            return editaCotizacion;
        }
        set
        {
            editaCotizacion = value;
        }
    }

    public String CondicionesPago
    {
        get
        {
            return condicionesPago;
        }
        set
        {
            condicionesPago = value;
        }
    }

    public String LAB
    {
        get
        {
            return lab;
        }
        set
        {
            lab = value;
        }
    }

    public String RazonSocial
    {
        get
        {
            return razonSocial;
        }
        set
        {
            razonSocial = value;
        }
    }

    public String BanActCliente
    {
        get
        {
            return banactcliente;
        }
        set
        {
            banactcliente = value;
        }
    }
    public String RepresentanteLegal
    {
        get
        {
            return representanteLegal;
        }
        set
        {
            representanteLegal = value;
        }
    }


    public int UsuarioIdInserto
    {
        get
        {
            return usuarioIdInserto;
        }
        set
        {
            usuarioIdInserto = value;
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
    public int BanderaDescuento
    {
        get
        {
            return banderaDescuento;
        }
        set
        {
            banderaDescuento = value;
        }
    }

    public int BanderaIncPrecio
    {
        get
        {
            return banderaIncPrecio;
        }
        set
        {
            banderaIncPrecio = value;
        }
    }

    public int LimitePorcentaje
    {
        get
        {
            return limitePorcentaje;
        }
        set
        {
            limitePorcentaje = value;
        }
    }

    public String UnidadNegocio
    {
        get
        {
            return unidadNegocio;
        }
        set
        {
            unidadNegocio = value;
        }
    }

    public String FechaVencimiento
    {
        get
        {
            return fechaVencimiento;
        }
        set
        {
            fechaVencimiento = value;
        }
    }
    public String FechaCaida
    {
        get
        {
            return fechaCaida;
        }
        set
        {
            fechaCaida= value;
        }
    }

}

