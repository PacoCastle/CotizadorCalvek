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
/// Summary description for InfoSessionVO
/// </summary>
public class InfoSessionVO
{
    private Hashtable valor = null;

    public static String PERFIL = "PERFIL";
    public static String FUNCIONES = "FUNCIONES";
    public static String NOMBRECOMPLETO = "NOMBRECOMPLETO";
    public static String OFICINA = "OFICINA";
    public static String NOMBREPERFIL = "NOMBREPERFIL";
    public static String ESTATUSUSUARIO = "ESTATUSUSUARIO";
    public static String ESTATUSPERFIL = "ESTATUSPERFIL";
    public static String USUARIOID = "USUARIOID";
    public static String CODIGOUSUARIOADMIN = "CODIGOUSUARIOADMIN";
    public static String CORREOELECTRONICO = "CORREOELECTRONICO";

	public InfoSessionVO()
	{
        valor = new Hashtable();
	}

    public Object getValor(String key)
    {
        return valor[key];
    }

    public void setValor(String key, Object value)
    {
        valor.Add(key, value);
    }

}
