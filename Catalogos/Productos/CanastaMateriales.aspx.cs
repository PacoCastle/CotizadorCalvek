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
using System.Drawing;
using System.Data.SqlClient;

public partial class Clientes_administradorClientesKepler : System.Web.UI.Page
{
    private static int NUMFUNCION = 8;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
        if (Session["perfilID"] == null)
        {
            InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
            int intPerfil = Int32.Parse(infoSession.getValor(InfoSessionVO.PERFIL).ToString());
            Session["perfilID"] = intPerfil;
        }
    }
    protected void insertaProductosCanasta(string CD_SUCURSAL, string CD_AGENTE, string CD_PRODUCTO, string NB_MARCA, string NB_PRODUCTO, int NU_UNIDADES, string CD_PEDIDO, string NB_COMENTARIOS, String FH_DESVIO, int NU_TIPO, string FH_PEDIDO, Boolean CD_SELECT)
    {
        string connString = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
        SqlConnection Cnn = new SqlConnection(connString);
        string sError = null;
        int valResultado = 0;
        System.Text.StringBuilder message = new System.Text.StringBuilder();

        try
        {
            //Cnn = new SqlConnection(cstrConnectBD);
            SqlCommand cmd = new SqlCommand("set_Inserta_CanastaProducto", Cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CD_SUCURSAL", SqlDbType.VarChar, 5);
            cmd.Parameters["@CD_SUCURSAL"].Value = CD_SUCURSAL;

            cmd.Parameters.Add("@CD_AGENTE", SqlDbType.VarChar, 5);
            cmd.Parameters["@CD_AGENTE"].Value = CD_AGENTE;

            cmd.Parameters.Add("@CD_PRODUCTO", SqlDbType.VarChar, 65);
            cmd.Parameters["@CD_PRODUCTO"].Value = CD_PRODUCTO;

            cmd.Parameters.Add("@NB_MARCA", SqlDbType.VarChar, 30);
            cmd.Parameters["@NB_MARCA"].Value = NB_MARCA;

            cmd.Parameters.Add("@NB_PRODUCTO", SqlDbType.VarChar, 60);
            cmd.Parameters["@NB_PRODUCTO"].Value = NB_PRODUCTO;

            cmd.Parameters.Add("@NU_UNIDADES", SqlDbType.Int);
            cmd.Parameters["@NU_UNIDADES"].Value = NU_UNIDADES;

            if (FH_DESVIO == "")
            {
                cmd.Parameters.Add("@FH_DESVIO", SqlDbType.DateTime);
                cmd.Parameters["@FH_DESVIO"].Value = FH_PEDIDO;
            }
            else
            {
                cmd.Parameters.Add("@FH_DESVIO", SqlDbType.DateTime);
                cmd.Parameters["@FH_DESVIO"].Value = FH_DESVIO;
            }

            cmd.Parameters.Add("@CD_USUARIO", SqlDbType.Int);
            cmd.Parameters["@CD_USUARIO"].Value = Session["usuarioId"].ToString();

            //cmd.Parameters.Add("@NU_COSTO", SqlDbType.Decimal);
            //cmd.Parameters["@NU_COSTO"].Value = txtCostoUnitario.Text;

            cmd.Parameters.Add("@CD_PEDIDO", SqlDbType.VarChar, 7);
            cmd.Parameters["@CD_PEDIDO"].Value = CD_PEDIDO;

            cmd.Parameters.Add("@NB_COMENTARIOS", SqlDbType.VarChar, -1);
            cmd.Parameters["@NB_COMENTARIOS"].Value = NB_COMENTARIOS;

            cmd.Parameters.Add("@CD_TIPO", SqlDbType.Int);
            cmd.Parameters["@CD_TIPO"].Value = NU_TIPO;

            cmd.Parameters.Add("@CD_SELECT", SqlDbType.Bit);
            cmd.Parameters["@CD_SELECT"].Value = CD_SELECT;

            cmd.Parameters.Add("@Res", SqlDbType.Int);
            cmd.Parameters["@Res"].Direction = ParameterDirection.Output;

            Cnn.Open();

            cmd.ExecuteReader();


            valResultado = Convert.ToInt32(cmd.Parameters["@Res"].Value.ToString());

            if (valResultado != 0 & NU_TIPO == 2)
            {
                message.Append("El producto " + CD_PRODUCTO + " existe en el catalogo.");
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + message + "');", true);
                btnPopUp_ModalPopupExtender.Hide();
            }
            else if (valResultado == 0 & NU_TIPO == 2)
            {
                message.Append("El producto " + CD_PRODUCTO + " se inserto correctamente.");
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + message + "');", true);
                btnPopUp_ModalPopupExtender.Hide();
                dgvProductosCanasta.DataBind();
                TabRemisiones.ActiveTabIndex = 1;
            }

        }
        catch (SqlException ex)
        {
            sError = ex.Number + "-" + ex.Message;
        }
        catch (Exception ex)
        {
            sError = ex.Source + "-" + ex.Message;
        }
        finally
        {

            if ((Cnn != null))
            {
                if (Cnn.State == ConnectionState.Open)
                {
                    Cnn.Close();
                    //cerrar conexion
                    Cnn = null;
                    //destruir objeto
                }
            }
        }
    }
    //protected void dgvProductosCanasta_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
    //    {
    //        SqlDataSource sdsEstatus = (SqlDataSource)e.Row.FindControl("sdsEstatus");
    //        DataKey data = dgvProductosCanasta.DataKeys[Convert.ToInt32(e.Row.RowIndex)];

    //        sdsEstatus.SelectParameters[0].DefaultValue = data.Values["CD_ESTATUS"].ToString();

    //    }
    //}
    protected void dgvProductosCanasta_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = dgvProductosCanasta.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsProductosCanasta.UpdateParameters[0].DefaultValue = data.Values["PK_PRODUCTO"].ToString();
            //sdsProductosCanasta.UpdateParameters[1].DefaultValue = data.Values["CD_AGENTE"].ToString();
            //sdsProductosCanasta.UpdateParameters[2].DefaultValue = data.Values["CD_PRODUCTO"].ToString();
            //sdsProductosCanasta.UpdateParameters[3].DefaultValue = data.Values["CD_PEDIDO"].ToString();
            sdsProductosCanasta.UpdateParameters[1].DefaultValue = ((TextBox)dgvProductosCanasta.Rows[dgvProductosCanasta.EditIndex].FindControl("txtUnidades")).Text;
            sdsProductosCanasta.UpdateParameters[2].DefaultValue = ((TextBox)dgvProductosCanasta.Rows[dgvProductosCanasta.EditIndex].FindControl("txtFechaDesvio")).Text;
            sdsProductosCanasta.UpdateParameters[3].DefaultValue = ((DropDownList)dgvProductosCanasta.Rows[dgvProductosCanasta.EditIndex].FindControl("lstEstatus")).SelectedValue;
            sdsProductosCanasta.UpdateParameters[4].DefaultValue = ((TextBox)dgvProductosCanasta.Rows[dgvProductosCanasta.EditIndex].FindControl("txtComentarios")).Text;
            sdsProductosCanasta.UpdateParameters[5].DefaultValue = Session["usuarioId"].ToString();
            sdsProductosCanasta.UpdateParameters[6].DefaultValue = ((DropDownList)dgvProductosCanasta.Rows[dgvProductosCanasta.EditIndex].FindControl("lstAgente")).SelectedValue;

        }
        if (e.CommandName == "Delete")
        {

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvProductosCanasta.Rows[index];
          
            DataKey data = dgvProductosCanasta.DataKeys[Convert.ToInt32(e.CommandArgument)];
           
            sdsProductosCanasta.DeleteParameters[0].DefaultValue = data.Values["PK_PRODUCTO"].ToString();
            sdsProductosCanasta.DeleteParameters[1].DefaultValue =(row.Cells[7].Text.ToString());
            sdsProductosCanasta.DeleteParameters[2].DefaultValue = (row.Cells[6].Text.ToString());
            sdsProductosCanasta.DeleteParameters[3].DefaultValue = "4";
            sdsProductosCanasta.DeleteParameters[4].DefaultValue = (row.Cells[16].Text.ToString());
            sdsProductosCanasta.DeleteParameters[5].DefaultValue = Session["usuarioId"].ToString();

        }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        sdsPedidos.SelectParameters[0].DefaultValue = "";
        sdsPedidos.SelectParameters[1].DefaultValue = txtPedido.Text;
        sdsPedidos.SelectParameters[2].DefaultValue = "";
        sdsPedidos.SelectParameters[3].DefaultValue = "";
        sdsPedidos.SelectParameters[4].DefaultValue = "";
        sdsPedidos.SelectParameters[5].DefaultValue = "0";
        sdsPedidos.SelectParameters[6].DefaultValue = "";
        sdsPedidos.SelectParameters[7].DefaultValue = "";
        gvPedidos.DataBind();
          
    }   
   
    protected void gvPedidos_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        lblSerie.Text = gvPedidos.SelectedDataKey.Values["Serie"].ToString();
        lblFolio.Text = gvPedidos.SelectedDataKey.Values["Folio"].ToString();
        lblSucursal.Text = gvPedidos.SelectedDataKey.Values["oficinaId"].ToString(); 

        //DataKey data = gvPedidos.DataKeys[gvPedidos.SelectedIndex];
                
        //lblSerie.Text = data.Values["Serie"].ToString();
        //lblFolio.Text = data.Values["Folio"].ToString();
        //lblSucursal.Text = data.Values["oficinaId"].ToString();
        this.btnPopUp_ModalPopupExtender.Show();
    }
    protected void chkall_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkSelectAll = sender as CheckBox;

        foreach (GridViewRow gvr in dgvDetallePedido.Rows)
        {
            CheckBox chkSelect = gvr.FindControl("chkPedidos") as CheckBox;

            if (chkSelect != null)
            {
                chkSelect.Checked = chkSelectAll.Checked;
            }
        }

    }
   protected void btnCerrarPopUp_Click(object sender, ImageClickEventArgs e)
   {
       this.btnPopUp_ModalPopupExtender.Hide();
   }
   protected void btnInsertar_Click(object sender, ImageClickEventArgs e)
   {
       //int i = 0;
       //if (dgvDetallePedido.Rows.Count>0)
       // {
            foreach (GridViewRow gr in dgvDetallePedido.Rows)
            {
                if (((CheckBox)dgvDetallePedido.Rows[gr.RowIndex].FindControl("chkPedidos")).Checked == true)
                {
                    //DataKey data2 = dgvProductosCanasta.DataKeys[Convert.ToInt32(e.CommandArgument)];
                    DataKey data = dgvDetallePedido.DataKeys[Convert.ToInt32(gr.RowIndex)];

                    insertaProductosCanasta(data.Values["oficinaId"].ToString(),
                        data.Values["CD_AGENTE"].ToString(),
                        data.Values["Codigo"].ToString(),
                        data.Values["NB_MARCA"].ToString(),
                        data.Values["NB_PRODUCTO"].ToString(),
                        Convert.ToInt32(data.Values["NU_UNIDADES"].ToString()),
                        data.Values["folioPedido"].ToString(),
                        data.Values["NB_COMENTARIOS"].ToString(),
                        data.Values["FH_DESVIO"].ToString(), 2, data.Values["FH_PEDIDO"].ToString(), Convert.ToBoolean(0));
                }

            }
          
                //if (((CheckBox)dgvDetallePedido.Rows[i].FindControl("chkPedidos")).Checked == true)
                //{
                //    Marca_Partida(CotizacionOrigen, Convert.ToInt32(dgvDetCot.Rows[i].Cells[2].Text));
                //    marca = true;
                //}
              
            //}
            //if (marca == true)
            //{ 
            //    //inserta cotizacion
            //    set_inserta_detalleCotizacion_acotizacionTableAdapter set_inserta_detalleCotizacion_acotizacion = new set_inserta_detalleCotizacion_acotizacionTableAdapter();
            //    set_inserta_detalleCotizacion_acotizacion.GetData(CotizacionOrigen,intCotizacion,intUsuarioId);
            //    txtCotBuscar.Text = "";
            //    MasCot_ModalPopupExtender.Hide();
            //    Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());

                //LimpiaCamposModal();
                //Ficticio_ModalPopupExtender.Hide();
                //Response.Redirect("../Cotizador/ShopCart.aspx?cotizacionid=" + intCotizacion.ToString());

            //}
   }
   protected void dgvDetallePedido_RowCommand(object sender, GridViewCommandEventArgs e)
   {
       if (e.CommandName == "Update")
       {
           DataKey data = dgvDetallePedido.DataKeys[Convert.ToInt32(e.CommandArgument)];

           insertaProductosCanasta("", ((DropDownList)dgvDetallePedido.Rows[dgvDetallePedido.EditIndex].FindControl("lstAgente")).SelectedValue, data.Values["Codigo"].ToString(), "", "",
                                Convert.ToInt32(((TextBox)dgvDetallePedido.Rows[dgvDetallePedido.EditIndex].FindControl("txtunidades")).Text),
                                    "", Convert.ToString(((TextBox)dgvDetallePedido.Rows[dgvDetallePedido.EditIndex].FindControl("txtComentarios")).Text)
                                    , Convert.ToString(((TextBox)dgvDetallePedido.Rows[dgvDetallePedido.EditIndex].FindControl("txtFechaDesvio")).Text), 1
                                    , data.Values["FH_PEDIDO"].ToString(),
                                    Convert.ToBoolean(data.Values["CD_SELECT"].ToString()));
           dgvDetallePedido.DataBind();
       }
   }
   protected void chkPedidos_CheckedChanged(object sender, EventArgs e)
   {
       CheckBox chk = (CheckBox)sender;
       GridViewRow gr = (GridViewRow)chk.Parent.Parent;
       int chkVal = 0;
       //lblmsg.Text = GridView1.DataKeys[gr.RowIndex].Value.ToString();

       CheckBox chkBx = (CheckBox)dgvDetallePedido.Rows[gr.RowIndex].FindControl("chkPedidos");
       if (chkBx != null && chkBx.Checked)
           chkVal = 1;
       else
           chkVal = 0;

       DataKey data = dgvDetallePedido.DataKeys[gr.RowIndex];
       insertaProductosCanasta("", "", data.Values["Codigo"].ToString(), "", "", Convert.ToInt32(data.Values["NU_UNIDADES"].ToString()), "",
           data.Values["NB_COMENTARIOS"].ToString(), data.Values["FH_DESVIO"].ToString(), 1, data.Values["FH_PEDIDO"].ToString(),
            Convert.ToBoolean(chkVal));

   }

   protected void dgvProductosCanasta_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
   {
       if (e.Row.RowType == DataControlRowType.DataRow && Session["perfilID"].ToString() != "25")
       {
           if (e.Row.RowType == DataControlRowType.DataRow && Session["perfilID"].ToString() != "1")
           {
               e.Row.Cells[16].Visible = false;
               e.Row.Cells[17].Visible = false;
           }
       }
   }
}

