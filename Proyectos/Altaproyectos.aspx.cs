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

public partial class Proyectos_Altaproyectos : System.Web.UI.Page
{
    private static int NUMFUNCION = 56;
    protected void Page_Load(object sender, EventArgs e)

    {
	String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }  
        int oficinaID = 0;
        if (Session["oficinaId"] == null)
        {
            InfoSessionVO infoSession;
            infoSession = (InfoSessionVO)Session["InfoSession"];
            oficinaID = (int)infoSession.getValor(InfoSessionVO.OFICINA);
            Session["oficinaID"] = oficinaID;
        }

        //txtRenglon1.Attributes.Add("onkeyup", "CountChars(" & 140 & ", '" & txtRenglon1.ClientID & "'," & "'characterCount');");

    }
   
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
          //  DataKey consultallave = GridView2.DataKeys[Convert.ToInt32(e.CommandArgument)];
            //SqlDataSource1.UpdateParameters[0].DefaultValue = consultallave.Value["ID_PROYECTO"].ToString();
            //SqlDataSource1.UpdateParameters[1].DefaultValue = consultallave.Value["IDPART"].ToString();
            //SqlDataSource1.UpdateParameters[2].DefaultValue = "002";
            //SqlDataSource1.UpdateParameters[3].DefaultValue = ((TextBox)GridView2.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("TXTREG1")).Text.Trim();


            DataKey data = GridDetalleProy.DataKeys[Convert.ToInt32(e.CommandArgument)];

            Sdsproyectosdetalles.UpdateParameters[0].DefaultValue = data.Values["ID_PROYECTO"].ToString(); // Sucursal
            Sdsproyectosdetalles.UpdateParameters[1].DefaultValue = data.Values["IDPART"].ToString(); // Cliente
            Sdsproyectosdetalles.UpdateParameters[2].DefaultValue = Gridproyunico.SelectedRow.Cells[3].Text.ToString();
            Sdsproyectosdetalles.UpdateParameters[3].DefaultValue = ((TextBox)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("TXTREG1")).Text.Trim();
            Sdsproyectosdetalles.UpdateParameters[4].DefaultValue = ((TextBox)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("TXTREG2")).Text.Trim();
            Sdsproyectosdetalles.UpdateParameters[5].DefaultValue = ((TextBox)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("TXTREG3")).Text.Trim();
            Sdsproyectosdetalles.UpdateParameters[6].DefaultValue = ((TextBox)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("TXTREG4")).Text.Trim();
            Sdsproyectosdetalles.UpdateParameters[7].DefaultValue = ((TextBox)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("TXTREG5")).Text.Trim();
            Sdsproyectosdetalles.UpdateParameters[8].DefaultValue = ((TextBox)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("Txtsubtotal")).Text.Trim();
            Sdsproyectosdetalles.UpdateParameters[9].DefaultValue = ((DropDownList)GridDetalleProy.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("Dwiva")).SelectedValue.ToString();
            
            //SqlDataSource1.Update();
            //GridView2.EditIndex = -1;
            

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        GridDetalleProy.Visible=false;
        limpiacontrol();
        pnlagrega.Visible = false;
    }
    protected void limpiacontrol()
    {
        txtRenglon1.Text = "";
        txtRenglon2.Text = "";
        txtRenglon3.Text = "";
        txtRenglon4.Text = "";
        txtRenglon5.Text = "";
        Txtsubtotal0.Text = "";
        

    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataKey data = GridDetalleProy.DataKeys[Convert.ToInt32(e.RowIndex)];

        Sdsproyectosdetalles.DeleteParameters[0].DefaultValue = data.Values["ID_PROYECTO"].ToString(); // Proyecto
        Sdsproyectosdetalles.DeleteParameters[1].DefaultValue = data.Values["IDPART"].ToString(); // Cliente
        Sdsproyectosdetalles.DeleteParameters[2].DefaultValue = Gridproyunico.SelectedRow.Cells[3].Text.ToString(); 
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Sdsproyectosdetalles.InsertParameters[0].DefaultValue = Gridproyunico.SelectedRow.Cells[1].Text.ToString();
        Sdsproyectosdetalles.InsertParameters[1].DefaultValue = lsttipopartida.SelectedValue.ToString();
        Sdsproyectosdetalles.InsertParameters[2].DefaultValue = Gridproyunico.SelectedRow.Cells[3].Text.ToString();
        Sdsproyectosdetalles.InsertParameters[3].DefaultValue = txtRenglon1.Text;
        Sdsproyectosdetalles.InsertParameters[4].DefaultValue = txtRenglon2.Text;
        Sdsproyectosdetalles.InsertParameters[5].DefaultValue = txtRenglon3.Text;
        Sdsproyectosdetalles.InsertParameters[6].DefaultValue = txtRenglon4.Text;
        Sdsproyectosdetalles.InsertParameters[7].DefaultValue = txtRenglon5.Text;
        Sdsproyectosdetalles.InsertParameters[8].DefaultValue = Txtsubtotal0.Text;
        Sdsproyectosdetalles.InsertParameters[9].DefaultValue = Dwiva.SelectedValue.ToString();

        Sdsproyectosdetalles.Insert();
        limpiacontrol();
    }
 
    protected void Gridproyunico_SelectedIndexChanged(object sender, EventArgs e)
    {
        Sdsproyectosdetalles.SelectParameters["idproy"].DefaultValue = "";
                 Sdsproyectosdetalles.SelectParameters["suc"].DefaultValue = "";
        Sdsproyectosdetalles.SelectParameters["idproy"].DefaultValue =
      Gridproyunico.SelectedRow.Cells[1].Text.ToString();
        pnlagrega.Visible = true;
        //lbsuc.Text = Gridproyunico.SelectedRow.Cells[3].Text.ToString();

  
        Sdsproyectosdetalles.SelectParameters["suc"].DefaultValue =
                  Gridproyunico.SelectedRow.Cells[3].Text.ToString();
        GridDetalleProy.Visible = true;
        Gridproyunico.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

      Response.Write("<script type='text/javascript'>window.open('ayudaproyecto.aspx','Popup','toolbar=no, location=yes,status=no,menubar=no,scrollbars=yes,resizable=no, width=700,height=700,left=350,top=23');</script>");

    }
   
}