using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Examenes_Resumen : System.Web.UI.Page
{

    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    private String IdPaciente;
    private String IdModuloOrigen;
    EnumMessage message = new EnumMessage();
    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            IdPaciente = Request.QueryString["Id_Persona"];
            IdModuloOrigen = Request.QueryString["idModuloOrigen"];

            if (!string.IsNullOrEmpty(IdPaciente))
            {
                if (!IsPostBack)
                {
                    consultaPaciente();
                    llenaDrops();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorUrl();", true);
            }

        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorGral('" + ex.Message + "');", true);
        }
    }

    protected void btnReporte_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(IdPaciente))
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertInfo();", true);
            else
                Response.Write("<script> window.open('../Reportes/Examenes/ResumenCaida.aspx','_blank'); </script>");
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertInfo(" + (int)EnumMessage.Message.ShowAlertInfo + ");", true);
        }

    }
    protected void ddlRRealizoEM_SelectedIndexChanged(object sender, EventArgs e)
    {
        imgFirmaRealizo.Visible = true;
        List<string> list = new List<string>();
        if (ddlRRealizoEM.SelectedIndex != 0)
        {
            list = getUrlImage(ddlRRealizoEM.SelectedValue);
            txtRCedProf.Text = list[0];
            imgFirmaRealizo.ImageUrl = list[1];
        }
        else
        {
            imgFirmaRealizo.Visible = false;
            txtRCedProf.Text = String.Empty;
        }
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            Dic.Add("@RES_ID_PERSONA", IdPaciente);
            Dic.Add("@RES_MODULO_ORIGEN", IdModuloOrigen);
            
            var DateNow = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);

            Dic.Add("@RES_ID_DOC_REALIZO", ddlRRealizoEM.SelectedValue == "Seleccionar" ? null : ddlRRealizoEM.SelectedValue);
            
            if (!Convert.ToBoolean(Session["NuevoResumen"]))
            {
                dbexam.changeProspecto("setUpdateExamenResumen", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('" + EnumMessage.DatosGenerales + "'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }

            else
            {
                Dic.Add("@RES_FECHA_INSERTA", DateNow);
                dbexam.changeProspecto("setInsertaExamenResumen", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess('" + EnumMessage.DatosGenerales + "'," + (int)EnumMessage.Message.ShowAlertSucess + ");", true);
            }

        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorGral('" + message.buildMessage(ex.Message) + "');", true);
        }
        finally
        {
            Dic.Clear();
        }
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
    }
    protected List<string> getUrlImage(String Id_Doctor)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        List<string> list = new List<string>();
        Dic.Add("@Id_Doctor", Id_Doctor);
        DataTable oTableDropDow = dbexam.getDataProspect("getDoctores", Dic);

        list.Add(oTableDropDow.Rows[0][5].ToString());
        list.Add(oTableDropDow.Rows[0][6].ToString());

        return list;
    }
    private void consultaPaciente()
    {
        DataTable oTablePaciente = new DataTable();
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_PERSONA", IdPaciente);
        Dic.Add("@ID_MODULO_ORIGEN", IdModuloOrigen);
        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenResumen", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {

                txtNombreCompleto.Text = oTablePaciente.Rows[0]["RES_NombreCompleto"].ToString();
                txtSexo.Text = oTablePaciente.Rows[0]["RES_DP_SEXO"].ToString();
                txtEdad.Text = oTablePaciente.Rows[0]["RES_DP_EDAD"].ToString();
                txtEmpresa.Text = oTablePaciente.Rows[0]["RES_DP_EMPRESA"].ToString();
                txtPuesto.Text = oTablePaciente.Rows[0]["RES_HL_PUESTO_SOL"].ToString();
                txtFecha.Text = oTablePaciente.Rows[0]["RES_EM_FECHA_CREACION"].ToString();
                txtTipoExamen.Text = oTablePaciente.Rows[0]["RES_TIPO_INGRESO"].ToString();

                //SOMATOMETRIA
                txtTa.Text = oTablePaciente.Rows[0]["RES_SSV_TA"].ToString();
                txtFcMIn.Text = oTablePaciente.Rows[0]["RES_SSV_FC"].ToString();
                txtFrMin.Text = oTablePaciente.Rows[0]["RES_SSV_FR"].ToString();
                txtT.Text = oTablePaciente.Rows[0]["RES_SSV_T"].ToString();
                txtPesoKg.Text = Convert.ToDecimal(oTablePaciente.Rows[0]["RES_SSV_PESO"].ToString()).ToString("N2");
                txtTallaCm.Text = Convert.ToDecimal(oTablePaciente.Rows[0]["RES_SSV_TALLA"].ToString()).ToString("N2");
                txtImc.Text = Convert.ToDecimal(oTablePaciente.Rows[0]["RES_SSV_IMC"].ToString()).ToString("N2");
                txtComplexion.Text = oTablePaciente.Rows[0]["RES_SSV_COMPLEXION"].ToString();


                txtAudiometria.Text = oTablePaciente.Rows[0]["RES_AUDIOMETRIA"].ToString();
                txtEspirometria.Text = oTablePaciente.Rows[0]["RES_ESPIROMETRIA"].ToString();
                txtRadiografias.Text = oTablePaciente.Rows[0]["RES_RADIOGRAFIAS"].ToString();
                txtLaboratorio.Text = oTablePaciente.Rows[0]["RES_LABORATORIOS"].ToString();
                txtExamenMedico.Text = oTablePaciente.Rows[0]["RES_EXAMEN_MEDICO"].ToString();
                txtToxicologico.Text = oTablePaciente.Rows[0]["RES_TOXICOLOGICOS"].ToString();
                txtComentarioOtros.Text = oTablePaciente.Rows[0]["RES_OTROS"].ToString();
                txtAptitud.Text = oTablePaciente.Rows[0]["RES_EXAMEN_MEDICO_APTITUD"].ToString();
                txtComentariosExamenMedico.Text = oTablePaciente.Rows[0]["RES_EXAMEN_MEDICO_COMENTARIOS"].ToString();
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
                if (oTablePaciente.Rows[0]["RES_ID_PERSONA"].ToString() != "")
                    Session["NuevoResumen"] = false;
                else
                    Session["NuevoResumen"] = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Dic.Clear();
        }

    }
    #endregion


}