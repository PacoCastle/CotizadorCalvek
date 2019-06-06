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
/// Summary description for DepositosVO
/// </summary>
public class DepositosVO
{
    private int? depositoId = 0;
    private String cliente_codigo = null;
    private Double monto = 0;
    private int monedaId = 0;
    private DateTime fechaDeposito;
    private int oficinaId = 0;
    private int cuentaDepositoId = 0;
    private String archivo = null;

    private String folioAdmin1 = null;
    private int porcentajeFolio1 = 0;
    private String folioAdmin2 = null;
    private int porcentajeFolio2 = 0;
    private String folioAdmin3 = null;
    private int porcentajeFolio3 = 0;
    private String folioAdmin4 = null;
    private int porcentajeFolio4 = 0;
    private String folioAdmin5 = null;
    private int porcentajeFolio5 = 0;

    private int afectado = 0;
    private String comentarios = null;
    private int usuarioIdAlta = 0;
    private DateTime fechaAlta;
    private int usuarioIdActualiza = 0;
    private DateTime fechaActualiza;

    private String folioDocumento = null;
    private int tipoDocumento = 0;

    private int operacion;
    private int? resultado;

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int DOCUMENTOAFECTADO = 4;
    public static int INSERTAR_FOLIODEPOSITO = 5;

	public DepositosVO()
	{
    depositoId = 0;
    Cliente_codigo = null;
    monto =0;
    monedaId = 0;
    fechaDeposito = new DateTime();
    oficinaId = 0;
    cuentaDepositoId = 0;
    archivo = null;
    folioAdmin1 = null;
    porcentajeFolio1 = 0;
    folioAdmin2 = null;
    porcentajeFolio2 = 0;
    folioAdmin3 = null;
    porcentajeFolio3 = 0;
    afectado=0;
    comentarios = null;
    usuarioIdAlta=0;
    fechaAlta = new DateTime();
    usuarioIdActualiza = 0;
    fechaActualiza = new DateTime();

    folioDocumento = null;
    tipoDocumento = 0;

    operacion = 0;
    resultado = 0;
	}

    public int? DepositoId
    {
        get
        {
            return depositoId;
        }
        set
        {
            depositoId = value;
        }
    }

    public String Cliente_codigo
    {
        get
        {
            return cliente_codigo;
        }
        set
        {
            cliente_codigo = value;
        }
    }

    public Double Monto
    {
        get
        {
            return monto;
        }
        set
        {
            monto = value;
        }
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
    
    public DateTime FechaDeposito
    {
        get
        {
            return fechaDeposito;
        }
        set
        {
            fechaDeposito = value;
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

    public int CuentaDepositoId
    {
        get
        {
            return cuentaDepositoId;
        }
        set
        {
            cuentaDepositoId = value;
        }
    }

    public String Archivo
    {
        get
        {
            return archivo;
        }
        set
        {
            archivo = value;
        }
    }

    public String FolioAdmin1
    {
        get
        {
            return folioAdmin1;
        }
        set
        {
            folioAdmin1 = value;
        }
    }

    public int PorcentajeFolio1
    {
        get
        {
            return porcentajeFolio1;
        }
        set
        {
            porcentajeFolio1 = value;
        }
    }    

    public String FolioAdmin2
    {
        get
        {
            return folioAdmin2;
        }
        set
        {
            folioAdmin2 = value;
        }
    }

    public int PorcentajeFolio2
    {
        get
        {
            return porcentajeFolio2;
        }
        set
        {
            porcentajeFolio2 = value;
        }
    } 

    public String FolioAdmin3
    {
        get
        {
            return folioAdmin3;
        }
        set
        {
            folioAdmin3 = value;
        }
    }

    public int PorcentajeFolio3
    {
        get
        {
            return porcentajeFolio3;
        }
        set
        {
            porcentajeFolio3 = value;
        }
    }

    public String FolioAdmin4
    {
        get
        {
            return folioAdmin4;
        }
        set
        {
            folioAdmin4 = value;
        }
    }

    public int PorcentajeFolio4
    {
        get
        {
            return porcentajeFolio4;
        }
        set
        {
            porcentajeFolio4 = value;
        }
    }

    public String FolioAdmin5
    {
        get
        {
            return folioAdmin5;
        }
        set
        {
            folioAdmin5 = value;
        }
    }

    public int PorcentajeFolio5
    {
        get
        {
            return porcentajeFolio5;
        }
        set
        {
            porcentajeFolio5 = value;
        }
    }

    public int Afectado
    {
        get
        {
            return afectado;
        }
        set
        {
            afectado = value;
        }
    }

    public String Comentarios
    {
        get
        {
            return comentarios;
        }
        set
        {
            comentarios = value;
        }
    }
    
    public int UsuarioIdAlta
    {
        get
        {
            return usuarioIdAlta;
        }
        set
        {
            usuarioIdAlta = value;
        }
    }

    public DateTime FechaAlta
    {
        get
        {
            return fechaAlta;
        }
        set
        {
            fechaAlta = value;
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

    public DateTime FechaActualiza
    {
        get
        {
            return fechaActualiza;
        }
        set
        {
            fechaActualiza = value;
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
