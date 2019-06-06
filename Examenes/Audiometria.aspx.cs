using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Windows.Forms;
using System.Data;
using System.Web.Services;
using System.Net;



public partial class Examenes_Audiometria : System.Web.UI.Page
{

    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    private String IdPaciente;
    private String IdModulo;
    private Boolean nuevo = false;
    EnumMessage message = new EnumMessage();
    #endregion


    #region Eventos

    protected void Page_Load(object sender, EventArgs e)

    {
        try
        {
            IdPaciente = Request.QueryString["Id_Persona"];
            IdModulo = Request.QueryString["idModuloOrigen"];

            if (!string.IsNullOrEmpty(IdPaciente) && !string.IsNullOrEmpty(IdModulo))
            {
                if (!IsPostBack)
                {
                    llenaDrops();
                    consultaPaciente();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorUrl(" + (int)EnumMessage.Message.ShowAlertErrorUrl + ");", true);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorGral('" + message.buildMessage(ex.Message) + "');", true);
        }

    }

    protected void btnConstruir_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            Dic.Add("@AUD_ID_PERSONA", IdPaciente);
            Dic.Add("@AUD_ID_MODULO_ORIGEN", IdModulo);
            Dic.Add("@AUD_OD_500HZ", txtOD500.Text);
            Dic.Add("@AUD_OD_1000HZ", txtOD1000.Text);
            Dic.Add("@AUD_OD_2000HZ", txtOD2000.Text);
            Dic.Add("@AUD_OD_3000HZ", txtOD3000.Text);
            Dic.Add("@AUD_II_500HZ", txtOI500.Text);
            Dic.Add("@AUD_II_1000HZ", txtOI1000.Text);
            Dic.Add("@AUD_II_2000HZ", txtOI2000.Text);
            Dic.Add("@AUD_II_3000HZ", txtOI3000.Text);
            Dic.Add("@AUD_OD_PERDIDA", txtPerdidaOD.Text);
            Dic.Add("@AUD_OI_PERDIDA", txtPerdidaOI.Text);
            Dic.Add("@AUD_HIPO_BIL_COMB", txtHopoacuasia.Text);
            Dic.Add("@AUD_FARINGE", txtFaringe.Text);
            Dic.Add("@AUD_CAD", txtCad.Text);
            Dic.Add("@AUD_MTD", txtMtd.Text);
            Dic.Add("@AUD_CAI", txtCai.Text);
            Dic.Add("@AUD_MTI", txtMti.Text);
            Dic.Add("@AUD_ID_CAT_AUDIOMETRIA", ddlDiagnostico.SelectedValue);
            Dic.Add("@AUD_ID_CAT_AUDIOMETRIA2", ddlDiagnostico2.SelectedValue);
            Dic.Add("@AUD_ID_CAT_AUDIOMETRIA3", ddlDiagnostico3.SelectedValue);
            Dic.Add("@AUD_ID_CAT_AUDIOMETRIA4", ddlDiagnostico4.SelectedValue);
            Dic.Add("@AUD_DESCRIPCION", txtDescComent.Text);
            Dic.Add("@AUD_DESCRIPCION2", txtDescComentOI.Text);
            Dic.Add("@AUD_IMP_DIAGNOSTICA", txtImpDiagnosticaComent.Text);
            Dic.Add("@AUD_IMP_DIAGNOSTICA2", txtImpDiagnosticaComentOI.Text);
            Dic.Add("@AUD_RECOMENDACIONES", txtRecomenComent.Text);
            Dic.Add("@AUD_RECOMENDACIONES2", txtRecomenComentOI.Text);
            Dic.Add("@AUD_ID_DOC_REALIZO", ddlRRealizoEM.SelectedValue == "Seleccionar" ? null : ddlRRealizoEM.SelectedValue);
            Dic.Add("@AUD_URL_IMAGE", cargaArchivo());

            if (Convert.ToBoolean(Session["NuevoAudiometria"]))
            {
                dbexam.changeProspecto("setUpdateExamenAudiometria", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('DatosGenerales.aspx'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }
            else
            {
                Dic.Add("@AUD_LAB_FECHA_INSERTA", Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value));
                dbexam.changeProspecto("setInsertaExamenAudiometria", Dic);
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

            if (_buildIamge.numPapeleta(name) == Convert.ToInt32(IdPaciente))
                UrlImage = _buildIamge.convertFileToImage(buffer, Request.Url.Segments[Request.Url.Segments.Length - 1], string.IsNullOrEmpty(imgExamenAudio.ImageUrl.ToString()) ? null : imgExamenAudio.ImageUrl.ToString().Substring(imgExamenAudio.ImageUrl.ToString().LastIndexOf("/") + 1));
            else
                throw new Exception("No coincide el numero de papeleta con el Id paciente");
        }
        else
        {
            UrlImage = imgExamenAudio.ImageUrl;
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
        Dic.Add("@ID_CAT_AUDIOMETRIA", ddlDiagnostico.SelectedValue);
        txtRecomendaciones.Text = dbexam.getDataProspect("getCAT_AUDIOMETRIA", Dic).Rows[0]["CAT_AUDIOMETRIA_RECOMENDACIONES"].ToString();
    }

    protected void ddlDiagnostico2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_CAT_AUDIOMETRIA", ddlDiagnostico.SelectedValue);
        txtImpDiagnostica.Text = dbexam.getDataProspect("getCAT_AUDIOMETRIA", Dic).Rows[0]["CAT_AUDIOMETRIA_IMPRESION_DIAGNOSTICA"].ToString();
    }

    protected void ddlDiagnostico3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_CAT_AUDIOMETRIA", ddlDiagnostico.SelectedValue);
        txtRecomendacionesOI.Text = dbexam.getDataProspect("getCAT_AUDIOMETRIA", Dic).Rows[0]["CAT_AUDIOMETRIA_RECOMENDACIONES"].ToString();
    }

