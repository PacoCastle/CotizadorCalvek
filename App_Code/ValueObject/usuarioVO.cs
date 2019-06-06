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
/// Summary description for usuarioVO
/// </summary>
public class usuarioVO
{
	public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int CAMBIARPASSWORD = 4;

    private int usuarioid = 0;
    private String usuario_login = null;
    private String usuario_contrasena = null;
    private String usuario_nombrecompleto = null;
    private int usuario_perfilid = 0;
    private int usuario_estatusId = 0;
    private int usuario_oficinaId = 0;
    private String usuario_codigoUsuarioAdmin = null;
    private String usuario_correoElectronico = null;
    private String usuario_radio = null;
    private DateTime usuario_fechaAlta;
    private DateTime usuario_fechaActualiza;
    private int usuario_jefeUsuarioId = 0;
    private String oficina_nombre = null;
    private int usuario_administrativoId = 0;
    private int usuario_VentasInternasId = 0;

    private int usuario_comisionId = 0;
    private int usuario_correoOC = 0;
    private int usuario_correoTraspaso = 0;

    private int? resultado;
    private int operacion;

    private int actualizarPassword;
    private String confirmaContrasena;

    public usuarioVO()
	{
        usuarioid = 0;
        usuario_login = "";
        usuario_contrasena = "";
        usuario_nombrecompleto = "";
        usuario_perfilid = 0;
        usuario_estatusId = 0;
        usuario_oficinaId = 0;
        usuario_codigoUsuarioAdmin = "";
        usuario_correoElectronico = "";
        usuario_radio = "";
        usuario_fechaAlta = new DateTime();
        usuario_fechaActualiza = new DateTime();
        usuario_jefeUsuarioId = 0;
        oficina_nombre = "";
        resultado = 0;
        operacion = 0;
        actualizarPassword = 0;
        confirmaContrasena = "";
        usuario_administrativoId = 0;
        usuario_VentasInternasId = 0;

        usuario_comisionId = 0;
        usuario_correoOC = 0;
        usuario_correoTraspaso = 0;

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
    public int Usuarioid
    {
        get
        {
            return usuarioid;
        }
        set
        {
            usuarioid = value;
        }
    }
    public String Usuario_login
    {
        get
        {
            return usuario_login;
        }
        set
        {
            usuario_login = value;
        }
    }
    public String Usuario_contrasena
    {
        get
        {
            return usuario_contrasena;
        }
        set
        {
            usuario_contrasena = value;
        }
    }
    public String Usuario_nombrecompleto
    {
        get
        {
            return usuario_nombrecompleto;
        }
        set
        {
            usuario_nombrecompleto = value;
        }
    }
    public int Usuario_perfilid
    {
        get
        {
            return usuario_perfilid;
        }
        set
        {
            usuario_perfilid = value;
        }
    }
    public int Usuario_estatusId
    {
        get
        {
            return usuario_estatusId;
        }
        set
        {
            usuario_estatusId = value;
        }
    }
    public int Usuario_oficinaId
    {
        get
        {
            return usuario_oficinaId;
        }
        set
        {
            usuario_oficinaId = value;
        }
    }
    public DateTime Usuario_fechaAlta
    {
        get
        {
            return usuario_fechaAlta;
        }
        set
        {
            usuario_fechaAlta = value;
        }
    }
    public DateTime Usuario_fechaActualiza
    {
        get
        {
            return usuario_fechaActualiza;
        }
        set
        {
            usuario_fechaActualiza = value;
        }
    }

    public int Usuario_jefeUsuarioId
    {
        get
        {
            return usuario_jefeUsuarioId;
        }
        set
        {
            usuario_jefeUsuarioId = value;
        }
    }

        public int Usuario_administrativoId
    {
        get
        {
            return usuario_administrativoId;
        }
        set
        {
            usuario_administrativoId = value;
        }
    }

        public int Usuario_ventasInternasId
    {
        get
        {
            return usuario_VentasInternasId;
        }
        set
        {
            usuario_VentasInternasId = value;
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
    public int ActualizarPassword
    {
        get
        {
            return actualizarPassword;
        }
        set
        {
            actualizarPassword = value;
        }
    }
    public String ConfirmaContrasena
    {
        get
        {
            return confirmaContrasena;
        }
        set
        {
            confirmaContrasena = value;
        }
    }

    public String Usuario_codigoUsuarioAdmin
    {
        get
        {
            return usuario_codigoUsuarioAdmin;
        }
        set
        {
            usuario_codigoUsuarioAdmin = value;
        }
    }
        
    public String Usuario_correoElectronico
    {
        get
        {
            return usuario_correoElectronico;
        }
        set
        {
            usuario_correoElectronico = value;
        }
    }

    public String Usuario_radio
    {
        get
        {
            return usuario_radio;
        }
        set
        {
            usuario_radio = value;
        }
    }

    public String Oficina_nombre
    {
        get
        {
            return oficina_nombre;
        }
        set
        {
            oficina_nombre = value;
        }
    }

  public int Usuario_comisionId
    {
        get
        {
            return usuario_comisionId;
        }
        set
        {
            usuario_comisionId = value;
        }
    }
        
  public int Usuario_correoOC
    {
        get
        {
            return usuario_correoOC;
        }
        set
        {
            usuario_correoOC = value;
        }
    }

  public int Usuario_correoTraspaso
    {
        get
        {
            return usuario_correoTraspaso;
        }
        set
        {
            usuario_correoTraspaso = value;
        }
    }

}
