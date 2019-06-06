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

public partial class OrdenesCompra_matrizDiferencias : System.Web.UI.Page
{
    private static int NUMFUNCION = 42;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        String error2 = Utilis.validaPermisos(Session, 43);
        if (error2.Equals(""))
        {
            GridView1.Columns[9].Visible = true;
        }
    }

    protected void lstCorreo_SelectedIndexChanged(object sender, EventArgs e)
    {
        var ddl1 = ((DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("lstCorreo"));

        if (
        ddl1.SelectedValue.ToString() == "0")
        {
            GridView1.Columns[8].Visible = true;
        }
        else if (ddl1.SelectedValue.ToString() == "1")
        {
            GridView1.Columns[8].Visible = false;            
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            DataKey data = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)];
            
            sdsMatrizDiferencias.UpdateParameters[1].DefaultValue = data.Values["producto"].ToString();
            sdsMatrizDiferencias.UpdateParameters[3].DefaultValue = ((DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("lstCorreo")).SelectedValue;
            sdsMatrizDiferencias.UpdateParameters[4].DefaultValue = ((DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("lstCorreoAdmin")).SelectedValue;
            sdsMatrizDiferencias.UpdateParameters[5].DefaultValue = Session["usuarioId"].ToString();
        }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList dropdown = e.Row.FindControl("lstCorreo") as DropDownList;
            if (dropdown != null && GridView1.Columns[8].Visible == false)
            {
                dropdown.SelectedValue = "1";
            }
        }

    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.Columns[7].Visible = true;
        GridView1.Columns[8].Visible = true;
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.Columns[7].Visible = false;
        GridView1.Columns[8].Visible = false;
    }
    
}
