using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class ComisionesVO
{
    public static int CONGELAR = 1;

    //CONGELA COMISIONES
    private int? mes;
    private int? año;

    //COMUNES
    private int? resultado;
    private int operacion;

	public ComisionesVO()
	{
        mes = 0;
        año = 0;

        resultado = 0;
        operacion = 0;
	}


    //COMISIONES
    public int? Mes
    {
        get
        {
            return mes;
        }
        set
        {
            mes = value;
        }
    }
    public int? Año
    {
        get
        {
            return año;
        }
        set
        {
            año = value;
        }
    }

    //COMUNES
    public int? Resultado
    {
        get
        {
            return resultado;
        }
        set
        {
            resultado = value;
        }
    }
    public int Operacion
    {
        get
        {
            return operacion;
        }
        set
        {
            operacion = value;
        }
    }
}