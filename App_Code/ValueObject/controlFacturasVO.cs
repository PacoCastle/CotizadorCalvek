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
/// Summary description for controlFacturaVO
/// </summary>
public class controlFacturasVO
{
    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int ACTUALIZAPENDIENTES = 4;

    private int intUsuarioId = 0;
    private int intControlFacturaId = 0;
    private String strIDKEPLER = "";
    private int intFirmaHojaVerde = 0;
    private int intRevision = 0;
    private int intClienteAgente = 0;
    private int intAgenteId = 0;
    private String strFechaProgramada = "";
    private String strComentarios = "";
    private String strSucursal = "";
    private ArrayList arrPendientes = null;
    private int intEstatusControlFactura = 0;

    private int operacion = 0;
    private int? resultado = 0;

    public controlFacturasVO()
	{
    intUsuarioId = 0;
    intControlFacturaId = 0;
    strIDKEPLER = "";
    intFirmaHojaVerde = 0;
    intRevision = 0;
    intClienteAgente = 0;
    intAgenteId = 0;
    strFechaProgramada = "";
    strComentarios = "";
    strSucursal = "";
    arrPendientes = null;
    intEstatusControlFactura = 0;
    operacion = 0;
    resultado = 0;
	}


    public int IntUsuarioId
    {
        get
        {
            return intUsuarioId;
        }
        set
        {
            intUsuarioId = value;
        }
    }

    public int IntControlFacturaId
    {
        get
        {
            return intControlFacturaId;
        }
        set
        {
            intControlFacturaId = value;
        }
    }

    public String StrIDKEPLER
    {
        get
        {
            return strIDKEPLER;
        }
        set
        {
            strIDKEPLER = value;
        }
    }

    public int IntFirmaHojaVerde
    {
        get
        {
            return intFirmaHojaVerde;
        }
        set
        {
            intFirmaHojaVerde = value;
        }
    }

    public int IntRevision
    {
        get
        {
            return intRevision;
        }
        set
        {
            intRevision = value;
        }
    }

    public int IntClienteAgente
    {
        get
        {
            return intClienteAgente;
        }
        set
        {
            intClienteAgente = value;
        }
    }

    public int IntAgenteId
    {
        get
        {
            return intAgenteId;
        }
        set
        {
            intAgenteId = value;
        }
    }

    public String StrFechaProgramada
    {
        get
        {
            return strFechaProgramada;
        }
        set
        {
            strFechaProgramada = value;
        }
    }

    public String StrComentarios
    {
        get
        {
            return strComentarios;
        }
        set
        {
            strComentarios = value;
        }
    }
    public String StrSucursal
    {
        get
        {
            return strSucursal;
        }
        set
        {
            strSucursal = value;
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

    public int IntEstatusControlFactura
    {
        get
        {
            return intEstatusControlFactura;
        }
        set
        {
            intEstatusControlFactura = value;
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
