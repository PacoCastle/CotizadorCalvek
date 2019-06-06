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

/// <summary>
/// Summary description for UsuarioBL
/// </summary>
public class UsuarioBL:IBusinessLogic
{
    private usuarioVO VOReg = null;
    private get_datosUsuarioTableAdapter Usuario = new get_datosUsuarioTableAdapter();
    private set_actualizaDatosUsuarioTableAdapter setUsuario = new set_actualizaDatosUsuarioTableAdapter();
    private set_insertaDatosUsuarioTableAdapter setIUsuario = new set_insertaDatosUsuarioTableAdapter();
    private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (usuarioVO)O;

        if (VOReg.Operacion == usuarioVO.ACTUALIZAR)
        {
            return actualizaUsuario();
        }
        else if (VOReg.Operacion == usuarioVO.INSERTAR)
        {
            return insertaUsuario();
        }
        else if (VOReg.Operacion == usuarioVO.BUSCAR)
        {
            return buscarUsuario();
        }
        else if (VOReg.Operacion == usuarioVO.CAMBIARPASSWORD)
        {
            return actualizaPassword();
        }
        return VOReg;
    }

    private object insertaUsuario()
    {
        int? res = -1;
        String contrasena = "";
        contrasena = Utilis.CalculateStringHash(VOReg.Usuario_contrasena);

        setIUsuario.GetData(VOReg.Usuarioid, VOReg.Usuario_login, contrasena.Trim(), VOReg.Usuario_nombrecompleto, VOReg.Usuario_perfilid, VOReg.Usuario_estatusId, VOReg.Usuario_oficinaId, VOReg.Usuario_codigoUsuarioAdmin, VOReg.Usuario_correoElectronico, VOReg.Usuario_radio, VOReg.Usuario_jefeUsuarioId,VOReg.Usuario_comisionId,VOReg.Usuario_correoOC,VOReg.Usuario_correoTraspaso, ref res, VOReg.Usuario_administrativoId, VOReg.Usuario_ventasInternasId);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object actualizaUsuario()
    {
        int? res = -1;

        setUsuario.GetData(VOReg.Usuarioid, VOReg.Usuario_login, VOReg.Usuario_nombrecompleto, VOReg.Usuario_perfilid, VOReg.Usuario_estatusId, VOReg.Usuario_oficinaId, "", VOReg.ActualizarPassword, VOReg.Usuario_codigoUsuarioAdmin, VOReg.Usuario_correoElectronico, VOReg.Usuario_radio, VOReg.Usuario_jefeUsuarioId, VOReg.Usuario_comisionId, VOReg.Usuario_correoOC, VOReg.Usuario_correoTraspaso, ref res, VOReg.Usuario_administrativoId, VOReg.Usuario_ventasInternasId);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private Object actualizaPassword()
    {
        int? res = -1;
        String contrasena = "";
        contrasena = Utilis.CalculateStringHash(VOReg.Usuario_contrasena);

        setUsuario.GetData(VOReg.Usuarioid, "", "", 0, 0, 0, contrasena.Trim(), VOReg.ActualizarPassword,"","","",0,0,0,0, ref res,0,0);
        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private Object buscarUsuario()
    {
        datos = Usuario.GetData(VOReg.Usuarioid);
        if (datos.Rows.Count > 0)
        {
            VOReg.Usuario_login = datos.Rows[0]["usuario_login"].ToString();
            VOReg.Usuario_nombrecompleto = datos.Rows[0]["usuario_nombrecompleto"].ToString();
            VOReg.Usuario_oficinaId = Int32.Parse(datos.Rows[0]["usuario_oficinaId"].ToString());
            VOReg.Usuario_estatusId = Int32.Parse(datos.Rows[0]["usuario_estatusId"].ToString());
            VOReg.Usuario_perfilid = Int32.Parse(datos.Rows[0]["usuario_perfilid"].ToString());
            VOReg.Usuario_codigoUsuarioAdmin = datos.Rows[0]["usuario_codigoUsuarioAdmin"].ToString();
            VOReg.Usuario_correoElectronico = datos.Rows[0]["usuario_correoElectronico"].ToString();
            VOReg.Usuario_radio = datos.Rows[0]["usuario_radio"].ToString();
            VOReg.Oficina_nombre = datos.Rows[0]["oficina_nombre"].ToString();
            VOReg.Usuario_jefeUsuarioId = Int32.Parse(datos.Rows[0]["usuario_jefeUsuarioId"].ToString());
            VOReg.Usuario_comisionId = Int32.Parse(datos.Rows[0]["usuario_comisionId"].ToString());
            VOReg.Usuario_correoOC = Int32.Parse(datos.Rows[0]["usuario_correoOc"].ToString());
            VOReg.Usuario_correoTraspaso = Int32.Parse(datos.Rows[0]["usuario_correoTraspasos"].ToString());
            VOReg.Usuario_administrativoId = Int32.Parse(datos.Rows[0]["usuario_administrativoId"].ToString());
            VOReg.Usuario_ventasInternasId = Int32.Parse(datos.Rows[0]["usuario_VentasInternasId"].ToString());
            return VOReg;
        }
        return VOReg;
    }
}
