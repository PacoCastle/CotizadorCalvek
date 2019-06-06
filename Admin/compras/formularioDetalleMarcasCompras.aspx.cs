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

public partial class Admin_compras_formularioDetalleMarcasCompras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] == null)
        {
                if(!Page.IsPostBack)
                {
                lstMoneda.SelectedValue = "2";
                lblLineaId.Text = Request["LINEAID"];
                lblMarca.Text = Request["Marca"];
                    if (Request["Sucursal"] != null)
                        { lblSucursal.Text = Request["Sucursal"]; }
                    else
                        { lblSucursal.Text = "0"; }
                }
            try
                {
                ((Label)GridView1.FooterRow.FindControl("lblConteo")).Text = GridView1.Rows.Count.ToString();
                }
            catch(Exception exo)
                {
                }
        }
        else
        {
            
        }
    }

    private ArrayList getListaProductosCompras()
    {
        try
        {
            ArrayList listaProductosCompras = new ArrayList();
            String index = "-1";
            if (GridView1.Rows.Count > 0)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    index = GridView1.DataKeys[row.RowIndex].Value.ToString().Trim();
                    bool result = ((CheckBox)row.FindControl("ckbCompra")).Checked;
                    if (result)
                    {
                        listaProductosCompras.Add(index + "|" + ((TextBox)GridView1.Rows[row.RowIndex].FindControl("txtCantidadPendiente")).Text.Trim() + "|" + ((TextBox)GridView1.Rows[row.RowIndex].FindControl("txtCosto")).Text.Trim());
                    }
                }
            }
            return listaProductosCompras;
        }
        catch (Exception exc)
        {
            return null;
        }
    }

    protected void btnBusqueda_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "odsDetalleComprasBusqueda";
        ((Label)GridView1.FooterRow.FindControl("lblConteo")).Text = GridView1.Rows.Count.ToString();
    }


    //public String getConteroRegistro()
    //{
    //    return GridView1.Rows.Count.ToString();
    //}

    public String strTipoDocumento
    {
        get
        {
            return rdoLstTipoDocumento.SelectedValue;
        }
    }

    public String strFolioDocumento
    {
        get
        {
            return rdoLstTipoDocumento.SelectedItem.Text.Split('(')[1].Split(')')[0];
        }
    }

    public String strMoneda
    {
        get
        {
            return lstMoneda.SelectedValue;
        }
    }

    public String strLineaId
    {
        get
        {
            return lblLineaId.Text;
        }
    }

    public String strMarca
    {
        get
        {
            return lblMarca.Text;
        }
    }

    public String strSucursal
    {
        get
        {
            return lblSucursal.Text;
        }
    }

    public String strCompraId
    {
        get
        {
            return lblCompraId.Text;
        }
    }

    public String strClaveProveedor
    {
        get
        {
            return lstProveedor.SelectedValue;
        }
    }

    public String strNombreProveedor
    {
        get
        {
            return lstProveedor.SelectedItem.Text;
        }
    }

    public String strComentario
    {
        get
        {
            return txtComentario.Text;
        }
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       // lblEtiTmpProducto.Text = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString().Trim();
        //((ObjectDataSource)GridView1.FooterRow.FindControl("odsProductoEnDocumentos")).EnableViewState = true;
        //((GridView)GridView1.FooterRow.FindControl("GridView2")).Visible = true;

    }

    private String validaCamposProductos()
    {
        String strVariable = "";
        Boolean blnVarCiclo = false;
        try
        {
            //ArrayList listaProductosCompras = new ArrayList();
            String index = "-1";
            if (GridView1.Rows.Count > 0)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    index = GridView1.DataKeys[row.RowIndex].Value.ToString().Trim();
                    bool result = ((CheckBox)row.FindControl("ckbCompra")).Checked;
                    if (result)
                    {
                        blnVarCiclo = true;
                        //listaProductosCompras.Add(index + "|" + ((TextBox)GridView1.Rows[row.RowIndex].FindControl("txtCantidadPendiente")).Text.Trim() + "|" + ((TextBox)GridView1.Rows[row.RowIndex].FindControl("txtCosto")).Text.Trim());
                        String cadVarPendiente = ((TextBox)GridView1.Rows[row.RowIndex].FindControl("txtCantidadPendiente")).Text.Trim();
                        String cadVarCosto = ((TextBox)GridView1.Rows[row.RowIndex].FindControl("txtCosto")).Text.Trim();

                        if (cadVarPendiente.Length == 0 )
                        {
                            strVariable = "El campo DIF debe contener un valor";
                        }
                        else if ( cadVarPendiente == "0")
                        {
                            strVariable = "El valor DIF no puede ser 0.";
                        }

                        if (cadVarCosto.Length == 0 )
                        {
                            strVariable = "El campo COSTO debe contener un valor";
                        }
                        else if (cadVarCosto == "0")
                        {
                            strVariable = "El valor COSTO no puede ser 0.";
                        }

                    }

                }
            }
            
        }
        catch (Exception exc)
        {
            strVariable = "Error.";
        }

        if(!blnVarCiclo)
            {
                strVariable = "Debe haber almenos un producto seleccionado.";
            }
        

        return strVariable;
    }

    protected void btnGenera_Click(object sender, EventArgs e)
    {
    //protected void lnkContinuar_Click(object sender, EventArgs e)
    //{
        lblMensaje.Text = validaCamposProductos();
        lblMensaje2.Text = lblMensaje.Text;
        if (lblMensaje.Text == "")
        {
            preCompraVO preCompVO = new preCompraVO();
            preCompraBL preCompBL = new preCompraBL();
            preCompVO.TipoDocumentoId = Int32.Parse(rdoLstTipoDocumento.SelectedValue);
            preCompVO.MonedaId = Int32.Parse(lstMoneda.SelectedValue);
            preCompVO.CveLinea = lblLineaId.Text;
            preCompVO.Sucursal = lblSucursal.Text;

            preCompVO.CveAgente = 0;//Int32.Parse(lblTmpAgente.Text);

            //preCompVO.FolioPedido = lstPedido.Text;
            preCompVO.FolioPedido = "";//txtPedido.Text;
            preCompVO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());
            //lblTemporal.Text = rdoLstTipoDocumento.SelectedItem.Text.Split('(')[1].Split(')')[0];
            preCompVO.FolioOrdenCompra = rdoLstTipoDocumento.SelectedItem.Text.Split('(')[1].Split(')')[0];
            //ArrayList listaProductosCompras = getListaProductosCompras();
            preCompVO.ClaveProveedor = lstProveedor.SelectedValue;
            preCompVO.Comentario = txtComentario.Text.Trim();
            preCompVO.ArrProductos = getListaProductosCompras();
            preCompVO.Operacion = preCompraVO.INSERTAR;
            preCompVO = (preCompraVO)preCompBL.execute(preCompVO);
            if (preCompVO.ComprasId > 0)
            {
                lblCompraId.Text = preCompVO.ComprasId.ToString();
            }

            Response.Redirect("~/Admin/compras/caidaCompras.aspx?strTipoDocumento=" + rdoLstTipoDocumento.SelectedValue + "&strFolioDocumento=" + rdoLstTipoDocumento.SelectedItem.Text.Split('(')[1].Split(')')[0] + "&strMoneda=" + lstMoneda.SelectedValue + "&strLineaId=" + lblLineaId.Text + "&strMarca=" + lblMarca.Text + "&strSucursal=" + lblSucursal.Text + "&strCompraId=" + lblCompraId.Text + "&strClaveProveedor=" + lstProveedor.SelectedValue + "&strNombreProveedor=" + lstProveedor.SelectedItem.Text + "&strComentario=" + txtComentario.Text + "&Fecha=" + DateTime.Now.ToString("d") + "&Tipo=" + rdoLstTipoDocumento.SelectedValue);

        }

    }


    protected void odsPedidosPendientes_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }



   protected void GridView2_rowCommand(Object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Marcar")
        {
          int index = Convert.ToInt32(e.CommandArgument);
          GridView GridView2 = (GridView)GridView1.Rows[GridView1.EditIndex].FindControl("GridView2");
          GridViewRow row = GridView2.Rows[index];
          // Update the row.
          GridView2.UpdateRow(index, false);
        }
        if (e.CommandName == "Borrar")
        {
            SqlDataSource sdsDocumentos = (SqlDataSource)GridView1.Rows[GridView1.EditIndex].FindControl("sdsDocumentos");
            sdsDocumentos.DeleteParameters[0].DefaultValue = e.CommandArgument.ToString();
            sdsDocumentos.Delete();
        }
   
    }


    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                //tiene marcado el pedido
                if (Int32.Parse(DataBinder.Eval(e.Row.DataItem, "comPedId").ToString())>0)
                {//

                    Button btnMarcar = (Button)e.Row.FindControl("btnMarcar");
                    //Label lblMarcada = (Label)e.Row.FindControl("lblMarcada");
                    Button btnEliminar = (Button)e.Row.FindControl("btnEliminar");

                    btnMarcar.Visible = false;
                    //lblMarcada.Visible = true;
                    btnEliminar.Visible = true;

                    btnMarcar.Dispose();
                    //lblMarcada.Dispose();
                    btnEliminar.Dispose();
                }

                if (Int32.Parse(DataBinder.Eval(e.Row.DataItem, "comPedId").ToString()) == -1)
                {//cuando es pedido

                    Button btnMarcar = (Button)e.Row.FindControl("btnMarcar");
                    Label lblMarcada = (Label)e.Row.FindControl("lblMarcada");

                    btnMarcar.Visible = true;
                    lblMarcada.Visible = false;

                    btnMarcar.Dispose();
                    lblMarcada.Dispose();

                }

                if (Int32.Parse(DataBinder.Eval(e.Row.DataItem, "comPedId").ToString()) == 0)
                {//

                    Button btnMarcar = (Button)e.Row.FindControl("btnMarcar");
                    Label lblMarcada = (Label)e.Row.FindControl("lblMarcada");
                    Button btnEliminar = (Button)e.Row.FindControl("btnEliminar");

                    btnMarcar.Visible = false;
                    lblMarcada.Visible = false;
                    btnEliminar.Visible = false;

                    btnMarcar.Dispose();
                    lblMarcada.Dispose();
                    btnEliminar.Dispose();
                }


            }
        }
    }



}
