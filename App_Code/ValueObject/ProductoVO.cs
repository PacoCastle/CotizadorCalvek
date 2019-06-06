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
/// Summary description for ProductoVO
/// </summary>
public class ProductoVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int ACTUALIZARARCHIVO = 4;

    private int? producto_ID = 0;
    private String producto_Codigo = null;
    private String producto_Nombre = null;
    private String producto_Marca = null;
    private Double producto_Precio = 0.0;
    private int producto_Moneda = 0;
    private String producto_Categoria = null;
    private String producto_Descripcion = null;
    private int producto_TiempoEntrega = 0;
    private int producto_MarcaId = 0;
    private int producto_CampDescripcion = 0;
	private int producto_CampPrecio = 0;
	private int producto_CampMoneda = 0;
    private int producto_CampTE = 0;
    private int usuarioIdActualiza = 0;
    private int operacion = 0;
    private int? resultado;

	public ProductoVO()
	{
		//
		// TODO: Add constructor logic here
		//
        producto_ID = 0;
        producto_Codigo = null;
        producto_Nombre = null;
        producto_Marca = null;
        producto_Precio = 0.0;
        producto_Moneda = 0;
        producto_Categoria = null;
        producto_Descripcion = null;
        producto_TiempoEntrega = 0;
        producto_MarcaId = 0;
        producto_CampDescripcion = 0;
	    producto_CampPrecio = 0;
        producto_CampMoneda = 0;
	    producto_CampTE = 0;
        usuarioIdActualiza = 0;
        operacion = 0;
        resultado = 0;
	}

    public int? Producto_ID
    {
        get
        {
            return producto_ID;
        }
        set
        {
            producto_ID = value;
        }
    }

    public String Producto_Codigo
    {
        get
        {
            return producto_Codigo;
        }
        set
        {
            producto_Codigo = value;
        }
    }

    public String Producto_Nombre
    {
        get
        {
            return producto_Nombre;
        }
        set
        {
            producto_Nombre = value;
        }
    }

    public String Producto_Marca
    {
        get
        {
            return producto_Marca;
        }
        set
        {
            producto_Marca = value;
        }
    }

    public Double Producto_Precio
    {
        get
        {
            return producto_Precio;
        }
        set
        {
            producto_Precio = value;
        }
    }

    public int Producto_Moneda
    {
        get
        {
            return producto_Moneda;
        }
        set
        {
            producto_Moneda = value;
        }
    }

    public String Producto_Categoria
    {
        get
        {
            return producto_Categoria;
        }
        set
        {
            producto_Categoria = value;
        }
    }

    public String Producto_Descripcion
    {
        get
        {
            return producto_Descripcion;
        }
        set
        {
            producto_Descripcion = value;
        }
    }

    public int Producto_TiempoEntrega
    {
        get
        {
            return producto_TiempoEntrega;
        }
        set
        {
            producto_TiempoEntrega = value;
        }
    }

    public int Producto_MarcaId
    {
        get
        {
            return producto_MarcaId;
        }
        set
        {
            producto_MarcaId = value;
        }
    }

    public int Producto_CampDescripcion
    {
        get
        {
            return producto_CampDescripcion;
        }
        set
        {
            producto_CampDescripcion = value;
        }
    }

    public int Producto_CampPrecio
    {
        get
        {
            return producto_CampPrecio;
        }
        set
        {
            producto_CampPrecio = value;
        }
    }

    public int Producto_CampMoneda
    {
        get
        {
            return producto_CampMoneda;
        }
        set
        {
            producto_CampMoneda = value;
        }
    }

    public int Producto_CampTE
    {
        get
        {
            return producto_CampTE;
        }
        set
        {
            producto_CampTE = value;
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
