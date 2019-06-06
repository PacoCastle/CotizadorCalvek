using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.ClientServices;
using System.Web.Services;


public partial class Examenes_ExamenGral : System.Web.UI.Page
{
    #region Inicializazion

    private DataTable oDataTable_NoPattox = new DataTable();
    private DataTable oDataTable_CatSex = new DataTable();
    private DataTable oDataTable_EdoCivil = new DataTable();
    private DataTable oDataTable_Escolaridad = new DataTable();
    private DataTable oDataTable_Nacionalidad = new DataTable();
    private DataTable oDataTable_Edad = new DataTable();
    private DataTable oDataTable_Alimentacion = new DataTable();
    private DataTable oDataTable_Frecuencia = new DataTable();
    private DataTable oDataTable_HeredoFamiliares = new DataTable();
    private DataTable oDataTable_GrupoRh = new DataTable();
    private DataTable oDataTable_AntGMenarca = new DataTable();
    private DataTable oDataTable_Ivs = new DataTable();
    private DataTable oDataTable_Vsa = new DataTable();
    private DataTable oDataTable_Gesta = new DataTable();
    private DataTable oDataTable_Mpf = new DataTable();
    private DataTable oDataTable_Parto = new DataTable();
    private DataTable oDataTable_Aborto = new DataTable();
    private DataTable oDataTable_Cesarea = new DataTable();
    private DataTable oDataTable_Vision = new DataTable();
    private DataTable oDataTable_VisionCercana = new DataTable();
    private DataTable oDataTable_ExploFisica = new DataTable();
    private DataTable oDataTable_Quiste = new DataTable();
    private DataTable oDataTable_Agudeza = new DataTable();
    private DataTable oDataTable_Arterial = new DataTable();
    private DataTable oDataTable_AlcoholSusp = new DataTable();
    private DataTable oDataTable_Cirucuncision = new DataTable();
    private DataTable oDataTable_Antrevsa = new DataTable();
    private DataTable oDataTable_Antrmpf = new DataTable();
    private DataTable oDataTable_TipoIngreso = new DataTable();
    private DataTable oDataTable_Complexion = new DataTable();
    private DataTable oDataTable_Boca = new DataTable();

    public int IdAptitud;

    string NoPattox;
    string CatSex;
    string estadoCivil;
    string escolaridad;
    string nacionalidad;
    string edad;
    string alimentacion;
    string frecuencia;
    string heredo_familiares;
    string grupoRh;
    string menarca;
    string ivs;
    string vsa;
    string gesta;
    string mpf;
    string parto;
    string aborto;
    string cesarea;
    string vision;
    string visionCercana;
    string ExploFisica;
    string quiste;
    string agudeza;
    string arterial;
    String alcoholSusp;
    string cirucuncision;
    string antrevsa;
    string antrmpf;
    string tipoIngreso;
    string complexion;
    string boca;

    ExamenVO examParam = new ExamenVO();
    SqlClientExamenes dbexam = new SqlClientExamenes();
    getClientsReports getClients = new getClientsReports();
    encryption cryp = new encryption();
    EnumMessage message = new EnumMessage();

    private String IdPaciente;
    private String Id_Modulo;


    #endregion

    #region Eventos

