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
/// Summary description for MiCalendario
/// </summary>
public abstract class MiCalendario
{
    private static string inicio = "<script language='JavaScript'>document.getElementById('";
    private static string nombre = "').value  = showModalDialog('../Calendario/Calendario.aspx'";
    private static string atributos = "'dialogTop=100px; dialogLeft=250px; dialogWidth=206px; " +
      "dialogHeight=205px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";

    public static void verCalendario(System.Web.UI.Page pagina, string control)
    {
        string wFecha = inicio + control + nombre + ",'', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }

    public static void verCalendario(System.Web.UI.Page pagina, string control, string _default)
    {
        string wFecha = inicio + control + nombre + ", '" + _default + "', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
}