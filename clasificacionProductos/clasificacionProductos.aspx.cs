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
using clasificacionProductosTableAdapters;

public partial class clasificacionProductos_clasificacionProductos : System.Web.UI.Page
{
    private static int NUMFUNCION = 34;

    private get_ProductoDetalleTableAdapter productoDetalle = new get_ProductoDetalleTableAdapter();
    private set_EstatusClasificacion_APTableAdapter setClasificacion = new set_EstatusClasificacion_APTableAdapter();
    private get_conteoPendientesTableAdapter conteoPendientes = new get_conteoPendientesTableAdapter();
    private get_conteoPendientesMarcaTableAdapter conteoPendientesMarca = new get_conteoPendientesMarcaTableAdapter();
    private get_ProductoDetalleBusquedaTableAdapter BuscaProductoDetalle = new get_ProductoDetalleBusquedaTableAdapter();
 
    private DataTable datos = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }


        lblUsuario.Text = Session["nombreCompleto"].ToString();

        datos = conteoPendientes.GetData(Int32.Parse(Session["usuarioID"].ToString()));
        if (datos.Rows.Count > 0)
        {
            lblPendientes.Text = datos.Rows[0]["conteoPendientes"].ToString();
        }

        try
        {
                datos = conteoPendientesMarca.GetData(Int32.Parse(Session["usuarioID"].ToString()), Int32.Parse(lstMarca.SelectedItem.Value));
                if (datos.Rows.Count > 0)
                {
                    lblPendientesMarca.Text = datos.Rows[0]["conteoPendientes"].ToString();
                    lblEtiquetaPenMarca.Visible = true;
                    lblPendientesMarca.Visible = true;
                }
        }
        catch (NullReferenceException ex)
        {
            lblEtiquetaPenMarca.Visible=false;
            lblPendientesMarca.Visible=false;
        }


        lblValorEstatus.Text = "";
        lblFecha.Text = "";

        //--------------------------------
        
        InfoSessionVO infoSession;
        infoSession = (InfoSessionVO)Session["InfoSession"];
        if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "2")
        {
            lnkbtnRegresar.PostBackUrl = "~/Cotizador/Cotizaciones.aspx";
        }
        else
        {
            lnkbtnRegresar.PostBackUrl = "~/Principal/Default.aspx";
        }

    }

    protected void Page_Unload()
    {
        try
        {
            lstTipo.DataSourceID = "odsTipoXMarca";
            lstSubTipo.DataSourceID = "odsSubTipoXTipo";

            if (lblTipoAdminId.Text != "")
                lstTipo.SelectedValue = lblTipoAdminId.Text;

            if (lblCategoriaAdminId.Text != "")
                lstSubTipo.SelectedValue = lblCategoriaAdminId.Text;
        }
        catch (Exception ex)
        {
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //if(!Page.IsPostBack)
       // {
        lblValorEstatus.Text = "BUSCANDO";

        datos = productoDetalle.GetData(Int32.Parse(lstMarca.SelectedItem.Value), Session["usuarioID"].ToString());
        if (datos.Rows.Count > 0)
        {
            Button1.Enabled = false;
            btnContinuar.Enabled = true;

            txtCodigo.Text=datos.Rows[0]["codigoAdminProducto"].ToString();
            txtCodigoN.Text = datos.Rows[0]["codigoAdminProducto"].ToString();
            txtNombre.Text=datos.Rows[0]["NombreAdminProducto"].ToString();
            lblNombre.Text = datos.Rows[0]["NombreAdminProducto"].ToString();
            lblMarcaAdminId.Text=datos.Rows[0]["marcaAdminId"].ToString();
            lstMarca.SelectedValue = datos.Rows[0]["marcaAdminId"].ToString();
            
            lblTipoAdminId.Text=datos.Rows[0]["tipoAdminId"].ToString();//Int32.Parse(
            lblTipo.Text=datos.Rows[0]["tipo"].ToString();
            lblCategoriaAdminId.Text=datos.Rows[0]["categoriaAdminId"].ToString();//Int32.Parse(
            lblSubTipo.Text=datos.Rows[0]["categoria"].ToString();
            lblprocedenciaAdminId.Text=datos.Rows[0]["procedenciaAdminId"].ToString();//Int32.Parse(
            lblProcedencia.Text=datos.Rows[0]["procedencia"].ToString();
            lblUnidadAdminId.Text=datos.Rows[0]["unidadAdminId"].ToString();//Int32.Parse(
            lblUnidadMedida.Text=datos.Rows[0]["Unidad"].ToString();
            lblSeguimientoId.Text=datos.Rows[0]["seguimientoId"].ToString();//Int32.Parse(
            lblFecha.Text=datos.Rows[0]["Fecha"].ToString();
            lblValorEstatus.Text=datos.Rows[0]["Estatus"].ToString();
            lblEstatusBusquedaId.Text = datos.Rows[0]["EstatusBusquedaId"].ToString();

            lstProcedencia.SelectedValue = lblprocedenciaAdminId.Text;
            lstUnidadMedida.SelectedValue = lblUnidadAdminId.Text;

            //btnModificar.Visible = true;
            btnBuscar.Visible = false;
            habilitarCampos();
            
        }
       // }
        datos = conteoPendientes.GetData(Int32.Parse(Session["usuarioID"].ToString()));
        if (datos.Rows.Count > 0)
        {
            lblPendientes.Text = datos.Rows[0]["conteoPendientes"].ToString();
        }

        datos = conteoPendientesMarca.GetData(Int32.Parse(Session["usuarioID"].ToString()), Int32.Parse(lstMarca.SelectedItem.Value));
        if (datos.Rows.Count > 0)
        {
            lblPendientesMarca.Text = datos.Rows[0]["conteoPendientes"].ToString();
            lblEtiquetaPenMarca.Visible = true;
            lblPendientesMarca.Visible = true;
        }

    }
    protected void btnContinuar_Click(object sender, EventArgs e)
    {

    String strNombreTmpUlt = "";
    String strNombreUlt = "";
    Int32 intTipoNewUlt = 0;
    Int32 intTipoUlt = 0;
    Int32 intCategoriaTmpUlt = 0;
    Int32 intCategoriaUlt = 0;
    Int32 intProcedenciaTmpUlt = 0;
    Int32 intProcedenciaUlt = 0;
    Int32 intUnidadMedidaTmpUlt = 0;
    Int32 intUnidadMedidaUlt = 0;
    Int32 intMarcaTmpUlt = 0;
    Int32 intMarcaUlt = 0;
    String strCodigoTmpUlt = "";
    String strCodigoUlt = "";

/*
EstatusBusquedaId
1 - Nuevo
2 - Encontrado
*/

//Nombre
    if ((txtNombre.Text).Equals(lblNombre.Text) && lblEstatusBusquedaId.Text=="1")
   {
    strNombreTmpUlt = "";
    strNombreUlt = "";
   }
 else
   {
    strNombreTmpUlt = txtNombre.Text;
    strNombreUlt = lblNombre.Text;
   }


//Tipo
   if (Int32.Parse(lstTipo.SelectedValue) == Int32.Parse(lblTipoAdminId.Text) && lblEstatusBusquedaId.Text == "1")
    {
    intTipoNewUlt = 0;
    intTipoUlt = 0;
    }
   else
    {
    intTipoNewUlt = Int32.Parse(lstTipo.SelectedValue);
    intTipoUlt = Int32.Parse(lblTipoAdminId.Text);
    }
  
//Categoria
    if (Int32.Parse(lstSubTipo.SelectedValue) == Int32.Parse(lblCategoriaAdminId.Text) && lblEstatusBusquedaId.Text == "1")
    {
    intCategoriaTmpUlt = 0;
    intCategoriaUlt = 0;
    }
  else
    {
    intCategoriaTmpUlt = Int32.Parse(lstSubTipo.SelectedValue);
    intCategoriaUlt = Int32.Parse(lblCategoriaAdminId.Text);
    }

//Procedencia
    if (Int32.Parse(lstProcedencia.SelectedValue) == Int32.Parse(lblprocedenciaAdminId.Text) && lblEstatusBusquedaId.Text == "1")
    {
    intProcedenciaTmpUlt = 0;
    intProcedenciaUlt = 0;
    }
  else
    {
    intProcedenciaTmpUlt = Int32.Parse(lstProcedencia.SelectedValue);
    intProcedenciaUlt = Int32.Parse(lblprocedenciaAdminId.Text);
    }

//Unidad Medida
    if (Int32.Parse(lstUnidadMedida.SelectedValue) == Int32.Parse(lblUnidadAdminId.Text) && lblEstatusBusquedaId.Text == "1")
    {
        intUnidadMedidaTmpUlt = 0;
        intUnidadMedidaUlt = 0;
    }
  else
    {
    intUnidadMedidaTmpUlt = Int32.Parse(lstUnidadMedida.SelectedValue);
    intUnidadMedidaUlt = Int32.Parse(lblUnidadAdminId.Text);
    }


//Marca
    if (Int32.Parse(lstMarca.SelectedValue) == Int32.Parse(lblMarcaAdminId.Text) && lblEstatusBusquedaId.Text == "1")
    {
        intMarcaTmpUlt = 0;
        intMarcaUlt = 0;
    }
  else
    {
        intMarcaTmpUlt = Int32.Parse(lstMarca.SelectedValue);
        intMarcaUlt = Int32.Parse(lblMarcaAdminId.Text);

    }

//Código
  if ((txtCodigoN.Text).Equals(txtCodigo.Text) && lblEstatusBusquedaId.Text == "1")
   {
    strCodigoTmpUlt = "";
    strCodigoUlt = "";
   }
 else
   {
    strCodigoTmpUlt = txtCodigoN.Text;
    strCodigoUlt = txtCodigo.Text;
   }

   datos = setClasificacion.GetData(Int32.Parse(lblSeguimientoId.Text), Session["usuarioID"].ToString(), 1, 1, txtCodigo.Text, strNombreTmpUlt, strNombreUlt, intTipoNewUlt, intTipoUlt, intCategoriaTmpUlt, intCategoriaUlt, intProcedenciaTmpUlt, intProcedenciaUlt, intUnidadMedidaTmpUlt, intUnidadMedidaUlt, intMarcaTmpUlt, intMarcaUlt,strCodigoTmpUlt);
        if (datos.Rows.Count > 0)
        {
            lblValorEstatus.Text = datos.Rows[0]["RESULTADO"].ToString();
            txtCodigo.Text = "";
            txtCodigoN.Text = "--";
            txtCodigoN.Visible = false;
            txtCodigo.Visible = true;

            txtNombre.Text = "";
            lstProcedencia.SelectedValue = "0";
            lstTipo.SelectedValue = "0";
            lstSubTipo.SelectedValue = "0";
            lstUnidadMedida.SelectedValue = "0";
            chkClasificacion.Items[0].Selected = false;
            chkClasificacion.Items[1].Selected = false;

            lblMarcaAdminId.Text = "";
            lblNombre.Text = "";
            lblProcedencia.Text = "";
            lblTipo.Text = "";
            lblSubTipo.Text = "";
            lblUnidadMedida.Text = "";

            lblMarcaAdminId.Text = "";
            lblNombre.Text = "";
            lblprocedenciaAdminId.Text = "";
            lblTipoAdminId.Text = "";
            lblCategoriaAdminId.Text = "";
            lblUnidadAdminId.Text = "";
            lblSeguimientoId.Text = "";

            Button1.Enabled = true;
            btnContinuar.Enabled = false;
            //btnModificar.Visible = false;
            btnBuscar.Visible = true;

            lblEstatusBusquedaId.Text = "0";

            lstTipo.DataSourceID = "odsListaTipos";
            lstSubTipo.DataSourceID = "odsListaSubtipos";
            deshabilitarCampos();
            lstMarca.Enabled = true;

        }

    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        txtCodigoN.Visible = true;
        txtCodigo.Visible = false;
        btnModificar.Visible = false;
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        if (lblBanderaBusqueda.Text=="0")
            {
            lblBanderaBusqueda.Text = "1";
            txtCodigoN.Visible=true;
            txtCodigoN.Enabled = true;
            txtCodigo.Visible=false;
            Button1.Visible = false;

            txtCodigo.Text = "";
            txtCodigoN.Text = "";
            //txtCodigoN.Text = "capture el código";


            txtNombre.Text = "";
            lstMarca.SelectedValue = "0";
            lstMarca.Enabled = false;
            lstProcedencia.SelectedValue = "0";
            lstTipo.SelectedValue = "0";
            lstSubTipo.SelectedValue = "0";
            lstUnidadMedida.SelectedValue = "0";
            chkClasificacion.Items[0].Selected = false;
            chkClasificacion.Items[1].Selected = false;

            lblMarcaAdminId.Text = "";
            lblNombre.Text = "";
            lblProcedencia.Text = "";
            lblTipo.Text = "";
            lblSubTipo.Text = "";
            lblUnidadMedida.Text = "";

            lblMarcaAdminId.Text = "";
            lblNombre.Text = "";
            lblprocedenciaAdminId.Text = "";
            lblTipoAdminId.Text = "";
            lblCategoriaAdminId.Text = "";
            lblUnidadAdminId.Text = "";
            lblSeguimientoId.Text = "";

            }
        else
            {
        lblBanderaBusqueda.Text = "0";
        Button1.Visible = true;
        btnBuscar.Visible = false;


        lblValorEstatus.Text = "BUSCANDO";
        //lstTipo.DataSourceID = "odsListaTipos";
        //lstSubTipo.DataSourceID = "odsListaSubtipos";

        datos = BuscaProductoDetalle.GetData(Int32.Parse(lstMarca.SelectedItem.Value), Session["usuarioID"].ToString(), txtCodigoN.Text);
        if (datos.Rows.Count > 0)
        {

            Button1.Enabled = false;
            btnContinuar.Enabled = true;
            habilitarCampos();

            lblTipoAdminId.Text = datos.Rows[0]["tipoAdminId"].ToString();
            lblTipo.Text = datos.Rows[0]["tipo"].ToString();
            lblCategoriaAdminId.Text = datos.Rows[0]["categoriaAdminId"].ToString();//Int32.Parse(
            lblSubTipo.Text = datos.Rows[0]["categoria"].ToString();
            lblprocedenciaAdminId.Text = datos.Rows[0]["procedenciaAdminId"].ToString();//Int32.Parse(
            lblProcedencia.Text = datos.Rows[0]["procedencia"].ToString();
            lblUnidadAdminId.Text = datos.Rows[0]["unidadAdminId"].ToString();//Int32.Parse(
            lblUnidadMedida.Text = datos.Rows[0]["Unidad"].ToString();
            lblSeguimientoId.Text = datos.Rows[0]["seguimientoId"].ToString();//Int32.Parse(
            lblFecha.Text = datos.Rows[0]["Fecha"].ToString();
            lblValorEstatus.Text = datos.Rows[0]["Estatus"].ToString();
            lblEstatusBusquedaId.Text = datos.Rows[0]["EstatusBusquedaId"].ToString();

            txtCodigo.Text=datos.Rows[0]["codigoAdminProducto"].ToString();
            txtCodigoN.Text = datos.Rows[0]["codigoAdminProducto"].ToString();
            txtNombre.Text=datos.Rows[0]["NombreAdminProducto"].ToString();
            lblNombre.Text = datos.Rows[0]["NombreAdminProducto"].ToString();
            lblMarcaAdminId.Text=datos.Rows[0]["marcaAdminId"].ToString();
            lstMarca.SelectedValue = datos.Rows[0]["marcaAdminId"].ToString();
            lstProcedencia.SelectedValue = lblprocedenciaAdminId.Text;
            lstUnidadMedida.SelectedValue = lblUnidadAdminId.Text;

            try
            {
                lstTipo.SelectedValue = lblTipoAdminId.Text;
                lstSubTipo.SelectedValue = lblCategoriaAdminId.Text;
            }
            catch (Exception ex)
            {
            }

            //btnModificar.Visible = true;
            lblValorEstatus.Text = "";

            lstTipo.DataSourceID = "odsTipoXMarca";
            lstSubTipo.Enabled = false;
            //lstSubTipo.DataSourceID = "odsSubTipoXTipo";

        }
        else
        {
            lblValorEstatus.Text = txtCodigoN.Text + " - NO SE ENCONTRÓ.";
            txtCodigoN.Text = "";
            btnBuscar.Visible = true;
        }

        datos = conteoPendientes.GetData(Int32.Parse(Session["usuarioID"].ToString()));
        if (datos.Rows.Count > 0)
        {
            lblPendientes.Text = datos.Rows[0]["conteoPendientes"].ToString();
        }

        datos = conteoPendientesMarca.GetData(Int32.Parse(Session["usuarioID"].ToString()), Int32.Parse(lstMarca.SelectedItem.Value));
        if (datos.Rows.Count > 0)
        {
            lblPendientesMarca.Text = datos.Rows[0]["conteoPendientes"].ToString();
            lblEtiquetaPenMarca.Visible = true;
            lblPendientesMarca.Visible = true;
        }
    //------
        }
    }

    protected void deshabilitarCampos()
    {
        lstMarca.Enabled=false;
        lstProcedencia.Enabled=false;
        lstUnidadMedida.Enabled=false;
        lstTipo.Enabled=false;
        lstSubTipo.Enabled=false;
        txtNombre.Enabled=false;
        txtCodigoN.Enabled = false;
    }

    protected void habilitarCampos()
    {
        lstMarca.Enabled=true;
        lstProcedencia.Enabled=true;
        lstUnidadMedida.Enabled=true;
        lstTipo.Enabled=true;
        lstSubTipo.Enabled=true;
        txtNombre.Enabled=true;
        txtCodigoN.Enabled = true;
    }

    protected void lstTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        lstSubTipo.Enabled = true;
        lstSubTipo.DataSourceID = "odsSubTipoXTipo";
    }
}
