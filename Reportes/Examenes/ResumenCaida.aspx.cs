using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Reportes_ResumenCaida : System.Web.UI.Page
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
        rvExamenesResumen.Reset();
        rvExamenesResumen.LocalReport.EnableHyperlinks = true;
        rvExamenesResumen.LocalReport.EnableExternalImages = true;

        //DataSource
        DataTable oData = (DataTable)Session["TableExamenesResumen"];
        ReportDataSource rds = new ReportDataSource("dsExamenResumen", oData);

        rvExamenesResumen.LocalReport.DataSources.Add(rds);
        //Path
        rvExamenesResumen.LocalReport.ReportPath = "Reportes/Examenes/Resumen.rdlc";
        String imagePath = Request.Url.GetLeftPart(UriPartial.Path);
        imagePath = imagePath.Substring(0, imagePath.LastIndexOf("/"));
        imagePath = imagePath.Replace("Reportes/Examenes", "Imagenes/");

        String ImgHeader = imagePath + "logoAMI.PNG";


        //Parameters
        ReportParameter[] rptParams = new ReportParameter[] {
           new ReportParameter("ImgHeader",ImgHeader)
        };
        rvExamenesResumen.LocalReport.SetParameters(rptParams);
        //Refresh
        rvExamenesResumen.LocalReport.Refresh();

    }
}
