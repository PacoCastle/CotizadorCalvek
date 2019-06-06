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
public class DetalleDepositosSinIdentificarVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int ACTUALIZA_ID_DETALLEORDENCOMPRA = 4;
    
    private int depositosPendientesId = 0;
    private String serieFactura = null;
    private int folioFactura = 0;
    private DateTime fechaAlta = new DateTime();
    private DateTime fechaModificacion = new DateTime();
    private int activo = 0;
    private int usuarioId = 0;
    private int usuarioIdModificacion = 0;

    private int operacion;
    private int? resultado;

    public DetalleDepositosSinIdentificarVO()
    {
    depositosPendientesId = 0;
    serieFactura = null;
    folioFactura = 0;
    fechaAlta = new DateTime();
    fechaModificacion = new DateTime();
    activo = 0;
    usuarioId = 0;
    usuarioIdModificacion = 0;

    operacion = 0;
    resultado = 0;
    }

    public int DepositosPendientesId
    {
        get
        {
            return depositosPendientesId;
        }
        set
        {
            depositosPendientesId = value;
        }
    }

    public String SerieFactura
    {
        get
        {
            return serieFactura;
        }
        set
        {
            serieFactura = value;
        }
    }
    
    public int FolioFactura
    {
        get
        {
            return folioFactura;
        }
        set
        {
            folioFactura = value;
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