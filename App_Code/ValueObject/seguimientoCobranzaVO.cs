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
/// Summary description for seguimientoCobranzaVO
/// </summary>
public class seguimientoCobranzaVO
{
    private int? logId = 0;
    private String origen = null;
    private String cambio = null;
    private String tipo = null;
    private int estatus = 0;

    private String fechaAgenda = null;

    private String clienteId = null;
    private int usuarioIdModificacion = 0;

    private int? contactoCXPId = 0;
    private String nombreResponsable = null;
    private String telefono = null;
    private String extension = null;
    private String correoElectronico = null;
    private String telefonoCelular = null;
    private String comentarios = null;
    private DateTime fechaModificacion;
    private int activo = 0;
    private int operacion;
    private int? resultado;

    //public static int ACTUALIZAR = 1;
    public static int INSERTAR_EVENTO = 1;
    public static int INSERTAR = 2;
    //public static int BUSCAR = 3;
    

	public seguimientoCobranzaVO()
	{
    logId = 0;
    origen = null;
    cambio = null;
    tipo = null;
    estatus = 0;
    fechaAgenda = null;

    clienteId = null;
    usuarioIdModificacion = 0;

    contactoCXPId = 0;
    nombreResponsable = null;
    telefono = null;
    Extension = null;
    correoElectronico = null;
    telefonoCelular = null;
    comentarios = null;
    fechaModificacion = new DateTime();
    activo = 0;
    operacion = 0;
    resultado = 0;
	}

    public int? LogId
    {
        get
        {
            return logId;
        }
        set
        {
            logId = value;
        }
    }
    
    public String Origen
    {
        get
        {
            return origen;
        }
        set
        {
            origen = value;
        }
    }
    
    public String Cambio
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
    
    public String Tipo
    {
        get
        {
            return tipo;
        }
        set
        {
            tipo = value;
        }
    }

    public int Estatus
    {
        get
        {
            return estatus;
        }
        set
        {
            estatus = value;
        }
    }

    public String FechaAgenda
    {
        get
        {
            return fechaAgenda;
        }
        set
        {
            fechaAgenda = value;
        }
    }

    public String ClienteId
    {
        get
        {
            return clienteId;
        }
        set
        {
            clienteId = value;
        }
    }

    public int UsuarioIdModificacion
    {
        get
        {
            return usuarioIdModificacion;
        }
        set
        {
            usuarioIdModificacion = value;
        }
    }

    public int? ContactoCXPId
    {
        get
        {
            return contactoCXPId;
        }
        set
        {
            contactoCXPId = value;
        }
    }
    
    public String NombreResponsable
    {
        get
        {
            return nombreResponsable;
        }
        set
        {
            nombreResponsable = value;
        }
    }

    public String Telefono
    {
        get
        {
            return telefono;
        }
        set
        {
            telefono = value;
        }
    }

    public String Extension
    {
        get
        {
            return extension;
        }
        set
        {
            extension = value;
        }
    }

    public String CorreoElectronico
    {
        get
        {
            return correoElectronico;
        }
        set
        {
            correoElectronico = value;
        }
    }

    public String TelefonoCelular
    {
        get
        {
            return telefonoCelular;
        }
        set
        {
            telefonoCelular = value;
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

    public DateTime FechaModificacion
    {
        get
        {
            return fechaModificacion;
        }
        set
        {
            fechaModificacion = value;
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
