using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DIOTTableAdapters;

/// <summary>
/// Summary description for DiotBL
/// </summary>
public class DiotBL:IBusinessLogic
{
    private DiotVO VOReg = null;
    //private get_datosUsuarioTableAdapter Usuario = new get_datosUsuarioTableAdapter();
    //private set_actualizaDatosUsuarioTableAdapter setUsuario = new set_actualizaDatosUsuarioTableAdapter();
    private set_insertaDatosDiotPeriodoAcreditamientoTableAdapter setPeriodo = new set_insertaDatosDiotPeriodoAcreditamientoTableAdapter();
    private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (DiotVO)O;

        //if (VOReg.Operacion == DiotVO.ACTUALIZAR)
        //{
        //    return actualizaUsuario();
        //}
        //else 
        if (VOReg.Operacion == DiotVO.INSERTAR)
        {
            return insertaPeriodo();
        }
        //else if (VOReg.Operacion == DiotVO.BUSCAR)
        //{
        //    return buscarUsuario();
        //}

        return VOReg;
    }

    private object insertaPeriodo()
    {
        int? res = -1;
        setPeriodo.GetData(VOReg.AnoAcreditamiento, VOReg.MesAcreditamiento, VOReg.PolizaId, VOReg.Cuenta, VOReg.Sucursal, VOReg.ClaveProveedor, VOReg.TipoPoliza, VOReg.SerieDocumento, VOReg.FolioDocumento, VOReg.UsuarioId, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    //private object actualizaUsuario()
    //{
    //    int? res = -1;

    //    setUsuario.GetData(VOReg.Usuarioid, VOReg.Usuario_login, VOReg.Usuario_nombrecompleto, VOReg.Usuario_perfilid, VOReg.Usuario_estatusId, VOReg.Usuario_oficinaId, "", VOReg.ActualizarPassword, VOReg.Usuario_codigoUsuarioAdmin, VOReg.Usuario_correoElectronico, VOReg.Usuario_radio, VOReg.Usuario_jefeUsuarioId, ref res);
    //    if (res == 0)
    //    {
    //        VOReg.Resultado = res;
    //    }
    //    return VOReg;
    //}

    //private Object buscarUsuario()
    //{
    //    datos = Usuario.GetData(VOReg.Usuarioid);
    //    if (datos.Rows.Count > 0)
    //    {
    //        VOReg.Usuario_login = datos.Rows[0]["usuario_login"].ToString();
    //        VOReg.Usuario_nombrecompleto = datos.Rows[0]["usuario_nombrecompleto"].ToString();
    //        VOReg.Usuario_oficinaId = Int32.Parse(datos.Rows[0]["usuario_oficinaId"].ToString());
    //        VOReg.Usuario_estatusId = Int32.Parse(datos.Rows[0]["usuario_estatusId"].ToString());
    //        VOReg.Usuario_perfilid = Int32.Parse(datos.Rows[0]["usuario_perfilid"].ToString());
    //        VOReg.Usuario_codigoUsuarioAdmin = datos.Rows[0]["usuario_codigoUsuarioAdmin"].ToString();
    //        VOReg.Usuario_correoElectronico = datos.Rows[0]["usuario_correoElectronico"].ToString();
    //        VOReg.Usuario_radio = datos.Rows[0]["usuario_radio"].ToString();
    //        VOReg.Oficina_nombre = datos.Rows[0]["oficina_nombre"].ToString();
    //        VOReg.Usuario_jefeUsuarioId = Int32.Parse(datos.Rows[0]["usuario_jefeUsuarioId"].ToString());
    //        return VOReg;
    //    }
    //    return VOReg;
    //}
}
