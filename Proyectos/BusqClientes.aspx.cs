using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Proyectos_BusqClientes : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
         if (!Page.IsPostBack)
            lblAux_Suc.Text = Request.QueryString["ControlVal"].ToString();
    }
    
    protected void dgvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        //txtReverse.Text = dgvClientes.SelectedRow.Cells[1].Text.ToString();
        //lblCliente.Text = dgvClientes.SelectedRow.Cells[1].Text.ToString();
    }
    protected void dgvClientes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button btnAdd = e.Row.FindControl("btnSelect") as Button;
            //btnAdd.Attributes.Add("OnClick", "SendParent('" + e.Row.Cells[1].Text + "');");
            btnAdd.Attributes.Add("onclick", "javascript:SendParent('"
                + e.Row.Cells[1].Text + "','" + e.Row.Cells[2].Text + "','" + e.Row.Cells[3].Text + "','" + e.Row.Cells[4].Text + "','" + e.Row.Cells[5].Text + "');");
        }
    }    
}
   