using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Reportes_EspirometriaCaida : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ShowReport();
        }
    }

    private void ShowReport()
    {
        //Reset
        rvExamenesEspirometria.Reset();
        rvExamenesEspirometria.LocalReport.EnableHyperlinks = true;
        rvExamenesEspirometria.LocalReport.EnableExternalImages = true;

        //DataSource
        DataTable oData = (DataTable)Session["TableExamenesEspirometria"];
        ReportDataSource rds = new ReportDataSource("dsExamenEspirometria", oData);

        rvExamenesEspirometria.LocalReport.DataSources.Add(rds);
        //Path
        rvExamenesEspirometria.LocalReport.ReportPath = "Reportes/Examenes/Espirometria.rdlc";
        String imagePath = Request.Url.GetLeftPart(UriPartial.Path);
        imagePath = imagePath.Substring(0, imagePath.LastIndexOf("/"));
        imagePath = imagePath.Replace("Reportes/Examenes", "Imagenes/");

        String ImgHeader = imagePath + "logoAMI.PNG";


        ////Parameters
        ReportParameter[] rptParams = new ReportParameter[] {
           new ReportParameter("ImgHeader",ImgHeader)
        };
        rvExamenesEspirometria.LocalReport.SetParameters(rptParams);
        //Refresh
        rvExamenesEspirometria.LocalReport.Refresh();

    }
}
