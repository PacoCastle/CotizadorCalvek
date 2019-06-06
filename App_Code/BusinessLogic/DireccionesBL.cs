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
using catalogosTableAdapters;

/// <summary>
/// Summary description for Direcciones
/// </summary>
public class DireccionesBL : IBusinessLogic
{
	public DireccionesBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private set_insertaDatosDireccionesTableAdapter setIDirecciones = new set_insertaDatosDireccionesTableAdapter();
    private get_DatosDireccionTableAdapter datosDireccion = new get_DatosDireccionTableAdapter();
    private set_actualizaDatosDomicilioTableAdapter ActualizaDatosDireccion = new set_actualizaDatosDomicilioTableAdapter();

    //private listaDireccionessTableAdapter listaDireccionessAdmin = new listaDireccionessTableAdapter();
    //private get_listaProveedoresDetallesTableAdapter listaDirecciones = new get_listaProveedoresDetallesTableAdapter();

    private DataTable datos = null;
    private DireccionesVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (DireccionesVO)O;

        if (VOReg.Operacion == DireccionesVO.ACTUALIZAR)
        {
            return actualizaDirecciones();
        }
        else if (VOReg.Operacion == DireccionesVO.INSERTAR)
        {
            return insertaDirecciones();
        }
        else if (VOReg.Operacion == DireccionesVO.BUSCAR)
        {
            return buscarDireccion();
        }


        return VOReg;
    }

    private object actualizaDirecciones()
    {
        //return null;
        
        int? res = -1;
        ActualizaDatosDireccion.GetData(VOReg.DireccionId, VOReg.Calle, VOReg.Cp, VOReg.Colonia, VOReg.Ciudad, VOReg.Estado, VOReg.Email, VOReg.Fax, VOReg.Telefono1, VOReg.UsuarioIdActualizo, ref res);

        if (res == 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
    }

    private object insertaDirecciones()
    {
        int? res = -1;
        setIDirecciones.GetData(VOReg.Calle,VOReg.NoExterior,VOReg.NoInterior,VOReg.Cp,VOReg.Colonia,VOReg.Ciudad,VOReg.DelMunicipio,VOReg.Estado,VOReg.Email,VOReg.Fax,VOReg.Telefono1,VOReg.Telefono2,VOReg.Telefono3,VOReg.Telefono4,VOReg.PaginaWeb,VOReg.TipoDomicilio,VOReg.UsuarioIdAlta, ref res);
        if (res > 0)
        {
            VOReg.Resultado = res;
        }
        return VOReg;
        //return null;
    }

    private object buscarDireccion()
    {
        datos = datosDireccion.GetData(VOReg.DireccionId);
        if (datos.Rows.Count > 0)
        {

    VOReg.DireccionId = Int32.Parse(datos.Rows[0]["direccionId"].ToString());
    VOReg.Calle = datos.Rows[0]["Calle"].ToString();
    VOReg.NoExterior = datos.Rows[0]["NoExterior"].ToString();
    VOReg.NoInterior = datos.Rows[0]["NoInterior"].ToString();
    VOReg.Cp = datos.Rows[0]["Cp"].ToString();
    VOReg.Colonia = datos.Rows[0]["Colonia"].ToString();
    VOReg.Ciudad = datos.Rows[0]["Ciudad"].ToString();
    VOReg.DelMunicipio = datos.Rows[0]["DelMunicipio"].ToString();
    VOReg.Estado = datos.Rows[0]["Estado"].ToString();
    VOReg.Email = datos.Rows[0]["Email"].ToString();
    VOReg.Fax = datos.Rows[0]["Fax"].ToString();
    VOReg.Telefono1 = datos.Rows[0]["Telefono1"].ToString();
    VOReg.Telefono2 = datos.Rows[0]["Telefono2"].ToString();
    VOReg.Telefono3 = datos.Rows[0]["Telefono3"].ToString();
    VOReg.Telefono4 = datos.Rows[0]["Telefono4"].ToString();
    VOReg.PaginaWeb = datos.Rows[0]["PaginaWeb"].ToString();
    VOReg.TipoDomicilio = Int32.Parse(datos.Rows[0]["TipoDomicilio"].ToString());
    VOReg.UsuarioIdAlta = Int32.Parse(datos.Rows[0]["usuarioIdAlta"].ToString());
    VOReg.UsuarioIdActualizo = Int32.Parse(datos.Rows[0]["usuarioIdActualizo"].ToString());

            return VOReg;
        }
        return VOReg;
        
    }

    

}
