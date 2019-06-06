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
/// Summary description for TipoCambioVO
/// </summary>
public class TipoCambioVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int BUSCAR_TIPOS_CAMBIOS = 4;

    private int monedaId = 0;
    private String descripcion = null;
    private Double cambio = 0;
    private String prefijo = null;
    private int operacion;
    private int? resultado;
    private DateTime fechaTipoCambio;
    private String[,] arrCambios = null; 

	public TipoCambioVO()
	{
        monedaId = 0;
        descripcion = null;
        cambio = 0;
        operacion = 0;
        resultado = 0;
        prefijo = null;
        fechaTipoCambio = new DateTime();
        arrCambios = null;
	}

    public int MonedaId
    {
        get
        {
            return monedaId;
        }
        set
        {
            monedaId = value;
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

    public String Prefijo
    {
        get
        {
            return prefijo;
        }
        set
        {
            prefijo = value;
        }
    }
    
    public Double Cambio
    {
        get
        {
            return cambio;
        }
        set
        {
            cambio = value;
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

    public DateTime FechaTipoCambio
    {
        get
        {
            return fechaTipoCambio;
        }
        set
        {
            fechaTipoCambio = value;
        }
    }

    public String[,] ArrCambios
    {
        get
        {
            return arrCambios;
        }
        set
        {
            arrCambios = value;
        }
    }

}