    protected void Page_PreLoad(object sender, EventArgs e)
    {

        lblFecha.Text = DateTime.Now.Date.ToShortDateString();
        NoPattox = "SELECT * FROM TU_EXMED_CAT_NOPATTOXI";
        CatSex = "SELECT * FROM TU_EXMED_CAT_SEX";
        estadoCivil = "SELECT * FROM TU_EXMED_CAT_EDOCIVIL";
        escolaridad = "SELECT * FROM TU_EXMED_CAT_ESCOLARIDAD";
        nacionalidad = "SELECT * FROM TU_EXMED_CAT_NACIONALIDAD";
        edad = "SELECT * FROM TU_EXMED_CAT_EDAD";
        alimentacion = "SELECT * FROM TU_EXMED_CAT_ALIMENTACION";
        frecuencia = "SELECT * FROM TU_EXMED_CAT_FREC";
        heredo_familiares = "SELECT * FROM TU_EXMED_CAT_HEREDOFAMILIARES";
        grupoRh = "SELECT * FROM TU_EXMED_CAT_GRUPO_RH";
        menarca = "SELECT * FROM TU_EXMED_CAT_ANTGMENARCA";
        ivs = "SELECT * FROM TU_EXMED_CAT_IVS";
        vsa = "SELECT * FROM TU_EXMED_CAT_VSA";
        gesta = "SELECT * FROM TU_EXMED_CAT_GESTA";
        mpf = "SELECT * FROM TU_EXMED_CAT_MPF";
        parto = "SELECT * FROM TU_EXMED_CAT_PARTO";
        aborto = "SELECT * FROM TU_EXMED_CAT_ABORTO";
        cesarea = "SELECT * FROM TU_EXMED_CAT_ANTGCESAREA";
        vision = "SELECT * FROM TU_EXMED_CAT_VISION";
        visionCercana = "SELECT * FROM TU_EXMED_CAT_VISIONCERCANA";
        ExploFisica = "SELECT * FROM TU_EXMED_CAT_EXPLOFISICA";
        quiste = "SELECT * FROM TU_EXMED_CAT_QUISTESIN";
        agudeza = "SELECT * FROM TU_EXMED_CAT_AGUDEZA_VISUAL";
        arterial = "SELECT * FROM TU_EXMED_CAT_PRESION_ARTERIAL";
        alcoholSusp = "SELECT * FROM TU_EXMED_CATSUSP";
        cirucuncision = "SELECT * FROM TU_EXMED_CAT_ANTRCIRCUNCISION";
        //(Se elimina) antrevsa = "SELECT * FROM TU_EXMED_CAT_ANTRVSA";
        antrmpf = "SELECT * FROM TU_EXMED_CAT_ANTRMPF";
        tipoIngreso = "SELECT * FROM TU_EXMED_CAT_TIPO_INGRESO";
        complexion = "SELECT * FROM TU_EXMED_CAT_COMPLEXION";
        boca = "SELECT * FROM TU_EXMED_CAT_BOCA";

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            IdPaciente = Request.QueryString["Id_Persona"];
            Id_Modulo = Request.QueryString["idModuloOrigen"];

            if (!string.IsNullOrEmpty(IdPaciente) && !string.IsNullOrEmpty(Id_Modulo))
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
            btnGuardar.Enabled = false;
        }
        finally
        {
            oDataTable_NoPattox.Clear();
            oDataTable_CatSex.Clear();
            oDataTable_EdoCivil.Clear();
            oDataTable_Escolaridad.Clear();
            Session["ControlsPage"] = Master;
            Session["formEdit"] = false;

        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            int result;
            int ashcOption;
            int cigarros;

            llenaParams();


            //Datos Personales.
            Dic.Add("@ID_USUARIO", Convert.ToInt32(Session["usuarioID"].ToString()));
            //Dic.Add("@ID_DG", IdPaciente);
            Dic.Add("@ID_PERSONA", IdPaciente);

            //Dic.Add("@EMPRESA", txtEmpresa.Text);
            //Dic.Add("@DP_NOMBRE", examParam.Nombre);
            //Dic.Add("@DP_PATERNO", txtPaterno.Text);
            //Dic.Add("@DP_MATERNO", txtMaterno.Text);
            //Dic.Add("@DP_ID_SEX", Convert.ToInt32(examParam.Sexo));

            Dic.Add("@DP_LUGAR_NACIMIENTO", txtLugarNac.Text);
            //Dic.Add("@DP_FECHA_NACIMIENTO", examParam.Fecha);
            Dic.Add("@DP_ID_EDOCIVIL", ddlEstadoCivil.SelectedValue);
            Dic.Add("@DP_ID_ESCOLARIDAD", examParam.Escolaridad);
            Dic.Add("@DP_TELEFONO", examParam.Telefono);
            Dic.Add("@DP_DIRECCION", examParam.Direccion);
            Dic.Add("@DP_ID_NACIONALIDAD", examParam.Nacionalidad);


            //Historia Laboral
            Dic.Add("@HL_ID_TIPO_INGRESO", examParam.HLIdTipoIngreso);
            Dic.Add("@HL_PUESTO_SOL", examParam.HlPuestoSol);
            Dic.Add("@HL_AREA", examParam.HlArea);
            Dic.Add("@HL_ULT_EMPLEO", examParam.HlUltimoEmpleo);
            Dic.Add("@HL_FACTOR_RIESGO", examParam.HlFactorRiesgo);
            Dic.Add("@HL_ANTIGUEDAD", examParam.HlAntiguedad);
            Dic.Add("@HL_ULT_EMPLEO2", examParam.HlUltimoEmpleotwo);
            Dic.Add("@HL_FACTOR_RIESGO_2", examParam.HlFactorRiesgotwo);
            Dic.Add("@HL_ANTIGUEDAD_2", examParam.HlAntiguedadtwo);
            Dic.Add("@HL_PUESTO", txtPuesto1.Text);
            Dic.Add("@HL_PUESTO2", txtPuesto2.Text);

            //Historia Laboral Periodico

            Dic.Add("@HL_PUESTO_ACT", examParam.HlPPuestoAct);
            Dic.Add("@HL_AREA_ACT", examParam.HlPAreaAct);
            Dic.Add("@HL_ANTIGUEDAD_PUESTO_ACT", examParam.HlPAntiguedadPuestoAct);
            Dic.Add("@HL_ANTIGUEDAD_AREA_ACT", examParam.HlPAntiguedadAreaAct);
            Dic.Add("@HL_FACTOR_RIESGO_ACT", examParam.HlPFactorRiesgoAct);
            Dic.Add("@HL_ANTECEDENTES", examParam.HlAntecedentesPenales);
            Dic.Add("@HL_ANTECEDENTES_ESP", examParam.HlEspecificar);


            Dic.Add("@AHF_ID_DIABETES", examParam.AhfDiabetes);
            Dic.Add("@AHF_ID_HTA", examParam.AhfHta);
            Dic.Add("@AHF_ID_EPILEPSIA", examParam.AhfEpilepsia);
            Dic.Add("@AHF_ID_CARDIOPATIA", examParam.AhfCardipatia);
            Dic.Add("@AHF_ID_RENALES", examParam.AhfRenales);
            Dic.Add("@AHF_ID_ASMA", examParam.AhfAsma);
            Dic.Add("@AHF_ID_CANCER", examParam.AhfCancer);
            Dic.Add("@AHF_ID_MENTALES", examParam.AhfMentales);
            Dic.Add("@AHF_OTRAS", examParam.Ahfotras);

            Dic.Add("@ANPT_ID_ALCOHOLISMO", examParam.AptAlcoholismo);
            Dic.Add("@ANPT_EDAD_ALCOHOLISMO", examParam.AptEdadComienzo);
            Dic.Add("@ANPT_ID_FREC_ALCOHOLISMO", examParam.AptFrecuencia);
            Dic.Add("@ANPT_ID_SUSP_ALCOHOLISMO", examParam.AptSusAlcoholismo);
            Dic.Add("@ANPT_TIEMPO_SUSP_ALCOHOLISMO", examParam.AptTiempoSuspAlcoholismo);
            Dic.Add("@ANPT_ID_TABAQUISMO", examParam.AptTabaquismo);
            Dic.Add("@ANPT_EDAD_TABAQUISMO", examParam.AptEdadComiecoTwo);
            Dic.Add("@ANPT_ID_FREC_TABAQUISMO", examParam.AptFrecuenciaTwo);
            Dic.Add("@ANPT_ID_SUSP_TABAQUISMO", examParam.AptSuspTabaquismo);
            Dic.Add("@ANPT_TIEMPO_SUSP_TABAQUISMO", examParam.AptTiempoSuspTabaquismo);
            if (!string.IsNullOrEmpty(examParam.AptCantidadDiaCigarros)) cigarros = Convert.ToInt32(examParam.AptCantidadDiaCigarros); else cigarros = 0;
            Dic.Add("@ANPT_CANTIDAD_DIA_CIGARROS", cigarros);
            Dic.Add("@ANPT_ID_DROGAS", examParam.AptDrogas);
            Dic.Add("@ANPT_DROGAS_ESPEC", examParam.AptDrogasEspecifique);
            Dic.Add("@ANPT_ULT_CONSUMO", examParam.AptUltimoConsumo);
            Dic.Add("@ANPT_ID_EJERCICIO", examParam.AptEjercicio);
            Dic.Add("@ANPT_EJERCICIO_ESPEC", examParam.AptEspecEjercicio);
            Dic.Add("@ANPT_FREC_EJERCICIO", examParam.AptFrecuenciaTree);
            Dic.Add("@ANPT_ID_ALIMENTACION", examParam.AptAlimentacion);
            Dic.Add("@ANPT_ID_GRUPO_RH", examParam.AptGrupoYRh);
            Dic.Add("@ANPT_ID_TATUAJES", examParam.Apttatuajes);
            Dic.Add("@ANPT_TATUAJES_ESPECIFIQUE", examParam.AptEspecifique);
            Dic.Add("@ANPT_TX_MEDICO_ACTUAL", examParam.AptTxMedicoActual);

            Dic.Add("@AP_ID_DIABETES", examParam.ApDiabetes);
            Dic.Add("@AP_ID_TIFOIDEA", examParam.ApTifoidea);
            Dic.Add("@AP_ID_RENALES", examParam.ApRenales);
            Dic.Add("@AP_ID_HERNIAS", examParam.ApHernias);
            Dic.Add("@AP_ID_HTA", examParam.AhfHta);
            Dic.Add("@AP_ID_ASMA", examParam.AhfAsma);
            Dic.Add("@AP_ID_EPILEPSIA", examParam.AhfEpilepsia);
            Dic.Add("@AP_ID_HEMORROIDES", examParam.ApHemorroides);
            Dic.Add("@AP_ID_CANCER", examParam.ApCancer);
            Dic.Add("@AP_ID_ALERGIAS", examParam.ApAlergias);
            Dic.Add("@AP_ID_VERTIGO", examParam.ApVertigo);
            Dic.Add("@AP_ID_TRAUMATISMO", examParam.ApTraumatismos);
            Dic.Add("@AP_ID_CARDIOPATIA", examParam.ApCardipatias);
            Dic.Add("@AP_ID_PAROTIDITIS", examParam.ApParotiditis);
            Dic.Add("@AP_ID_DESMAYOS", examParam.ApDesmayos);
            Dic.Add("@AP_ID_PATOLOGIAS", examParam.ApPatologiaCVertebral);
            Dic.Add("@AP_ID_BRONQUITIS", examParam.ApBronquitis);
            Dic.Add("@AP_ID_DERMATITIS", examParam.ApDermatitis);
            Dic.Add("@AP_ID_FRACTURAS", examParam.ApFracturas);
            Dic.Add("@AP_ID_GINECOLOGICOS", examParam.ApGinecologicos);
            Dic.Add("@AP_ID_NEUMONIAS", examParam.ApNeumonias);
            Dic.Add("@AP_ID_VARICES", examParam.ApVarices);
            Dic.Add("@AP_ID_CIRUGIAS", examParam.ApCirugias);
            Dic.Add("@AP_ID_ENF_TRANS_SEXUAL", examParam.ApEnfTransSexual);

            Dic.Add("@AP_ID_EXANTEMATICAS", examParam.ApExantematicas);
            Dic.Add("@AP_OTRAS", examParam.ApOtras);
            Dic.Add("@AP_OTRAS_ESPECIFIQUE", examParam.ApEspecificacion);

            Dic.Add("@AG_ID_MENARCA", examParam.AgMenarca);
            Dic.Add("@AG_ID_IVS", examParam.AgIvs);
            Dic.Add("@AG_ID_VSA", examParam.AgVsa);
            Dic.Add("@AG_FUM", string.IsNullOrEmpty(examParam.AgFum) ? Convert.ToDateTime("01/01/1900") : Convert.ToDateTime(examParam.AgFum));
            Dic.Add("@AG_RITMO", examParam.AgRitmo);
            Dic.Add("@AG_ID_MPF", examParam.AgMpf);
            Dic.Add("@AG_DOC", string.IsNullOrEmpty(examParam.AgDoc) ? Convert.ToDateTime("01/01/1900") : Convert.ToDateTime(examParam.AgDoc));
            Dic.Add("@AG_ID_GESTA", examParam.AgGesta);
            Dic.Add("@AG_ID_PARTO", examParam.AgParto);
            Dic.Add("@AG_ID_CESAREA", examParam.AgCesarea);
            Dic.Add("@AG_ID_ABORTO", examParam.AgAborto);
            Dic.Add("@AG_FUP_FUC", string.IsNullOrEmpty(examParam.AgFupFuc) ? Convert.ToDateTime("01/01/1900") : Convert.ToDateTime(examParam.AgFupFuc));


            Dic.Add("@AR_IVS", txtARIvs.Text);
            Dic.Add("@AR_DOC_PROSTATA", txtARProstata.Text);
            Dic.Add("@AR_ID_VSA", ddlARVsa.SelectedValue);
            Dic.Add("@AR_ID_CIRCUNCISION", ddlARCircuncision.SelectedValue);
            Dic.Add("@AR_ID_MPF", ddlARMPF.SelectedValue);


            Dic.Add("@SSV_TA", txtTa.Text);
            Dic.Add("@SSV_FC", examParam.SsvFcMin);
            Dic.Add("@SSV_FR", examParam.SsvFrMin);
            Dic.Add("@SSV_T", examParam.SsvT);
            Dic.Add("@SSV_PESO", examParam.SsvpesoKg);
            Dic.Add("@SSV_TALLA", examParam.SsvTallaCm);
            Dic.Add("@SSV_PERIMETRO_CINTURA", examParam.SsvCintura);
            Dic.Add("@SSV_PERIMETRO_CADERA", examParam.SsvCadera);
            //Dic.Add("@SSV_IMC", examParam.SsvImc);
            Dic.Add("@SSV_ID_COMPLEXION", examParam.SsvComplexion);

            Dic.Add("@EO_ID_VISION_LEJANA_OI", examParam.EoVisionLejenaOi);
            Dic.Add("@EO_ID_VISION_CERCANA_OI ", examParam.EoVisionCercanaOi);
            Dic.Add("@EO_ID_VC_CORREGIDA_OI", examParam.EoCercanaCorregidaOi);
            Dic.Add("@EO_ID_VISION_LEJANA_OD", examParam.EoVisionLejanaOd);
            Dic.Add("@EO_ID_VISION_CERCANA_OD", examParam.EoVisionCercanaOd);
            Dic.Add("@EO_ID_VL_CORREGIDA_OI", examParam.EoCorregidaOi);

            Dic.Add("@EO_ID_VL_CORREGIDA_OD", examParam.EoCorregidaOd);
            Dic.Add("@EO_ID_VC_CORREGIDA_OD", examParam.EoCercanaCorregidaOd);


            Dic.Add("@EO_REFLEJOS", examParam.EoReflejos);
            Dic.Add("@EO_DALTONISMO", examParam.EoDaltonismo);
            Dic.Add("@EO_AMPIMETRIA", examParam.EoCampimetria);

            Dic.Add("@EF_NEUROLOGICO", examParam.EfNeurologico);
            Dic.Add("@EF_CABEZA", examParam.EfCraneo);
            Dic.Add("@EF_PIEL_FANERAS", examParam.EfPielyFaneras);
            Dic.Add("@EF_OIDOS_CAD", examParam.EfOidosCad);
            Dic.Add("@EF_OIDOS_CAI", examParam.EfOidosCai);
            Dic.Add("@EF_OJOS", examParam.EfOjos);
            Dic.Add("@EF_ID_BOCA", examParam.EfBoca);
            Dic.Add("@EF_BOCA", txtEFBoca.Text);
            Dic.Add("@EF_NARIZ", examParam.EfNariz);
            Dic.Add("@EF_FARINGE", examParam.EfFaringe);
            Dic.Add("@EF_CUELLO", examParam.EfCuello);
            Dic.Add("@EF_TORAX", examParam.EfTorax);
            Dic.Add("@EF_CORAZON", examParam.EfCorazon);
            Dic.Add("@EF_CAMPOS_PULMONARES", examParam.EfCamposPulmonares);
            Dic.Add("@EF_ABDOMEN", examParam.EfAbdomen);
            Dic.Add("@EF_GENITOURINARIO", txtEFGen.Text);
            Dic.Add("@EF_COLUMNA_VERTEBRAL", examParam.EfColumnaVertebral);
            Dic.Add("@EF_TEST_DE_ADAM", examParam.EfTestAdam);
            Dic.Add("@EF_Ms_SUPERIORES", examParam.EfMsSuperiores);
            Dic.Add("@EF_FMD_SUP", examParam.EfFuerzaMuscularDaniels);
            Dic.Add("@EF_Ms_INFERIORES", examParam.EfMsInferirores);
            Dic.Add("@EF_FMD_INF", txtFuerzaMuscularDanielsInf.Text);
            Dic.Add("@EF_CIRCULACION", examParam.EfCirculacion);
            Dic.Add("@EF_ARCO_MOVILIDAD", examParam.EfArcoMovilidad);
            Dic.Add("@EF_TONO_MUSCULAR", examParam.EfTonoMuscular);
            Dic.Add("@EF_COORDINACION", examParam.EfCoordinacion);
            Dic.Add("@EF_ID_ROMBERG", examParam.EfRomberg);
            Dic.Add("@EF_ID_PRUEBA_FINKELSTEIN", examParam.EfPruebaFinkelestein);
            Dic.Add("@EF_ID_SIGNO_TINEL", examParam.EfSignoTinel);
            Dic.Add("@EF_ID_PRUEBA_PHANEL", examParam.EfPruebaPhabel);
            Dic.Add("@EF_ID_PRUEBA_LASAGUE", examParam.EfPruebaLasage);
            Dic.Add("@EF_ID_SIGNO_BRAGGARD", examParam.EfSignoBraggard);
            Dic.Add("@EF_ID_QSINOVIAL", examParam.EfPresenciaQuiste);
            Dic.Add("@EF_QSINOVIAL_ESPEC", examParam.EfEspecificar);


            //INMUNIZACIONES
            Dic.Add("@INM_ID_RUBEOLA", examParam.InmRubeola);
            Dic.Add("@INM_ID_SARAMPION", examParam.InmSarampion);
            Dic.Add("@INM_ID_HEPATITIS", examParam.InmHepatitisB);
            Dic.Add("@INM_ID_NEUMOCOCO", examParam.InmNeumococo);
            Dic.Add("@INM_ID_INFLUENZA", examParam.InmInfluenza);
            Dic.Add("@INM_ID_TOXOIDE_TETA", examParam.InmToxoide);
            Dic.Add("@INM_OTRA", examParam.InmOtra);
            Dic.Add("@INM_COMENTARIOS", examParam.InmProximaDosis);


            Dic.Add("@ID_ID_AGUDEZA_VISUAL", examParam.IDAgudezaNormal);
            Dic.Add("@ID_ID_PRESION_ARTERIAL", examParam.IDPresionArt);
            Dic.Add("@ID_COMENTARIOS", txtIDComentarios.Text);

            if (rdbASHCBueno.Checked)
                ashcOption = 0;
            else if (rdbASHCRegular.Checked)
                ashcOption = 1;
            else
                ashcOption = 2;

            Dic.Add("@ASHC_ID_APTITUD_HALLAZGOS", ashcOption);
            Dic.Add("@ASHC_RECOMENDACIONES", txtASHCRecomencaciones.Text);

            Dic.Add("@VMVA_ID_REALIZO_EM", examParam.RRealizoEM == "Seleccionar" ? null : examParam.RRealizoEM);
            Dic.Add("@VMVA_ID_REVISO_EM",  examParam.RRevisoEM == "Seleccionar" ? null : examParam.RRevisoEM);
            //Dic.Add("@VMVA_REALIZO_CP", examParam.RCedProf);
            //Dic.Add("@VMVA_REVISO_CP", examParam.RCedProftwo);
            Dic.Add("@ID_MODULO_ORIGEN", Id_Modulo);

            var DateNow = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);

