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
/// Summary description for PerfilBL
/// </summary>
public class PerfilBL : IBusinessLogic
{

    private PerfilVO VOReg = null;
    private DataTable datos = null;
    private get_funcionesPorPerfilTableAdapter funcXPerfil = new get_funcionesPorPerfilTableAdapter();
    private get_datosPerfilTableAdapter perfil = new get_datosPerfilTableAdapter();
    private set_borraFuncionesPorPerfilTableAdapter borraFuncXPerfil = new set_borraFuncionesPorPerfilTableAdapter();
    private set_actualizaFuncionesPorPerfilTableAdapter actFuncXPerfil = new set_actualizaFuncionesPorPerfilTableAdapter();
    private ArrayList funcionesList = new ArrayList();
    private FuncionesPerfilVO funcTempVO = new FuncionesPerfilVO();

    public Object execute(object O)
    {
        VOReg = (PerfilVO)O;
        if (VOReg.Operacion == PerfilVO.ACTUALIZAR)
        {
            return actualizaPerfil();
        }
        else if (VOReg.Operacion == PerfilVO.INSERTAR)
        {
            return insertaPerfil();
        }
        else if (VOReg.Operacion == PerfilVO.BUSCAR)
        {
            return buscarPerfil();
        }
        return VOReg;
        
        //throw new Exception("The method or operation is not implemented.");
    }

    private Object insertaPerfil()
    {
        int? res = -1;
        set_insertaDatosPerfilTableAdapter insPerfil = new set_insertaDatosPerfilTableAdapter();

        funcionesList = VOReg.ListaFuncVO.Funciones;
        insPerfil.GetData(VOReg.Nombre, VOReg.Estatus, ref res);
         if (res > 0)
        {
            VOReg.Resultado = res;
            VOReg.Perfilid = (int)res;
            insertaFuncionesPorPerfil(VOReg.ListaFuncVO.Funciones);
        }

        return VOReg;
    }

    private Object actualizaPerfil()
    {
        int? res = -1;
        set_actualizaDatosPerfilTableAdapter actPerfil = new set_actualizaDatosPerfilTableAdapter();
        
        actPerfil.GetData(VOReg.Perfilid, VOReg.Nombre, VOReg.Estatus, ref res);
        if (res == 0)
        {
            VOReg.Resultado = res;
            insertaFuncionesPorPerfil(VOReg.ListaFuncVO.Funciones);
        }
        return VOReg;
    }

    private Object buscarPerfil()
    {
        datos = funcXPerfil.GetData(VOReg.Perfilid, 1);
        if (datos.Rows.Count > 0)
        {
            String cadenaTemp = "";
            for (int i = 0; i < datos.Rows.Count; i++)
            {
                cadenaTemp = datos.Rows[i]["funcionId"].ToString();
                funcionesList.Add(cadenaTemp);
            }
            funcTempVO.Funciones = funcionesList;
            VOReg.ListaFuncVO = funcTempVO;
        }

        datos = perfil.GetData(VOReg.Perfilid);
        if (datos.Rows.Count > 0)
        {
            VOReg.Nombre = datos.Rows[0]["perfil_nombre"].ToString();
            VOReg.Estatus = Int32.Parse(datos.Rows[0]["perfil_estatusId"].ToString());
        }

        return VOReg;
    }

    private void insertaFuncionesPorPerfil(ArrayList funcionesList)
    {
        int funcionTemp = 0;
        if (funcionesList != null && funcionesList.Count > 0)
        {
            borraFuncXPerfil.GetData(VOReg.Perfilid);

            foreach (String item in funcionesList)
            {
                funcionTemp = Int32.Parse(item);
                actFuncXPerfil.GetData(VOReg.Perfilid, funcionTemp);
            }
        }
    }
}
