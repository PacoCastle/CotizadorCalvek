using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Reportes_CaidaCotizador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
       {
            int Id_ExMedico = Convert.ToInt32(Request.QueryString["Id_ExMedico"]);
            ShowReport(Id_ExMedico);
        }
    }

    private void ShowReport(int pId_ExMedico)
    {
        //Reset
        rvExamenesGeneral.Reset();
        rvExamenesGeneral.LocalReport.EnableHyperlinks = true;
        rvExamenesGeneral.LocalReport.EnableExternalImages = true;

        //DataSource
        //getClientsReports objClientsReports = new getClientsReports();
        DataTable oData = (DataTable)Session["TableRowSelect"];
        ReportDataSource rds = new ReportDataSource("dsExamenMedicoDetalles", oData);

        rvExamenesGeneral.LocalReport.DataSources.Add(rds);
        //Path
        rvExamenesGeneral.LocalReport.ReportPath = "Reportes/Examenes/General.rdlc";
        String imagePath = Request.Url.GetLeftPart(UriPartial.Path);
        imagePath = imagePath.Substring(0, imagePath.LastIndexOf("/"));
        imagePath = imagePath.Replace("Reportes/Examenes", "Imagenes/");

        String ImgHeader = imagePath + "logoAMI.PNG";
        

        //Parameters
        ReportParameter[] rptParams = new ReportParameter[] {
           new ReportParameter("ImgHeader",ImgHeader)
        };
        rvExamenesGeneral.LocalReport.SetParameters(rptParams);
        //Refresh
        rvExamenesGeneral.LocalReport.Refresh();

    }
}
