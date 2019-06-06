using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CotizadorCalvek.Blob_Storage;
using System.Data;

public partial class Examenes_Radiologia : System.Web.UI.Page
{
    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    private String IdPaciente;
    private String IdModulo;
    private Boolean nuevo = false;
    EnumMessage message = new EnumMessage();
    DataTable oDataTable = new DataTable();
    List<string> lstImages = new List<string>();
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
            Dic.Add("@RAD_ID_PERSONA", IdPaciente);
            Dic.Add("@RAD_ID_MODULO_ORIGEN", IdModulo);
            Dic.Add("@RAD_INTERPRETACION", txtInterpretacion.Text);
            var DateNow = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);
            Dic.Add("@RAD_FECHA_EXAMEN", Convert.ToDateTime(txtRadFechaExamen.Text));

            foreach (RepeaterItem item in rep.Items)
            {
                dynamic fuAux = item.FindControl("fuRadiologia") as FileUpload;
                Image imgAux = item.FindControl("imgRadiologia") as Image;

                if (fuAux.PostedFile.FileName != "")
                {
                    if (imgAux.ImageUrl != "")
                    {
                        lstImages.Add(UpdateImage(fuAux, imgAux.ImageUrl.ToString().Substring(imgAux.ImageUrl.ToString().LastIndexOf("/") + 1)));
                    }
                    else
                    {
                        lstImages.Add(UploadImage(fuAux));
                    }
                }
                else
                {
                    lstImages.Add(imgAux.ImageUrl.ToString());
                }
            }
            
            Dic.Add("@RAD_URL_IMAGE", lstImages[0].ToString());
            Dic.Add("@RAD_URL_IMAGE2", lstImages[1].ToString());
            
            if (Convert.ToBoolean(Session["NuevoRadiologia"]))
            {

                Dic.Add("@RAD_FECHA_INSERTA", DateNow);
                dbexam.changeProspecto("setInsertaExamenRadiologia", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess('DatosGenerales.aspx'," + (int)EnumMessage.Message.ShowAlertSucess + ");", true);
            }
            else
            {
                dbexam.changeProspecto("setUpdateExamenRadiologia", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('DatosGenerales.aspx'," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
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
    #endregion
    #region Metodos
    private void consultaPaciente()
    {
        DataTable oTablePaciente = new DataTable();
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        Dic.Add("@ID_PERSONA", IdPaciente);
        Dic.Add("@ID_MODULO_ORIGEN", IdModulo);

        try
        {
            oTablePaciente = dbexam.getDataProspect("getExamenRadiologia", Dic);
            if (oTablePaciente.Rows.Count > 0)
            {
                lstImages.Add(oTablePaciente.Rows[0]["RAD_URL_IMAGE"].ToString());
                lstImages.Add(oTablePaciente.Rows[0]["RAD_URL_IMAGE2"].ToString());
                txtInterpretacion.Text = oTablePaciente.Rows[0]["RAD_INTERPRETACION"].ToString();
                txtRadFechaExamen.Text = oTablePaciente.Rows[0]["RAD_FECHA_EXAMEN"].ToString();

                Session["NuevoRadiologia"] = false;
            }
            else
            {
                Session["NuevoRadiologia"] = true;
                lstImages.Add("");
                lstImages.Add("");
            }
            rep.DataSource = lstImages;
            rep.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private string UpdateImage(dynamic pFu,string oldResourceId)
    {
        BlobManager manager = new BlobManager();
        string updated = "";
        try
        {
            if (manager.DeleteByResourceId(oldResourceId))
            {
                updated = UploadImage(pFu);
            }

            return updated;
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    private string UploadImage(dynamic pFu)
    {
        BlobManager manager = new BlobManager();
        string uploaded = "";
        try
        {
            IList<HttpPostedFile> postedfile = pFu.PostedFiles;

            string ImageUploaded = manager.UploadImage(postedfile);

            uploaded = ImageUploaded;

            return uploaded;
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    
    #endregion

}