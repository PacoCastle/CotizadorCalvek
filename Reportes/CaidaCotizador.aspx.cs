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
            int OrderNumber = Int32.Parse(Request.QueryString["OrderNumber"]);
            Boolean isDescuento = Boolean.Parse(Request.QueryString["isDescuento"]);
            int usuarioID = Int32.Parse(Request.QueryString["usuarioID"]);
            ShowReport(OrderNumber, isDescuento, usuarioID);
        }
    }

    private void ShowReport(int OrderNumber, Boolean pIsDescuento, int pUsuarioID)
    {
        string unidadNegocio;
        //Reset
        rptViewer.Reset();
        rptViewer.LocalReport.EnableHyperlinks = true;
        rptViewer.LocalReport.EnableExternalImages = true;

        //DataSource
        DataTable dt = GetData(Convert.ToInt32(OrderNumber));
        ReportDataSource rds = new ReportDataSource("dsCotizacion", dt);
        DataTable dtUsuario = GetDataUsuario(Convert.ToInt32(pUsuarioID));
        ReportDataSource rdsUsuario = new ReportDataSource("dsUsuario", dtUsuario);

        rptViewer.LocalReport.DataSources.Add(rds);
        rptViewer.LocalReport.DataSources.Add(rdsUsuario);
        //Path
        rptViewer.LocalReport.ReportPath = "Reportes/CotizadorDetalle.rdlc";
        String imagePath = Request.Url.GetLeftPart(UriPartial.Path);
        imagePath = imagePath.Substring(0, imagePath.LastIndexOf("/"));
        imagePath = imagePath.Replace("Reportes", "Imagenes/");

        String ImgHeader = imagePath + "logoAMI.PNG";
        String Img1 = imagePath + "1_Ema.jpg";
        String Img2 = imagePath + "2_NIOSH.jpg";
        String Img3 = imagePath + "3_NIICA.png";
        String Img4 = imagePath + "4_CAOHC.jpg";
        String Img5 = imagePath + "ReporteFooter.JPG";
        String unidadNegocioDetalle = "";
        String unidadNegocioDetalle2 = "";

        unidadNegocio = Convert.ToString(dt.Rows[0]["unidadnegocio"]);

        switch (unidadNegocio)
        {
            case "CEM QUERETARO":
                unidadNegocioDetalle = "*Se requiere confirmar la cita un día antes para ver disponibilidad de la agenda del área clínica por medio de correo electrónico a correo electrónico a teléfonos(442) 480 29 03 con ubicación Circuito del Mesón 135, Col.Del Prado ";
                unidadNegocioDetalle2 = "Para llevar a cabo esta propuesta se deben tomar en cuenta las siguientes consideraciones (En las instalaciones de AMI, con ubicación Circuito del Mesón 135, Col.Del Prado):";
                break;
            case "CEM MARQUES":
                unidadNegocioDetalle = "*Se requiere confirmar la cita un día antes para ver disponibilidad de la agenda del área clínica por medio de correo electrónico a reportes@medicaindustrial.com teléfonos 442 225 5267 / 442 480 0548 ext 201 con ubicación Local 11 Plaza Comercial El Marqués";
                unidadNegocioDetalle2 = "Para llevar a cabo esta propuesta se deben tomar en cuenta las siguientes consideraciones (En las instalaciones de AMI, con ubicación Local 11 Plaza Comercial El Marqués:";
                break;
            case "CEM CELAYA":
                unidadNegocioDetalle = "*Se requiere confirmar la cita un día antes para ver disponibilidad de la agenda del área clínica por medio de correo electrónico a amicelaya@medicaindustrial.com teléfonos(461) 132 3502 y cel. (461) 101 0222 con ubicación Vicente Riva Palacio #303 Col. Alameda, Zona Centro, Celaya Guanajuato, C.P. 38020";
                unidadNegocioDetalle2 = "Para llevar a cabo esta propuesta se deben tomar en cuenta las siguientes consideraciones (En las instalaciones de AMI, con ubicación Vicente Riva Palacio #303 Col. Alameda, Zona Centro, Celaya Guanajuato, C.P. 38020";
                break;
            case "CEM UMM":
                unidadNegocioDetalle = "*Se requiere como mínimo 25 pacientes para desplazar la Unidad Médica de Audiometrías, Exámenes Médicos y Espirometrías; sin ningún costo adicional.  En caso de solicitar menos estudios el costo por movimiento de unidad es de $1,500.00 + IVA * Se requiere como mínimo 35 pacientes para desplazar la Unidad Médica de Rayos X sin costo adicional. En caso de solicitar menos estudios el costo por movimiento de unidad es de $3,500.00 + IVA";
                unidadNegocioDetalle2 = "Para llevar a cabo esta propuesta se deben tomar en cuenta las siguientes consideraciones (En las instalaciones de su Empresa):";
                break;
        }

        //Parameters
        ReportParameter[] rptParams = new ReportParameter[] {
            new ReportParameter("intCotizacionid",OrderNumber.ToString()),
            new ReportParameter("ImgHeader",ImgHeader),
            new ReportParameter("Img1",Img1),
            new ReportParameter("Img2",Img2),
            new ReportParameter("Img3",Img3),
            new ReportParameter("Img4",Img4),
            new ReportParameter("unidadNegocioDetalle",unidadNegocioDetalle),
            new ReportParameter("unidadNegocioDetalle2",unidadNegocioDetalle2),
            new ReportParameter("isDescuento",pIsDescuento.ToString()),
            new ReportParameter("Img5",Img5)
        };
        rptViewer.LocalReport.SetParameters(rptParams);
        //Refresh
        rptViewer.LocalReport.Refresh();

    }
    private DataTable GetData(int pIntCotizacionid)
    {
        DataTable dt = new DataTable();
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand("get_detalleCotizacion", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@intCotizacionid", SqlDbType.Int).Value = pIntCotizacionid;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        return dt;
    }
    private DataTable GetDataUsuario(int usuarioID)
    {
        DataTable dt = new DataTable();
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand("get_datosUsuario", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usuarioId", SqlDbType.Int).Value = usuarioID;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        return dt;
    }
}
