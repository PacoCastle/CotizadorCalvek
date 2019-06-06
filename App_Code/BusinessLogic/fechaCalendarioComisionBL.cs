using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using cotizadorTableAdapters;
using ComisionesTableAdapters;

public class fechaCalendarioComisionBL
{
    private fechaCalendarioComisionVO VOReg = null;
    private set_insertaFechaComisionesTableAdapter setIFecha = new set_insertaFechaComisionesTableAdapter();
    private set_cambioEstatusFechaComisionesTableAdapter setEFecha = new set_cambioEstatusFechaComisionesTableAdapter();
    private set_insertaDatosAgentesGarantiaTableAdapter setIAgente = new set_insertaDatosAgentesGarantiaTableAdapter();
    private get_datosAgenteGarantiaTableAdapter buscaAgente = new get_datosAgenteGarantiaTableAdapter();
    private set_actualizaDatosAgenteGarantiaTableAdapter setEAgente = new set_actualizaDatosAgenteGarantiaTableAdapter();
    private set_actualizaEstatusAgenteTableAdapter setEstAgente = new set_actualizaEstatusAgenteTableAdapter();
    private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (fechaCalendarioComisionVO)O;
        if (VOReg.Operacion == fechaCalendarioComisionVO.INSERTAR)
        {
            return insertaFecha();
        }
        else if (VOReg.Operacion == fechaCalendarioComisionVO.ACTUALIZAR)
        {
            return actualizaEstatus();
        }
        else if (VOReg.Operacion == fechaCalendarioComisionVO.INSERTARAGT)
        {
            return insertaAgenteGarantia();
        } else if (VOReg.Operacion == fechaCalendarioComisionVO.BUSCARAGT)
        {
            return buscaDatosAgente();
        } else if (VOReg.Operacion == fechaCalendarioComisionVO.EDITAGT)
        {
            return editaDatosAgente();
        }
        else if (VOReg.Operacion == fechaCalendarioComisionVO.ESTATUSAGT)
        {
            return editaEstatusAgente();
        }
        return VOReg;
    }

    private object insertaFecha()
    {
        int? res = -1;
        setIFecha.GetData(VOReg.FechaCalendario, VOReg.UsuarioModificacionId, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object actualizaEstatus()
    {
        int? res = -1;
        setEFecha.GetData(VOReg.IdFechaCalendario, VOReg.UsuarioModificacionId, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object insertaAgenteGarantia()
    {
        int? res = -1;
        setIAgente.GetData(VOReg.IdAgente, VOReg.NbAgente, VOReg.IdOficina, VOReg.NbOficina, VOReg.NbSucursal, VOReg.IdPuesto, VOReg.FaGarantia, VOReg.FhInicio, VOReg.FhVigencia, ref res);
        VOReg.Resultado = res;
        return VOReg;
    }

    private object buscaDatosAgente()
    {
        datos = buscaAgente.GetData(VOReg.IdAgenteGarantia);
        if (datos.Rows.Count > 0)
        {
            VOReg.IdAgente = datos.Rows[0]["ID_AGENTE"].ToString();
            VOReg.IdOficinaStr = datos.Rows[0]["ID_OFICINA_ACTUAL"].ToString();
            VOReg.NbSucursal = datos.Rows[0]["NB_SUCURSAL_ACTUAL"].ToString();
            VOReg.IdPuestoStr = datos.Rows[0]["ID_PUESTO"].ToString();
            VOReg.FaGarantiaStr = datos.Rows[0]["FA_GARANTIA"].ToString();
            VOReg.FhInicioStr = datos.Rows[0]["FH_INICIO_GARANTIA"].ToString();
            VOReg.FhVigenciaStr = datos.Rows[0]["FH_VIGENCIA_GARANTIA"].ToString();
            VOReg.IdAgenteGarantia = datos.Rows[0]["ID_AGENTE_GARANTIA"].ToString();
            return VOReg;
        }
        return VOReg;
    }

    private object editaDatosAgente()
    {
        int? res = -1;
        setEAgente.GetData(VOReg.IdAgenteGarantiaInt, VOReg.IdPuesto, VOReg.FaGarantia, VOReg.FhInicio, VOReg.FhVigencia, ref res);
        VOReg.Resultado = res;
        return VOReg;
    }

    private object editaEstatusAgente()
    {
        int? res = -1;
        setEstAgente.GetData(VOReg.IdAgenteGarantiaInt, ref res);
        VOReg.Resultado = res;
        return VOReg;
    }

	public fechaCalendarioComisionBL()
	{

	}
}