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

public partial class Cobranza_facturasCobranzaFechaPago : System.Web.UI.Page
{
    private static int NUMFUNCION = 60;
    protected void Page_Load(object sender, EventArgs e)
    {
  	String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
        if (!IsPostBack)
        {
            lstAno.SelectedItem.Value = DateTime.Now.Year.ToString();
            //lstMes.SelectedItem.Value = DateTime.Now.Month.ToString();
            //TextBox2.Text = ("00" + (DateTime.Now.Month - 1).ToString()).Substring(("00" + (DateTime.Now.Month - 1).ToString()).Length - 2);
            txtAno.Text = DateTime.Now.Year.ToString();
            txtMes.Text = DateTime.Now.Month.ToString();
        }

        //if(lstMes.SelectedIndex <= 0)
        //{
    String strMes = "";

    switch (DateTime.Now.Month)
         {
             case 1:
             strMes = "Enero";
             break;
             case 2:
             strMes = "Febrero";
             break;
             case 3:
             strMes = "Marzo";
             break;
             case 4:
             strMes = "Abril";
             break;
             case 5:
             strMes = "Mayo";
             break;
             case 6:
             strMes = "Junio";
             break;
             case 7:
             strMes = "Julio";
             break;
             case 8:
             strMes = "Agosto";
             break;
             case 9:
             strMes = "Septiembre";
             break;
             case 10:
             strMes = "Octubre";
             break;
             case 11:
             strMes = "Noviembre";
             break;
             case 12:
             strMes = "Diciembre";
             break;
         }

         gvEstatusechaCobranza.Caption = strMes + " " + txtAno.Text;

        InfoSessionVO infoSession;

        infoSession = (InfoSessionVO)Session["InfoSession"];
        
        //if (infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "1" || infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "5" || infoSession.getValor(InfoSessionVO.PERFIL).ToString() == "25")
        //{
            lblSucursal.Enabled = true;
            lstOficina.Enabled = true;
        //}

    }

    protected void btnBuscar_Click1(object sender, EventArgs e)
    {
        gvFacturasFechaPago.DataSourceID = "sdsFacturasCobranzaBusqueda";
        gvEstatusechaCobranza.Caption = lstMes.SelectedItem.Text + " " + lstAno.SelectedItem.Value.ToString();
        gvEstatusechaCobranza.DataSourceID = "sdsEstatusFechaCobranzaBusqueda";

        if (lstMes.SelectedIndex <= 0)
        {
            String strMes = "";

            switch (DateTime.Now.Month)
            {
                case 1:
                    strMes = "Enero";
                    break;
                case 2:
                    strMes = "Febrero";
                    break;
                case 3:
                    strMes = "Marzo";
                    break;
                case 4:
                    strMes = "Abril";
                    break;
                case 5:
                    strMes = "Mayo";
                    break;
                case 6:
                    strMes = "Junio";
                    break;
                case 7:
                    strMes = "Julio";
                    break;
                case 8:
                    strMes = "Agosto";
                    break;
                case 9:
                    strMes = "Septiembre";
                    break;
                case 10:
                    strMes = "Octubre";
                    break;
                case 11:
                    strMes = "Noviembre";
                    break;
                case 12:
                    strMes = "Diciembre";
                    break;
            }

            gvEstatusechaCobranza.Caption = strMes + " " + lstAno.SelectedItem.Value.ToString();

        }

    }

    protected void gvFacturasFechaPago_rowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {
            DataKey data = gvFacturasFechaPago.DataKeys[Convert.ToInt32(e.CommandArgument)];

            String strFechaFactura = data.Values["FechaFactura"].ToString(); // Sucursal
            String strFechaPago = ((TextBox)gvFacturasFechaPago.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtFechaPago")).Text.Trim();
            String strRecibe = ((TextBox)gvFacturasFechaPago.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtRecibe")).Text.Trim();
            String strComentarios = ((TextBox)gvFacturasFechaPago.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtComentarios")).Text.Trim();

            if (strFechaPago == "")
            {
                strFechaPago = strFechaFactura;
            }
            
            String intFechaFactura = strFechaFactura.Substring(6, 4) + strFechaFactura.Substring(3, 2) + strFechaFactura.Substring(0, 2);
            String intFechaPago = strFechaPago.Substring(6, 4) + strFechaPago.Substring(3, 2) + strFechaPago.Substring(0, 2);


            if (Int32.Parse(intFechaFactura) <= Int32.Parse(intFechaPago))
            {
               // lblMensaje.Text = "";

            sdsFacturasCobranza.InsertParameters[0].DefaultValue = data.Values["sucursal"].ToString(); // Sucursal
            sdsFacturasCobranza.InsertParameters[1].DefaultValue = data.Values["tp_folio"].ToString(); // Folio
            sdsFacturasCobranza.InsertParameters[2].DefaultValue = data.Values["id_cte"].ToString(); // Cliente
            sdsFacturasCobranza.InsertParameters[3].DefaultValue = strFechaPago.ToString(); // Fecha Pago
            sdsFacturasCobranza.InsertParameters[4].DefaultValue = data.Values["id_kepler"].ToString(); // Cliente
            sdsFacturasCobranza.InsertParameters[5].DefaultValue = strRecibe.ToString(); //recibe
            sdsFacturasCobranza.InsertParameters[6].DefaultValue = strComentarios.ToString(); // Comentario
            sdsFacturasCobranza.InsertParameters[7].DefaultValue = Session["usuarioID"].ToString(); // UsuarioId
            sdsFacturasCobranza.Insert();
           
            gvFacturasFechaPago.DataBind();
            gvEstatusechaCobranza.DataBind();

            gvFacturasFechaPago.EditIndex = -1;

            }
            else 
            {
               //lblMensaje.Text = "LA FECHA CAPTURADA DEBE SER MAYOR A LA FECHA DE LA FACTURA.";
            }

        }
    }

    protected void sdsFacturasCobranza_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
}