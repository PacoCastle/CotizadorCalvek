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

public partial class Admin_Contabilidad_CuentasIncorrectas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        //BuscarPolizasDesc.EnableViewState = false;
        //BuscarPolizasDesc.EnableViewState = true;
        //GridPolizas.DataSource = BuscarPolizasDesc;
        GridCuentas.DataBind();
        GridCuentas.Visible = false;
        GridCuentas.Visible = true;
    }
}
