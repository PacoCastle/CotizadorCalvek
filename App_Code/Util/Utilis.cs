using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for Utilis
/// </summary>
public class Utilis
{
	public Utilis()
	{
	}

    public static string CalculateStringHash(string cadena)
    {
        HashAlgorithm hash = HashAlgorithm.Create("MD5");

        byte[] tempSource = Encoding.ASCII.GetBytes(cadena);

        return ArrayToString(hash.ComputeHash(tempSource));
    }

    private static string ArrayToString(byte[] byteArray)
    {
        // usamos un objeto stringbuilder por su mejor rendimiento con operaciones
        // de cadenas.
        StringBuilder sb = new StringBuilder(byteArray.Length);

        // por cada byte en el array
        for (int i = 0; i < byteArray.Length; i++)
        {
            // obtenemos su valor hexadecimal y lo agregamos al objeto
            // stringbuilder.
            sb.Append(byteArray[i].ToString("X2"));
        }

        // devolvemos el objeto stringbuilder, formateado a string
        return sb.ToString();
    }

    public static String validaPermisos(HttpSessionState session, int numFuncion)
    {
        InfoSessionVO infoSession;
        FuncionesPerfilVO funciones;

        if (session["InfoSession"] == null)
        {
            //Response.Redirect("~/Error/UsuarioNoValido.aspx?mensaje=3");
            return "~/Error/UsuarioNoValido.aspx?mensaje=3";
        }
        else
        {
            infoSession = (InfoSessionVO)session["InfoSession"];
            if (infoSession.getValor(InfoSessionVO.FUNCIONES) != null)
            {
                funciones = (FuncionesPerfilVO)infoSession.getValor(InfoSessionVO.FUNCIONES);
                if (!funciones.isUsuarioEnFuncion(numFuncion))
                {
                    //Response.Redirect("~/Error/UsuarioNoValido.aspx?mensaje=1");
                    return "~/Error/UsuarioNoValido.aspx?mensaje=1";
                }
            }
            else
            {
                //Response.Redirect("~/Error/UsuarioNoValido.aspx?mensaje=2");
                return "~/Error/UsuarioNoValido.aspx?mensaje=2";
            }
        }
        return "";

    }
}
