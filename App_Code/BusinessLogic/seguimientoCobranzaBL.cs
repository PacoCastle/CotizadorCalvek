using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Cobranza_seguimientoLlamadasTableAdapters;

/// <summary>
/// Summary description for CotizacionBL
/// </summary>
public class seguimientoCobranzaBL : IBusinessLogic
{
    private seguimientoCobranzaVO VOReg = new seguimientoCobranzaVO();
    private set_insertaDatosContactoCobranzaTableAdapter setContacto = new set_insertaDatosContactoCobranzaTableAdapter();
    //private get_datosDepositoTableAdapter datosDeposito = new get_datosDepositoTableAdapter();
    private set_insertaEventoContactoCobranzaTableAdapter setEvento = new set_insertaEventoContactoCobranzaTableAdapter();
    //private set_actualizaDocumentoAfectadoDepositoTableAdapter actualizaDocAfectadoDeposito = new set_actualizaDocumentoAfectadoDepositoTableAdapter();
    private DataTable datos = null;


    public Object execute(Object O)
    {
        VOReg = (seguimientoCobranzaVO)O;

        if (VOReg.Operacion == seguimientoCobranzaVO.INSERTAR_EVENTO)
        {
            return insertaEvento();
        }
        else if (VOReg.Operacion == seguimientoCobranzaVO.INSERTAR)
        {
            return insertaContacto();
        }
        //else if (VOReg.Operacion == seguimientoCobranzaVO.BUSCAR)
        //{
        //    return buscarContacto();
        //}

       return VOReg;
    }

    private object buscarContacto()
    {
        return null;
    }

    private object insertaContacto()
    {
        int? reg=0;
        setContacto.GetData(VOReg.NombreResponsable, VOReg.Telefono, VOReg.Extension, VOReg.CorreoElectronico, VOReg.TelefonoCelular, VOReg.Comentarios, VOReg.ClienteId, VOReg.UsuarioIdModificacion, ref reg);

        if (reg > 0)
        {
            VOReg.ContactoCXPId = reg;
        }
        return VOReg;
    }

    private object insertaEvento()
    {
        int? reg = 0;
        setEvento.GetData(VOReg.Origen, VOReg.ClienteId, VOReg.Cambio, VOReg.Tipo, VOReg.Estatus, VOReg.FechaAgenda, VOReg.UsuarioIdModificacion, ref reg);
        
        if (reg > 0)
        {
            VOReg.LogId = reg;
            VOReg.Resultado = reg;
        }
        return VOReg;
    }

    

}
