using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using catalogosTableAdapters;

/// <summary>
/// Summary description for Proveedores
/// </summary>
public class ProveedoresBL : IBusinessLogic
{
	public ProveedoresBL()
	{
		//
		// TODO: Add constructor logic here
		//

	}

    private set_insertaDatosProveedorTableAdapter insertaDatosProveedores = new set_insertaDatosProveedorTableAdapter();
    private get_DatosProveedorTableAdapter datosProveedor = new get_DatosProveedorTableAdapter();
    private get_listaProveedoresDetallesTableAdapter listaProveedoresDetalles = new get_listaProveedoresDetallesTableAdapter();
    private set_actualizaDatosProveedorTableAdapter actualizaDatosProveedor = new set_actualizaDatosProveedorTableAdapter();

    private DataTable datos = null;
    private ProveedoresVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (ProveedoresVO)O;
        if (VOReg.Operacion == ProveedoresVO.ACTUALIZAR)
        {
            return actualizaProveedor();
        }
        else if (VOReg.Operacion == ProveedoresVO.INSERTAR)
        {
            return insertaProveedores();
        }
        else if (VOReg.Operacion == ProveedoresVO.BUSCAR)
        {
            return buscarProveedor();
        }
        else if (VOReg.Operacion == ProveedoresVO.LISTAPROVEEDORES)
        {
            return ListaProveedoresDetalles();
        }
        return VOReg;
    }

    private object actualizaProveedor()
    {
        int? res = -1;
        actualizaDatosProveedor.GetData(VOReg.ProveedorId, VOReg.Nombre, VOReg.Rfc, VOReg.Representante, VOReg.UsuarioId, ref res);
        if (res >= 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object insertaProveedores()
    {
        int? res = -1;
        insertaDatosProveedores.GetData(VOReg.Nombre, VOReg.Rfc, VOReg.Representante, VOReg.DireccionId, VOReg.UsuarioId, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object buscarProveedor()
    {
        datos = datosProveedor.GetData(VOReg.ProveedorId);
        if (datos.Rows.Count > 0)
        {
        VOReg.ProveedorId = Int32.Parse(datos.Rows[0]["proveedorId"].ToString());
        VOReg.Nombre = datos.Rows[0]["Nombre"].ToString();
        VOReg.Representante = datos.Rows[0]["representante"].ToString();
        VOReg.DireccionId = Int32.Parse(datos.Rows[0]["direccionId"].ToString());
        VOReg.UsuarioId = Int32.Parse(datos.Rows[0]["usuarioIdAlta"].ToString());
        VOReg.UsuarioIdActualizo = Int32.Parse(datos.Rows[0]["usuarioIdActualizo"].ToString());
        VOReg.Rfc = datos.Rows[0]["rfc"].ToString();
        VOReg.EnSistemaAdm = Int32.Parse(datos.Rows[0]["EnSistemaAdm"].ToString());
        return VOReg;
        }
        return VOReg;
    }

    private object ListaProveedoresDetalles()
    {
        int b = 0;
        String[,] arrProveedores = null;
        datos = null;
        datos = listaProveedoresDetalles.GetData();
        if (datos.Rows.Count > 0)
        {
            arrProveedores = new String[18, (datos.Rows.Count)];
            while (b < datos.Rows.Count)
            {
                arrProveedores[0, b] = datos.Rows[b]["proveedorId"].ToString();
                arrProveedores[1, b] = datos.Rows[b]["Nombre"].ToString();
                arrProveedores[2, b] = datos.Rows[b]["representante"].ToString();
                arrProveedores[3, b] = datos.Rows[b]["Calle"].ToString();
                arrProveedores[4, b] = datos.Rows[b]["NoExterior"].ToString();
                arrProveedores[5, b] = datos.Rows[b]["NoInterior"].ToString();
                arrProveedores[6, b] = datos.Rows[b]["CP"].ToString();
                arrProveedores[7, b] = datos.Rows[b]["Colonia"].ToString();
                arrProveedores[8, b] = datos.Rows[b]["Ciudad"].ToString();
                arrProveedores[9, b] = datos.Rows[b]["DelMunicipio"].ToString();
                arrProveedores[10, b] = datos.Rows[b]["Estado"].ToString();
                arrProveedores[11, b] = datos.Rows[b]["Email"].ToString();
                arrProveedores[12, b] = datos.Rows[b]["telefono1"].ToString();
                arrProveedores[13, b] = datos.Rows[b]["telefono2"].ToString();
                arrProveedores[14, b] = datos.Rows[b]["telefono3"].ToString();
                arrProveedores[15, b] = datos.Rows[b]["telefono4"].ToString();
                arrProveedores[16, b] = datos.Rows[b]["PaginaWeb"].ToString();
                arrProveedores[17, b] = datos.Rows[b]["TipoDomicilio"].ToString();
                b++;
            }
        }

        VOReg.ArrProveedores = arrProveedores;
        return VOReg;
        
    }

}
