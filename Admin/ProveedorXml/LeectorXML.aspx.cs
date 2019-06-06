using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using ContabilidadTableAdapters;
using System.Threading;
using System.Net;
using System.Data;


public partial class Admin_ProveedorXml_LeectorXML : System.Web.UI.Page
{
    private static int NUMFUNCION = 68;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //CARGA COMBO AÑOS
        int year;
        int añosDocumento = Convert.ToInt32(lstAños.Items.Count.ToString());
        if (añosDocumento < 1)
        {
            for (year = 1990; year <= DateTime.Now.Year; year++)
            {
                lstAños.Items.Add(year.ToString());
            }
            lstAños.SelectedValue = DateTime.Now.Year.ToString();
        }

        //CARGA COMBO AÑOS BUSQUEDA
        int yearBusqueda;
        int añosBusqueda = Convert.ToInt32(lstAñosBd.Items.Count.ToString());
        if(añosBusqueda < 1){
            for (yearBusqueda = 1990; yearBusqueda <= DateTime.Now.Year; yearBusqueda++)
            {
                lstAñosBd.Items.Add(yearBusqueda.ToString());
            }
            lstAñosBd.SelectedValue = DateTime.Now.Year.ToString();
        }
        this.btnImport.CausesValidation = false;
       
        //OCULTA COMBO DE CONSULTA CON KEPLER
        if (añosBusqueda < 1)
        {
            this.Label4.Visible = false;
            this.infoAñosKepler.Visible = false;
            this.LabelAnioBusqueda.Visible = false;
            this.lstAñosBd.Visible = false;
        }
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        try
        {
            String Path = Server.MapPath("~/Archivos/CargaXml/");
            string[] docXml = Directory.GetFiles(Path);

            foreach (var elemento in docXml)
            {
                string documento = elemento;

                FileStream docPath = new FileStream(documento, FileMode.Open, FileAccess.Read);
                string fileName = docPath.Name;

                if (!string.IsNullOrEmpty(fileName))
                {
                    string uuid = string.Empty;
                    string folio = string.Empty;
                    string serie = string.Empty;
                    string fechaTimbrado = string.Empty;
                    string tasa = string.Empty;
                    string importeTotal = string.Empty;
                    string rfc = string.Empty;
                    string nombreRfc = string.Empty;
                    string moneda = string.Empty;
                    string tipoCambio = string.Empty;
                    string rfcReceptor = string.Empty;
                    string tipoComprobante = string.Empty;

                    XNamespace ns = "http://www.sat.gob.mx/cfd/3";
                    XNamespace nd = "http://www.sat.gob.mx/TimbreFiscalDigital";

                    XDocument xDoc = XDocument.Load(fileName);
                    if (xDoc.Root.Element(ns + "Complemento").Element(nd + "TimbreFiscalDigital").Attribute("UUID") != null)
                    {
                        uuid = xDoc.Root.Element(ns + "Complemento").Element(nd + "TimbreFiscalDigital").Attribute("UUID").Value;
                    }
                    if (xDoc.Root.Attribute("folio") != null)
                    {
                        folio = xDoc.Root.Attribute("folio").Value;
                    }
                    if (xDoc.Root.Attribute("serie") != null)
                    {
                        serie = xDoc.Root.Attribute("serie").Value;
                    }
                    if (xDoc.Root.Element(ns + "Complemento").Element(nd + "TimbreFiscalDigital").Attribute("FechaTimbrado") != null)
                    {
                        fechaTimbrado = xDoc.Root.Element(ns + "Complemento").Element(nd + "TimbreFiscalDigital").Attribute("FechaTimbrado").Value;
                    }

                    if (xDoc.Root.Element(ns + "Impuestos") != null)
                    {
                        if (xDoc.Root.Element(ns + "Impuestos").Element(ns + "Traslados") != null)
                        {
                            if (xDoc.Root.Element(ns + "Impuestos").Element(ns + "Traslados").Element(ns + "Traslado") != null)
                            {
                                if (xDoc.Root.Element(ns + "Impuestos").Element(ns + "Traslados").Element(ns + "Traslado").Attribute("tasa") != null)
                                {
                                    tasa = xDoc.Root.Element(ns + "Impuestos").Element(ns + "Traslados").Element(ns + "Traslado").Attribute("tasa").Value;
                                }

                            }
                        }
                    }

                    if (xDoc.Root.Attribute("total") != null)
                    {
                        importeTotal = xDoc.Root.Attribute("total").Value;
                    }
                    if (xDoc.Root.Element(ns + "Emisor").Attribute("rfc") != null)
                    {
                        rfc = xDoc.Root.Element(ns + "Emisor").Attribute("rfc").Value;
                    }
                    if (xDoc.Root.Element(ns + "Emisor").Attribute("nombre") != null)
                    {
                        nombreRfc = xDoc.Root.Element(ns + "Emisor").Attribute("nombre").Value;
                    }
                    if (xDoc.Root.Attribute("Moneda") != null)
                    {
                        moneda = xDoc.Root.Attribute("Moneda").Value;
                    }
                    if (xDoc.Root.Attribute("TipoCambio") != null)
                    {
                        tipoCambio = xDoc.Root.Attribute("TipoCambio").Value;
                    }
                    if (xDoc.Root.Element(ns + "Receptor").Attribute("rfc") != null)
                    {
                        rfcReceptor = xDoc.Root.Element(ns + "Receptor").Attribute("rfc").Value;
                    }
                    if (xDoc.Root.Attribute("tipoDeComprobante") != null)
                    {
                        tipoComprobante = xDoc.Root.Attribute("tipoDeComprobante").Value;
                    }

                    double tasaEnviar = 0;
                    double d;
                    if (tasa != string.Empty && Double.TryParse(tasa, out d))
                    {
                        tasaEnviar = Convert.ToDouble(tasa);
                    }
                    if (nombreRfc == "")
                    {
                        nombreRfc = "Sin identificar";
                    }
                    if (moneda == "")
                    {
                        moneda = "Sin identificar";
                    }

                    set_insertaXmlTableAdapter set_insertaXml = new set_insertaXmlTableAdapter();
                    set_insertaXml.GetData(uuid, fechaTimbrado, folio, serie, Decimal.Parse(importeTotal), tasaEnviar, nombreRfc, rfc, DateTimeOffset.Parse(fechaTimbrado).DateTime, moneda, tipoCambio, rfcReceptor, tipoComprobante);

                }
            }
            this.ctrPopup1.Show();
            this.GridView1.DataBind();
        }
        catch (Exception)
        {

            throw;
        }

    }

    protected void popupClose_Click(object sender, EventArgs e)
    {
        ctrPopup1.Hide();
        ctrPopup2.Hide();
        ctrPopupMsjAñoDoc.Hide();
        ctrPopupMsjAñoKepler.Hide();
        ctrPopupValida.Hide();
        ctrPopupValidaFinal.Hide();
        ctrPopupValidaInicial.Hide();
    }
    
    protected void mes_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }

    protected void añoDocumento_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }

    protected void oficina_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }

    protected void añoBd_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }

    protected void proveedores_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }
    protected void dia_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }
    protected void moneda_onChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }
    protected void txtIncialOnChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }
    protected void txtFinalOnChange(object sender, EventArgs e)
    {
        ocultarGrids();
    }

    protected void btnBusqueda_click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int banderaChecked = 0;

            string validaMontoInicial = txtMontoInicial.Text;
            string validaMontoFinal = TextBoxMontoFinal.Text;
            float montoInicial;
            float montoFinal;

            if (ChkConsultaKepler.Checked == true)
            {
                banderaChecked = 1;
            }       
            if(banderaChecked == 1){
                //CASO EN QUE NO ELIJAN LOS CAMPOS MONTOS
                if (string.IsNullOrEmpty(validaMontoInicial) && string.IsNullOrEmpty(validaMontoFinal))
                {
                    System.Threading.Thread.Sleep(1000);
                    gridGeneral.Visible = false;
                    GridProveedor.Visible = true;
                    SqlDataSource2.DataBind();
                    GridProveedor.EmptyDataText = "No se encontraron registros asociados.";
                    GridProveedor.DataSourceID = "SqlDataSource2";
                    return;
                }

                //CASO EN QUE ELIJAN MONTO INICIAL PERO NO FINAL
                if (!string.IsNullOrEmpty(validaMontoInicial) && string.IsNullOrEmpty(validaMontoFinal))
                {
                    this.ctrPopupValidaInicial.Show();
                    return;
                }
                //CASO EN QUE ELIJAN MONTO FINAL PERO NO INICIAL
                if (string.IsNullOrEmpty(validaMontoInicial) && !string.IsNullOrEmpty(validaMontoFinal))
                {
                    this.ctrPopupValidaFinal.Show();
                    return;
                }

                montoInicial = float.Parse(txtMontoInicial.Text);
                montoFinal = float.Parse(TextBoxMontoFinal.Text);
                if (montoFinal > montoInicial)
                {
                    System.Threading.Thread.Sleep(1000);
                    gridGeneral.Visible = false;
                    GridProveedor.Visible = true;
                    SqlDataSource2.DataBind();
                    GridProveedor.EmptyDataText = "No se encontraron registros asociados.";
                    GridProveedor.DataSourceID = "SqlDataSource2";
                }
                else
                {
                    this.ctrPopupValida.Show();
                }
            }

            if (banderaChecked == 0) {
                //CASO EN QUE NO ELIJAN LOS CAMPOS MONTOS
                if (string.IsNullOrEmpty(validaMontoInicial) && string.IsNullOrEmpty(validaMontoFinal))
                {
                    System.Threading.Thread.Sleep(1000);
                    gridGeneral.Visible = true;
                    GridProveedor.Visible = false;
                    SqlDataSource1.DataBind();
                    gridGeneral.EmptyDataText = "No se encontraron registros asociados.";
                    gridGeneral.DataSourceID = "SqlDataSource1";
                    return;
                }

                //CASO EN QUE ELIJAN MONTO INICIAL PERO NO FINAL
                if (!string.IsNullOrEmpty(validaMontoInicial) && string.IsNullOrEmpty(validaMontoFinal))
                {
                    this.ctrPopupValidaInicial.Show();
                    return;
                }
                //CASO EN QUE ELIJAN MONTO FINAL PERO NO INICIAL
                if (string.IsNullOrEmpty(validaMontoInicial) && !string.IsNullOrEmpty(validaMontoFinal))
                {
                    this.ctrPopupValidaFinal.Show();
                    return;
                }

                montoInicial = float.Parse(txtMontoInicial.Text);
                montoFinal = float.Parse(TextBoxMontoFinal.Text);
                if (montoFinal > montoInicial)
                {
                    System.Threading.Thread.Sleep(1000);
                    gridGeneral.Visible = true;
                    GridProveedor.Visible = false;
                    SqlDataSource1.DataBind();
                    gridGeneral.EmptyDataText = "No se encontraron registros asociados.";
                    gridGeneral.DataSourceID = "SqlDataSource1";
                }
                else
                {
                    this.ctrPopupValida.Show();
                }
            }
        }
    }

    private void ocultarGrids() 
    {
        gridGeneral.Visible = false;
        GridProveedor.Visible = false;
    }

    protected void descargaXml_OnClick(object sender, EventArgs e)
    {
        Button objImage = (Button)sender;
        string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
        string uuid = commandArgs[0];
        string rfcReceptor = commandArgs[1];

        String Path = Server.MapPath("~/Archivos/DescargaXml/");

        string validacion = Path + rfcReceptor + "_" + uuid + ".xml";
        if (File.Exists(validacion))
        {
            string fileName = rfcReceptor + "_" + uuid + ".xml";

            HttpContext.Current.Response.ContentType = "APPLICATION/OCTET-STREAM";
            String Header = "Attachment; Filename=" + fileName;
            HttpContext.Current.Response.AppendHeader("Content-Disposition", Header);
            System.IO.FileInfo Dfile = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Archivos/DescargaXml/" + fileName));
            HttpContext.Current.Response.WriteFile(Dfile.FullName);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "jsKeys", "javascript:Forzar();", true);
            HttpContext.Current.Response.End();
        }
        else
        {
            this.ctrPopup2.Show();
        }
    }

    protected void descargaProveedor_OnClick(object sender, EventArgs e)
    {

        Button objImage = (Button)sender;
        string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
        string uuid = commandArgs[0];
        string rfcReceptor = commandArgs[1];

        String Path = Server.MapPath("~/Archivos/DescargaXml/");

        string validacion = Path + rfcReceptor + "_" + uuid + ".xml";
        if (File.Exists(validacion))
        {
            string fileName = rfcReceptor + "_" + uuid + ".xml";

            HttpContext.Current.Response.ContentType = "APPLICATION/OCTET-STREAM";
            String Header = "Attachment; Filename=" + fileName;
            HttpContext.Current.Response.AppendHeader("Content-Disposition", Header);
            System.IO.FileInfo Dfile = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("~/Archivos/DescargaXml/" + fileName));
            HttpContext.Current.Response.WriteFile(Dfile.FullName);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "jsKeys", "javascript:Forzar();", true);
            HttpContext.Current.Response.End();
        }
        else
        {
            this.ctrPopup2.Show();
        }
    }

    protected void infoAñoDoc_OnClick(object sender, EventArgs e)
    {
        this.ctrPopupMsjAñoDoc.Show();
    }
    protected void infoAñoKepler_OnClick(object sender, EventArgs e)
    {
        this.ctrPopupMsjAñoKepler.Show();
    }

    protected void chkLinked_CheckedChanged(object sender, EventArgs e)
    {
        if (ChkConsultaKepler.Checked == false)
        {
            this.Label4.Visible = false;
            this.infoAñosKepler.Visible = false;
            this.LabelAnioBusqueda.Visible = false;
            this.lstAñosBd.Visible = false;
        }

        if (ChkConsultaKepler.Checked == true)
        {
            this.Label4.Visible = true;
            this.infoAñosKepler.Visible = true;
            this.LabelAnioBusqueda.Visible = true;
            this.lstAñosBd.Visible = true;
        }       
    }    
}
