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
using System.Web.Configuration;
using System.Web.SessionState;



public partial class Cotizador_Cotizador : System.Web.UI.MasterPage
{
    private static int NUMFUNCION = 8;

    // The Master Page provides a public event that page's can "subscribe" to
    public event CommandEventHandler AgentesChanged;

    protected void Page_Load(object sender, EventArgs e)
    {

        int usuarioID = 0;
        int oficinaID = 0;

        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        if (Session["usuarioID"] == null)
        {
            InfoSessionVO infoSession;
            infoSession = (InfoSessionVO)Session["InfoSession"];
            usuarioID = (int)infoSession.getValor(InfoSessionVO.USUARIOID);
            Session["usuarioID"] = usuarioID;
        }

        if (Session["usuarioIDCotizacion"] == null)
        {
            Session["usuarioIDCotizacion"] = Session["usuarioID"];
        }

        if (Session["nombreCompleto"] != null)
        {
            lblUsuario.Text = Session["nombreCompleto"].ToString();
        }

        if (Session["oficinaId"] == null)
        {
            InfoSessionVO infoSession;
            infoSession = (InfoSessionVO)Session["InfoSession"];
            oficinaID = (int)infoSession.getValor(InfoSessionVO.OFICINA);
            Session["oficinaID"] = oficinaID;
        }
        // valida si el usuario tiene el permiso para cotizar con otro usuario
        String error2 = Utilis.validaPermisos(Session, 16);
        if (!error2.Equals(""))
        {
            lblAgentes.Enabled = false;
            lstAgentes.Enabled = false;
            lblUsuarioAlterno.Enabled = false;
            //ObjectDataSource2 = false;
            lblAgentes.Visible = false;
            lstAgentes.Visible = false;
            lblUsuarioAlterno.Visible = false;
        }

        if (Session["usuarioNombreCotizacion"] != null)
        {
            lblUsuarioAlterno.Text = Session["usuarioNombreCotizacion"].ToString();
        }

    }


    public void Get_Category(Object Src, CommandEventArgs As)
    {
        Response.Redirect("Search.aspx?Categoria=" + As.CommandName + "&textoCat=" + As.CommandArgument.ToString());
    }

    public void Get_Criterion(Object Src, EventArgs Args)
    {
        redireccionaBusqueda();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["usuarioID"] = null;
        Session["InfoSession"] = null;
        Session["OrderNumber"] = null;
        Session["usuarioIDCotizacion"] = null;
        Session["oficinaId"] = null;
        Response.Redirect("../Seguridad/Login.aspx");
    }

    public void Set_usuarioCotiza(Object Src, CommandEventArgs As)
    {
        Session["usuarioIDCotizacion"] = As.CommandName;
        Session["usuarioNombreCotizacion"] = As.CommandArgument.ToString();
    }

    protected void lstAgentes_SelectedIndexChanged(object sender, EventArgs e)
    {
        // When the DropDownList's SelectedIndexChanged event fires, fire the Master Page's AgentesChanged event
        if (lstAgentes.SelectedIndex != 0 && AgentesChanged != null)
            AgentesChanged(this, new CommandEventArgs(lstAgentes.SelectedItem.Text, lstAgentes.SelectedValue));

        Session["usuarioIDCotizacion"] = lstAgentes.SelectedValue;
        Session["usuarioNombreCotizacion"] = lstAgentes.SelectedItem.Text;
        Session["OrderNumber"] = null;
        lblUsuarioAlterno.Text = lstAgentes.SelectedItem.Text;
        Session["usuarioNombreCotizacion"] = lblUsuarioAlterno.Text;
        Response.Redirect("~/Cotizador/Cotizaciones.aspx");
    }

    protected void SearchCriterion_TextChanged(object sender, EventArgs e)
    {
        if (SearchCriterion.Text != "")
        {
            //Response.Redirect("Search.aspx?Criterion=" + SearchCriterion.Text.ToUpper() + "");
            redireccionaBusqueda();
        }
    }

    public void redireccionaBusqueda()
    {
        // Response.Redirect("Search.aspx?Criterion=" + SearchCriterion.Text.ToUpper() + "");
        String strDireccion = "Search.aspx?Criterion=";

        if (SearchCriterion.Text != "")
        {
            strDireccion += SearchCriterion.Text.ToUpper();
            /*
            if (ckbBuscaAdmin.Checked)
                strDireccion += "&filtroAdminPaq=1";
            else
                strDireccion += "&filtroAdminPaq=0";
            */
            Response.Redirect(strDireccion);
        }
    }


 

    protected void lnkSalirCot_Click(object sender, EventArgs e)
    {
        Session["OrderNumber"] = null;
        Response.Redirect("../Cotizador/Cotizaciones.aspx");
    }
}
