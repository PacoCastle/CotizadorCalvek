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

public partial class Admin_SeguimientoPedidos_Default : System.Web.UI.Page
{
    private static int NUMFUNCION = 24;
    Boolean blnProductoSelecionado;

    protected void Page_Load(object sender, EventArgs e)
    {
        blnProductoSelecionado = false;

        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //lblCodigoProducto.Visible = true;




    }

    public void GridView1_DataBound(Object src, GridViewRowEventArgs e) 
    {
      //if ( e.Row.RowType == DataControlRowType.DataRow ) 
      //  {
      //   TableCellCollection cells = e.Row.Cells;
      //   // assumes column to sum is last column in grid
      //   //lblMensaje.Text += cells[cells.Count - 1].Text;

      //   //cells [ cells.Count-1 ].Text = string.Format ( "{0:n}", float.Parse ( cells [ cells.Count-1 ].Text ) );
      //  }
    }

    private ArrayList getValoresCheckbox()
    {
        ArrayList categoryIDList = new ArrayList();
        String index = "-1";
        String strSerie = "";
        String strOficinaId = "";
        String strFolio = "";
        String strFecha = "";

        Boolean blnFechEntrega = true;
        Boolean blnFechConfirmada = true;
        String[] strFechaPedido;
        DateTime dtFechaEntregaPedido;
        bool result;
        TimeSpan difFechaEntrega;
        TimeSpan difFechaConfirmada;
        String[] strFechaEntrega;
        DateTime dtFechaEntregaEntrega = new DateTime();
        String[] strFechaConfirmada;
        DateTime dtFechaEntregaConfirmada = new DateTime();

        if(txtFechaEntrega.Text.Trim().Length > 0)
            {
                strFechaEntrega = txtFechaEntrega.Text.Replace('-','/').Split('/');
                dtFechaEntregaEntrega = new DateTime(Int32.Parse(strFechaEntrega[2]), Int32.Parse(strFechaEntrega[1]), Int32.Parse(strFechaEntrega[0]));
            }
        if(txtFechaConfirmada.Text.Trim().Length > 0)
            {
                strFechaConfirmada = txtFechaConfirmada.Text.Replace('-','/').Split('/');
                dtFechaEntregaConfirmada = new DateTime(Int32.Parse(strFechaConfirmada[2]), Int32.Parse(strFechaConfirmada[1]), Int32.Parse(strFechaConfirmada[0]));
            }

        foreach (GridViewRow row in GridView2.Rows)
        {
            index = GridView2.DataKeys[row.RowIndex].Values["cidmovim01"].ToString();
            strSerie = GridView2.DataKeys[row.RowIndex].Values["cseriedo01"].ToString();
            strOficinaId = GridView2.DataKeys[row.RowIndex].Values["oficinaId"].ToString();
            strFolio = GridView2.DataKeys[row.RowIndex].Values["cfolio"].ToString();
            strFecha = GridView2.DataKeys[row.RowIndex].Values["fecha"].ToString();

            result = ((CheckBox)row.FindControl("ckbPedidos")).Checked;
            if (result)
            {
                            //DD/MM/AAAA
            strFechaPedido = strFecha.Split('/');
            dtFechaEntregaPedido = new DateTime(Int32.Parse(strFechaPedido[2]), Int32.Parse(strFechaPedido[1]), Int32.Parse(strFechaPedido[0]));


            if(txtFechaEntrega.Text.Trim().Length > 0)
                {
                difFechaEntrega = dtFechaEntregaEntrega - dtFechaEntregaPedido;
                if (difFechaEntrega.Days <= 0)
                    {
                        blnFechEntrega = false;
                    }

                }

            if(txtFechaConfirmada.Text.Trim().Length > 0)
                {
                difFechaConfirmada = dtFechaEntregaConfirmada - dtFechaEntregaPedido;
                if (difFechaConfirmada.Days <= 0)
                    {
                        blnFechConfirmada = false;
                    }
                }
            
            if (blnFechEntrega || blnFechConfirmada)
                {
                    ArrayList arrTmp = new ArrayList();
                    arrTmp.Add(index);
                    arrTmp.Add(strSerie);
                    arrTmp.Add(strOficinaId);
                    arrTmp.Add(strFolio);
                    categoryIDList.Add(arrTmp);
                }
                else
                {
                    lblMensaje.Text = "Validar la Fecha Prevista o la Fecha Confirmada: " + strSerie.Trim() + "-" + strFolio;
                }

            }
        }
        return categoryIDList;
    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        lblMensaje.Text = "";
        AdmPedidosPendientesCompraVO VO = new AdmPedidosPendientesCompraVO();
        AdmPedidosPendientesCompraBL BL = new AdmPedidosPendientesCompraBL();
        GridViewRow row = GridView1.SelectedRow;

        VO.ArrMovimientos = getValoresCheckbox();
        if(VO.ArrMovimientos.Count > 0 )
        {
            VO.DocumentoSeriePedido = txtSerieDocumento.Text.Trim();
            VO.DocumentoFolioPedido = txtFolioDocumento.Text.Trim();
            VO.FechaEntrega = txtFechaEntrega.Text.Replace('-','/').Trim();
            VO.Comentarios = txtComentario.Text.Trim();
            VO.FechaConfirmada = txtFechaConfirmada.Text.Replace('-','/').Trim();
            VO.ProvContactado = ckbProvContac.Checked;
            VO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());
            
            VO.CodigoProd=row.Cells[1].Text;
            VO.UsuarioIdAsignado = 0; // usuarioAsignado

            VO.Operacion = AdmPedidosPendientesCompraVO.ACTUALIZAR;

            VO = (AdmPedidosPendientesCompraVO)BL.execute(VO);
            if (VO.Resultado == 0)
            {
                //perfilid = (int)VO.Resultado;
                lblCodigoProducto.Visible = true;
                lblMensaje.Text = "LOS DATOS SE ACTUALIZARON CORRECTAMENTE.";

                GridView2.Visible = false;
                GridView1.Visible = false;
                txtProductoBus.Text = "";

                lblOrdenCompra.Visible = false;
                txtSerieDocumento.Visible = false;
                txtFolioDocumento.Visible = false;
                lblFechaEntrega.Visible = false;
                txtFechaEntrega.Visible = false;
                lblComentario.Visible = false;
                txtComentario.Visible = false;
                btnContinuar.Visible = false;
                txtFechaConfirmada.Visible = false;
                lblFechaConfirmada.Visible = false;
                lblProvContacto.Visible = false;
                ckbProvContac.Visible = false;

                //txtComentario.Text = "";

            }
            else
            {
                lblMensaje.Text = "Los datos NO se insertaron";
            }
        }
        else
        {
            if (lblMensaje.Text.Length==0)
                lblMensaje.Text = "SELECCIONAR UNA OPCIÓN";
        }
        
    }

    protected void ckbPedidos_CheckedChanged(object sender, EventArgs e)
    {
        
        
    }

    protected void btnSeleccionProducto_Click(object sender, EventArgs e)
    {
        
        //GridView1.DataBind();
    }

    protected void GridView1_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if(blnProductoSelecionado)
              {
                Button btnSeleccion = (Button)e.Row.FindControl("Button1");
                btnSeleccion.Enabled = false;
                btnSeleccion.Dispose();
                btnContinuar.Visible = true;

                lblOrdenCompra.Visible = true;
                txtSerieDocumento.Visible = true;
                txtFolioDocumento.Visible = true;

                lblFechaEntrega.Visible = true;
                txtFechaEntrega.Visible = true;

                lblFechaConfirmada.Visible = true;
                txtFechaConfirmada.Visible = true;

                lblProvContacto.Visible = true;
                ckbProvContac.Visible = true;

                lblComentario.Visible = true;
                txtComentario.Visible = true;


                //  Label lblCod_prod = (Label)e.Row.FindControl("lblCod_prod");
                //lblCod_prod.Visible = true;
                //lblCod_prod.Dispose();
               }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        blnProductoSelecionado = true;
        
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    if(e.Row.RowType==DataControlRowType.DataRow)
        {
        if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {

                String strInstruccion = DataBinder.Eval(e.Row.DataItem, "Instruccion").ToString();

                if (strInstruccion == "COMPRA" || strInstruccion == "TRASPASO" || strInstruccion == "PENDIENTE")
                {//deshabilita el boton de editar
                    CheckBox ckbPedidos = (CheckBox)e.Row.FindControl("ckbPedidos");
                    ckbPedidos.Enabled = true;
                    //ckbPedidos.Dispose();

                    lblOrdenCompra.Visible = true;
                    txtSerieDocumento.Visible = true;
                    txtFolioDocumento.Visible = true;
                    lblFechaEntrega.Visible = true;
                    txtFechaEntrega.Visible = true;
                    lblComentario.Visible = true;
                    txtComentario.Visible = true;
                    btnContinuar.Visible = true;
                    txtFechaConfirmada.Visible = true;
                    lblFechaConfirmada.Visible = true;
                    lblProvContacto.Visible = true;
                    ckbProvContac.Visible = true;

                }
            }
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblProducto.Visible = true;
        GridViewRow row = GridView1.SelectedRow;
        lblCodigoProducto.Text = row.Cells[1].Text + " - " + row.Cells[2].Text;
        GridView2.Visible = true;

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        lblProducto.Visible = false;
        lblCodigoProducto.Text = "";
        lblCodigoProducto.Visible = false;

        lblCodigoProducto.Visible = false;
        lblMensaje.Text = "";
        GridView1.Visible = true;
        //GridView2.Visible = true;
    }
}
