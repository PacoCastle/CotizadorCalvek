using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Proyectos_NvoProyecto : System.Web.UI.Page
{
    private static int NUMFUNCION = 57;
    protected void Page_Load(object sender, EventArgs e)
    {
       String error = Utilis.validaPermisos(Session, NUMFUNCION);
       if (!error.Equals(""))
       {
           Response.Redirect(error);
       }

       txtCliente.Attributes.Add("onclick", "javascript:InvokePop('"
          + lstSucursales.ClientID + "','" + txtCliente.ClientID + "');");

        int oficinaID = 0;
        if (Session["oficinaId"] == null)
        {
            InfoSessionVO infoSession;
            infoSession = (InfoSessionVO)Session["InfoSession"];
            oficinaID = (int)infoSession.getValor(InfoSessionVO.OFICINA);
            Session["oficinaID"] = oficinaID;
        }
    }

    protected void cblRazonSocial_SelectedIndexChanged(object sender, EventArgs e)
    {
       lstSucursales.DataBind();
    }
    protected void sdsNvoProyecto_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {      
        System.Text.StringBuilder message = new System.Text.StringBuilder();
        message.Append(e.Command.Parameters["@msgInsert"].Value.ToString());
        message.Append(e.Command.Parameters["@msgReplica"].Value.ToString());       

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + message + "');", true); 
    }
   
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        sdsNvoProyecto.InsertParameters[0].DefaultValue = lstSucursales.SelectedValue.ToString();
        sdsNvoProyecto.InsertParameters[1].DefaultValue = txtProyId.Text.ToString();
        sdsNvoProyecto.InsertParameters[2].DefaultValue = txtProyDescripcion.Text.ToString();
        sdsNvoProyecto.InsertParameters[3].DefaultValue = txtCliente.Text.ToString();
        sdsNvoProyecto.InsertParameters[4].DefaultValue = lstMoneda.SelectedValue.ToString();
        sdsNvoProyecto.InsertParameters[5].DefaultValue = txtMonto.Text.ToString();
        sdsNvoProyecto.InsertParameters[6].DefaultValue = Session["usuarioID"].ToString();
       

        sdsNvoProyecto.Insert();
    }
  
}