using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class OrdenesCompra_formularioCredito : System.Web.UI.Page
{
    private static int NUMFUNCION = 20;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //if (gvListadoOrdenesCompra.Rows.Count == 0)
        //{
        //    mostrarCamposBusqueda(false);
        //    Response.Redirect("formularioOrdenCompra.aspx");
        //}
        
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        if (gvListadoOrdenesCompra.PageCount > 2)
        {
            mostrarCamposBusqueda(true);
        }
        else
        {
            mostrarCamposBusqueda(false);
        }
    } 

    protected void lnkBusqueda_Click(object sender, EventArgs e)
    {
        //tblTabla.Visible = true;
        //lnkBusqueda.Visible = false;
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        gvListadoOrdenesCompra.DataSourceID = "sdsOrdenesCompraBusqueda"; // "odsOrdenesCompraBusqueda";//
    }

    protected void btnDuplicar_Click(object sender, CommandEventArgs As)
    {
        
        OrdenCompraBL OCBL = new OrdenCompraBL();
        OrdenCompraVO OCVO = new OrdenCompraVO();
        OCVO.Operacion = OrdenCompraVO.DUPLICAORDENCOMPRA;
        OCVO.OrdenCompraId = Int32.Parse(As.CommandArgument.ToString()); 
        OCVO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());
        OCVO = (OrdenCompraVO)OCBL.execute(OCVO);

        if (OCVO.Resultado > 0)
        {
            Server.Transfer("formularioOrdenCompra.aspx?ordenCompraId=" + OCVO.Resultado);
        }
    }

    public void mostrarCamposBusqueda(Boolean blnMostrar)
    {
        lblEtiBusqueda.Visible = blnMostrar;
        lblUsuario.Visible = blnMostrar;
        lstUsuario.Visible = blnMostrar;
        lblFactura.Visible = blnMostrar;
        txtFactura.Visible = blnMostrar;
        lblOrigen.Visible = blnMostrar;
        lstOrigen.Visible = blnMostrar;
        lblOrdenCompra.Visible = blnMostrar;
        txtOrdenCompra.Visible = blnMostrar;
        RegularExpressionValidator1.Visible = blnMostrar;
        lblProveedor.Visible = blnMostrar;
        lstProveedor.Visible = blnMostrar;
        lblProyecto.Visible = blnMostrar;
        txtProyecto.Visible = blnMostrar;
        lblJob.Visible = blnMostrar;
        lstJobs.Visible = blnMostrar;
        btnBuscar.Visible = blnMostrar;
    }


}
