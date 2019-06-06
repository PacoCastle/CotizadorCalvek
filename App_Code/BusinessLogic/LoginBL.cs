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
using System.Collections;

/// <summary>
/// Summary description for LoginBL
/// </summary>
public class LoginBL : IBusinessLogic
{
    private get_isUsuarioValidoTableAdapter usuario = new get_isUsuarioValidoTableAdapter();
    private get_funcionesPorPerfilTableAdapter funciones = new get_funcionesPorPerfilTableAdapter();
    private DataTable datos = null;
    private int? resultado = 0;
    private FuncionesPerfilVO funcionesVO = new FuncionesPerfilVO();
    private ArrayList funcionesList = new ArrayList();

    public Object execute(Object O)
    {
        LoginVO VOReg = new LoginVO();
        VOReg = (LoginVO)O;
        String pass = Utilis.CalculateStringHash(VOReg.Usuario_contrasena);

        datos = usuario.GetData(VOReg.Usuario_login, pass, ref resultado);
        if (datos.Rows.Count > 0)
        {
            VOReg.Usuario_nombrecompleto = datos.Rows[0]["usuario_nombrecompleto"].ToString();
            VOReg.Usuario_perfilid = Int32.Parse(datos.Rows[0]["usuario_perfilid"].ToString());
            VOReg.Usuario_estatusId = Int32.Parse(datos.Rows[0]["usuario_estatusid"].ToString());
            VOReg.Usuario_oficinaId = Int32.Parse(datos.Rows[0]["usuario_oficinaid"].ToString());
            VOReg.Usuarioid = Int32.Parse(datos.Rows[0]["usuarioId"].ToString());
            VOReg.Usuario_codigoUsuarioAdmin = datos.Rows[0]["usuario_codigoUsuarioAdmin"].ToString();
	    VOReg.Usuario_correoElectronico = datos.Rows[0]["usuario_correoElectronico"].ToString();
            VOReg.Resultado = resultado;

            //recupera la informacion del pefil del usuario
            if (VOReg.Usuario_perfilid > 0)
            {
                datos = funciones.GetData(VOReg.Usuario_perfilid,1);
                if (datos.Rows.Count > 0)
                {
                    String cadenaTemp = "";
                    for (int i = 0; i < datos.Rows.Count; i++)
                    {
                        cadenaTemp = datos.Rows[i]["funcionId"].ToString();
                        funcionesList.Add(cadenaTemp);
                    }
                    funcionesVO.Funciones = funcionesList;
                    VOReg.FuncionPerfil = funcionesVO;
                }
            }
        }
        return VOReg;
    }
}
