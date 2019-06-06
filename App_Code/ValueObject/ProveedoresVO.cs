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
public class ProveedoresVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int LISTAPROVEEDORES = 4;

    private int proveedorId = 0;
    private String nombre = null;
    private String representante = null;
    private int direccionId = 0;
    private int usuarioId = 0;
    private int usuarioIdActualizo = 0;
    private String[,] arrProveedores = null;
    private String rfc = null;
    private int enSistemaAdm = 0;
    private int operacion;
    private int? resultado;

    public ProveedoresVO()
    {
    proveedorId = 0;
    nombre = null;
    representante = null;
    direccionId = 0;
    usuarioId =0;
    usuarioIdActualizo = 0;
    arrProveedores = null;
    rfc = null;
    enSistemaAdm = 0;
    operacion = 0;
    resultado = 0;
    }

    public int ProveedorId
    {
        get
        {
            return proveedorId;
        }
        set
        {
            proveedorId = value;
        }
    }
    
    public String Nombre
    {
        get
        {
            return nombre;
        }
        set
        {
            nombre = value;
        }
    }
    
    
    
    public String Representante
    {
        get
        {
            return representante;
        }
        set
        {
            representante = value;
        }
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
    
    public String[,] ArrProveedores
    {
        get
        {
            return arrProveedores;
        }
        set
        {
            arrProveedores = value;
        }
    }

    public String Rfc
    {
        get
        {
            return rfc;
        }
        set
        {
            rfc = value;
        }
    }

    public int EnSistemaAdm
    {
        get
        {
            return enSistemaAdm;
        }
        set
        {
            enSistemaAdm = value;
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