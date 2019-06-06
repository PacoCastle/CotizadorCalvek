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
public class ClienteVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int BUSCAR_ADMIN_RFC = 4;
    public static int BUSCAR_ADMIN_CODIGO = 5;
    public static int LISTACLIENTES = 6;
    public static int BUSCAR_SQL_CODIGO = 7;
    public static int BUSCAR_ADMIN_ID = 8;

    private int clienteid = 0;
    private String cliente_codigo = null;
    private String cliente_razonSocial = null;
    private String cliente_rfc = null;
    private String cliente_calle = null;
    private int cliente_usuarioId = 0;
    private Double cliente_descuento = 0;
    private String cliente_representante = null;
    private String cliente_telefonoContacto = null;
    private String cliente_correoElectronico = null;
    private String cliente_fax = null;
    private String cliente_noExterno = null;
    private String cliente_noInterno = null;
    private String cliente_codigoPostal = null;
    private String cliente_estado = null;
    private String cliente_municipio = null;
    private String cliente_colonia = null;
    private int cliente_tipoCliente = 0;
    private Double cliente_limiteCredito = 0;
    private int cliente_diasCredito = 0;
    private String cliente_idAdmin = null;
    private String cliente_actrazon = null;

    private String[,] arrClientes = null; 
    private int operacion;
    private int? resultado;

    public ClienteVO()
    {
        clienteid = 0;
        cliente_codigo = null;
        cliente_razonSocial = null;
        cliente_rfc = null;
        cliente_calle = null;
        cliente_usuarioId = 0;
        cliente_descuento = 0;
        cliente_representante = null;
        cliente_telefonoContacto = null;
        cliente_correoElectronico = null;
        cliente_fax = null;
        cliente_noExterno = null;
        cliente_noInterno = null;
        cliente_codigoPostal = null;
        cliente_estado = null;
        cliente_municipio = null;
        cliente_colonia = null;
        cliente_tipoCliente = 0;
        cliente_limiteCredito = 0;
        cliente_diasCredito = 0;
        cliente_codigo = null;
        cliente_idAdmin = null;
        cliente_actrazon = null;

        arrClientes = null;
        operacion = 0;
        resultado = 0;
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
        
    public int Clienteid
    {
        get
        {
            return clienteid;
        }
        set
        {
            clienteid = value;
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
        
    public String Cliente_razonSocial
    {
        get
        {
            return cliente_razonSocial;
        }
        set
        {
            cliente_razonSocial = value;
        }
    }

    public String Cliente_rfc
    {
        get
        {
            return cliente_rfc;
        }
        set
        {
            cliente_rfc = value;
        }
    }
    public String Cliente_calle
    {
        get
        {
            return cliente_calle;
        }
        set
        {
            cliente_calle = value;
        }
    }

    public int Cliente_usuarioId
    {
        get
        {
            return cliente_usuarioId;
        }
        set
        {
            cliente_usuarioId = value;
        }
    }

    public Double Cliente_descuento
    {
        get
        {
            return cliente_descuento;
        }
        set
        {
            cliente_descuento = value;
        }
    }

    public String Cliente_Representante
    {
        get
        {
            return cliente_representante;
        }
        set
        {
            cliente_representante = value;
        }
    }

    public String Cliente_TelefonoContacto
    {
        get
        {
            return cliente_telefonoContacto;
        }
        set
        {
            cliente_telefonoContacto = value;
        }
    }
    
    public String Cliente_CorreoElectronico
    {
        get
        {
            return cliente_correoElectronico;
        }
        set
        {
            cliente_correoElectronico = value;
        }
    }

    public String Cliente_Fax
    {
        get
        {
            return cliente_fax;
        }
        set
        {
            cliente_fax = value;
        }
    }

    public String Cliente_noExterno
    {
        get
        {
            return cliente_noExterno;
        }
        set
        {
            cliente_noExterno = value;
        }
    }

    public String Cliente_noInterno
    {
        get
        {
            return cliente_noInterno;
        }
        set
        {
            cliente_noInterno = value;
        }
    }

   public String Cliente_CodigoPostal
    {
        get
        {
            return cliente_codigoPostal;
        }
        set
        {
            cliente_codigoPostal = value;
        }
    }

    public String Cliente_Estado
    {
        get
        {
            return cliente_estado;
        }
        set
        {
            cliente_estado = value;
        }
    }

    public String Cliente_Municipio
    {
        get
        {
            return cliente_municipio;
        }
        set
        {
            cliente_municipio = value;
        }
    }

        
    public String Cliente_colonia
    {
        get
        {
            return cliente_colonia;
        }
        set
        {
            cliente_colonia = value;
        }
    }

    public int Cliente_tipoCliente
    {
        get
        {
            return cliente_tipoCliente;
        }
        set
        {
            cliente_tipoCliente = value;
        }
    }
    
    public Double Cliente_LimiteCredito
    {
        get
        {
            return cliente_limiteCredito;
        }
        set
        {
            cliente_limiteCredito = value;
        }
    }

    public int Cliente_DiasCredito
    {
        get
        {
            return cliente_diasCredito;
        }
        set
        {
            cliente_diasCredito = value;
        }
    }

    public string Cliente_idAdmin
    {
        get
        {
            return cliente_idAdmin;
        }
        set
        {
            cliente_idAdmin = value;
        }
    }

    public string Cliente_ActRazon
    {
        get
        {
            return cliente_actrazon;
        }
        set
        {
            cliente_actrazon = value;
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

    public String[,] ArrClientes
    {
        get
        {
            return arrClientes;
        }
        set
        {
            arrClientes = value;
        }
    }

}