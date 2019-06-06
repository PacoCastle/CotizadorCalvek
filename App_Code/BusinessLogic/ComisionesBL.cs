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
using ComisionesTableAdapters;

public class ComisionesBL
{

    private ComisionesVO VOReg = null;
    private set_congelaCom_AsesoresTableAdapter congCom = new set_congelaCom_AsesoresTableAdapter();
    private DataTable datos = null;

    public Object execute(Object O)
    {
        VOReg = (ComisionesVO)O;
        if (VOReg.Operacion == ComisionesVO.CONGELAR)
        {
            return congelaComision();
        }
        return VOReg;
    }

    private object congelaComision()
    {
        int? res = -1;
        congCom.GetData(VOReg.Mes, VOReg.Año, ref res);
        VOReg.Resultado = res;
        return VOReg;
    }

    public ComisionesBL() { 
    
    }
}