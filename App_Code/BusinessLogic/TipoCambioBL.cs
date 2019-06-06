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
/// Summary description for TipoCambioBL
/// </summary>
public class TipoCambioBL:IBusinessLogic
{
	public TipoCambioBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private get_buscaMonedaTableAdapter buscaMoneda = new get_buscaMonedaTableAdapter();
    private get_buscaTiposCambioTableAdapter buscaTiposCambio = new get_buscaTiposCambioTableAdapter();
    private set_insertaTipoCambioTableAdapter setTipoCAmbio = new set_insertaTipoCambioTableAdapter();

    private DataTable datos = null;
    private TipoCambioVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (TipoCambioVO)O;

        if (VOReg.Operacion == TipoCambioVO.ACTUALIZAR)
        {
            return actualizaTipoCambio();
        }
        else if (VOReg.Operacion == TipoCambioVO.INSERTAR)
        {
            return insertaTipoCambio();
        }
        else if (VOReg.Operacion == TipoCambioVO.BUSCAR)
        {
            return buscarDescripcionMoneda();
        }
        else if (VOReg.Operacion == TipoCambioVO.BUSCAR_TIPOS_CAMBIOS)
        {
            return buscarTiposCambio();
        }

        return VOReg;
    }

    private object actualizaTipoCambio()
    {
        return null;
    }

    private object insertaTipoCambio()
    {
        int? reg = 0;

        setTipoCAmbio.GetData(VOReg.Cambio, ref reg);
        if (reg == 0)
        {
            VOReg.Resultado = reg;
        }
        return VOReg;

    }

    private object buscarDescripcionMoneda()
    {
        datos = buscaMoneda.GetData(VOReg.MonedaId);
        if (datos.Rows.Count > 0)
        {
            VOReg.Descripcion = datos.Rows[0]["descripcion"].ToString();
            VOReg.Prefijo = datos.Rows[0]["Prefijo"].ToString();
            return VOReg;
        }
        return VOReg;
    }

    private object buscarTiposCambio()
    {

        datos = buscaTiposCambio.GetData(VOReg.MonedaId, VOReg.FechaTipoCambio);
        int a = 0;

        if (datos.Rows.Count > 0)
        {
        String[,] arrCambio = new String[2, (datos.Rows.Count)];
        //for (int a=1; a <= datos.Rows.Count; a++)
            while (a < datos.Rows.Count)
            {
            
                arrCambio[0, a] = datos.Rows[a]["moneda"].ToString();
                arrCambio[1, a] = datos.Rows[a]["cambio"].ToString();
                a++;
            }
            VOReg.ArrCambios = arrCambio;
        return VOReg;
        }
      return VOReg;
    }

}
