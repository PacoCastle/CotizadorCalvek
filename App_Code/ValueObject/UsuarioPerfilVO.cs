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
/// Summary description for UsuarioPerfilVO
/// </summary>
public class UsuarioPerfilVO
{
    private int perfilId = 0;
    private String perfilNombre = null;
    private int estatus = 0;
    private DateTime fechaAlta;
    private DateTime fechaActualiza;

	public UsuarioPerfilVO()
	{
        perfilId = 0;
        perfilNombre = "";
        estatus = 0;
        fechaAlta = new DateTime();
        fechaActualiza = new DateTime();
	}

    public DateTime FechaActualiza
    {
        get
        {
            return fechaActualiza;
        }
        set
        {
            fechaActualiza = value;
        }
    }
    public DateTime FechaAlta
    {
        get
        {
            return fechaAlta;
        }
        set
        {
            fechaAlta = value;
        }
    }

    public int PerfilId
    {
        get
        {
            return perfilId;
        }
        set
        {
            perfilId = value;
        }
    }
    public String PerfilNombre
    {
        get
        {
            return perfilNombre;
        }
        set
        {
            perfilNombre = value;
        }
    }
    public int Estatus
    {
        get
        {
            return estatus;
        }
        set
        {
            estatus = value;
        }
    }
}
