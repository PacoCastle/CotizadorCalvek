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
/// Summary description for DetalleCotizaVO
/// </summary>
public class AdmPedidosPendientesCompraVO
{
    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;

    private String documentoSeriePedido = "";
    private String documentoFolioPedido = "";
    private String fechaEntrega = "";
    private String comentarios = "";
    private ArrayList arrMovimientos = null;
    private String fechaConfirmada = "";
    private Boolean provContactado = false;
    private String codigoProd = "";
    private int usuarioIdAsignado = 0;
    private int usuarioId = 0;
    private int operacion = 0;
    private int? resultado = 0;

    public AdmPedidosPendientesCompraVO()
	{
    documentoSeriePedido = "";
    documentoFolioPedido = "";
    fechaEntrega = "";
    comentarios = "";
    arrMovimientos = new ArrayList();
    fechaConfirmada = "";
    provContactado = false;
    codigoProd = "";
    usuarioIdAsignado = 0;
    usuarioId = 0;
    operacion = 0;
    resultado = 0;
	}

    public String DocumentoSeriePedido
    {
        get
        {
            return documentoSeriePedido;
        }
        set
        {
            documentoSeriePedido = value;
        }
    }

    public String DocumentoFolioPedido
    {
        get
        {
            return documentoFolioPedido;
        }
        set
        {
            documentoFolioPedido = value;
        }
    }

    public String FechaEntrega
    {
        get
        {
            return fechaEntrega;
        }
        set
        {
            fechaEntrega = value;
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

    public ArrayList ArrMovimientos
    {
        get
        {
            return arrMovimientos;
        }
        set
        {
            arrMovimientos = value;
        }
    }

    public String FechaConfirmada
    {
        get
        {
            return fechaConfirmada;
        }
        set
        {
            fechaConfirmada = value;
        }
    }

    public Boolean ProvContactado
    {
        get
        {
            return provContactado;
        }
        set
        {
            provContactado = value;
        }
    }

    public String CodigoProd
    {
        get
        {
            return codigoProd;
        }
        set
        {
            codigoProd = value;
        }
    }

    public int UsuarioIdAsignado
    {
        get
        {
            return usuarioIdAsignado;
        }
        set
        {
            usuarioIdAsignado = value;
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
