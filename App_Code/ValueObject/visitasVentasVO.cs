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
/// Summary description for controlFacturaVO
/// </summary>
public class visitasVentasVO
{
    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int ACTUALIZACONTACTOS = 4;

    private int visitaVentasId = 0;
    private int usuarioId = 0;
    private String clienteId = "";
    private String fechaVisita = "";
    private int departamentoVisitaId = 0;
    private int novedadVisitaId = 0;
    private int objetivoVisitaId = 0;
    private int siguientePasoId = 0;
    private int solicitudApoyoId = 0;
    private String temaApoyo = "";
    private int estatusActualId = 0;
    private int banderaVenta = 0;
    private String observaciones = "";
    private String comentarios = "";
    private int usuarioIdModifico = 0;
    private ArrayList arrListaContactos = null;
    private int temaPresentadoId = 0;
    private String otroNovedad = "";
    private String otroObjetivo = "";
    private String otroSiguientePaso = "";
    private String otroSolicitudApoyo = "";
    private String otroEstatusActual = "";
    private String otroTemaPresentado = "";

    private String otroCliente = "";
    private String otroContactoCliente = "";
    private int banderaSeguimiento = 0;

    private int operacion = 0;
    private int? resultado = 0;

    public visitasVentasVO()
	{
    visitaVentasId = 0;
    usuarioId = 0;
    fechaVisita = "";
    departamentoVisitaId = 0;
    novedadVisitaId = 0;
    objetivoVisitaId = 0;
    siguientePasoId = 0;
    solicitudApoyoId = 0;
    temaApoyo = "";
    estatusActualId = 0;
    banderaVenta = 0;
    observaciones = "";
    comentarios = "";
    usuarioIdModifico = 0;
    arrListaContactos = null;
    temaPresentadoId = 0;
    otroNovedad = "";
    otroObjetivo = "";
    otroSiguientePaso = "";
    otroSolicitudApoyo = "";
    otroEstatusActual = "";
    otroTemaPresentado = "";

    otroCliente = "";
    otroContactoCliente = "";
    banderaSeguimiento = 0;

    operacion = 0;
    resultado = 0;
	}


    public int VisitaVentasId
    {
        get
        {
            return visitaVentasId;
        }
        set
        {
            visitaVentasId = value;
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

    public String FechaVisita
    {
        get
        {
            return fechaVisita;
        }
        set
        {
            fechaVisita = value;
        }
    }
    
    public int DepartamentoVisitaId
    {
        get
        {
            return departamentoVisitaId;
        }
        set
        {
            departamentoVisitaId = value;
        }
    }
    
    public int NovedadVisitaId
    {
        get
        {
            return novedadVisitaId;
        }
        set
        {
            novedadVisitaId = value;
        }
    }
    
    public int ObjetivoVisitaId
    {
        get
        {
            return objetivoVisitaId;
        }
        set
        {
            objetivoVisitaId = value;
        }
    }
    
    public int SiguientePasoId
    {
        get
        {
            return siguientePasoId;
        }
        set
        {
            siguientePasoId = value;
        }
    }
    
    public int SolicitudApoyoId
    {
        get
        {
            return solicitudApoyoId;
        }
        set
        {
            solicitudApoyoId = value;
        }
    }

    public String TemaApoyo
    {
        get
        {
            return temaApoyo;
        }
        set
        {
            temaApoyo = value;
        }
    }

    public int EstatusActualId
    {
        get
        {
            return estatusActualId;
        }
        set
        {
            estatusActualId = value;
        }
    }

    public int BanderaVenta
    {
        get
        {
            return banderaVenta;
        }
        set
        {
            banderaVenta = value;
        }
    }

    public String Observaciones
    {
        get
        {
            return observaciones;
        }
        set
        {
            observaciones = value;
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

    public ArrayList ArrListaContactos
    {
        get
        {
            return arrListaContactos;
        }
        set
        {
            arrListaContactos = value;
        }
    }

    public int TemaPresentadoId
    {
        get
        {
            return temaPresentadoId;
        }
        set
        {
            temaPresentadoId = value;
        }
    }

    public String OtroNovedad
    {
        get
        {
            return otroNovedad;
        }
        set
        {
            otroNovedad = value;
        }
    }

    public String OtroObjetivo
    {
        get
        {
            return otroObjetivo;
        }
        set
        {
            otroObjetivo = value;
        }
    }

    public String OtroSiguientePaso
    {
        get
        {
            return otroSiguientePaso;
        }
        set
        {
            otroSiguientePaso = value;
        }
    }

    public String OtroSolicitudApoyo
    {
        get
        {
            return otroSolicitudApoyo;
        }
        set
        {
            otroSolicitudApoyo = value;
        }
    }

    public String OtroEstatusActual
    {
        get
        {
            return otroEstatusActual;
        }
        set
        {
            otroEstatusActual = value;
        }
    }

    public String OtroTemaPresentado
    {
        get
        {
            return otroTemaPresentado;
        }
        set
        {
            otroTemaPresentado = value;
        }
    }

    public String OtroCliente
    {
        get
        {
            return otroCliente;
        }
        set
        {
            otroCliente = value;
        }
    }
    
    public String OtroContactoCliente
    {
        get
        {
            return otroContactoCliente;
        }
        set
        {
            otroContactoCliente = value;
        }
    }
    
    public int BanderaSeguimiento
    {
        get
        {
            return banderaSeguimiento;
        }
        set
        {
            banderaSeguimiento = value;
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

    public int UsuarioIdModifico
    {
        get
        {
            return usuarioIdModifico;
        }
        set
        {
            usuarioIdModifico = value;
        }
    }

}
