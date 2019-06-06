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
/// Summary description for FuncionesPerfilVO
/// </summary>
public class FuncionesPerfilVO
{
    private ArrayList funciones = null;

	public FuncionesPerfilVO()
	{
        funciones = new ArrayList();
	}
    public ArrayList Funciones
    {
        get
        {
            return funciones;
        }
        set
        {
            funciones = value;
        }
    }

    public bool isUsuarioEnFuncion(int nFuncion)
    {
        foreach( Object func in funciones){
            //Console.WriteLine(func.ToString());
            if (Int32.Parse(func.ToString()) == nFuncion)
                return true;
        }
        return false;
    }
}
