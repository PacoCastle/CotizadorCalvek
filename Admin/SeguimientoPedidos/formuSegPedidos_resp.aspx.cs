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
using catalogosTableAdapters;
using System.Drawing;

public partial class Admin_SeguimientoPedidos_formularioSeguimientoPedidos : System.Web.UI.Page
{
    //private static int NUMFUNCION = 8;
    private get_comboEstatusPedidoPendienteTableAdapter get_comboEstatusPedidoPendiente = new get_comboEstatusPedidoPendienteTableAdapter();
    private DataTable datos = null;

    Boolean blnPedidoCompletoIncompleto = false;    // lo que indica esta variable es: pedido marcado para mandar al cliente todo, pero no hay existencia para surtir
    Boolean blnPerfilAuxAdministrativo = false;
    Boolean blnPerfilCompras = false;


    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "300"); // se refresca la pagina cada 5 min

        //btnDestino.Attributes["OnClick"] = "new_window('DestinoPedido.aspx');return false;";
        
        // SEGURIDAD
        //String error = Utilis.validaPermisos(Session, NUMFUNCION);
        //if (!error.Equals(""))
        //{
        //    Response.Redirect(error);
        //}

        // determinar si el usuario tiene los permisos como administrador de seguimiento a pedidos.
        String error2 = Utilis.validaPermisos(Session, 25);
        if (error2.Equals(""))
        {
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[12].Visible = false;
        }

        DropDownList lstEstatusPendiente = (DropDownList)FormView1.FindControl("lstEstatusPendiente");
        lstEstatusPendiente.Visible = true;
        Label lblEstatusPendiente = (Label)FormView1.FindControl("lblEstatusPendiente");
        lblEstatusPendiente.Visible = true;
        lstEstatusPendiente.Dispose();
        lblEstatusPendiente.Dispose();

        error2 = Utilis.validaPermisos(Session, 26);
        if (error2.Equals(""))
        {
            blnPerfilAuxAdministrativo = true;
            DropDownList lstEstatusPendientef = (DropDownList)FormView1.FindControl("lstEstatusPendiente");
            lstEstatusPendientef.Enabled = true;
            lstEstatusPendientef.Dispose();
        }
         
        error2 = Utilis.validaPermisos(Session, 24);
        if (error2.Equals(""))
        {
            blnPerfilCompras = true;
        }
        
        lblSerie.Text = Request["serie"].ToString();
        lblFolio.Text = Request["folio"].ToString();

        Label lblEstatusSurtir = (Label)FormView1.FindControl("lblEstatusSurtir");
        if (lblEstatusSurtir.Text=="1")
            {
                blnPedidoCompletoIncompleto = true;
            }
        lblEstatusSurtir.Dispose();

        if (!Page.IsPostBack)
        {
            Label lblMensajeF = (Label)FormView1.FindControl("lblMensajeF");
            txtMensaje.Text = lblMensajeF.Text;
            lblMensajeF.Dispose();

            error2 = Utilis.validaPermisos(Session, 27);
            if (error2.Equals(""))
            {
                DropDownList ddlEstatusAlmacen = (DropDownList)FormView1.FindControl("ddlEstatusAlmacen");
                ddlEstatusAlmacen.Enabled = true;
            }

        }

        lblMensaje.Text = "";

    }
    
    protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
    {
        int index = GridView1.EditIndex;
        GridViewRow row = GridView1.Rows[index];
        DropDownList temporal = (DropDownList)row.FindControl("temporal");
        e.NewValues["acciones"] = temporal.SelectedItem.Value.Split('-')[0];

        Label Label4 = (Label)row.FindControl("Label1");
        //if (Label4.Text == "COMPRA" || Label4.Text == "TRASPASO")
        //    {
        //    if(e.OldValues["acciones"] != e.NewValues["acciones"])
        //        {
        //            e.Cancel = true;
        //            lblMensaje.Text = "NO SE PUEDE MODIFICAR EL VALOR DE ACCIONES";
        //        }
        //    }

        if (Label4.Text == "POR SURTIR")
            {
                if (e.OldValues["serieDocumento"] != e.NewValues["serieDocumento"] || e.OldValues["folioDocumento"] != e.NewValues["folioDocumento"])
                {
                    e.Cancel = true;
                    lblMensaje.Text = "NO SE PUEDE MODIFICAR LOS VALORES DE DOCUMENTO";
                }
            }

        if(e.OldValues["fechaEntrega"]!= null)
            {
            TextBox txtFechaEntrega = (TextBox)row.FindControl("fechaEntrega");
            if(e.OldValues["fechaEntrega"].ToString().Trim().Length > 0 && txtFechaEntrega.Text.Trim().Length > 0)
            {
            //DD/MM/AAAA
            String[] strFechaOld = e.OldValues["fechaEntrega"].ToString().Split('/');
            DateTime dtFechaEntregaOld = new DateTime(Int32.Parse(strFechaOld[2]), Int32.Parse(strFechaOld[1]), Int32.Parse(strFechaOld[0]));
            String[] strFechaNew = txtFechaEntrega.Text.Split('/');
            DateTime dtFechaEntregaNew = new DateTime(Int32.Parse(strFechaNew[2]), Int32.Parse(strFechaNew[1]), Int32.Parse(strFechaNew[0]));
            TimeSpan diffResult = dtFechaEntregaNew - dtFechaEntregaOld;

            //txtMensaje.Text = diffResult.Days.ToString();

            if (diffResult.Days > 0)
                {
                //String strComentario = e.OldValues["comentario"].ToString();
                TextBox txtComentario = (TextBox)row.FindControl("comentario");
                String strComentario=txtComentario.Text.Trim(), strCorreoAdministracion="";
                Label lblccoreo = (Label)FormView1.FindControl("lblCorreo");

                if(Int32.Parse(GridView1.DataKeys[index][5].ToString())==1) // oficinaId Queretaro
			{
			strCorreoAdministracion = "iris.salazar@calvek.com";
			}
		if(Int32.Parse(GridView1.DataKeys[index][5].ToString())==2) //  San luis
			{
                    	strCorreoAdministracion = "sarai.castillo@calvek.com";
			}
		if(Int32.Parse(GridView1.DataKeys[index][5].ToString())==3) //  celaya
			{
                    	strCorreoAdministracion = "iliana.manrique@calvek.com";
			}

                Mail.sendMail("sick@calvek.com", "SICK", lblccoreo.Text, "", strCorreoAdministracion, "", "", "", "SEGUIMIENTO A PEDIDOS, MODIFICACIÓN FECHA ENTREGA A PEDIDO:" + lblSerie.Text.Trim() + "-" + lblFolio.Text.Trim(), "La fecha de entrega del Pedido:" + lblSerie.Text.Trim() + "-" + lblFolio.Text.Trim() + " cambio de:" + e.OldValues["fechaEntrega"].ToString().Trim() + " para el:" + txtFechaEntrega.Text + " Comentario: " + strComentario, false);

                txtComentario.Dispose();
                strComentario = null;
                lblccoreo.Dispose();
                }

                strFechaOld = null;
                strFechaNew = null;

            }
            
        }
    }

    protected void GridView1_RowCreated(Object sender, GridViewRowEventArgs e)
    {
    }

    protected void GridView1_RowEditing(Object sender, GridViewEditEventArgs e)
      {
      }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    if(e.Row.RowType==DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                    {
                        String strInstruccion = DataBinder.Eval(e.Row.DataItem, "Instruccion").ToString();
                        if (strInstruccion == "SURTIDO" || blnPedidoCompletoIncompleto && !blnPerfilCompras || strInstruccion == "" || (strInstruccion == "COMPRA" && blnPerfilAuxAdministrativo) || (strInstruccion == "POR SURTIR" && blnPerfilCompras) || (!blnPerfilAuxAdministrativo && !blnPerfilCompras))
                        {//deshabilita el boton de editar
                            Button Button1 = (Button)e.Row.FindControl("Button1");
                            Button1.Enabled = false;
                            Button1.Dispose();
                        }
                    }

                    if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == DataControlRowState.Alternate)
                    {
                        String strInstruccion = DataBinder.Eval(e.Row.DataItem, "Instruccion").ToString();
                        if(strInstruccion == "POR SURTIR")
                            {//deshablita los campos del documento y accion
                                try
                                {
                                    TextBox serieDocumento = (TextBox)e.Row.FindControl("serieDocumento");
                                    serieDocumento.Enabled = false;
                                    serieDocumento.Dispose();

                                    TextBox folioDocumento = (TextBox)e.Row.FindControl("folioDocumento");
                                    folioDocumento.Enabled = false;
                                    folioDocumento.Dispose();
                                }
                                catch (Exception ex)
                                {
                                    //Console.WriteLine("{0} Exception caught.", e);
                                }

                            }
                    }
        }
    }

    public ListItemCollection ListaEstatus(String strEstatus)
    {

        ListItem li = null;
        ListItemCollection liC = new ListItemCollection();

        int a = 0;
        datos = get_comboEstatusPedidoPendiente.GetData(strEstatus);
        if (datos.Rows.Count > 0)
        {
            while (a < datos.Rows.Count)
            {
                li = new ListItem(datos.Rows[a]["estatusPedidoPendienteId"].ToString()+"-"+datos.Rows[a]["Descripcion"].ToString(), datos.Rows[a]["estatusPedidoPendienteId"].ToString());
                liC.Add(li);
                li = null;
                a++;
            }
        }

        return liC;

    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        DropDownList ddlEstatusAlmacen = (DropDownList)FormView1.FindControl("ddlEstatusAlmacen");
        DropDownList lstEstatusPendiente = (DropDownList)FormView1.FindControl("lstEstatusPendiente");

        AdmPedidosPendientesVO VOPedidoPend = new AdmPedidosPendientesVO();
        AdmPedidosPendientesBL BLPedidoPend = new AdmPedidosPendientesBL();

        VOPedidoPend.SeriePedido = lblSerie.Text;
        VOPedidoPend.FolioPedido = Int32.Parse(lblFolio.Text);
        VOPedidoPend.OficinaId = Int32.Parse(Request["oficinaId"].ToString());
        VOPedidoPend.Mensaje = txtMensaje.Text.Trim();
        VOPedidoPend.EstatusPedidoAlmacenId = Int32.Parse(ddlEstatusAlmacen.SelectedItem.Value);
        VOPedidoPend.EstatusPendienteId = Int32.Parse(lstEstatusPendiente.SelectedItem.Value);
        VOPedidoPend.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());
        VOPedidoPend = (AdmPedidosPendientesVO)BLPedidoPend.execute(VOPedidoPend);
        VOPedidoPend.Operacion = AdmPedidosPendientesVO.INSERTAR;
        VOPedidoPend = (AdmPedidosPendientesVO)BLPedidoPend.execute(VOPedidoPend);
        if (VOPedidoPend.Resultado == 0)
            {
                lblMensaje.Text = "CAMBIO APLICADO";
            }
         else
            {
                lblMensaje.Text = "Cambio NO aplicado";
            }
        ddlEstatusAlmacen.Dispose();
        lstEstatusPendiente.Dispose();
        lblMensaje.ForeColor = Color.FromName("#990000");
        lblMensaje.BackColor = Color.FromName("#E0E0E0");
        lblMensaje.Font.Bold = true;
    }

    protected void odsDetallePedido_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
    }
    protected void btnDestino_Click(object sender, EventArgs e)
    {
        gwDocumentosDestino.Visible=true;
        odsDocumentoDestino.EnableViewState=true;
    }


    protected void gvDocDestino_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    if(e.Row.RowType==DataControlRowType.DataRow)
      {
       if(e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
         {
             if (DataBinder.Eval(e.Row.DataItem, "Movimiento2").ToString().Trim().Length > 0)
               {//deshabilita el boton de editar

                Label lblDestino2 = (Label)e.Row.FindControl("lblDestino2");

                Label lblSerie2 = (Label)e.Row.FindControl("lblSerie2");
                Label lblFolio2 = (Label)e.Row.FindControl("lblFolio2");
                Label lblFecha2 = (Label)e.Row.FindControl("lblFecha2");
                Label lblCantidad2 = (Label)e.Row.FindControl("lblCantidad2");

                lblDestino2.Visible = true;
                lblSerie2.Visible = true;
                lblFolio2.Visible = true;
                lblFecha2.Visible = true;
                lblCantidad2.Visible = true;

                lblDestino2.Dispose();
                lblSerie2.Dispose();
                lblFolio2.Dispose();
                lblFecha2.Dispose();
                lblCantidad2.Dispose();

               }
         }
      }
    }



}
