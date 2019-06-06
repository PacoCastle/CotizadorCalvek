using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CotizadorCalvek.Blob_Storage;
using System.IO;

public partial class Catalogos_Doctores_AdminDoctores : System.Web.UI.Page{

    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    DataTable oDataTable = new DataTable();
    encryption cryp = new encryption();
    string pageRedirect = "AdminDoctores.aspx";
    private static int NUMFUNCION = 16;
    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["IdDoctor"] = null;
        }
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        string urlUploadImagen = "";
        try
        {
            
            Dic.Add("@DOC_NOMBRE", txtDocNombre.Text);
            Dic.Add("@DOC_NOMBRE_2", txtDocNombre2.Text);
            Dic.Add("@DOC_APELLIDO_PATERNO", txtDocApellido.Text );
            Dic.Add("@DOC_APELLIDO_MATERNO", txtDocApellido2.Text);
            Dic.Add("@DOC_CEDULA_PROFESIONAL", txtDocCedulaProfesional.Text);

            if (Session["IdDoctor"] != null)
            {
                if (imgDocFirma.ImageUrl.ToString() != "")
                {
                    urlUploadImagen = UpdateImage(imgDocFirma.ImageUrl.ToString().Substring(imgDocFirma.ImageUrl.ToString().LastIndexOf("/") + 1));
                    Dic.Add("@DOC_URL_FIRMA", urlUploadImagen);
                }
                else
                {
                    urlUploadImagen = UpdateImage(imgDocFirma.ImageUrl.ToString()); 
                    Dic.Add("@DOC_URL_FIRMA", urlUploadImagen);
                }
                
                Dic.Add("@ID_DOCTOR", Session["IdDoctor"].ToString());
                
                dbexam.changeProspecto("setUpdateDoctores", Dic);
                imgDocFirma.ImageUrl = urlUploadImagen;
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit('" + pageRedirect + "');", true);
            }
            else
            {
                urlUploadImagen = UploadImage();
                Dic.Add("@DOC_URL_FIRMA", urlUploadImagen);

                dbexam.changeProspecto("setInsertaDoctores", Dic);
                imgDocFirma.ImageUrl = urlUploadImagen;
                ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess('" + pageRedirect + "');", true);
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
    protected void gvDoctores_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row =gvDoctores.Rows[index];

        int id = Convert.ToInt32(row.Cells[1].Text); //Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["ID_EXMEDICO"]);
        //String id = GridView1.DataKeys[row.RowIndex].Values["ID_DG"].ToString();
        getDatosDoctor(row);
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {
            imgDocFirma.Visible = false;
            gvDoctores.Visible = true;

            Dic.Add("@strNombre", txtNombreBuscar.Text);
            
            gvDoctores.DataSource = dbexam.getDataProspect("getDoctores", Dic);
            Session["TableSelect"] = gvDoctores.DataSource;
            gvDoctores.DataBind();
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertErrorGral('" + ex.Message + "');", true);
        }
        finally
        {
            Dic.Clear();
        }
    }

    private string UploadImage()
    {
        string uploaded = "";
        try
        {
            if (fuDocFirma.HasFile)
            {

                dynamic dinfuDocFirma = fuDocFirma;

                string filename = Path.GetFileName(dinfuDocFirma.FileName);
                IList<HttpPostedFile> postedfile = dinfuDocFirma.PostedFiles;

                BlobManager manager = new BlobManager();

                string ImageUploaded = manager.UploadImage(postedfile);

                lblEstatusCarga.Text = "Imagen Adjunta: " + ImageUploaded;
                uploaded = ImageUploaded; 
            }
            return uploaded;
        }
        catch (Exception ex)
        {
            lblEstatusCarga.Text = "Error: El archivo no se pudo cargar: " + ex.Message;
            return ex.Message;
        }
        
    }
    private string UpdateImage(string resourceId)
    {
        string updated = "";
        try
        {
            if (fuDocFirma.HasFile)
            {
                BlobManager manager = new BlobManager();
                if (resourceId != "")
                {
                    if (manager.DeleteByResourceId(resourceId))
                    {
                        updated = UploadImage();
                    }
                }
                else
                {
                    updated = UploadImage();
                }
            }
            else
            {
                updated = resourceId;
            }
            
            return updated;
        }
        catch (Exception ex)
        {
            lblEstatusCarga.Text = "Error: El archivo no se pudo cargar: " + ex.Message;
            return ex.Message;
        }
    }
    private string DeleteImage(string resourceId)
    {
        try
        {
            BlobManager manager = new BlobManager();
            manager.DeleteByResourceId(resourceId);
            return "";
        }
        catch (Exception ex)
        {
            lblEstatusCarga.Text = "Error: El archivo no se pudo cargar: " + ex.Message;
            return ex.Message;
        }

    }
    protected void getDatosDoctor(GridViewRow gr)
    {
        try
        {
            txtDocNombre.Text   = HttpUtility.HtmlDecode(gr.Cells[2].Text);
            txtDocNombre2.Text = HttpUtility.HtmlDecode(gr.Cells[3].Text.Replace("&nbsp;", string.Empty)); 
            txtDocApellido .Text = HttpUtility.HtmlDecode(gr.Cells[4].Text.Replace("&nbsp;", string.Empty));
            txtDocApellido2.Text = HttpUtility.HtmlDecode(gr.Cells[5].Text.Replace("&nbsp;", string.Empty));
            txtDocCedulaProfesional.Text = HttpUtility.HtmlDecode(gr.Cells[6].Text.Replace("&nbsp;", string.Empty));
            imgDocFirma.ImageUrl= ((HiddenField)gr.FindControl("hdnDOC_URL_FIRMA")).Value;
            imgDocFirma.Visible = true;

            gvDoctores.Visible = false;
            Session["IdDoctor"] = gr.Cells[1].Text;
        }
        catch (Exception)
        {
            throw;
        }
    }

    #endregion
}