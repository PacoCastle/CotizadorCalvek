using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Examenes_Espirometria : System.Web.UI.Page
{

    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    private String IdPaciente;
    private String IdModulo;
    private Boolean nuevo = false;
    EnumMessage message = new EnumMessage();
    DataTable oDataTable = new DataTable();
    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        IdPaciente = Request.QueryString["Id_Persona"];
        IdModulo = Request.QueryString["idModuloOrigen"];

        if (!string.IsNullOrEmpty(IdPaciente) && !string.IsNullOrEmpty(IdModulo))
        {
            if (!IsPostBack)
            {
                oDataTable = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_SI_NO");
                llenaDrops();
                consultaPaciente();
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorUrl(" + (int)EnumMessage.Message.ShowAlertErrorUrl + ");", true);
        }
    }


    protected void btnConstruir_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            Dic.Add("@ESP_ID_PERSONA", IdPaciente);
            Dic.Add("@ESP_ID_MODULO_ORIGEN", IdModulo);
            Dic.Add("@ESP_ID_PICO_MAXIMO", ddlPico.SelectedValue);
            Dic.Add("@ESP_ID_FORMA_TRIANGULAR", ddlFormaTriangular.SelectedValue);
            Dic.Add("@ESP_ID_LIBRE_DE_ARTEFACTOS", ddlLibreArtefactos.SelectedValue);
            Dic.Add("@ESP_ID_MESETA", ddlMeseta.SelectedValue);
            Dic.Add("@ESP_ID_REPET_FVC_MEN_200", ddlRepetibilidadFvc200.SelectedValue);
            Dic.Add("@ESP_ID_REPET_FEV1_MAY_200", ddlRepetibilidadFev1.SelectedValue);
            Dic.Add("@ESP_ID_TIEMPO_MAYOR_4S", ddlTiempo.SelectedValue);
            Dic.Add("@ESP_ID_PRUEBAS_ACEPTABLES", txtPruebas.Text);
            Dic.Add("@ESP_ID_CALIDAD", ddlCalidad.SelectedValue);
            Dic.Add("@ESP_ID_CRITERIOS_DRX", ddlCriterios.SelectedValue);
            Dic.Add("@ESP_ID_CAT_ESPIROMETRIA", ddlDiagnostico.SelectedValue);
            Dic.Add("@ESP_IMPRESION_DIAGNOSTICA", txtImprecionComentario.Text);
            Dic.Add("@ESP_RECOMENDACIONES", txtRecomendacionesComentario.Text);
            Dic.Add("@ESP_ID_DOC_REALIZO", ddlRRealizoEM.SelectedValue == "Seleccionar" ? null : ddlRRealizoEM.SelectedValue);
            Dic.Add("@ESP_URL_IMAGE", cargaArchivo());
            Dic.Add("@ESP_REP_FVC",  txtFVC.Text);
            Dic.Add("@ESP_REP_FVE1", txtFVE1.Text);



            if (Convert.ToBoolean(Session["NuevoEspirometria"]))
            {
                dbexam.changeProspecto("setUpdateExamenEspirometria", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('DatosGenerales.aspx'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }
            else
            {
                Dic.Add("@ESP_FECHA_INSERTA", Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value));
                dbexam.changeProspecto("setInsertaExamenEspirometria", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess('DatosGenerales.aspx'," + (int)EnumMessage.Message.ShowAlertSucess + ");", true);
            }

        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertError('" + ex.Message + "');", true);
        }
        finally
        {
            Dic.Clear();
        }

    }

    protected string cargaArchivo()
    {
        BuildImage _buildIamge = new BuildImage();
        string UrlImage = string.Empty;
        bool HasFile = oFile.HasFile;

        if (oFile.HasFile)
        {
            String name = oFile.PostedFile.FileName;
            Stream input = oFile.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(input);

            byte[] buffer = br.ReadBytes((Int32)input.Length);

            if (_buildIamge.numPapeleta(name) != 0)
                UrlImage = _buildIamge.convertFileToImage(buffer, Request.Url.Segments[Request.Url.Segments.Length - 1], string.IsNullOrEmpty(imgExamenEspiro.ImageUrl.ToString()) ? null : imgExamenEspiro.ImageUrl.ToString().Substring(imgExamenEspiro.ImageUrl.ToString().LastIndexOf("/") + 1));
            else
                throw new Exception("No coincide el numero de papeleta con el Id paciente");
        }
        else
        {
            UrlImage = imgExamenEspiro.ImageUrl;
        }

        return UrlImage;

    }


    protected void ddlRRealizoEM_SelectedIndexChanged(object sender, EventArgs e)
    {
        imgFirmaRealizo.Visible = true;
        List<string> list = new List<string>();
        if (ddlRRealizoEM.SelectedIndex != 0)
        {
            list = getUrlImage(ddlRRealizoEM.SelectedValue);
            txtRCedProf.Text = list[0];
            lblCedProf.Text = "Ced. Prof. " + list[0];
            imgFirmaRealizo.ImageUrl = list[1];
            lblDoctor.Text = "Dr(a). " + list[2].ToUpper();
        }
        else
        {
            imgFirmaRealizo.Visible = false;
            txtRCedProf.Text = String.Empty;
        }
    }

    protected void ddlDiagnostico_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_CAT_ESPIROMETRIA", ddlDiagnostico.SelectedValue);
        txtRecomendaciones.Text = dbexam.getDataProspect("getCAT_ESPIROMETRIA", Dic).Rows[0]["CAT_ESPIROMETRIA_RECOMENDACIONES"].ToString();
        txtImpresiónDiagnostica.Text = dbexam.getDataProspect("getCAT_ESPIROMETRIA", Dic).Rows[0]["CAT_ESPIROMETRIA_IMPRESION_DIAGNOSTICA"].ToString();
    }
    #endregion

    #region Metodos

 
    private void llenaDrops()
    {
        ddlPico.DataSource = oDataTable;
        ddlPico.DataValueField = "ID_CAT_SI_NO";
        ddlPico.DataTextField = "CAT_CAT_SI_NO";
        ddlPico.DataBind();

        ddlFormaTriangular.DataSource = oDataTable;
        ddlFormaTriangular.DataValueField = "ID_CAT_SI_NO";
        ddlFormaTriangular.DataTextField = "CAT_CAT_SI_NO";
        ddlFormaTriangular.DataBind();

        ddlLibreArtefactos.DataSource = oDataTable;
        ddlLibreArtefactos.DataValueField = "ID_CAT_SI_NO";
        ddlLibreArtefactos.DataTextField = "CAT_CAT_SI_NO";
        ddlLibreArtefactos.DataBind();

        ddlMeseta.DataSource = oDataTable;
        ddlMeseta.DataValueField = "ID_CAT_SI_NO";
        ddlMeseta.DataTextField = "CAT_CAT_SI_NO";
        ddlMeseta.DataBind();

        ddlTiempo.DataSource = oDataTable;
        ddlTiempo.DataValueField = "ID_CAT_SI_NO";
        ddlTiempo.DataTextField = "CAT_CAT_SI_NO";
        ddlTiempo.DataBind();

        ddlRepetibilidadFvc200.DataSource = oDataTable;
        ddlRepetibilidadFvc200.DataValueField = "ID_CAT_SI_NO";
        ddlRepetibilidadFvc200.DataTextField = "CAT_CAT_SI_NO";
        ddlRepetibilidadFvc200.DataBind();

        ddlRepetibilidadFev1.DataSource = oDataTable;
        ddlRepetibilidadFev1.DataValueField = "ID_CAT_SI_NO";
        ddlRepetibilidadFev1.DataTextField = "CAT_CAT_SI_NO";
        ddlRepetibilidadFev1.DataBind();

        ddlCriterios.DataSource = oDataTable;
        ddlCriterios.DataValueField = "ID_CAT_SI_NO";
        ddlCriterios.DataTextField = "CAT_CAT_SI_NO";
        ddlCriterios.DataBind();

        ddlPico.DataSource = oDataTable;
        ddlPico.DataValueField = "ID_CAT_SI_NO";
        ddlPico.DataTextField = "CAT_CAT_SI_NO";
        ddlPico.DataBind();

        ddlPico.DataSource = oDataTable;
        ddlPico.DataValueField = "ID_CAT_SI_NO";
        ddlPico.DataTextField = "CAT_CAT_SI_NO";
        ddlPico.DataBind();

        ddlPico.DataSource = oDataTable;
        ddlPico.DataValueField = "ID_CAT_SI_NO";
        ddlPico.DataTextField = "CAT_CAT_SI_NO";
        ddlPico.DataBind();

        ddlPico.DataSource = oDataTable;
        ddlPico.DataValueField = "ID_CAT_SI_NO";
        ddlPico.DataTextField = "CAT_CAT_SI_NO";
        ddlPico.DataBind();

        DataTable oTableDropDow = dbexam.getDataProspect("getDoctores", null);

        ddlRRealizoEM.DataSource = oTableDropDow;
        ddlRRealizoEM.DataValueField = "ID_DOCTOR";
        ddlRRealizoEM.DataTextField = "NOMBRE_COMPLETO";
        ddlRRealizoEM.DataBind();

        ddlRRealizoEM.Items.Insert(0, "Seleccionar");

        ddlDiagnostico.DataSource = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_ESPIROMETRIA");
        ddlDiagnostico.DataValueField = "ID_CAT_ESPIROMETRIA";
        ddlDiagnostico.DataTextField = "CAT_ESPIROMETRIA_DESCRIPCION";
        ddlDiagnostico.DataBind();

        ddlCalidad.DataSource = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_CALIDAD");
        ddlCalidad.DataValueField = "ID_CAT_CALIDAD";
        ddlCalidad.DataTextField = "CAT_CALIDAD";
        ddlCalidad.DataBind();

    }

    private void consultaPaciente()
    {
        DataTable oTablePaciente = new DataTable();
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_PERSONA", IdPaciente);
        Dic.Add("@ID_MODULO_ORIGEN", IdModulo);

        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenEspirometria", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {

                ddlPico.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_PICO_MAXIMO"].ToString();
                ddlFormaTriangular.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_FORMA_TRIANGULAR"].ToString();
                ddlLibreArtefactos.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_LIBRE_DE_ARTEFACTOS"].ToString();
                ddlMeseta.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_MESETA"].ToString();
                ddlTiempo.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_TIEMPO_MAYOR_4S"].ToString();
                ddlRepetibilidadFvc200.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_REPET_FVC_MEN_200"].ToString();
                ddlRepetibilidadFev1.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_REPET_FEV1_MAY_200"].ToString();
                txtPruebas.Text = oTablePaciente.Rows[0]["ESP_ID_PRUEBAS_ACEPTABLES"].ToString();
                ddlCalidad.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_CALIDAD"].ToString();
                ddlCriterios.SelectedValue = oTablePaciente.Rows[0]["ESP_ID_CRITERIOS_DRX"].ToString();
                ddlDiagnostico.SelectedValue = oTablePaciente.Rows[0]["ID_CAT_ESPIROMETRIA"].ToString();
                txtImpresiónDiagnostica.Text = oTablePaciente.Rows[0]["CAT_ESPIROMETRIA_IMPRESION_DIAGNOSTICA"].ToString();
              
                txtRecomendaciones.Text = oTablePaciente.Rows[0]["CAT_ESPIROMETRIA_RECOMENDACIONES"].ToString();
                txtImprecionComentario.Text = oTablePaciente.Rows[0]["ESP_IMPRESION_DIAGNOSTICA"].ToString();
                txtRecomendacionesComentario.Text = oTablePaciente.Rows[0]["ESP_RECOMENDACIONES"].ToString();

                imgExamenEspiro.ImageUrl = oTablePaciente.Rows[0]["ESP_URL_IMAGE"].ToString();

                List<string> list = new List<string>();
                if (!String.IsNullOrEmpty(oTablePaciente.Rows[0]["DRE_ID_DOC"].ToString()))
                {
                    ddlRRealizoEM.SelectedValue = oTablePaciente.Rows[0]["DRE_ID_DOC"].ToString();
                    list = getUrlImage(ddlRRealizoEM.SelectedValue);
                    imgFirmaRealizo.ImageUrl = list[1];
                    imgFirmaRealizo.Visible = true;
                    list.Clear();
                }

                txtRCedProf.Text = oTablePaciente.Rows[0]["DRE_CEDULA_PROFESIONAL"].ToString();
                if (!String.IsNullOrEmpty(txtRCedProf.Text))
                    lblCedProf.Text = "Ced. Prof. " + txtRCedProf.Text;
                if (!String.IsNullOrEmpty(oTablePaciente.Rows[0]["DRE_NOMBRE_COMPLETO"].ToString()))
                    lblDoctor.Text = "Dr(a). " + oTablePaciente.Rows[0]["DRE_NOMBRE_COMPLETO"].ToString();


                txtFVC.Text = oTablePaciente.Rows[0]["ESP_REP_FVC"].ToString();
                txtFVE1.Text = oTablePaciente.Rows[0]["ESP_REP_FVE1"].ToString();

                Session["NuevoEspirometria"] = true;
                Session["TableExamenesEspirometria"] = oTablePaciente;

            }
            else
            {
    
                Session["NuevoEspirometria"] = false;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected List<string> getUrlImage(String Id_Doctor)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        List<string> list = new List<string>();
        Dic.Add("@Id_Doctor", Id_Doctor);
        DataTable oTableDropDow = dbexam.getDataProspect("getDoctores", Dic);

        list.Add(oTableDropDow.Rows[0][5].ToString());
        list.Add(oTableDropDow.Rows[0][6].ToString());
        list.Add(oTableDropDow.Rows[0][8].ToString());

        return list;
    }

    protected void btnReporte_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(IdPaciente))
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertInfo();", true);
            else
                Response.Write("<script> window.open('../Reportes/Examenes/EspirometriaCaida.aspx','_blank'); </script>");
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertInfo(" + (int)EnumMessage.Message.ShowAlertInfo + ");", true);
        }

    }
    #endregion

}