            if (Convert.ToBoolean(Session["NuevoExamenGral"]))
            {
                Dic.Add("@FECHA_MODIFICACION", DateNow);
                dbexam.changeProspecto("setUpdateExamenMedico", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('" + EnumMessage.DatosGenerales + "'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
                btnGuardar.Visible = true;
            }

            else
            {
                Dic.Add("@FECHA_CREACION", DateNow);
                dbexam.changeProspecto("setInsertaExamenMedico", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess('" + EnumMessage.DatosGenerales + "'," + (int)EnumMessage.Message.ShowAlertSucess + ");", true);
                btnGuardar.Visible = true;
            }

            Session["NuevoExamenGral"] = false;

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


    protected void btnReporte_Click(object sender, EventArgs e)
    {
        try
        {

            if (string.IsNullOrEmpty(IdPaciente))
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertInfo();", true);
            else
                Response.Write("<script> window.open('../Reportes/Examenes/General.aspx?Id_ExMedico=" + IdPaciente + "','_blank'); </script>");
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
        ClientScript.RegisterStartupScript(this.GetType(), "abrePestaña", "mostrarPestaña();", true);
    }

    protected void ddlRRevisoEM_SelectedIndexChanged(object sender, EventArgs e)
    {
        imgFirmaReviso.Visible = true;
        List<string> list = new List<string>();
        if (ddlRRevisoEM.SelectedIndex != 0)
        {
            list = getUrlImage(ddlRRevisoEM.SelectedValue);
            txtRCedProftwo.Text = list[0];
            imgFirmaReviso.ImageUrl = list[1];
        }
        else
        {
            imgFirmaReviso.Visible = false;
            txtRCedProftwo.Text = String.Empty;
        }

        ClientScript.RegisterStartupScript(this.GetType(), "abrePestaña", "mostrarPestaña();", true);
    }

    #endregion

    #region Metodos

    private void llenaDrops()
    {
        //Obtiene catalogo de Examen Patologico 
        oDataTable_NoPattox = getTable(NoPattox);
        //Obtiene catalogo de sexo
        oDataTable_CatSex = getTable(CatSex);
        oDataTable_EdoCivil = getTable(estadoCivil);
        oDataTable_Escolaridad = getTable(escolaridad);
        oDataTable_Nacionalidad = getTable(nacionalidad);
        oDataTable_Edad = getTable(edad);
        oDataTable_Alimentacion = getTable(alimentacion);
        oDataTable_Frecuencia = getTable(frecuencia);
        oDataTable_HeredoFamiliares = getTable(heredo_familiares);
        oDataTable_AntGMenarca = getTable(menarca);
        oDataTable_TipoIngreso = getTable(tipoIngreso);


        oDataTable_Ivs = getTable(ivs);
        oDataTable_Vsa = getTable(vsa);
        oDataTable_Gesta = getTable(gesta);
        oDataTable_Mpf = getTable(mpf);
        oDataTable_Parto = getTable(parto);
        oDataTable_Aborto = getTable(aborto);
        oDataTable_Cesarea = getTable(cesarea);
        oDataTable_Vision = getTable(vision);
        oDataTable_VisionCercana = getTable(visionCercana);
        oDataTable_ExploFisica = getTable(ExploFisica);
        oDataTable_Quiste = getTable(quiste);

        oDataTable_GrupoRh = getTable(grupoRh);

        oDataTable_Agudeza = getTable(agudeza);
        oDataTable_Arterial = getTable(arterial);

        oDataTable_AlcoholSusp = getTable(alcoholSusp);
        oDataTable_Cirucuncision = getTable(cirucuncision);
        oDataTable_Antrevsa = getTable(antrevsa);
        oDataTable_Antrmpf = getTable(antrmpf);
        oDataTable_Complexion = getTable(complexion);
        oDataTable_Boca = getTable(boca);

        //Datos Personales
        ddlSexo.DataSource = oDataTable_CatSex;
        ddlSexo.DataValueField = "ID_SEX";
        ddlSexo.DataTextField = "CAT_SEX";
        ddlSexo.DataBind();

        ddlEstadoCivil.DataSource = oDataTable_EdoCivil;
        ddlEstadoCivil.DataValueField = "ID_EDOCIVIL";
        ddlEstadoCivil.DataTextField = "CAT_EDOCIVIL";
        ddlEstadoCivil.DataBind();

        ddlEscolaridad.DataSource = oDataTable_Escolaridad;
        ddlEscolaridad.DataValueField = "ID_ESCOLARIDAD";
        ddlEscolaridad.DataTextField = "CAT_ESCOLARIDAD";
        ddlEscolaridad.DataBind();


        ddlNacionalidad.DataSource = oDataTable_Nacionalidad;
        ddlNacionalidad.DataValueField = "ID_NACIONALIDAD";
        ddlNacionalidad.DataTextField = "CAT_NACIONALIDAD";
        ddlNacionalidad.DataBind();


        rblOpciones.DataSource = oDataTable_TipoIngreso;
        rblOpciones.DataValueField = "ID_TIPO_INGRESO";
        rblOpciones.DataTextField = "CAT_TIPO_INGRESO";
        rblOpciones.DataBind();
        rblOpciones.SelectedValue = "0";


        //Antecedentes Heredo-Familiares

        ddlAHFDiabetes.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFDiabetes.DataValueField = "ID_HEREDOF";
        ddlAHFDiabetes.DataTextField = "CAT_HEREDOF";
        ddlAHFDiabetes.DataBind();

        ddlAHTAHeredo.DataSource = oDataTable_HeredoFamiliares;
        ddlAHTAHeredo.DataValueField = "ID_HEREDOF";
        ddlAHTAHeredo.DataTextField = "CAT_HEREDOF";
        ddlAHTAHeredo.DataBind();


        ddlAHFEpilepsia.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFEpilepsia.DataValueField = "ID_HEREDOF";
        ddlAHFEpilepsia.DataTextField = "CAT_HEREDOF";
        ddlAHFEpilepsia.DataBind();


        ddlAHFCardio.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFCardio.DataValueField = "ID_HEREDOF";
        ddlAHFCardio.DataTextField = "CAT_HEREDOF";
        ddlAHFCardio.DataBind();

        ddlAHFRenalesHeredo.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFRenalesHeredo.DataValueField = "ID_HEREDOF";
        ddlAHFRenalesHeredo.DataTextField = "CAT_HEREDOF";
        ddlAHFRenalesHeredo.DataBind();


        ddlAHFAsma.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFAsma.DataValueField = "ID_HEREDOF";
        ddlAHFAsma.DataTextField = "CAT_HEREDOF";
        ddlAHFAsma.DataBind();


        ddlAHFCancer.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFCancer.DataValueField = "ID_HEREDOF";
        ddlAHFCancer.DataTextField = "CAT_HEREDOF";
        ddlAHFCancer.DataBind();


        ddlAHFMentales.DataSource = oDataTable_HeredoFamiliares;
        ddlAHFMentales.DataValueField = "ID_HEREDOF";
        ddlAHFMentales.DataTextField = "CAT_HEREDOF";
        ddlAHFMentales.DataBind();

        //Antecedentes No Patologicos

        ddlAPTAlcoholismo.DataSource = oDataTable_NoPattox;
        ddlAPTAlcoholismo.DataValueField = "ID_NOPAT";
        ddlAPTAlcoholismo.DataTextField = "CAT_NOPATTOXI";
        ddlAPTAlcoholismo.DataBind();

        ddlAPTTabaquismo.DataSource = oDataTable_NoPattox;
        ddlAPTTabaquismo.DataValueField = "ID_NOPAT";
        ddlAPTTabaquismo.DataTextField = "CAT_NOPATTOXI";
        ddlAPTTabaquismo.DataBind();


        ddlAPTEdadComienzo.DataSource = oDataTable_Edad;
        ddlAPTEdadComienzo.DataValueField = "ID_EDAD";
        ddlAPTEdadComienzo.DataTextField = "CAT_EDAD";
        ddlAPTEdadComienzo.DataBind();


        ddlAPTEdadComienzoTwo.DataSource = oDataTable_Edad;
        ddlAPTEdadComienzoTwo.DataValueField = "ID_EDAD";
        ddlAPTEdadComienzoTwo.DataTextField = "CAT_EDAD";
        ddlAPTEdadComienzoTwo.DataBind();

        ddlAPTFrecuencia.DataSource = oDataTable_Frecuencia;
        ddlAPTFrecuencia.DataValueField = "ID_FREC";
        ddlAPTFrecuencia.DataTextField = "CAT_FRECUENCIA";
        ddlAPTFrecuencia.DataBind();

        ddlAPTFrecuenciatwo.DataSource = oDataTable_Frecuencia;
        ddlAPTFrecuenciatwo.DataValueField = "ID_FREC";
        ddlAPTFrecuenciatwo.DataTextField = "CAT_FRECUENCIA";
        ddlAPTFrecuenciatwo.DataBind();


        ddlAPTAlcoholSusp.DataSource = oDataTable_AlcoholSusp;
        ddlAPTAlcoholSusp.DataValueField = "ID_SUSP";
        ddlAPTAlcoholSusp.DataTextField = "CAT_SUSPENSION";
        ddlAPTAlcoholSusp.DataBind();

        ddlAPTTabaqSusp.DataSource = oDataTable_AlcoholSusp;
        ddlAPTTabaqSusp.DataValueField = "ID_SUSP";
        ddlAPTTabaqSusp.DataTextField = "CAT_SUSPENSION";
        ddlAPTTabaqSusp.DataBind();

        //ddlAPTFrecuenciaTree.DataSource = oDataTable_Frecuencia;
        //ddlAPTFrecuenciaTree.DataValueField = "ID_FREC";
        //ddlAPTFrecuenciaTree.DataTextField = "CAT_FRECUENCIA";
        //ddlAPTFrecuenciaTree.DataBind();

        ddlAPTAlimentacion.DataSource = oDataTable_Alimentacion;
        ddlAPTAlimentacion.DataValueField = "ID_ALIM";
        ddlAPTAlimentacion.DataTextField = "CAT_ALIM";
        ddlAPTAlimentacion.DataBind();

        ddlAPTGrupoRh.DataSource = oDataTable_GrupoRh;
        ddlAPTGrupoRh.DataValueField = "ID_GRUPO_RH";
        ddlAPTGrupoRh.DataTextField = "CAT_GRUPO_RH";
        ddlAPTGrupoRh.DataBind();

        ddlAPTTatuajes.DataSource = oDataTable_NoPattox;
        ddlAPTTatuajes.DataValueField = "ID_NOPAT";
        ddlAPTTatuajes.DataTextField = "CAT_NOPATTOXI";
        ddlAPTTatuajes.DataBind();

        ddlAPTDrogas.DataSource = oDataTable_NoPattox;
        ddlAPTDrogas.DataValueField = "ID_NOPAT";
        ddlAPTDrogas.DataTextField = "CAT_NOPATTOXI";
        ddlAPTDrogas.DataBind();


        ddlAPTEjercicio.DataSource = oDataTable_NoPattox;
        ddlAPTEjercicio.DataValueField = "ID_NOPAT";
        ddlAPTEjercicio.DataTextField = "CAT_NOPATTOXI";
        ddlAPTEjercicio.DataBind();


        ddlComplexion.DataSource = oDataTable_Complexion;
        ddlComplexion.DataValueField = "ID_COMPLEXION";
        ddlComplexion.DataTextField = "CAT_COMPLEXION";
        ddlComplexion.SelectedIndex = -1;
        ddlComplexion.DataBind();


        //Antecendentes Patologicos
        RdlAPDiabetes.DataSource = oDataTable_NoPattox;
        RdlAPDiabetes.DataValueField = "ID_NOPAT";
        RdlAPDiabetes.DataTextField = "CAT_NOPATTOXI";
        RdlAPDiabetes.DataBind();
        RdlAPDiabetes.SelectedValue = "0";

        rblAPTifoidea.DataSource = oDataTable_NoPattox;
        rblAPTifoidea.DataBind();
        rblAPTifoidea.SelectedValue = "0";

        rblAPRenales.DataSource = oDataTable_NoPattox;
        rblAPRenales.DataBind();
        rblAPRenales.SelectedValue = "0";

        rblAPHernias.DataSource = oDataTable_NoPattox;
        rblAPHernias.DataBind();
        rblAPHernias.SelectedValue = "0";

        rblAPHTA.DataSource = oDataTable_NoPattox;
        rblAPHTA.DataBind();
        rblAPHTA.SelectedValue = "0";

        rblAPAsma.DataSource = oDataTable_NoPattox;
        rblAPAsma.DataBind();
        rblAPAsma.SelectedValue = "0";

        ddlAPEpilepsia.DataSource = oDataTable_NoPattox;
        ddlAPEpilepsia.DataBind();
        ddlAPEpilepsia.SelectedValue = "0";

        ddlAPHemorroides.DataSource = oDataTable_NoPattox;
        ddlAPHemorroides.DataBind();
        ddlAPHemorroides.SelectedValue = "0";

        ddlAPCancer.DataSource = oDataTable_NoPattox;
        ddlAPCancer.DataBind();
        ddlAPCancer.SelectedValue = "0";

        ddlAPAlergias.DataSource = oDataTable_NoPattox;
        ddlAPAlergias.DataBind();
        ddlAPAlergias.SelectedValue = "0";

        ddlAPVertigo.DataSource = oDataTable_NoPattox;
        ddlAPVertigo.DataBind();
        ddlAPVertigo.SelectedValue = "0";

        ddlAPTraumaCraneales.DataSource = oDataTable_NoPattox;
        ddlAPTraumaCraneales.DataBind();
        ddlAPTraumaCraneales.SelectedValue = "0";

        ddlAPCardipatias.DataSource = oDataTable_NoPattox;
        ddlAPCardipatias.DataBind();
        ddlAPCardipatias.SelectedValue = "0";

        ddlAPParatiditis.DataSource = oDataTable_NoPattox;
        ddlAPParatiditis.DataBind();
        ddlAPParatiditis.SelectedValue = "0";

        ddlAPDesmayos.DataSource = oDataTable_NoPattox;
        ddlAPDesmayos.DataBind();
        ddlAPDesmayos.SelectedValue = "0";

        ddlAPPatCVertebral.DataSource = oDataTable_NoPattox;
        ddlAPPatCVertebral.DataBind();
        ddlAPPatCVertebral.SelectedValue = "0";

        ddlAPBronquitis.DataSource = oDataTable_NoPattox;
        ddlAPBronquitis.DataBind();
        ddlAPBronquitis.SelectedValue = "0";

        ddlAPDermatitis.DataSource = oDataTable_NoPattox;
        ddlAPDermatitis.DataBind();
        ddlAPDermatitis.SelectedValue = "0";

        ddlAPFracturas.DataSource = oDataTable_NoPattox;
        ddlAPFracturas.DataBind();
        ddlAPFracturas.SelectedValue = "0";

        ddlAPGinecologicos.DataSource = oDataTable_NoPattox;
        ddlAPGinecologicos.DataBind();
        ddlAPGinecologicos.SelectedValue = "0";

        ddlAPNeumonias.DataSource = oDataTable_NoPattox;
        ddlAPNeumonias.DataBind();
        ddlAPNeumonias.SelectedValue = "0";

        ddlAPVarices.DataSource = oDataTable_NoPattox;
        ddlAPVarices.DataBind();
        ddlAPVarices.SelectedValue = "0";

        ddlAPEnfTransSex.DataSource = oDataTable_NoPattox;
        ddlAPEnfTransSex.DataBind();
        ddlAPEnfTransSex.SelectedValue = "0";

        ddlAPTuberculosis.DataSource = oDataTable_NoPattox;
        ddlAPTuberculosis.DataBind();
        ddlAPTuberculosis.SelectedValue = "0";

        ddlAPHepatitis.DataSource = oDataTable_NoPattox;
        ddlAPHepatitis.DataBind();
        ddlAPHepatitis.SelectedValue = "0";

        ddlAPTransfuciones.DataSource = oDataTable_NoPattox;
        ddlAPTransfuciones.DataBind();
        ddlAPTransfuciones.SelectedValue = "0";

        ddlAPEndocrino.DataSource = oDataTable_NoPattox;
        ddlAPEndocrino.DataBind();
        ddlAPEndocrino.SelectedValue = "0";

        ddlAPPsiquiatricas.DataSource = oDataTable_NoPattox;
        ddlAPPsiquiatricas.DataBind();
        ddlAPPsiquiatricas.SelectedValue = "0";

        ddlAPCirugias.DataSource = oDataTable_NoPattox;
        ddlAPCirugias.DataBind();
        ddlAPCirugias.SelectedValue = "0";


        ddlAPExantematicas.DataSource = oDataTable_NoPattox;
        ddlAPExantematicas.DataBind();
        ddlAPExantematicas.SelectedValue = "0";

        //INMUNIZACIONES
        //ddlIRubeola.DataSource = oDataTable_NoPattox;
        //ddlIRubeola.DataValueField = "ID_NOPAT";
        //ddlIRubeola.DataTextField = "CAT_NOPATTOXI";
        //ddlIRubeola.DataBind();

        //ddlISarampeon.DataSource = oDataTable_NoPattox;
        //ddlISarampeon.DataValueField = "ID_NOPAT";
        //ddlISarampeon.DataTextField = "CAT_NOPATTOXI";
        //ddlISarampeon.DataBind();

        //ddlITexoideTetanico.DataSource = oDataTable_NoPattox;
        //ddlITexoideTetanico.DataValueField = "ID_NOPAT";
        //ddlITexoideTetanico.DataTextField = "CAT_NOPATTOXI";
        //ddlITexoideTetanico.DataBind();

        //ddlINeumococo.DataSource = oDataTable_NoPattox;
        //ddlINeumococo.DataValueField = "ID_NOPAT";
        //ddlINeumococo.DataTextField = "CAT_NOPATTOXI";
        //ddlINeumococo.DataBind();

        //ddlIIfluenza.DataSource = oDataTable_NoPattox;
        //ddlIIfluenza.DataValueField = "ID_NOPAT";
        //ddlIIfluenza.DataTextField = "CAT_NOPATTOXI";
        //ddlIIfluenza.DataBind();

        //ddlIHepatitsB.DataSource = oDataTable_NoPattox;
        //ddlIHepatitsB.DataValueField = "ID_NOPAT";
        //ddlIHepatitsB.DataTextField = "CAT_NOPATTOXI";
        //ddlIHepatitsB.DataBind();


        ddlEFBoca.DataSource = oDataTable_Boca;
        ddlEFBoca.DataBind();

        txtIDSaludBucal.Text = ddlEFBoca.SelectedItem.Text;


        //ANTECEDENTES GINECOLOGICOS

        ddlAGMenarca.DataSource = oDataTable_AntGMenarca;
        ddlAGMenarca.DataValueField = "ID_MENARCA";
        ddlAGMenarca.DataTextField = "CAT_MENARCA";
        ddlAGMenarca.DataBind();

        ddlAGIvs.DataSource = oDataTable_Ivs;
        ddlAGIvs.DataValueField = "ID_IVS";
        ddlAGIvs.DataTextField = "CAT_IVS";
        ddlAGIvs.DataBind();

        ddlAGVsa.DataSource = oDataTable_Vsa;
        ddlAGVsa.DataValueField = "ID_VSA";
        ddlAGVsa.DataTextField = "CAT_VSA";
        ddlAGVsa.DataBind();

        ddlAGGesta.DataSource = oDataTable_Gesta;
        ddlAGGesta.DataValueField = "ID_GESTA";
        ddlAGGesta.DataTextField = "CAT_GESTA";
        ddlAGGesta.DataBind();

        ddlAGMpf.DataSource = oDataTable_Mpf;
        ddlAGMpf.DataValueField = "ID_MPF";
        ddlAGMpf.DataTextField = "CAT_MPF";
        ddlAGMpf.DataBind();

        ddlAGParto.DataSource = oDataTable_Parto;
        ddlAGParto.DataValueField = "ID_PARTO";
        ddlAGParto.DataTextField = "CAT_PARTO";
        ddlAGParto.DataBind();

        ddlAGAborto.DataSource = oDataTable_Aborto;
        ddlAGAborto.DataValueField = "ID_ABORTO";
        ddlAGAborto.DataTextField = "CAT_ABORTO";
        ddlAGAborto.DataBind();

        ddlAGCesarea.DataSource = oDataTable_Aborto;
        ddlAGCesarea.DataValueField = "ID_ABORTO";
        ddlAGCesarea.DataTextField = "CAT_ABORTO";
        ddlAGCesarea.DataBind();


        //ANTECEDENTES REPRODUCTIVOS

        ddlARCircuncision.DataSource = oDataTable_Cirucuncision;
        ddlARCircuncision.DataValueField = "ID_CIRCUNCISION";
        ddlARCircuncision.DataTextField = "CAT_CIRCUNCISION";
        ddlARCircuncision.DataBind();

        ddlARVsa.DataSource = oDataTable_Vsa;
        ddlARVsa.DataValueField = "ID_VSA";
        ddlARVsa.DataTextField = "CAT_VSA";
        ddlARVsa.DataBind();


        ddlARMPF.DataSource = oDataTable_Antrmpf;
        ddlARMPF.DataValueField = "ID_MPF";
        ddlARMPF.DataTextField = "CAT_MPF";
        ddlARMPF.DataBind();


        //Examen Oftalmologico

        ddlVisionLejana.DataSource = oDataTable_Vision;
        ddlVisionLejana.DataValueField = "ID_VISION";
        ddlVisionLejana.DataTextField = "CAT_VISION";
        ddlVisionLejana.DataBind();

        ddlLejanaOi.DataSource = oDataTable_Vision;
        ddlLejanaOi.DataValueField = "ID_VISION";
        ddlLejanaOi.DataTextField = "CAT_VISION";
        ddlLejanaOi.DataBind();


        ddlVisionCercana.DataSource = oDataTable_VisionCercana;
        ddlVisionCercana.DataValueField = "ID_VISIONCER";
        ddlVisionCercana.DataTextField = "CAT_VISIONCER";
        ddlVisionCercana.DataBind();

        ddlCercanaOI.DataSource = oDataTable_VisionCercana;
        ddlCercanaOI.DataValueField = "ID_VISIONCER";
        ddlCercanaOI.DataTextField = "CAT_VISIONCER";
        ddlCercanaOI.DataBind();

        ddlCorregida.DataSource = oDataTable_Vision;
        ddlCorregida.DataValueField = "ID_VISION";
        ddlCorregida.DataTextField = "CAT_VISION";
        ddlCorregida.DataBind();

        DDLCorregidaOi.DataSource = oDataTable_Vision;
        DDLCorregidaOi.DataValueField = "ID_VISION";
        DDLCorregidaOi.DataTextField = "CAT_VISION";
        DDLCorregidaOi.DataBind();

        ddlCercanaCorregida.DataSource = oDataTable_VisionCercana;
        ddlCercanaCorregida.DataValueField = "ID_VISIONCER";
        ddlCercanaCorregida.DataTextField = "CAT_VISIONCER";
        ddlCercanaCorregida.DataBind();

        ddlCercanaCorregidaOi.DataSource = oDataTable_VisionCercana;
        ddlCercanaCorregidaOi.DataValueField = "ID_VISIONCER";
        ddlCercanaCorregidaOi.DataTextField = "CAT_VISIONCER";
        ddlCercanaCorregidaOi.DataBind();



        //EXPLORACION FISICA
        ddlEFPruebaFinke.DataSource = oDataTable_ExploFisica;
        ddlEFPruebaFinke.DataValueField = "ID_EXPLOFISICA";
        ddlEFPruebaFinke.DataTextField = "CAT_EXPLOFISICA";
        ddlEFPruebaFinke.DataBind();

        ddlEFSignoTinel.DataSource = oDataTable_ExploFisica;
        ddlEFSignoTinel.DataValueField = "ID_EXPLOFISICA";
        ddlEFSignoTinel.DataTextField = "CAT_EXPLOFISICA";
        ddlEFSignoTinel.DataBind();

        ddlEFPruebaPhanel.DataSource = oDataTable_ExploFisica;
        ddlEFPruebaPhanel.DataValueField = "ID_EXPLOFISICA";
        ddlEFPruebaPhanel.DataTextField = "CAT_EXPLOFISICA";
        ddlEFPruebaPhanel.DataBind();

        ddlEFPruebaLasage.DataSource = oDataTable_ExploFisica;
        ddlEFPruebaLasage.DataValueField = "ID_EXPLOFISICA";
        ddlEFPruebaLasage.DataTextField = "CAT_EXPLOFISICA";
        ddlEFPruebaLasage.DataBind();

        ddlEFSignoBraggard.DataSource = oDataTable_ExploFisica;
        ddlEFSignoBraggard.DataValueField = "ID_EXPLOFISICA";
        ddlEFSignoBraggard.DataTextField = "CAT_EXPLOFISICA";
        ddlEFSignoBraggard.DataBind();

        ddlEFRomberg.DataSource = oDataTable_ExploFisica;
        ddlEFRomberg.DataValueField = "ID_EXPLOFISICA";
        ddlEFRomberg.DataTextField = "CAT_EXPLOFISICA";
        ddlEFRomberg.DataBind();

        ddlEFPresenciaQuiste.DataSource = oDataTable_Quiste;
        ddlEFPresenciaQuiste.DataValueField = "ID_QUISTESIN";
        ddlEFPresenciaQuiste.DataTextField = "CAT_QUISTESIN";
        ddlEFPresenciaQuiste.DataBind();

        //IMPRESION DIAGNOSTICA
        ddlIDAgudezaNormal.DataSource = oDataTable_Agudeza;
        ddlIDAgudezaNormal.DataValueField = "ID_AGUDEZA_VISUAL";
        ddlIDAgudezaNormal.DataTextField = "CAT_AGUDEZA_VISUAL";
        ddlIDAgudezaNormal.DataBind();

        dllIDPresionArt.DataSource = oDataTable_Arterial;
        dllIDPresionArt.DataValueField = "ID_PRESION_ARTERIAL";
        dllIDPresionArt.DataTextField = "CAT_PRESION_ARTERIAL";
        dllIDPresionArt.DataBind();


        DataTable oTableDropDow = dbexam.getDataProspect("getDoctores", null);
        ddlRRevisoEM.DataSource = oTableDropDow;
        ddlRRevisoEM.DataValueField = "ID_DOCTOR";
        ddlRRevisoEM.DataTextField = "NOMBRE_COMPLETO";
        ddlRRevisoEM.DataBind();


        ddlRRealizoEM.DataSource = oTableDropDow;
        ddlRRealizoEM.DataValueField = "ID_DOCTOR";
        ddlRRealizoEM.DataTextField = "NOMBRE_COMPLETO";
        ddlRRealizoEM.DataBind();

        ddlRRealizoEM.Items.Insert(0, "Seleccionar");
        ddlRRevisoEM.Items.Insert(0, "Seleccionar");
    }

    /// <summary>
    /// Obtiene un DataTable"
    /// </summary>
    private DataTable getTable(String instruccion)
    {
        DataTable oDataTable = new DataTable();
        SqlDataReader oReader;
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand(instruccion, con))
                {
                    con.Open();
                    oReader = cmd.ExecuteReader();
                    oDataTable.Load(oReader);
                    con.Close();
                }
            }
        }
        catch (Exception ex)
        {

        }
        return oDataTable;
    }

    private void muestraSexo()
    {
        if (Convert.ToInt32(ddlSexo.SelectedValue) == 2)
            ClientScript.RegisterStartupScript(this.GetType(), "Sexo", "muestraSexo();", true);

    }

    private void muestraHistoriaLaboral()
    {
        if (Convert.ToInt32(rblOpciones.SelectedValue) != 0)
            ClientScript.RegisterStartupScript(this.GetType(), "HistoriaLaboral", "muestraHistoriaLaboral();", true);
    }

    private ExamenVO llenaParams()
    {
        //DATOS PERSONALES
        examParam.Nombre = txtNombre.Text;
        examParam.Edad = Convert.ToInt32(txtEdad.Text);
        examParam.Sexo = ddlSexo.SelectedValue;
        examParam.Escolaridad = ddlEscolaridad.SelectedValue;
        examParam.Telefono = txtTelefono.Text;
        examParam.Direccion = txtDirec.Text;
        examParam.Nacionalidad = ddlNacionalidad.SelectedValue;
        examParam.Fecha = Convert.ToDateTime(txtFechaNac.Text);


        //HISTORIA LABORAL

        examParam.HLIdTipoIngreso = rblOpciones.SelectedValue;
        examParam.HlPuestoSol = txtPuestoSol.Text;
        examParam.HlArea = txtArea.Text;
        examParam.HlUltimoEmpleo = txtHlUltimoEmpleo.Text;
        examParam.HlAntiguedad = txtHlAntiguedad.Text;
        examParam.HlAntiguedadtwo = txtHlAntiguedadtwo.Text;
        examParam.HlUltimoEmpleotwo = txtHlUltimoEmpleotwo.Text;
        examParam.HlFactorRiesgo = txHltFactorRiesgo.Text;
        examParam.HlFactorRiesgotwo = txtHlFactorRiesgotwo.Text;
        examParam.HlAntecedentesPenales = Convert.ToInt32(rblHlAntecedentes.SelectedValue);
        examParam.HlEspecificar = txtHlEspeciales.Text;

        //HISTORIAL PERIODICO
        examParam.HlPPuestoAct = txtHLPPuestoActual.Text;
        examParam.HlPAntiguedadPuestoAct = txtHLPAntiguedadPuesto.Text;
        examParam.HlPAreaAct = txtHLPArea.Text;
        examParam.HlPAntiguedadAreaAct = txtHLPAntiguedadArea.Text;
        examParam.HlPFactorRiesgoAct = txtHLPFactorRiesgo.Text;
        examParam.HlAntecedentesPenales = Convert.ToInt32(rblHlAntecedentes.SelectedValue);
        examParam.HlEspecificar = txtHlEspeciales.Text;


        //ANTECEDENTES HEREDO-FAMILIARES
        examParam.AhfDiabetes = Convert.ToInt32(ddlAHFDiabetes.SelectedValue);
        examParam.AhfEpilepsia = Convert.ToInt32(ddlAHFEpilepsia.SelectedValue);
        examParam.AhfCardipatia = Convert.ToInt32(ddlAHFCardio.SelectedValue);
        examParam.AhfRenales = Convert.ToInt32(ddlAHFRenalesHeredo.SelectedValue);
        examParam.AhfRenales = Convert.ToInt32(ddlAHFRenalesHeredo.SelectedValue);
        examParam.AhfRenales = Convert.ToInt32(ddlAHFAsma.SelectedValue);
        examParam.AhfCancer = Convert.ToInt32(ddlAHFCancer.SelectedValue);
        examParam.AhfMentales = Convert.ToInt32(ddlAHFMentales.SelectedValue);
        examParam.Ahfotras = txtAHFOtras.Text;

        //ANTECEDENTES PERSONALES NO PATOLOGICOS Y TOXICOMANIAS 
        examParam.AptAlcoholismo = ddlAPTAlcoholismo.SelectedValue;
        examParam.AptEdadComienzo = Convert.ToInt32(ddlAPTEdadComienzo.SelectedValue);
        examParam.AptFrecuencia = Convert.ToInt32(ddlAPTFrecuencia.SelectedValue);
        examParam.AptSusAlcoholismo = Convert.ToInt32(ddlAPTAlcoholSusp.SelectedValue);
        examParam.AptTiempoSuspAlcoholismo = txtAPTAlcoholTiempoSusp.Text;
        examParam.AptTabaquismo = ddlAPTTabaquismo.SelectedValue;
        examParam.AptEdadComiecoTwo = Convert.ToInt32(ddlAPTEdadComienzoTwo.SelectedValue);
        examParam.AptFrecuenciaTwo = Convert.ToInt32(ddlAPTFrecuenciatwo.SelectedValue);
        examParam.AptSuspTabaquismo = ddlAPTTabaqSusp.SelectedValue;
        examParam.AptTiempoSuspTabaquismo = txtAPTTabaqTiempoSusp.Text;
        examParam.AptCantidadDiaCigarros = txtAPTTabaTiempoSusp.Text;
        examParam.AptDrogas = ddlAPTDrogas.SelectedValue;
        examParam.AptDrogasEspecifique = txtAPTDrogasEspec.Text;
        examParam.AptUltimoConsumo = txtAPTUltimoConsumo.Text;
        examParam.AptEjercicio = Convert.ToInt32(ddlAPTEjercicio.SelectedValue);
        examParam.AptFrecuenciaTree = txtAPTFrecuenciaTree.Text;
        examParam.AptEspecEjercicio = txtAPTEjercicioEsp.Text;
        examParam.AptAlimentacion = Convert.ToInt32(ddlAPTAlimentacion.SelectedValue);
        examParam.AptGrupoYRh = ddlAPTGrupoRh.SelectedValue;
        examParam.Apttatuajes = Convert.ToInt32(ddlAPTTatuajes.SelectedValue);
        examParam.AptEspecifique = txtAPTTatuajesEsp.Text;
        examParam.AptTxMedicoActual = txtAPTMedicoActual.Text;

        //ANTECEDENTES PERSONALES PATOLOGICOS
        examParam.ApDiabetes = RdlAPDiabetes.SelectedValue;
        examParam.ApTifoidea = rblAPTifoidea.SelectedValue;
        examParam.ApRenales = rblAPRenales.SelectedValue;
        examParam.ApHernias = rblAPHernias.SelectedValue;
        examParam.ApHta = rblAPHTA.SelectedValue;
        examParam.ApAsma = rblAPAsma.SelectedValue;
        examParam.AhfEpilepsia = Convert.ToInt32(ddlAPEpilepsia.SelectedValue);
        examParam.ApHemorroides = ddlAPHemorroides.SelectedValue;
        examParam.ApCancer = ddlAPCancer.SelectedValue;
        examParam.ApAlergias = ddlAPAlergias.SelectedValue;
        examParam.ApVertigo = ddlAPVertigo.SelectedValue;
        examParam.ApTraumatismos = ddlAPTraumaCraneales.SelectedValue;
        examParam.ApCardipatias = ddlAPCardipatias.SelectedValue;
        examParam.ApParotiditis = ddlAPParatiditis.SelectedValue;
        examParam.ApDesmayos = ddlAPDesmayos.SelectedValue;
        examParam.ApPatologiaCVertebral = ddlAPPatCVertebral.SelectedValue;
        examParam.ApBronquitis = ddlAPBronquitis.SelectedValue;
        examParam.ApDermatitis = ddlAPDermatitis.SelectedValue;
        examParam.ApFracturas = ddlAPFracturas.SelectedValue;
        examParam.ApGinecologicos = ddlAPGinecologicos.SelectedValue;
        examParam.ApNeumonias = ddlAPNeumonias.SelectedValue;
        examParam.ApVarices = ddlAPVarices.SelectedValue;
        examParam.ApCirugias = ddlAPCirugias.SelectedValue;
        examParam.ApEnfTransSexual = ddlAPEnfTransSex.SelectedValue;
        examParam.ApTuberculosis = ddlAPTuberculosis.SelectedValue;
        examParam.ApHepatitis = ddlAPHepatitis.SelectedValue;
        examParam.ApTransfuciones = ddlAPTransfuciones.SelectedValue;
        examParam.ApEndocrinopatias = ddlAPEndocrino.SelectedValue;
        examParam.ApExantematicas = ddlAPExantematicas.SelectedValue;
        examParam.ApEspecificacion = txtAPEspecificacion.Text;
        examParam.ApPsiquiatricas = ddlAPPsiquiatricas.SelectedValue;
        examParam.ApOtras = txtAPOtrasPato.Text;

        //ANTECEDENTES GINECOLOGICOS
        examParam.AgMenarca = ddlAGMenarca.SelectedValue;
        examParam.AgIvs = ddlAGIvs.SelectedValue;
        examParam.AgVsa = ddlAGVsa.SelectedValue;
        examParam.AgFum = txtAGFum.Text;
        examParam.AgRitmo = txtAGRitmo.Text;
        examParam.AgMpf = ddlAGMpf.Text;
        examParam.AgDoc = txtAGDoc.Text;
        examParam.AgGesta = ddlAGGesta.SelectedValue;
        examParam.AgParto = ddlAGParto.SelectedValue;
        examParam.AgCesarea = ddlAGCesarea.SelectedValue;
        examParam.AgAborto = ddlAGAborto.SelectedValue;
        examParam.AgFupFuc = txtAGFup.Text;

        //INMUNIZACIONES
        examParam.InmRubeola = txtIRubeola.Text; //ddlIRubeola.SelectedValue;
        examParam.InmSarampion = txtISarampeon.Text; //ddlISarampeon.SelectedValue;
        examParam.InmToxoide = txtITexoideTetanico.Text; //ddlITexoideTetanico.SelectedValue;
        examParam.InmNeumococo = txtINeumococo.Text; //ddlINeumococo.SelectedValue;
        examParam.InmInfluenza = txtIInfluenza.Text;  //ddlIIfluenza.SelectedValue;
        examParam.InmHepatitisB = txtIHepatisB.Text; //ddlIHepatitsB.SelectedValue;
        examParam.InmOtra = txtIOtra.Text;
        examParam.InmProximaDosis = txtIProximaDosis.Text;

        //SAMATOMETRIA

        examParam.SsvTammHg = txtTa.Text;
        examParam.SsvFcMin = txtFcMIn.Text;
        examParam.SsvFrMin = txtFrMin.Text;
        examParam.SsvT = txtT.Text;
        examParam.SsvpesoKg = txtPesoKg.Text;
        examParam.SsvTallaCm = txtTallaCm.Text;
        examParam.SsvImc = txtImc.Text;
        examParam.SsvCintura = txtCintura.Text;
        examParam.SsvCadera = txtCadera.Text;
        if (String.IsNullOrEmpty(hdnIdComplexion.Value))
            examParam.SsvComplexion = ddlComplexion.SelectedValue;
        else
            examParam.SsvComplexion = hdnIdComplexion.Value;


        //AGUDEZA VISUAL
        examParam.EoVisionLejanaOd = ddlVisionLejana.SelectedValue;
        examParam.EoVisionLejenaOi = ddlLejanaOi.SelectedValue;
        examParam.EoVisionCercanaOd = ddlVisionCercana.SelectedValue;
        examParam.EoVisionCercanaOi = ddlCercanaOI.SelectedValue;
        examParam.EoReflejos = txtReflejos.Text;

        examParam.EoCorregidaOd = ddlCorregida.SelectedValue;
        examParam.EoCorregidaOi = DDLCorregidaOi.SelectedValue;

        examParam.EoCercanaCorregidaOd = ddlCercanaCorregida.SelectedValue;
        examParam.EoCercanaCorregidaOi = ddlCercanaCorregidaOi.SelectedValue;

        examParam.EoCampimetria = txtCampimtria.Text;
        examParam.EoDaltonismo = txtDaltomismo.Text;

        //EXPLORACION FISICA GENERAL
        examParam.EfNeurologico = txtEFNeuro.Text;
        examParam.EfCraneo = txtEFCraneo.Text;
        examParam.EfPielyFaneras = txtEFPielyFaneras.Text;
        examParam.EfOidosCad = txtEFOidos.Text;
        examParam.EfOidosCai = txtEFCai.Text;
        examParam.EfOjos = txtEFOjos.Text;
        examParam.EfBoca = ddlEFBoca.SelectedValue;
        examParam.EfNariz = txtEFNariz.Text;
        examParam.EfFaringe = txtEFFaringe.Text;
        examParam.EfCuello = txtEFCuello.Text;
        examParam.EfTorax = txtEFTorax.Text;
        examParam.EfCorazon = txtEFCorazon.Text;
        examParam.EfCamposPulmonares = txtEFCamposPulmonares.Text;
        examParam.EfAbdomen = txtEFAbdomen.Text;
        examParam.EfColumnaVertebral = txtEFColumnaVer.Text;
        examParam.EfTestAdam = txtTestAdam.Text;
        examParam.EfMsSuperiores = txtEFSuperiores.Text;
        examParam.EfFuerzaMuscularDaniels = txtFuerzaMuscularDaniels.Text;
        examParam.EfMsInferirores = txtInferiores.Text;
        examParam.EfCirculacion = txtEFCirculacion.Text;
        examParam.EfArcoMovilidad = txtEFArcoMovilidad.Text;
        examParam.EfTonoMuscular = txtEFTonoMuscular.Text;
        examParam.EfCoordinacion = txtCoordinacion.Text;
        examParam.EfRomberg = ddlEFRomberg.SelectedValue;
        examParam.EfPruebaFinkelestein = ddlEFPruebaFinke.SelectedValue;
        examParam.EfSignoTinel = ddlEFSignoTinel.SelectedValue;
        examParam.EfPruebaPhabel = ddlEFPruebaPhanel.SelectedValue;
        examParam.EfPruebaLasage = ddlEFPruebaLasage.SelectedValue;
        examParam.EfSignoBraggard = ddlEFSignoBraggard.SelectedValue;
        examParam.EfPresenciaQuiste = ddlEFPresenciaQuiste.SelectedValue;
        examParam.EfEspecificar = txtEFEspecificar.Text;



        //IMPRESION DIAGNOSTICA
        examParam.IDAgudezaNormal = ddlIDAgudezaNormal.SelectedValue;
        examParam.IDPresionArt = dllIDPresionArt.SelectedValue;

        //RECOMENDACIONES

        //VALORACION MEDICA Y VISUAL ANUAL
        examParam.RRealizoEM = ddlRRealizoEM.SelectedValue;
        examParam.RRevisoEM = ddlRRevisoEM.SelectedValue;  //txtRRevisoEM.Text;
        //examParam.RCedProf = txtRCedProf.Text;
        //examParam.RCedProftwo = txtRCedProftwo.Text;

        //AGUDEZA VISUAL

        examParam.AptGrupoYRh = ddlAPTGrupoRh.SelectedValue;

        return examParam;
    }


    private void habilitarControles()
    {
        foreach (Control controls in Master.FindControl("MainContent").Controls)
        {
            foreach (Control child in controls.Controls)
            {
                if (child is TextBox)
                    ((TextBox)child).Enabled = true;
                if (child is DropDownList)
                    ((DropDownList)child).Enabled = true;
            }
        }
    }

    private void desHabilitarControles()
    {
        foreach (Control controls in Master.FindControl("MainContent").Controls)
        {
            foreach (Control child in controls.Controls)
            {
                if (child is TextBox)
                    ((TextBox)child).Enabled = false;
                if (child is DropDownList)
                    ((DropDownList)child).Enabled = false;
            }
        }
    }

    //public DataTable filtroTable(int id)
    //{

    //    DataTable oDataTableGridView = (DataTable)Session["TableRowSelect"];
    //    DataTable oDataResult = new DataTable();
    //    IEnumerable<DataRow> query = from examen in oDataTableGridView.AsEnumerable()
    //                                 where examen.Field<Int32>("ID_EXMEDICO") == Convert.ToInt32(id)
    //                                 select examen;
    //    oDataResult = query.CopyToDataTable<DataRow>();

    //    return oDataResult;
    //}

    private void consultaPaciente()
    {
        DataTable oTablePaciente = new DataTable();
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_PERSONA", IdPaciente);
        Dic.Add("@ID_MODULO_ORIGEN", Id_Modulo);


        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenMedicoDetalles", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {

                DataRow oRow = oTablePaciente.Rows[0];
                //DATOS PERSONALES

                txtEmpresa.Text = oRow["DP_EMPRESA"].ToString();
                txtNombre.Text = oRow["DP_NOMBRE"].ToString() + " " + oRow["DP_NOMBRE_2"].ToString();
                txtPaterno.Text = oRow["DP_APELLIDO_PATERNO"].ToString();
                txtMaterno.Text = oRow["DP_APELLIDO_MATERNO"].ToString();
                txtEdad.Text = oRow["DP_EDAD"].ToString();
                txtFechaNac.Text = Convert.ToDateTime(oRow["DP_FECHA_NACIMIENTO"].ToString()).ToString("dd/MM/yyyy");
                ddlEstadoCivil.SelectedValue = oRow["DP_ID_EDOCIVIL"].ToString();
                ddlEscolaridad.SelectedValue = oRow["DP_ID_ESCOLARIDAD"].ToString();
                txtTelefono.Text = oRow["DP_TELEFONO"].ToString();
                txtDirec.Text = oRow["DP_DIRECCION"].ToString();
                ddlNacionalidad.SelectedValue = oRow["DP_ID_NACIONALIDAD"].ToString();
                txtLugarNac.Text = oRow["DP_LUGAR_NACIMIENTO"].ToString();
                ddlSexo.SelectedValue = oRow["DP_ID_SEX"].ToString();

                muestraSexo();

                //HISTORIAL LABORAL
                rblOpciones.SelectedValue = oRow["HL_ID_TIPO_INGRESO"].ToString();

                muestraHistoriaLaboral();

                txtPuestoSol.Text = oRow["HL_PUESTO_SOL"].ToString();
                txtArea.Text = oRow["HL_AREA"].ToString();
                txtHlUltimoEmpleo.Text = oRow["HL_ULT_EMPLEO"].ToString();
                txHltFactorRiesgo.Text = oRow["HL_FACTOR_RIESGO"].ToString();
                txtHlAntiguedad.Text = oRow["HL_ANTIGUEDAD"].ToString();
                txtHlUltimoEmpleotwo.Text = oRow["HL_ULT_EMPLEO2"].ToString();
                txtHlFactorRiesgotwo.Text = oRow["HL_FACTOR_RIESGO_2"].ToString();
                txtHlAntiguedadtwo.Text = oRow["HL_ANTIGUEDAD_2"].ToString();
                rblHlAntecedentes.SelectedValue = oRow["HL_ANTECEDENTES"].ToString();
                txtHlEspeciales.Text = oRow["HL_ANTECEDENTES_ESP"].ToString();
                txtPuesto1.Text = oRow["HL_PUESTO"].ToString();
                txtPuesto2.Text = oRow["HL_PUESTO2"].ToString();


                //HISTORIA LABORAL PERIODICO

                txtHLPPuestoActual.Text = oRow["HL_PUESTO_ACT"].ToString();
                txtHLPArea.Text = oRow["HL_AREA_ACT"].ToString();
                txtHLPAntiguedadArea.Text = oRow["HL_ANTIGUEDAD_AREA_ACT"].ToString();
                txtHLPAntiguedadPuesto.Text = oRow["HL_ANTIGUEDAD_PUESTO_ACT"].ToString();
                txtHLPFactorRiesgo.Text = oRow["HL_FACTOR_RIESGO_ACT"].ToString();
                rblHLPAntecedentesAcc.SelectedValue = oRow["HL_ANTECEDENTES"].ToString();
                txtHLPEspecificar.Text = oRow["HL_ANTECEDENTES_ESP"].ToString();

                //ANTECEDENTES HEREDO-FAMILIARES
                ddlAHFDiabetes.SelectedValue = oRow["AHF_ID_DIABETES"].ToString();
                ddlAHTAHeredo.SelectedValue = oRow["AHF_ID_HTA"].ToString();
                ddlAHFEpilepsia.SelectedValue = oRow["AHF_ID_EPILEPSIA"].ToString();
                ddlAHFCardio.SelectedValue = oRow["AHF_ID_CARDIOPATIA"].ToString();
                ddlAHFRenalesHeredo.SelectedValue = oRow["AHF_ID_RENALES"].ToString();
                ddlAHFAsma.SelectedValue = oRow["AHF_ID_ASMA"].ToString();
                ddlAHFCancer.SelectedValue = oRow["AHF_ID_CANCER"].ToString();
                ddlAHFMentales.SelectedValue = oRow["AHF_ID_MENTALES"].ToString();
                txtAHFOtras.Text = oRow["AHF_OTRAS"].ToString();

                //ANTECEDENTES PERSONALES NO PATOLOGICOS Y TOXICOMANIAS
                ddlAPTAlcoholismo.SelectedValue = oRow["ANPT_ID_ALCOHOLISMO"].ToString();
                ddlAPTEdadComienzo.SelectedValue = oRow["ANPT_EDAD_ALCOHOLISMO"].ToString();
                ddlAPTFrecuencia.SelectedValue = oRow["ANPT_ID_FREC_ALCOHOLISMO"].ToString();
                ddlAPTAlcoholSusp.SelectedValue = oRow["ANPT_ID_SUSP_ALCOHOLISMO"].ToString();
                txtAPTAlcoholTiempoSusp.Text = oRow["ANPT_TIEMPO_SUSP_ALCOHOLISMO"].ToString();
                ddlAPTTabaquismo.SelectedValue = oRow["ANPT_ID_TABAQUISMO"].ToString();
                ddlAPTEdadComienzoTwo.SelectedValue = oRow["ANPT_EDAD_TABAQUISMO"].ToString();
                ddlAPTFrecuenciatwo.SelectedValue = oRow["ANPT_ID_FREC_TABAQUISMO"].ToString();
                ddlAPTTabaqSusp.SelectedValue = oRow["ANPT_ID_SUSP_TABAQUISMO"].ToString();
                txtAPTTabaqTiempoSusp.Text = oRow["ANPT_TIEMPO_SUSP_TABAQUISMO"].ToString();
                txtAPTTabaTiempoSusp.Text = oRow["ANPT_CANTIDAD_DIA_CIGARROS"].ToString();
                ddlAPTDrogas.SelectedValue = oRow["ANPT_ID_DROGAS"].ToString();
                txtAPTDrogasEspec.Text = oRow["ANPT_DROGAS_ESPEC"].ToString();
                txtAPTUltimoConsumo.Text = oRow["ANPT_ULT_CONSUMO"].ToString();

                ddlAPTEjercicio.SelectedValue = oRow["ANPT_ID_EJERCICIO"].ToString();
                txtAPTEjercicioEsp.Text = oRow["ANPT_EJERCICIO_ESPEC"].ToString();
                txtAPTFrecuenciaTree.Text = oRow["ANPT_FREC_EJERCICIO"].ToString();
                ddlAPTAlimentacion.SelectedValue = oRow["ANPT_ID_ALIMENTACION"].ToString();
                ddlAPTGrupoRh.SelectedValue = oRow["ANPT_ID_GRUPO_RH"].ToString();
                ddlAPTTatuajes.SelectedValue = oRow["ANPT_ID_TATUAJES"].ToString();
                txtAPTTatuajesEsp.Text = oRow["ANPT_TATUAJES_ESPECIFIQUE"].ToString();
                txtAPTMedicoActual.Text = oRow["ANPT_TX_MEDICO_ACTUAL"].ToString();

                //ANTECEDENTES PERSONALES PATOLOGICOS 
                RdlAPDiabetes.SelectedValue = oRow["AP_ID_DIABETES"].ToString();
                rblAPTifoidea.SelectedValue = oRow["AP_ID_TIFOIDEA"].ToString();
                rblAPRenales.SelectedValue = oRow["AP_ID_RENALES"].ToString();
                rblAPHernias.SelectedValue = oRow["AP_ID_HERNIAS"].ToString();
                rblAPHTA.SelectedValue = oRow["AP_ID_HTA"].ToString();
                rblAPAsma.SelectedValue = oRow["AP_ID_ASMA"].ToString();
                ddlAPEpilepsia.SelectedValue = oRow["AP_ID_EPILEPSIA"].ToString();
                ddlAPHemorroides.SelectedValue = oRow["AP_ID_HEMORROIDES"].ToString();
                ddlAPCancer.SelectedValue = oRow["AP_ID_CANCER"].ToString();
                ddlAPAlergias.SelectedValue = oRow["AP_ID_ALERGIAS"].ToString();
                ddlAPVertigo.SelectedValue = oRow["AP_ID_VERTIGO"].ToString();
                ddlAPTraumaCraneales.SelectedValue = oRow["AP_ID_TRAUMATISMO"].ToString();
                ddlAPCardipatias.SelectedValue = oRow["AP_ID_CARDIOPATIA"].ToString();
                ddlAPParatiditis.SelectedValue = oRow["AP_ID_PAROTIDITIS"].ToString();
                ddlAPDesmayos.SelectedValue = oRow["AP_ID_DESMAYOS"].ToString();
                ddlAPPatCVertebral.SelectedValue = oRow["AP_ID_PATOLOGIAS"].ToString();
                ddlAPBronquitis.SelectedValue = oRow["AP_ID_BRONQUITIS"].ToString();
                ddlAPDermatitis.SelectedValue = oRow["AP_ID_DERMATITIS"].ToString();
                ddlAPFracturas.SelectedValue = oRow["AP_ID_FRACTURAS"].ToString();
                ddlAPGinecologicos.SelectedValue = oRow["AP_ID_GINECOLOGICOS"].ToString();
                ddlAPNeumonias.SelectedValue = oRow["AP_ID_NEUMONIAS"].ToString();
                ddlAPVarices.SelectedValue = oRow["AP_ID_VARICES"].ToString();
                ddlAPCirugias.SelectedValue = oRow["AP_ID_CIRUGIAS"].ToString();
                ddlAPEnfTransSex.SelectedValue = oRow["AP_ID_ENF_TRANS_SEXUAL"].ToString();
                ddlAPExantematicas.SelectedValue = oRow["AP_ID_EXANTEMATICAS"].ToString();
                txtAPOtrasPato.Text = oRow["AP_OTRAS"].ToString();
                txtAPEspecificacion.Text = oRow["AP_OTRAS_ESPECIFIQUE"].ToString();


                //ANTECEDENTES GINECOLOGICOS
                ddlAGMenarca.SelectedValue = oRow["AG_ID_MENARCA"].ToString();
                ddlAGIvs.SelectedValue = oRow["AG_ID_IVS"].ToString();
                ddlAGVsa.SelectedValue = oRow["AG_ID_VSA"].ToString();
                txtAGFum.Text = String.IsNullOrEmpty(oRow["AG_FUM"].ToString()) ? string.Empty : Convert.ToDateTime(oRow["AG_FUM"].ToString()).ToString("yyyy-MM-dd");
                txtAGRitmo.Text = oRow["AG_RITMO"].ToString();
                ddlAGMpf.SelectedValue = oRow["AG_ID_MPF"].ToString();
                txtAGDoc.Text = string.IsNullOrEmpty(oRow["AG_DOC"].ToString()) ? string.Empty : Convert.ToDateTime(oRow["AG_DOC"].ToString()).ToString("yyyy-MM-dd");
                ddlAGGesta.SelectedValue = oRow["AG_ID_GESTA"].ToString();
                ddlAGParto.SelectedValue = oRow["AG_ID_PARTO"].ToString();
                ddlAGCesarea.SelectedValue = oRow["AG_ID_CESAREA"].ToString();
                ddlAGAborto.SelectedValue = oRow["AG_ID_ABORTO"].ToString();
                txtAGFup.Text = string.IsNullOrEmpty(oRow["AG_FUP_FUC"].ToString()) ? string.Empty : Convert.ToDateTime(oRow["AG_FUP_FUC"].ToString()).ToString("yyyy-MM-dd");

                //ANTECEDENTES REPRODUCTIVOS
                txtARIvs.Text = oRow["AR_IVS"].ToString();
                ddlARCircuncision.SelectedValue = oRow["AR_ID_CIRCUNCISION"].ToString();
                ddlARVsa.SelectedValue = oRow["AR_ID_VSA"].ToString();
                txtARProstata.Text = oRow["AR_DOC_PROSTATA"].ToString();
                ddlARMPF.SelectedValue = oRow["AR_ID_MPF"].ToString();


                //INMUNIZACIONES
                txtIRubeola.Text = oRow["INM_ID_RUBEOLA"].ToString();
                txtISarampeon.Text = oRow["INM_ID_SARAMPION"].ToString();
                //txtIRubeola.Text = oRow["INM_ID_RUBEOLA"].ToString();
                txtIHepatisB.Text = oRow["INM_ID_HEPATITIS"].ToString();
                txtINeumococo.Text = oRow["INM_ID_NEUMOCOCO"].ToString();
                txtIInfluenza.Text = oRow["INM_ID_INFLUENZA"].ToString();
                txtITexoideTetanico.Text = oRow["INM_ID_TOXOIDE_TETA"].ToString();
                txtIOtra.Text = oRow["INM_OTRA"].ToString();
                txtIProximaDosis.Text = oRow["INM_COMENTARIOS"].ToString();

                //SOMATOMETRIA
                txtTa.Text = oRow["SSV_TA"].ToString();
                txtFcMIn.Text = oRow["SSV_FC"].ToString();
                txtFrMin.Text = oRow["SSV_FR"].ToString();
                txtT.Text = oRow["SSV_T"].ToString();
                txtPesoKg.Text = Convert.ToDecimal(oRow["SSV_PESO"].ToString()).ToString("N2");
                txtTallaCm.Text = Convert.ToDecimal(oRow["SSV_TALLA"].ToString()).ToString("N2");
                txtImc.Text = Convert.ToDecimal(oRow["SSV_IMC"].ToString()).ToString("N2");
                //ddlComplexion.SelectedValue = oRow["SSV_ID_COMPLEXION"].ToString();
                ddlComplexion.SelectedValue = oRow["SSV_ID_COMPLEXION"].ToString();
                hdnIdComplexion.Value = oRow["SSV_ID_COMPLEXION"].ToString();
                txtCintura.Text = Convert.ToDecimal(oRow["SSV_PERIMETRO_CINTURA"].ToString()).ToString("N2");
                txtCadera.Text = Convert.ToDecimal(oRow["SSV_PERIMETRO_CADERA"].ToString()).ToString("N2");
                txtCinCad.Text = Convert.ToDecimal(oRow["SSV_INDICE_CIN_CAD"].ToString()).ToString("N2");




                //AGUDEZA VISUAL
                ddlLejanaOi.SelectedValue = oRow["EO_ID_VISION_LEJANA_OI"].ToString();
                ddlCercanaOI.SelectedValue = oRow["EO_ID_VISION_CERCANA_OI"].ToString();
                DDLCorregidaOi.SelectedValue = oRow["EO_ID_VL_CORREGIDA_OI"].ToString();
                ddlCercanaCorregidaOi.SelectedValue = oRow["EO_ID_VC_CORREGIDA_OI"].ToString();
                ddlVisionLejana.SelectedValue = oRow["EO_ID_VISION_LEJANA_OD"].ToString();
                ddlVisionCercana.SelectedValue = oRow["EO_ID_VISION_CERCANA_OD"].ToString();
                ddlCorregida.SelectedValue = oRow["EO_ID_VL_CORREGIDA_OD"].ToString();
                ddlCercanaCorregida.SelectedValue = oRow["EO_ID_VC_CORREGIDA_OD"].ToString();
                txtReflejos.Text = oRow["EO_REFLEJOS"].ToString();
                txtDaltomismo.Text = oRow["EO_DALTONISMO"].ToString();
                txtCampimtria.Text = oRow["EO_AMPIMETRIA"].ToString();

                //EXPLORACION FISICA GENERAL
                txtEFNeuro.Text = oRow["EF_NEUROLOGICO"].ToString();
                txtEFCraneo.Text = oRow["EF_CABEZA"].ToString();
                txtEFPielyFaneras.Text = oRow["EF_PIEL_FANERAS"].ToString();
                txtEFOidos.Text = oRow["EF_OIDOS_CAD"].ToString();
                txtEFCai.Text = oRow["EF_OIDOS_CAI"].ToString();
                txtEFOjos.Text = oRow["EF_OJOS"].ToString();
                ddlEFBoca.SelectedValue = oRow["EF_ID_BOCA"].ToString();
                txtIDSaludBucal.Text = ddlEFBoca.SelectedItem.Text;
                txtEFBoca.Text = oRow["EF_BOCA_2"].ToString();
                txtEFNariz.Text = oRow["EF_NARIZ"].ToString();
                txtEFFaringe.Text = oRow["EF_FARINGE"].ToString();
                txtEFCuello.Text = oRow["EF_CUELLO"].ToString();
                txtEFTorax.Text = oRow["EF_TORAX"].ToString();
                txtEFCorazon.Text = oRow["EF_CORAZON"].ToString();
                txtEFCamposPulmonares.Text = oRow["EF_CAMPOS_PULMONARES"].ToString();
                txtEFAbdomen.Text = oRow["EF_ABDOMEN"].ToString();
                txtEFGen.Text = oRow["EF_GENITOURINARIO"].ToString();
                txtEFColumnaVer.Text = oRow["EF_COLUMNA_VERTEBRAL"].ToString();
                txtTestAdam.Text = oRow["EF_TEST_DE_ADAM"].ToString();
                txtEFSuperiores.Text = oRow["EF_Ms_SUPERIORES"].ToString();
                txtFuerzaMuscularDaniels.Text = oRow["EF_FMD_SUP"].ToString();
                txtInferiores.Text = oRow["EF_Ms_INFERIORES"].ToString();
                txtFuerzaMuscularDanielsInf.Text = oRow["EF_FMD_INF"].ToString();
                txtEFCirculacion.Text = oRow["EF_CIRCULACION"].ToString();
                txtEFArcoMovilidad.Text = oRow["EF_ARCO_MOVILIDAD"].ToString();
                txtEFTonoMuscular.Text = oRow["EF_TONO_MUSCULAR"].ToString();
                txtCoordinacion.Text = oRow["EF_COORDINACION"].ToString();
                ddlEFRomberg.SelectedValue = oRow["EF_ID_ROMBERG"].ToString();
                ddlEFPruebaFinke.SelectedValue = oRow["EF_ID_PRUEBA_FINKELSTEIN"].ToString();
                ddlEFSignoTinel.SelectedValue = oRow["EF_ID_SIGNO_TINEL"].ToString();
                ddlEFPruebaPhanel.SelectedValue = oRow["EF_ID_PRUEBA_PHANEL"].ToString();
                ddlEFPruebaLasage.SelectedValue = oRow["EF_ID_PRUEBA_LASAGUE"].ToString();
                ddlEFSignoBraggard.SelectedValue = oRow["EF_ID_SIGNO_BRAGGARD"].ToString();
                ddlEFPresenciaQuiste.SelectedValue = oRow["EF_ID_QSINOVIAL"].ToString();
                txtEFEspecificar.Text = oRow["EF_QSINOVIAL_ESPEC"].ToString();


                //IMPRESION DIAGNOSTICA
                ddlIDAgudezaNormal.SelectedValue = oRow["ID_ID_AGUDEZA_VISUAL"].ToString();
                dllIDPresionArt.SelectedValue = oRow["ID_ID_PRESION_ARTERIAL"].ToString();
                txtIDComentarios.Text = oRow["ID_COMENTARIOS"].ToString();

                txtENEstadoNutricional.Text = ddlComplexion.SelectedItem.Text;

                //APTITUD SEGÚN HALLAZGOS CLÍNICOS
                IdAptitud = Convert.ToInt32(oRow["ASHC_ID_APTITUD_HALLAZGOS"].ToString());
                switch (IdAptitud)
                {
                    case 0:
                        rdbASHCBueno.Checked = true;
                        break;
                    case 1:
                        rdbASHCRegular.Checked = true;
                        break;
                    case 2:
                        rdbASHCMalo.Checked = true;
                        break;

                }

                txtASHCRecomencaciones.Text = oRow["ASHC_RECOMENDACIONES"].ToString();
                //VALORACIÓN MÉDICA Y VISUAL ANUAL.
                List<string> list = new List<string>();
                if (!String.IsNullOrEmpty(oRow["VMVA_ID_DOC_REALIZO"].ToString()))
                {
                    ddlRRealizoEM.SelectedValue = oRow["VMVA_ID_DOC_REALIZO"].ToString();
                    list = getUrlImage(ddlRRealizoEM.SelectedValue);
                    imgFirmaRealizo.ImageUrl = list[1];
                    imgFirmaRealizo.Visible = true;
                    list.Clear();
                }
                if (!String.IsNullOrEmpty(oRow["VMVA_ID_DOC_REVISO"].ToString()))
                {
                    ddlRRevisoEM.SelectedValue = oRow["VMVA_ID_DOC_REVISO"].ToString();
                    list = getUrlImage(ddlRRevisoEM.SelectedValue);
                    imgFirmaReviso.ImageUrl = list[1];
                    imgFirmaReviso.Visible = true;
                    list.Clear();
                }
                txtRCedProf.Text = oRow["DRE_CEDULA_PROFESIONAL"].ToString();
                txtRCedProftwo.Text = oRow["DRV_CEDULA_PROFESIONAL"].ToString();

                muestraSexo();
                muestraHistoriaLaboral();

                btnReporte.Visible = true;

                Session["NuevoExamenGral"] = true;
            }
            else
            {

                Dic = new Dictionary<string, object>();
                Dic.Add("@ID_PERSONA", IdPaciente);
                Dic.Add("@ID_MODULO", Id_Modulo);

                oTablePaciente = dbexam.getDataProspect("getExamenDatosGenerales", Dic);


                //DataRow oRowDatosGenerales = getClients.getRowClientTable(Convert.ToInt32(IdPaciente)).Rows[0];
                DataRow oRowDatosGenerales = oTablePaciente.Rows[0];

                txtEmpresa.Text = oRowDatosGenerales["cliente_razonSocial"].ToString();
                txtNombre.Text = oRowDatosGenerales["DG_NOMBRE"].ToString() + " " + oRowDatosGenerales["DG_NOMBRE_2"];
                txtPaterno.Text = oRowDatosGenerales["DG_APELLIDO_PATERNO"].ToString();
                txtMaterno.Text = oRowDatosGenerales["DG_APELLIDO_MATERNO"].ToString();
                txtFechaNac.Text = Convert.ToDateTime(oRowDatosGenerales["DG_FECHA_NACIMIENTO"].ToString()).ToString("dd/MM/yyyy");
                ddlSexo.SelectedValue = oRowDatosGenerales["DG_ID_SEXO"].ToString();
                txtEdad.Text = oRowDatosGenerales["DP_EDAD"].ToString();
                muestraSexo();
                Session["NuevoExamenGral"] = false;
            }

            Session["TableRowSelect"] = oTablePaciente;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public static void setIdComplexion(string IdComplexion)
    {
        HttpContext.Current.Session["Complexion"] = IdComplexion;
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