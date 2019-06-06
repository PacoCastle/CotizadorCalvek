using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Reportes_AudiometriaCaida : System.Web.UI.Page
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
        rvExamenesAudiometria.Reset();
        rvExamenesAudiometria.LocalReport.EnableHyperlinks = true;
        rvExamenesAudiometria.LocalReport.EnableExternalImages = true;

        //DataSource
        DataTable oData = (DataTable)Session["TableExamenesAudiometria"];
        ReportDataSource rds = new ReportDataSource("dsExamenAudiometria", oData);

        rvExamenesAudiometria.LocalReport.DataSources.Add(rds);
        //Path
        rvExamenesAudiometria.LocalReport.ReportPath = "Reportes/Examenes/Audiometria.rdlc";
        String imagePath = Request.Url.GetLeftPart(UriPartial.Path);
        imagePath = imagePath.Substring(0, imagePath.LastIndexOf("/"));
        imagePath = imagePath.Replace("Reportes/Examenes", "Imagenes/");

        String ImgHeader = imagePath + "logoAMI.PNG";


        ////Parameters
        ReportParameter[] rptParams = new ReportParameter[] {
           new ReportParameter("ImgHeader",ImgHeader)
        };
        rvExamenesAudiometria.LocalReport.SetParameters(rptParams);
        //Refresh
        rvExamenesAudiometria.LocalReport.Refresh();

    }
}