    protected void ddlDiagnostico4_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_CAT_AUDIOMETRIA", ddlDiagnostico.SelectedValue);
        txtImpDiagnosticaOI.Text = dbexam.getDataProspect("getCAT_AUDIOMETRIA", Dic).Rows[0]["CAT_AUDIOMETRIA_IMPRESION_DIAGNOSTICA"].ToString();
    }
    #endregion


    #region Metodos

    private void llenaDrops()
    {
        DataTable oTableDropDow = dbexam.getDataProspect("getDoctores", null);

        ddlRRealizoEM.DataSource = oTableDropDow;
        ddlRRealizoEM.DataValueField = "ID_DOCTOR";
        ddlRRealizoEM.DataTextField = "NOMBRE_COMPLETO";
        ddlRRealizoEM.DataBind();

        ddlRRealizoEM.Items.Insert(0, "Seleccionar");

        DataTable odataDdl1 = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_AUDIOMETRIA WHERE ID_DIAGNOSTICO = 1");
        DataTable odataDdl0 = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_AUDIOMETRIA WHERE ID_DIAGNOSTICO = 0");

        ddlDiagnostico.DataSource = odataDdl1;
        ddlDiagnostico.DataValueField = "ID_CAT_AUDIOMETRIA";
        ddlDiagnostico.DataTextField = "CAT_AUDIOMETRIA_DESCRIPCION";
        ddlDiagnostico.DataBind();

        ddlDiagnostico2.DataSource = odataDdl0;
        ddlDiagnostico2.DataValueField = "ID_CAT_AUDIOMETRIA";
        ddlDiagnostico2.DataTextField = "CAT_AUDIOMETRIA_DESCRIPCION";
        ddlDiagnostico2.DataBind();

        ddlDiagnostico3.DataSource = odataDdl1;
        ddlDiagnostico3.DataBind();

        ddlDiagnostico4.DataSource = odataDdl0;
        ddlDiagnostico4.DataBind();

    }

    private void consultaPaciente()
    {
        DataTable oTablePaciente = new DataTable();
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_PERSONA", IdPaciente);
        Dic.Add("@ID_MODULO_ORIGEN", IdModulo);

        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenAudiometria", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {
                imgExamenAudio.ImageUrl = oTablePaciente.Rows[0]["AUD_URL_IMAGE"].ToString();
                txtOD500.Text = oTablePaciente.Rows[0]["AUD_OD_500HZ"].ToString();
                txtOD1000.Text = oTablePaciente.Rows[0]["AUD_OD_1000HZ"].ToString();
                txtOD2000.Text = oTablePaciente.Rows[0]["AUD_OD_2000HZ"].ToString();
                txtOD3000.Text = oTablePaciente.Rows[0]["AUD_OD_3000HZ"].ToString();
                txtOI500.Text = oTablePaciente.Rows[0]["AUD_II_500HZ"].ToString();
                txtOI1000.Text = oTablePaciente.Rows[0]["AUD_II_1000HZ"].ToString();
                txtOI2000.Text = oTablePaciente.Rows[0]["AUD_II_2000HZ"].ToString();
                txtOI3000.Text = oTablePaciente.Rows[0]["AUD_II_3000HZ"].ToString();
                txtPerdidaOD.Text = oTablePaciente.Rows[0]["AUD_OD_PERDIDA"].ToString();
                txtPerdidaOI.Text = oTablePaciente.Rows[0]["AUD_OI_PERDIDA"].ToString();
                txtHopoacuasia.Text = oTablePaciente.Rows[0]["AUD_HIPO_BIL_COMB"].ToString();
                txtFaringe.Text = oTablePaciente.Rows[0]["AUD_FARINGE"].ToString();
                txtCad.Text = oTablePaciente.Rows[0]["AUD_CAD"].ToString();
                txtMtd.Text = oTablePaciente.Rows[0]["AUD_MTD"].ToString();
                txtCai.Text = oTablePaciente.Rows[0]["AUD_CAI"].ToString();
                txtMti.Text = oTablePaciente.Rows[0]["AUD_MTI"].ToString();
                ddlDiagnostico.SelectedValue = oTablePaciente.Rows[0]["ID_CAT_AUDIOMETRIA"].ToString();
                ddlDiagnostico2.SelectedValue = oTablePaciente.Rows[0]["ID_CAT_AUDIOMETRIA2"].ToString();
                ddlDiagnostico3.SelectedValue = oTablePaciente.Rows[0]["ID_CAT_AUDIOMETRIA3"].ToString();
                ddlDiagnostico4.SelectedValue = oTablePaciente.Rows[0]["ID_CAT_AUDIOMETRIA4"].ToString();
                txtDesc.Text = oTablePaciente.Rows[0]["CAT_AUDIOMETRIA_DESCRIPCION_AUDIOMETRICA"].ToString();
                txtImpDiagnostica.Text = oTablePaciente.Rows[0]["CAT_AUDIOMETRIA_IMPRESION_DIAGNOSTICA"].ToString();
                txtRecomendaciones.Text = oTablePaciente.Rows[0]["CAT_AUDIOMETRIA_RECOMENDACIONES"].ToString();
                txtRecomendacionesOI.Text = oTablePaciente.Rows[0]["CAT_AUDIOMETRIA_RECOMENDACIONES2"].ToString();
                txtDescComent.Text = oTablePaciente.Rows[0]["AUD_DESCRIPCION"].ToString();
                txtDescComentOI.Text = oTablePaciente.Rows[0]["AUD_DESCRIPCION2"].ToString();
                txtRecomenComent.Text = oTablePaciente.Rows[0]["AUD_RECOMENDACIONES"].ToString();
                txtRecomenComentOI.Text = oTablePaciente.Rows[0]["AUD_RECOMENDACIONES2"].ToString();
                txtImpDiagnosticaComent.Text = oTablePaciente.Rows[0]["AUD_IMP_DIAGNOSTICA"].ToString();
                txtImpDiagnosticaComentOI.Text = oTablePaciente.Rows[0]["AUD_IMP_DIAGNOSTICA2"].ToString();

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

                Session["NuevoAudiometria"] = true;
                Session["TableExamenesAudiometria"] = oTablePaciente;
            }
            else
            {
                txtOD500.Text = "0";
                txtOD1000.Text = "0";
                txtOD2000.Text = "0";
                txtOD3000.Text = "0";
                txtOI500.Text = "0";
                txtOI1000.Text = "0";
                txtOI2000.Text = "0";
                txtOI3000.Text = "0";

                Session["NuevoAudiometria"] = false;
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
                Response.Write("<script> window.open('../Reportes/Examenes/AudiometriaCaida.aspx','_blank'); </script>");
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertInfo(" + (int)EnumMessage.Message.ShowAlertInfo + ");", true);
        }

    }
    #endregion

    protected void ddlDiagnostico_DataBound(object sender, EventArgs e)
    {
        ddlDiagnostico_SelectedIndexChanged(sender, e);
    }

    protected void ddlDiagnostico3_DataBound(object sender, EventArgs e)
    {
        ddlDiagnostico3_SelectedIndexChanged(sender, e);
    }
}