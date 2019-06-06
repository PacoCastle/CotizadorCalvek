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

public partial class Admin_ControlCartera_busquedaFacturasCarteras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
         {   
            // determinar si el usuario tiene los permisos como administrador de seguimiento a pedidos.
            String error2 = Utilis.validaPermisos(Session, 29);
            if (!error2.Equals(""))
            {
                GridView1.Columns[6].Visible = false;
            }
        }
    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }

    public String get_formatoCantidad(int intConteo)
    {
        if (intConteo == 0)
            {
                return "";
            }
        else
            {
                return "(" + intConteo.ToString() + ")";
            }
    }

    protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
    {
        int index = GridView1.EditIndex;
        GridViewRow row = GridView1.Rows[index];
        DropDownList IdAdmin = (DropDownList)row.FindControl("idEstatus");
        e.NewValues["idEstatus"] = IdAdmin.SelectedItem.Value;

    }
}
