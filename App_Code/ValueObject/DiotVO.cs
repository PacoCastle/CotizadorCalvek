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
/// Summary description for DiotVO
/// </summary>
public class DiotVO
{
	public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;

    private int periodoAcreditamientoId = 0;
	private int anoAcreditamiento = 0;
	private int mesAcreditamiento = 0;
	private int polizaId = 0;
    private String cuenta = null;
    private String sucursal = null;
	private String claveProveedor = null;
	private String tipoPoliza = null;
	private String serieDocumento = null;
    private String folioDocumento = null;
	private int usuarioId = 0;

    private int? resultado;
    private int operacion;

    public DiotVO()
	{
    periodoAcreditamientoId = 0;
	anoAcreditamiento = 0;
	mesAcreditamiento = 0;
	polizaId = 0;
    cuenta = null;
    sucursal = null;
	claveProveedor = null;
	tipoPoliza = null;
	serieDocumento = null;
    folioDocumento = null;
    usuarioId = 0;
    resultado = 0;
    operacion = 0;
	}


    public int PeriodoAcreditamientoId
    {
        get
        {
            return periodoAcreditamientoId;
        }
        set
        {
            periodoAcreditamientoId = value;
        }
    }

    public int AnoAcreditamiento
    {
        get
        {
            return anoAcreditamiento;
        }
        set
        {
            anoAcreditamiento = value;
        }
    }

    public int MesAcreditamiento
    {
        get
        {
            return mesAcreditamiento;
        }
        set
        {
            mesAcreditamiento = value;
        }
    }

    public int PolizaId
    {
        get
        {
            return polizaId;
        }
        set
        {
            polizaId = value;
        }
    }

    public String Cuenta
    {
        get
        {
            return cuenta;
        }
        set
        {
            cuenta = value;
        }
    }

    public String Sucursal
    {
        get
        {
            return sucursal;
        }
        set
        {
            sucursal = value;
        }
    }

    public String ClaveProveedor
    {
        get
        {
            return claveProveedor;
        }
        set
        {
            claveProveedor = value;
        }
    }

    public String TipoPoliza
    {
        get
        {
            return tipoPoliza;
        }
        set
        {
            tipoPoliza = value;
        }
    }

    public String SerieDocumento
    {
        get
        {
            return serieDocumento;
        }
        set
        {
            serieDocumento = value;
        }
    }
    
    public String FolioDocumento
    {
        get
        {
            return folioDocumento;
        }
        set
        {
            folioDocumento = value;
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
 
}
