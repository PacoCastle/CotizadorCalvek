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
/// Summary description for LoginVO
/// </summary>
public class LoginVO : usuarioVO
{
    private FuncionesPerfilVO funcionPerfil;

	public LoginVO()
	{
        funcionPerfil = new FuncionesPerfilVO();
	}
    public FuncionesPerfilVO FuncionPerfil
    {
        get
        {
            return funcionPerfil;
        }
        set
        {
            funcionPerfil = value;
        }
    }
}
