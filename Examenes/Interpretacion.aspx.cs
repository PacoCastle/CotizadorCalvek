using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Examenes_Interpretacion : System.Web.UI.Page
{

    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    private String IdPaciente;
    private Boolean nuevo = false;

    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
          
            IdPaciente = Request.QueryString["Id_Persona"];

            if (!string.IsNullOrEmpty(IdPaciente))
            {
                if (!IsPostBack)
                {
                    llenaDrops();
                    consultaPaciente();
                    Session["Id_Persona"] = IdPaciente;
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

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            Dic.Add("@ID_PERSONA", IdPaciente);
            Dic.Add("@INT_AUDIOMETRIA_COMENTARIOS", txtAudiometriaComent.Text);
            Dic.Add("@INT_ESPIROMETRIA_COMENTARIOS", txtEspiroComent.Text);
            Dic.Add("@INT_RADIOGRAFIAS_COMENTARIOS", txtRadioComent.Text);
            Dic.Add("@INT_MEDICO_COMENTARIOS", txtExamenComent.Text);
            Dic.Add("@INT_LABORATORIOS_COMENTARIOS", txtLaboratorioComent.Text);
            Dic.Add("@INT_TOXICOLOGICOS_COMENTARIOS", txtToxicologicoComent.Text);
            Dic.Add("@INT_OTROS_COMENTARIOS", txtComentarioOtros.Text);
            Dic.Add("@ID_DOC_REALIZO", ddlRRealizoEM.SelectedValue == "Seleccionar" ? null : ddlRRealizoEM.SelectedValue);
           


            if (Convert.ToInt32(Session["NuevoInterpretacion"])!=0)
            {
                dbexam.changeProspecto("setUpdateExamenInterpretacion", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit(''," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }
            else
            {
                Dic.Add("@INT_FECHA_INSERTA", Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value));
                dbexam.changeProspecto("setInsertaExamenInterpretacion", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess(''," + (int)EnumMessage.Message.ShowAlertSucess + ");", true);
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


    protected void lnkAudio_Click(object sender, EventArgs e)
    {
        Response.Redirect("Audiometria.aspx?Id_Persona=" + Session["Id_Persona"] + "&idModuloOrigen=0");
    }

    protected void lnkEspiro_Click(object sender, EventArgs e)
    {
        Response.Redirect("Espirometria.aspx?Id_Persona=" + Session["Id_Persona"] + "&idModuloOrigen=0");
    }

    protected void lnkRadio_Click(object sender, EventArgs e)
    {
        Response.Redirect("Radiografias.aspx?Id_Persona=" + Session["Id_Persona"] + "&idModuloOrigen=0");
    }

    protected void lnkExamenMedico_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamenGral.aspx?Id_Persona=" + Session["Id_Persona"] + "&idModuloOrigen=0");
    }

    protected void lnkExamenToxicologico_Click(object sender, EventArgs e)
    {
        Response.Redirect("Toxicologico.aspx?Id_Persona=" + Session["Id_Persona"]);
    }

    protected void lnkLaboratorio_Click(object sender, EventArgs e)
    {
        Response.Redirect("Laboratorio.aspx?Id_Persona=" + Session["Id_Persona"]);
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

    private void consultaPaciente()
    {
        DataTable oTablePaciente = new DataTable();
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_PERSONA", IdPaciente);
        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenInterpretacion", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {
                txtAudiometria.Text = oTablePaciente.Rows[0]["INT_AUDIOMETRIA"].ToString();
                txtAudiometriaComent.Text = oTablePaciente.Rows[0]["INT_AUDIOMETRIA_COMENTARIOS"].ToString();
                txtEspirometria.Text = oTablePaciente.Rows[0]["INT_ESPIROMETRIA"].ToString();
                txtEspiroComent.Text = oTablePaciente.Rows[0]["INT_ESPIROMETRIA_COMENTARIOS"].ToString();
                txtRadiografias.Text = oTablePaciente.Rows[0]["INT_RADIOGRAFIAS"].ToString();
                txtRadioComent.Text = oTablePaciente.Rows[0]["INT_RADIOGRAFIAS_COMENTARIOS"].ToString();
                txtLaboratorio.Text = oTablePaciente.Rows[0]["INT_LABORATORIOS"].ToString();
                txtLaboratorioComent.Text = oTablePaciente.Rows[0]["INT_LABORATORIOS_COMENTARIOS"].ToString();
                txtExamenMedico.Text = oTablePaciente.Rows[0]["INT_EXAMEN_MEDICO"].ToString();
                txtExamenComent.Text = oTablePaciente.Rows[0]["INT_MEDICO_COMENTARIOS"].ToString();
                txtToxicologico.Text = oTablePaciente.Rows[0]["INT_TOXICOLOGICOS"].ToString();
                txtToxicologicoComent.Text = oTablePaciente.Rows[0]["INT_TOXICOLOGICOS_COMENTARIOS"].ToString();
                txtComentarioOtros.Text = oTablePaciente.Rows[0]["INT_OTROS_COMENTARIOS"].ToString();

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
              
                Session["NuevoInterpretacion"] = oTablePaciente.Rows[0]["INT_EXIST_ID_PERSONA"].ToString();
            }
            else
            {
                Session["NuevoInterpretacion"] = 0;
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
    #endregion




}