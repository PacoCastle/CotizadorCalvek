using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Examenes_Toxicologico : System.Web.UI.Page
{
    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    DataTable oDataTable = new DataTable();
    private String IdPaciente;
    encryption cryp = new encryption();
    EnumMessage message = new EnumMessage();


    #endregion

    #region Eventos
    protected void Page_PreLoad(object sender, EventArgs e)
    {

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            IdPaciente = Request.QueryString["Id_Persona"];

            if (!string.IsNullOrEmpty(IdPaciente))
            {
                //Session["NuevoToxicologico"] = false;

                if (!IsPostBack)
                {
                    oDataTable = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_TOXICOS");
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

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            Dic.Add("@ID_DG", IdPaciente);
            Dic.Add("@TOX_CRITERIOS", Tox_Criterios.Text);
            Dic.Add("@TOX_HALLAZGOS", Tox_Hallazgos.Text);
            Dic.Add("@TOX_RECOMENDACIONES", Tox_Recomedacion.Text);
            Dic.Add("@TOX_ID_ANFETAMINAS", ddlToxIdAnfetaminas.SelectedValue);
            Dic.Add("@TOX_ID_COCAINA", ddlToxIdCocaina.SelectedValue);
            Dic.Add("@TOX_ID_MARIHUANA", ddlToxIdMarihuana.SelectedValue);
            Dic.Add("@TOX_ID_OPIACEOS", ddlToxIdOpiaceos.SelectedValue);
            Dic.Add("@TOX_ID_METANFETAMINAS", ddlToxIsMetanfetamina.SelectedValue);
            Dic.Add("@TOX_RESULTADO", Tox_Resultado.Text);
            var DateNow = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);

            Dic.Add("@ID_DOC_REALIZO", ddlRRealizoEM.SelectedValue == "Seleccionar" ? null : ddlRRealizoEM.SelectedValue);
            Dic.Add("@TOX_FECHA_EXAMEN", Convert.ToDateTime(txtToxFechaExamen.Text));


            if (Convert.ToBoolean(Session["NuevoToxicologico"]))
            {
                dbexam.changeProspecto("setUpdateExamenToxicologicos", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('" + EnumMessage.DatosGenerales + "'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }

            else
            {
                Dic.Add("@TOX_FECHA_INSERTA", DateNow);
                dbexam.changeProspecto("setInsertaExamenToxicologicos", Dic);
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


    #endregion

    #region Metodos
    private void llenaDrops()
    {
        ddlToxIdAnfetaminas.DataSource = oDataTable;
        ddlToxIdAnfetaminas.DataBind();
        ddlToxIdCocaina.DataSource = oDataTable;
        ddlToxIdCocaina.DataBind();
        ddlToxIdMarihuana.DataSource = oDataTable;
        ddlToxIdMarihuana.DataBind();
        ddlToxIdOpiaceos.DataSource = oDataTable;
        ddlToxIdOpiaceos.DataBind();
        ddlToxIsMetanfetamina.DataSource = oDataTable;
        ddlToxIsMetanfetamina.DataBind();

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
        Dic.Add("ID_DG", IdPaciente);
        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenToxicologicos", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {
                txtToxFechaExamen.Text = oTablePaciente.Rows[0]["TOX_FECHA_EXAMEN"].ToString();
                Tox_Criterios.Text = oTablePaciente.Rows[0]["TOX_CRITERIOS"].ToString();
                Tox_Hallazgos.Text = oTablePaciente.Rows[0]["TOX_HALLAZGOS"].ToString();
                Tox_Recomedacion.Text = oTablePaciente.Rows[0]["TOX_RECOMENDACIONES"].ToString();
                ddlToxIdAnfetaminas.Text = oTablePaciente.Rows[0]["TOX_ID_ANFETAMINAS"].ToString();
                ddlToxIdCocaina.Text = oTablePaciente.Rows[0]["TOX_ID_COCAINA"].ToString();
                ddlToxIdMarihuana.Text = oTablePaciente.Rows[0]["TOX_ID_MARIHUANA"].ToString();
                ddlToxIdOpiaceos.Text = oTablePaciente.Rows[0]["TOX_ID_OPIACEOS"].ToString();
                ddlToxIsMetanfetamina.Text = oTablePaciente.Rows[0]["TOX_ID_METANFETAMINAS"].ToString();
                Tox_Resultado.Text = oTablePaciente.Rows[0]["TOX_RESULTADO"].ToString();

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


                Session["NuevoToxicologico"] = true;
            }
            else
            {
                Session["NuevoToxicologico"] = false;
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