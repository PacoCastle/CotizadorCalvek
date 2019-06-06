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
using visitasVentasTableAdapters;

/// <summary>
/// Summary description for visitasVentasBL
/// </summary>
public class visitasVentasBL : IBusinessLogic
{
    private visitasVentasVO VOReg = new visitasVentasVO();
    private set_ActualizaDatosVisitaVentasTableAdapter setActualizaVisitaVentas = new set_ActualizaDatosVisitaVentasTableAdapter();
    private set_insertaDatosVisitaVentasTableAdapter setVisitaVentas = new set_insertaDatosVisitaVentasTableAdapter();
    private set_insertaDatosContactosXvisitaTableAdapter setContactosXvisita = new set_insertaDatosContactosXvisitaTableAdapter();
    private get_datosVisitaVentasTableAdapter getVisitaVentas = new get_datosVisitaVentasTableAdapter();
    private get_contactoVisitadoXvisitaTableAdapter getContactosXvisita = new get_contactoVisitadoXvisitaTableAdapter();

    private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (visitasVentasVO)O;

        if (VOReg.Operacion == visitasVentasVO.ACTUALIZAR)
        {
            return actualizaDatos();
        }
        else if (VOReg.Operacion == visitasVentasVO.INSERTAR)
        {
            return insertaDatos();
        }
        else if (VOReg.Operacion == visitasVentasVO.BUSCAR)
        {
            return buscarDatos();
        }
        else if (VOReg.Operacion == visitasVentasVO.ACTUALIZACONTACTOS)
        {
            return actualizaArreglo();
        }
        
       return VOReg;
    }

    private object buscarDatos()
    {
        datos = getVisitaVentas.GetData(VOReg.VisitaVentasId,VOReg.UsuarioIdModifico);
        if (datos.Rows.Count > 0)
        {
        VOReg.UsuarioId = Int32.Parse(datos.Rows[0]["usuarioId"].ToString());
        VOReg.ClienteId = datos.Rows[0]["clienteId"].ToString();
        VOReg.FechaVisita = datos.Rows[0]["fechaVisita"].ToString();
        VOReg.DepartamentoVisitaId = Int32.Parse(datos.Rows[0]["departamentoVisitaId"].ToString());
        VOReg.NovedadVisitaId = Int32.Parse(datos.Rows[0]["novedadVisitaId"].ToString());
        VOReg.ObjetivoVisitaId = Int32.Parse(datos.Rows[0]["objetivoVisitaId"].ToString());
        VOReg.SiguientePasoId = Int32.Parse(datos.Rows[0]["siguientePasoId"].ToString());
        VOReg.SolicitudApoyoId = Int32.Parse(datos.Rows[0]["solicitudApoyoId"].ToString());
        VOReg.TemaApoyo = datos.Rows[0]["temaApoyo"].ToString();
        VOReg.EstatusActualId = Int32.Parse(datos.Rows[0]["estatusActualId"].ToString());
        VOReg.BanderaVenta = Int32.Parse(datos.Rows[0]["banderaVenta"].ToString());
        VOReg.Observaciones = datos.Rows[0]["observaciones"].ToString();
        VOReg.Comentarios = datos.Rows[0]["comentarios"].ToString();
        VOReg.TemaPresentadoId = Int32.Parse(datos.Rows[0]["TemaPresentadoId"].ToString());
        VOReg.OtroNovedad = datos.Rows[0]["otroNovedad"].ToString();
        VOReg.OtroObjetivo = datos.Rows[0]["otroObjetivo"].ToString();
        VOReg.OtroSiguientePaso = datos.Rows[0]["otroSiguientePaso"].ToString();
        VOReg.OtroSolicitudApoyo = datos.Rows[0]["otroSolicitudApoyo"].ToString();
        VOReg.OtroEstatusActual = datos.Rows[0]["otroEstatusActual"].ToString();
        VOReg.OtroTemaPresentado = datos.Rows[0]["otroTemaPresentado"].ToString();
        VOReg.BanderaSeguimiento = Int32.Parse(datos.Rows[0]["banderaSeguimiento"].ToString());
        VOReg.OtroCliente = datos.Rows[0]["otroCliente"].ToString();
        VOReg.OtroContactoCliente = datos.Rows[0]["otroContactoCliente"].ToString();
        }

        ArrayList ContactoList = new ArrayList();
        datos = getContactosXvisita.GetData(VOReg.VisitaVentasId, VOReg.UsuarioIdModifico, 1);
        if (datos.Rows.Count > 0)
        {
            String cadenaTemp = "";
            for (int i = 0; i < datos.Rows.Count; i++)
            {
                cadenaTemp = datos.Rows[i]["contactoVisitadoId"].ToString();
                ContactoList.Add(cadenaTemp);
            }
            VOReg.ArrListaContactos = ContactoList;
        }

        return VOReg;
    }

    private object insertaDatos()
    {
        int? res = 0;
        setVisitaVentas.GetData(VOReg.UsuarioId, VOReg.ClienteId, VOReg.FechaVisita, VOReg.DepartamentoVisitaId, VOReg.NovedadVisitaId, VOReg.ObjetivoVisitaId, VOReg.SiguientePasoId, VOReg.SolicitudApoyoId, VOReg.TemaApoyo, VOReg.EstatusActualId, VOReg.BanderaVenta, VOReg.Observaciones, VOReg.Comentarios, VOReg.UsuarioIdModifico, VOReg.TemaPresentadoId, VOReg.OtroNovedad, VOReg.OtroObjetivo, VOReg.OtroSiguientePaso, VOReg.OtroSolicitudApoyo, VOReg.OtroEstatusActual, VOReg.OtroTemaPresentado, VOReg.BanderaSeguimiento, VOReg.OtroCliente, VOReg.OtroContactoCliente, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
            VOReg.VisitaVentasId = (int)VOReg.Resultado;
        }
        return VOReg;
    }

    private object actualizaDatos()
    {
        int? res = 0;
        setActualizaVisitaVentas.GetData(VOReg.VisitaVentasId, VOReg.UsuarioId, VOReg.ClienteId, VOReg.FechaVisita, VOReg.DepartamentoVisitaId, VOReg.NovedadVisitaId, VOReg.ObjetivoVisitaId, VOReg.SiguientePasoId, VOReg.SolicitudApoyoId, VOReg.TemaApoyo, VOReg.EstatusActualId, VOReg.BanderaVenta, VOReg.Observaciones, VOReg.Comentarios, VOReg.UsuarioIdModifico, VOReg.TemaPresentadoId, VOReg.OtroNovedad, VOReg.OtroObjetivo, VOReg.OtroSiguientePaso, VOReg.OtroSolicitudApoyo, VOReg.OtroEstatusActual, VOReg.OtroTemaPresentado, VOReg.BanderaSeguimiento, VOReg.OtroCliente, VOReg.OtroContactoCliente, ref res);
        return VOReg;
    }

    private object actualizaArreglo()
    {
        int? res = 0;
        if (VOReg.ArrListaContactos != null && VOReg.ArrListaContactos.Count > 0)
        {
            foreach (String item in VOReg.ArrListaContactos)
            {
                setContactosXvisita.GetData(VOReg.VisitaVentasId, Int32.Parse(item), VOReg.UsuarioIdModifico, ref res);
            }
        }
        return VOReg;
    }

}