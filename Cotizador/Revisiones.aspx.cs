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

public partial class Cotizador_OrderCapture : System.Web.UI.Page
{
    private static int NUMFUNCION = 9;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //String[,] arrClientes;
        //ClienteVO VOcliente = new ClienteVO();
        //ClienteBL BLcliente = new ClienteBL();
        //VOcliente.Operacion = ClienteVO.LISTACLIENTES;
        //VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        //arrClientes = VOcliente.ArrClientes;

        //int a;        
        //for (int i = 0; i <= arrClientes.GetLength(1) - 1; i++)
        //{
        //    a = i + 1;
        //    lslCliente.Items.Insert(a, new ListItem(arrClientes[1, i], arrClientes[0, i]));
        //}

        GridView1.Visible = false;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
}
