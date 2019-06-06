using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Examenes_Laboratorio : System.Web.UI.Page
{
    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    DataTable oDataTable = new DataTable();
    private String IdPaciente;
    encryption cryp = new encryption();
    EnumMessage message = new EnumMessage();

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
            Dic.Add("@LAB_ERIT", validaCampos(txtLab_Erit.Text));
            Dic.Add("@LAB_HB", validaCampos(txtLab_Hb.Text));
            Dic.Add("@LAB_HCTO", validaCampos(txtLab_Hcto.Text));
            Dic.Add("@LAB_PLQ", validaCampos(txtLab_Plq.Text));
            Dic.Add("@LAB_LEU", validaCampos(txtLab_Leu.Text));
            Dic.Add("@LAB_GLUCOSA", validaCampos(txtLab_Glucosa.Text));
            Dic.Add("@LAB_UREA", validaCampos(txtLab_Urea.Text));
            Dic.Add("@LAB_CREATININA", validaCampos(txtLab_Creatinina.Text));
            Dic.Add("@LAB_BUN_CREATININA", validaCampos(txtLab_Bun_Creatinina.Text));
            Dic.Add("@LAB_ACIDOURICO", validaCampos(txtLab_AcidoUrico.Text));
            Dic.Add("@LAB_COLESTEROL", validaCampos(txtLab_Colesterol.Text));
            Dic.Add("@LAB_TRIGLICERIDOS", validaCampos(txtLab_Trigliceridos.Text));
            Dic.Add("@LAB_HDL", validaCampos(txtLab_Hdl.Text));
            Dic.Add("@LAB_LDL", validaCampos(txtLab_Ldl.Text));
            Dic.Add("@LAB_VLDL", validaCampos(txtLab_Vldl.Text));
            Dic.Add("@LAB_ATEROGENICO", validaCampos(txtLab_Aterogenico.Text));
            Dic.Add("@LAB_AST_TGO", validaCampos(txtLab_AstTgo.Text));
            Dic.Add("@LAB_ALT_TGP", validaCampos(txtLab_AltTgp.Text));
            Dic.Add("@LAB_BILIRRUBINA", validaCampos(txtLab_Bilirrubina.Text));
            Dic.Add("@LAB_CALCIO", validaCampos(txtLab_Calcio.Text));
            Dic.Add("@LAB_NITROGENO", validaCampos(txtLab_Nitrogeno.Text));
            var DateNow = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);

            Dic.Add("@ID_DOC_REALIZO", ddlRRealizoEM.SelectedValue == "Seleccionar" ? null : ddlRRealizoEM.SelectedValue);
            Dic.Add("@LAB_FECHA_EXAMEN", Convert.ToDateTime(txtLabFechaExamen.Text));



            if (Convert.ToBoolean(Session["NuevoLaboratorio"]))
            {
                dbexam.changeProspecto("setUpdateExamenLaboratorios", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('" + EnumMessage.DatosGenerales + "'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }

            else
            {
                Dic.Add("@LAB_FECHA_INSERTA", DateNow);
                dbexam.changeProspecto("setInsertaExamenLaboratorios", Dic);
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
            oTablePaciente = dbexam.getDataProspect("getExamenLaboratorios", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {
                txtLab_Erit.Text = oTablePaciente.Rows[0]["LAB_ERIT"].ToString();
                txtLab_Hb.Text = oTablePaciente.Rows[0]["LAB_HB"].ToString();
                txtLab_Hcto.Text = oTablePaciente.Rows[0]["LAB_HCTO"].ToString();
                txtLab_Plq.Text = oTablePaciente.Rows[0]["LAB_PLQ"].ToString();
                txtLab_Leu.Text = oTablePaciente.Rows[0]["LAB_LEU"].ToString();
                txtLab_Glucosa.Text = oTablePaciente.Rows[0]["LAB_GLUCOSA"].ToString();
                txtLab_Urea.Text = oTablePaciente.Rows[0]["LAB_UREA"].ToString();
                txtLab_Creatinina.Text = oTablePaciente.Rows[0]["LAB_CREATININA"].ToString();
                txtLab_Bun_Creatinina.Text = oTablePaciente.Rows[0]["LAB_BUN_CREATININA"].ToString();
                txtLab_AcidoUrico.Text = oTablePaciente.Rows[0]["LAB_ACIDOURICO"].ToString();
                txtLab_Colesterol.Text = oTablePaciente.Rows[0]["LAB_COLESTEROL"].ToString();
                txtLab_Trigliceridos.Text = oTablePaciente.Rows[0]["LAB_TRIGLICERIDOS"].ToString();
                txtLab_Hdl.Text = oTablePaciente.Rows[0]["LAB_HDL"].ToString();
                txtLab_Ldl.Text = oTablePaciente.Rows[0]["LAB_LDL"].ToString();
                txtLab_Vldl.Text = oTablePaciente.Rows[0]["LAB_VLDL"].ToString();
                txtLab_Aterogenico.Text = oTablePaciente.Rows[0]["LAB_ATEROGENICO"].ToString();
                txtLab_AstTgo.Text = oTablePaciente.Rows[0]["LAB_AST_TGO"].ToString();
                txtLab_AltTgp.Text = oTablePaciente.Rows[0]["LAB_ALT_TGP"].ToString();
                txtLab_Bilirrubina.Text = oTablePaciente.Rows[0]["LAB_BILIRRUBINA"].ToString();
                txtLab_Calcio.Text = oTablePaciente.Rows[0]["LAB_CALCIO"].ToString();
                txtLab_Nitrogeno.Text = oTablePaciente.Rows[0]["LAB_NITROGENO"].ToString();
                txtLabFechaExamen.Text = oTablePaciente.Rows[0]["LAB_FECHA_EXAMEN"].ToString();

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

                Session["NuevoLaboratorio"] = true;
            }
            else
            {
                Session["NuevoLaboratorio"] = false;
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


    public Decimal validaCampos(String campo)
    {

        if (String.IsNullOrEmpty(campo))
            return 0;

        else
            return Convert.ToDecimal(Convert.ToDecimal(campo).ToString("N2"));
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