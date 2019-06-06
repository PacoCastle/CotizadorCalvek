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
/// Summary description for ClienteVO
/// </summary>
public class DireccionesVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int LISTADIRECCIONES = 4;

    private int direccionId = 0;
    private String calle = null;
    private String noExterior = null;
    private String noInterior = null;
    private String cp = null;
    private String colonia = null;
    private String ciudad = null;
    private String delMunicipio = null;
    private String estado = null;
    private String email = null;
    private String fax = null;
    private String telefono1 = null;
    private String telefono2 = null;
    private String telefono3 = null;
    private String telefono4 = null;
    private String paginaWeb = null;
    private int tipoDomicilio = 0;
    private int usuarioIdAlta = 0;
    private int usuarioIdActualizo = 0;
    private int operacion;
    private int? resultado;

    public DireccionesVO()
    {
    direccionId = 0;
    calle = null;
    noExterior = null;
    noInterior = null;
    cp = null;
    colonia = null;
    ciudad = null;
    delMunicipio = null;
    estado = null;
    email = null;
    fax = null;
    telefono1 = null;
    telefono2 = null;
    telefono3 = null;
    telefono4 = null;
    paginaWeb = null;
    tipoDomicilio = 0;
    usuarioIdAlta = 0;
    usuarioIdActualizo = 0;
    operacion = 0;
    resultado = 0;
    }

    public int DireccionId
    {
        get
        {
            return direccionId;
        }
        set
        {
            direccionId = value;
        }
    }
      
    public String Calle
    {
        get
        {
            return calle;
        }
        set
        {
            calle = value;
        }
    }
    
    public String NoExterior
    {
        get
        {
            return noExterior;
        }
        set
        {
            noExterior = value;
        }
    }
    
    public String NoInterior
    {
        get
        {
            return noInterior;
        }
        set
        {
            noInterior = value;
        }
    }

    public String Cp
    {
        get
        {
            return cp;
        }
        set
        {
            cp = value;
        }
    }

    public String Colonia
    {
        get
        {
            return colonia;
        }
        set
        {
            colonia = value;
        }
    }

    public String Ciudad
    {
        get
        {
            return ciudad;
        }
        set
        {
            ciudad = value;
        }
    }
    
    public String DelMunicipio
    {
        get
        {
            return delMunicipio;
        }
        set
        {
            delMunicipio = value;
        }
    }
    
    public String Estado
    {
        get
        {
            return estado;
        }
        set
        {
            estado = value;
        }
    }

    public String Email
    {
        get
        {
            return email;
        }
        set
        {
            email = value;
        }
    }

    public String Fax
    {
        get
        {
            return fax;
        }
        set
        {
            fax = value;
        }
    }

    public String Telefono1
    {
        get
        {
            return telefono1;
        }
        set
        {
            telefono1 = value;
        }
    }

    public String Telefono2
    {
        get
        {
            return telefono2;
        }
        set
        {
            telefono2 = value;
        }
    }

    public String Telefono3
    {
        get
        {
            return telefono3;
        }
        set
        {
            telefono3 = value;
        }
    }

    public String Telefono4
    {
        get
        {
            return telefono4;
        }
        set
        {
            telefono4 = value;
        }
    }

    public String PaginaWeb
    {
        get
        {
            return paginaWeb;
        }
        set
        {
            paginaWeb = value;
        }
    }

    public int TipoDomicilio
    {
        get
        {
            return tipoDomicilio;
        }
        set
        {
            tipoDomicilio = value;
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

    public int UsuarioIdActualizo
    {
        get
        {
            return usuarioIdActualizo;
        }
        set
        {
            usuarioIdActualizo = value;
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