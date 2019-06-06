using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public class fechaCalendarioComisionVO
{
    public static int INSERTAR = 2;
    public static int ACTUALIZAR = 3;
    public static int INSERTARAGT = 4;
    public static int BUSCARAGT = 5;
    public static int EDITAGT = 6;
    public static int ESTATUSAGT = 7;

    //CALENDARIO
    private String fechaCalendario = null;
    private String usuarioModificacionId = null;
    private String idFechaCalendario = null;
    
    
    //AGENTES-GARANTIAS
    private int idAgenteGarantiaInt = 0;
    private String idAgente = null;
    private String nbAgente = null;
    private int idOficina = 0;
    private String nbOficina = null;
    private String nbSucursal = null;
    private int idPuesto = 0;
    private Decimal faGarantia = 0;
    private DateTime? fhInicio = null;
    private DateTime? fhVigencia = null;

    private String idAgenteGarantia = null;
    private String idOficinaStr = null;
    private String idPuestoStr = null;
    private String faGarantiaStr = null;
    private String fhInicioStr = null;
    private String fhVigenciaStr = null;
    
    //COMUNES
    private int? resultado;
    private int operacion;


    //--------------------------------------------------------------------------------------------
	public fechaCalendarioComisionVO()
	{
        fechaCalendario = "";
        usuarioModificacionId = "";
        resultado = 0;
        operacion = 0;
        idFechaCalendario = "";
        idAgente = "";
        nbAgente = "";
        idOficina = 0;
        nbOficina = "";
        nbSucursal = "";
        idPuesto = 0;
        faGarantia = 0;
	}
    //---------------------------------------------------------------------------------------------
    //CALENDARIO
    public String FechaCalendario
    {
        get
        {
            return fechaCalendario;
        }
        set
        {
            fechaCalendario = value;
        }
    }
    public String UsuarioModificacionId
    {
        get
        {
            return usuarioModificacionId;
        }
        set
        {
            usuarioModificacionId = value;
        }
    }
    public String IdFechaCalendario
    {
        get
        {
            return idFechaCalendario;
        }
        set
        {
            idFechaCalendario = value;
        }
    }

    //AGENTES-GARANTIA
    public int IdAgenteGarantiaInt
    {
        get
        {
            return idAgenteGarantiaInt;
        }
        set
        {
            idAgenteGarantiaInt = value;
        }
    }
    public String IdAgente
    {
        get
        {
            return idAgente;
        }
        set
        {
            idAgente = value;
        }
    }
    public String NbAgente
    {
        get
        {
            return nbAgente;
        }
        set
        {
            nbAgente = value;
        }
    }
    public int IdOficina
    {
        get
        {
            return idOficina;
        }
        set
        {
            idOficina = value;
        }
    }
    public String NbOficina
    {
        get
        {
            return nbOficina;
        }
        set
        {
            nbOficina = value;
        }
    }
    public String NbSucursal
    {
        get
        {
            return nbSucursal;
        }
        set
        {
            nbSucursal = value;
        }
    }
    public int IdPuesto
    {
        get
        {
            return idPuesto;
        }
        set
        {
            idPuesto = value;
        }
    }
    public Decimal FaGarantia
    {
        get
        {
            return faGarantia;
        }
        set
        {
            faGarantia = value;
        }
    }
    public DateTime? FhInicio
    {
        get
        {
            return fhInicio;
        }
        set
        {
            fhInicio = value;
        }
    }
    public DateTime? FhVigencia
    {
        get
        {
            return fhVigencia;
        }
        set
        {
            fhVigencia = value;
        }
    }

    public String IdAgenteGarantia
    { 
        get
        {
            return idAgenteGarantia;
        }
        set
        {
            idAgenteGarantia = value;
        }
    }

    public String IdOficinaStr
    {
        get
        {
            return idOficinaStr;
        }
        set
        {
            idOficinaStr = value;
        }
    }

    public String IdPuestoStr
    {
        get
        {
            return idPuestoStr;
        }
        set
        {
            idPuestoStr = value;
        }
    }

    public String FaGarantiaStr
    {
        get
        {
            return faGarantiaStr;
        }
        set
        {
            faGarantiaStr = value;
        }
    }

    public String FhInicioStr
    {
        get
        {
            return fhInicioStr;
        }
        set
        {
            fhInicioStr = value;
        }
    }

    public String FhVigenciaStr
    {
        get
        {
            return fhVigenciaStr;
        }
        set
        {
            fhVigenciaStr = value;
        }
    }

    //COMUNES
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