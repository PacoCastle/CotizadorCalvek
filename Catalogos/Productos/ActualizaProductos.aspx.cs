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

public partial class Catalogos_Productos_ActualizaProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // System.Configuration.ConfigurationSettings.AppSettings["cuentaSalidaCorreo"].ToString()


    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        
        btnContinuar.Visible = false;
        btnCancelar.Visible = false;


        ProductoVO VOpro = new ProductoVO();
        ProductoBL BLpro = new ProductoBL();

        VOpro.Producto_MarcaId = Int32.Parse(Request.QueryString["intMarcaId"]);
        VOpro.Producto_CampDescripcion = Int32.Parse(Request.QueryString["intBanderaDescripcion"]);
        VOpro.Producto_CampPrecio = Int32.Parse(Request.QueryString["intBanderaPrecio"]);
        VOpro.Producto_CampMoneda = Int32.Parse(Request.QueryString["intBanderaMoneda"]);
        VOpro.Producto_CampTE = Int32.Parse(Request.QueryString["intBanderaTE"]);
        VOpro.UsuarioIdActualiza = Int32.Parse(Session["usuarioId"].ToString());

        VOpro.Operacion = ProductoVO.ACTUALIZARARCHIVO;
        VOpro = (ProductoVO)BLpro.execute(VOpro);
        if (VOpro.Resultado == 0)
        {
            lblMensaje.Text = "ACTUALIZACION EXITOSA";
            
        }
        else
        {
            lblMensaje.Text = "FALLO LA ACTUALIZACION";
        }

    }
}
