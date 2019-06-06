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
/// Summary description for ClienteVO
/// </summary>
public class preCompraVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;

    private int comprasId = 0;
    private String idproducto = null;
    private int tipoDocumentoId = 0;
    private int monedaId = 0;
    private String cveLinea = null;
    private String sucursal = null;
    private int cveAgente = 0;
    private String folioPedido = null;
    private String folioOrdenCompra = null;

    private ArrayList arrProductos = null;
    private int cantidad = 0;
    private String claveProveedor = null;
    private String comentario = null;

    private int usuarioId = 0;
    private int operacion;
    private int? resultado;

    public preCompraVO()
    {
    comprasId = 0;
    idproducto = null;
    tipoDocumentoId = 0;
    monedaId = 0;
    cveLinea = null;
    sucursal = null;
    cveAgente = 0;
    folioPedido = null;
    folioOrdenCompra = null;
    arrProductos = null;
    cantidad = 0;
    claveProveedor = null;
    comentario = null;

    usuarioId = 0;
    operacion = 0;
    resultado = 0;
    }

    public int ComprasId
    {
        get
        {
            return comprasId;
        }
        set
        {
            comprasId = value;
        }
    }

    public String Idproducto
    {
        get
        {
            return idproducto;
        }
        set
        {
            idproducto = value;
        }
    }

    public int TipoDocumentoId
    {
        get
        {
            return tipoDocumentoId;
        }
        set
        {
            tipoDocumentoId = value;
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

    public String CveLinea
    {
        get
        {
            return cveLinea;
        }
        set
        {
            cveLinea = value;
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

    public int CveAgente
    {
        get
        {
            return cveAgente;
        }
        set
        {
            cveAgente = value;
        }
    }

    public String FolioPedido
    {
        get
        {
            return folioPedido;
        }
        set
        {
            folioPedido = value;
        }
    }
    
    public String FolioOrdenCompra
    {
        get
        {
            return folioOrdenCompra;
        }
        set
        {
            folioOrdenCompra = value;
        }
    }

    public ArrayList ArrProductos
    {
        get
        {
            return arrProductos;
        }
        set
        {
            arrProductos = value;
        }
    }

    public int Cantidad
    {
        get
        {
            return cantidad;
        }
        set
        {
            cantidad = value;
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

    public String Comentario
    {
        get
        {
            return comentario;
        }
        set
        {
            comentario = value;
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