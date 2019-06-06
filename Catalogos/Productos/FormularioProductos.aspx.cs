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

public partial class Catalogos_Productos_FormularioProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ProductoVO VOpro = new ProductoVO();
        ProductoBL BLpro = new ProductoBL();

        VOpro.Producto_Codigo = txtCodigo.Text.Trim().ToUpper();
        VOpro.Producto_Nombre = txtNombre.Text.Trim().ToUpper();
        VOpro.Producto_Marca = lstMarca.SelectedValue;
        VOpro.Producto_Precio = Double.Parse(txtPrecio.Text.Trim());
        VOpro.Producto_Moneda = Int32.Parse(lstMoneda.SelectedValue);
        VOpro.Producto_Categoria = txtCategoria.Text.Trim().ToUpper();
        VOpro.Producto_Descripcion = txtDescripcion.Text.Trim().ToUpper();
        VOpro.Producto_TiempoEntrega = Int32.Parse(txtTiempoEntrega.Text.Trim());
        VOpro.Operacion = ProductoVO.INSERTAR;
        VOpro = (ProductoVO)BLpro.execute(VOpro);
        if (VOpro.Producto_ID > 0)
        {
            lblMensaje.Text = "EL PRODUCTO SE INSERTO CORRECTAMENTE";
        }
        else
        {
            lblMensaje.Text = "FALLO LA ALTA DEL PRODUCTO";
        }

    }
}
