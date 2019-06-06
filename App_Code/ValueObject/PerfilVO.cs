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
/// Summary description for PerfilVO
/// </summary>
public class PerfilVO
{
    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;

    private int perfilid;
    private String nombre;
    private int estatus;
    private DateTime fechaAlta;
    private DateTime fechaCambio;
    private int operacion;
    private FuncionesPerfilVO listaFuncVO;
    private int? resultado;
    
    public PerfilVO()
	{
        perfilid = 0;
        nombre = "";
        estatus = 0;
        fechaAlta = new DateTime();
        fechaCambio = new DateTime();
        operacion = 0;
        listaFuncVO = new FuncionesPerfilVO();
        resultado = 0;
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

    public FuncionesPerfilVO ListaFuncVO
    {
        get
        {
            return listaFuncVO;
        }
        set
        {
            listaFuncVO = value;
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
    public DateTime FechaCambio
    {
        get
        {
            return fechaCambio;
        }
        set
        {
            fechaCambio = value;
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
    public int Perfilid
    {
        get
        {
            return perfilid;
        }
        set
        {
            perfilid = value;
        }
    }

}
