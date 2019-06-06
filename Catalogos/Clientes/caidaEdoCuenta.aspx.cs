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

public partial class Catalogos_Clientes_caidaEdoCuenta : System.Web.UI.Page
{

    Double dblTotalSaldoMN = 0.0;
    Double dblTotalSaldoUS = 0.0;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblRazonSocial.Text = Request["nombreCliente"];
        //lblFecha.Text = String.Format("{0:dd/MM/yyyy}", System.DateTime.Now);  //Convert.ToString(System.DateTime.Now);

        ClienteVO VOcliente = new ClienteVO();
        ClienteBL BLcliente = new ClienteBL();

        VOcliente.Cliente_idAdmin = (Request["clienteAdminId"]);
        VOcliente.Operacion = ClienteVO.BUSCAR_ADMIN_ID;
        VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
        if (VOcliente.Cliente_razonSocial != null)
        {
            lblDireccionCliente.Text = VOcliente.Cliente_calle + " # " + VOcliente.Cliente_noExterno + " " + VOcliente.Cliente_noInterno;
            lblDireccionCliente2.Text = VOcliente.Cliente_colonia + " CP: " + VOcliente.Cliente_CodigoPostal;
            lblDireccionCliente3.Text = VOcliente.Cliente_Municipio + ", " + VOcliente.Cliente_Estado;
        }
    }

    public String getTotalSaldoMN(String strValor)
    {
        if (strValor.Length > 0)
        {
            dblTotalSaldoMN = dblTotalSaldoMN + Double.Parse(strValor);
            return String.Format("{0:#,##0.00}", Double.Parse(strValor));
        }
        else
        {
            return "";
        }
    }

    public String getTotalSaldoUS(String strValor)
    {
        if (strValor.Length > 0)
        {
            dblTotalSaldoUS = dblTotalSaldoUS + Double.Parse(strValor);
            return String.Format("{0:#,##0.00}", Double.Parse(strValor));
        }
        else
        {
            return "";
        }
    }

    public String Get_TSaldoMN()
    {
        if (dblTotalSaldoMN > 0)
        {
            return String.Format("{0:N}", dblTotalSaldoMN);
        }
        else
        {
            return "";
        }
    }

    public String Get_TSaldoUS()
    {
        if (dblTotalSaldoUS > 0)
        {
            return String.Format("{0:N}", dblTotalSaldoUS);
        }
        else
        {
            return "";
        }
    }

}
