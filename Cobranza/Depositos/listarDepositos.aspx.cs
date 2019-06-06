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

public partial class Cobranza_AltaDeposito : System.Web.UI.Page
{
    private static int NUMFUNCION = 17;
   // Boolean blnBanderaDescuentoAfectado = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //// determinar si el usuario tiene los permisos para aceptar una cotizacion con descuento.
        //String error2 = Utilis.validaPermisos(Session, 18);
        //if (error2.Equals(""))
        //{
        //    blnBanderaDescuentoAfectado = true;
        //}

        if (!IsPostBack)
        {
            ObjectDataSource3.DataBind();
            ObjectDataSource3.Select();
            GridView1.DataBind();
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if (lblbndFecha1.Text == "1")
        {
            txtFecha.Text = Calendar1.SelectedDate.Date.ToString("d");
        }
        if (lblbndFecha2.Text == "1")
        {
            txtFechaActualizaDe.Text = Calendar1.SelectedDate.Date.ToString("d");
            if (txtFechaActualizaHasta.Text == "")
            {
                txtFechaActualizaHasta.Text = Calendar1.SelectedDate.Date.ToString("d");
            }
        }
        if (lblbndFecha3.Text == "1")
        {
            txtFechaActualizaHasta.Text = Calendar1.SelectedDate.Date.ToString("d");
        }

        Calendar1.Visible = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        lblbndFecha1.Text = "1";
        lblbndFecha2.Text = "0";
        lblbndFecha3.Text = "0";
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        lblbndFecha1.Text = "0";
        lblbndFecha2.Text = "1";
        lblbndFecha3.Text = "0";
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        lblbndFecha1.Text = "0";
        lblbndFecha2.Text = "0";
        lblbndFecha3.Text = "1";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }

    //protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        if (!blnBanderaDescuentoAfectado)
    //        {
    //            LinkButton btnDepositoAfectado = (LinkButton)e.Row.FindControl("lnkDepositoAfectado");
    //            btnDepositoAfectado.Visible = false;
    //        }
    //    }
    //}

    protected void lnkDepositoAfectado_Click(object sender, CommandEventArgs As)
    {
        DepositosVO VO = new DepositosVO();
        DepositosBL BL = new DepositosBL();
        VO.Operacion = DepositosVO.DOCUMENTOAFECTADO;
        VO.DepositoId = Int32.Parse(As.CommandName);
        VO.Afectado = 1;
        VO.UsuarioIdAlta = Int32.Parse(Session["usuarioID"].ToString());
        VO = (DepositosVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            ObjectDataSource1.DataBind();
            ObjectDataSource1.Select();
            GridView1.DataBind();   
        }
    }

}
