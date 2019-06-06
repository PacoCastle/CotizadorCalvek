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

public partial class Comisiones_formularioComisiones : System.Web.UI.Page
{
    private static int NUMFUNCION = 48;

    protected void Page_Load(object sender, EventArgs e)
    {
        //String error = Utilis.validaPermisos(Session, NUMFUNCION);
        //if (!error.Equals(""))
        //{
        //    Response.Redirect(error);
        //}

        if (!IsPostBack)
        {
        lblAno.Text = DateTime.Now.Year.ToString();
        lblMes.Text = DateTime.Now.Month.ToString();

        lstMes.SelectedValue = DateTime.Now.Month.ToString();
        }
    }

    protected void lstMes_SelectedIndexChanged1(object sender, EventArgs e)
    {
        lblMes.Text = lstMes.SelectedItem.Value.ToString();
    }

    Double TotalMontoImporteVentas = 0.0;
    Double TotalMontoAbonoVentas = 0.0;
    Double TotalMontoComisionVentas = 0.0;
    Double TotalMontoComisionGarantiaVentas = 0.0;

    public Double Get_montoImporteVentas(Double Monto)
    {
        TotalMontoImporteVentas += Monto;
        return Monto;
    }
    public Double Get_montoAbonoVentas(Double Monto)
    {
        TotalMontoAbonoVentas += Monto;
        return Monto;
    }
    public Double Get_montoComisionVentas(Double Monto)
    {
        TotalMontoComisionVentas += Monto;
        return Monto;
    }

    public Double Get_montoComisionGarantiaVentas(Double Monto)
    {
        TotalMontoComisionGarantiaVentas += Monto;
        return Monto;
    }

    // ---------------------------------------

    Double TotalMontoImporteSupervisor = 0.0;
    Double TotalMontoAbonoSupervisor = 0.0;
    Double TotalMontoComisionSupervisor = 0.0;

    public Double Get_montoImporteSupervisor(Double Monto)
    {
        TotalMontoImporteSupervisor += Monto;
        return Monto;
    }
    public Double Get_montoAbonoSupervisor(Double Monto)
    {
        TotalMontoAbonoSupervisor += Monto;
        return Monto;
    }
    public Double Get_montoComisionSupervisor(Double Monto)
    {
        TotalMontoComisionSupervisor += Monto;
        return Monto;
    }

    // ---------------------------------------

    Double TotalMontoImporteSoporte = 0.0;
    Double TotalMontoAbonoSoporte = 0.0;
    Double TotalMontoComisionSoporte = 0.0;

    public Double Get_montoImporteSoporte(Double Monto)
    {
        TotalMontoImporteSoporte += Monto;
        return Monto;
    }
    public Double Get_montoAbonoSoporte(Double Monto)
    {
        TotalMontoAbonoSoporte += Monto;
        return Monto;
    }
    public Double Get_montoComisionSoporte(Double Monto)
    {
        TotalMontoComisionSoporte += Monto;
        return Monto;
    }


    public Double Get_Monto_Total_ImporteVentas()
    {
        return TotalMontoImporteVentas;
    }
    public Double Get_Monto_Total_AbonoVentas()
    {
        return TotalMontoAbonoVentas;
    }
    public Double Get_Monto_Total_ComisionVentas()
    {
        return TotalMontoComisionVentas;
    }

    public Double Get_Monto_Total_ComisionGarantiaVentas()
    {
        return TotalMontoComisionGarantiaVentas;
    }


    public Double Get_Monto_Total_ImporteSupervisor()
    {
        return TotalMontoImporteSupervisor;
    }
    public Double Get_Monto_Total_AbonoSupervisor()
    {
        return TotalMontoAbonoSupervisor;
    }
    public Double Get_Monto_Total_ComisionSupervisor()
    {
        return TotalMontoComisionSupervisor;
    }

    public Double Get_Monto_Total_ImporteSoporte()
    {
        return TotalMontoImporteSoporte;
    }
    public Double Get_Monto_Total_AbonoSoporte()
    {
        return TotalMontoAbonoSoporte;
    }
    public Double Get_Monto_Total_ComisionSoporte()
    {
        return TotalMontoComisionSoporte;
    }


}
