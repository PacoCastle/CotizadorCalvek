using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Examenes_DatosGenerales : System.Web.UI.Page
{

    #region Inicializacion
    SqlClientExamenes dbexam = new SqlClientExamenes();
    DataTable oDataTable = new DataTable();
    DataTable oDataStatus = new DataTable();
    encryption cryp = new encryption();
    EnumMessage message = new EnumMessage();

    #endregion

    #region Eventos
    protected void Page_PreLoad(object sender, EventArgs e)
    {

    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            oDataTable = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_SEX");
            oDataStatus = dbexam.getDataDropDown("SELECT * FROM TU_EXMED_CAT_ESTATUS");
            llenaDrops();
            Session["IdPaciente"] = null;
        }

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {

            Dic.Add("@DG_NOMBRE", txtDgNombre.Text);
            Dic.Add("@DG_NOMBRE_2", txtDgNombre2.Text);
            Dic.Add("@DG_APELLIDO_PATERNO", txtDgApellidoP.Text);
            Dic.Add("@DG_APELLIDO_MATERNO", txtDgApellidoM.Text);
            Dic.Add("@DG_FECHA_NACIMIENTO", Convert.ToDateTime(txtDgFechaNac.Text));
            Dic.Add("@DG_ID_EMPRESA", ddlEmpresa.SelectedValue);
            Dic.Add("@DG_ID_SEXO", ddlSexo.SelectedValue);
            Dic.Add("@DG_ID_ESTATUS", ddlEstatus.SelectedValue);
            var DateNow = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);

            if (Session["IdPaciente"] != null)
            {
                Dic.Add("@ID_DG", Session["IdPaciente"].ToString());
                dbexam.changeProspecto("setUpdateExamenDatosGenerales", Dic);
                ClientScript.RegisterStartupScript(this.GetType(), "Actualiza", "ShowAlertSucesseEdit(''," + (int)EnumMessage.Message.ShowAlertSucesseEdit + ");", true);
            }
            else
            {
                Dic.Add("@DG_FECHA_INSERTA", DateNow);
                if (dbexam.changeProspectoByEstatus("setInsertaExamenDatosGenerales", Dic) == 0)
                    ClientScript.RegisterStartupScript(this.GetType(), "Inserta", "ShowAlertSucess(''," + (int)EnumMessage.Message.ShowAlertSucess + ");", true);
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertError('" + message.buildMessage("Ya existe el usuario") + "');", true);
            }

        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "ShowAlertError('" + message.buildMessage(ex.Message) + "');", true);
        }
        finally
        {
            Dic.Clear();
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int numero = 0;
        int Id_Persona = 0;
        if (int.TryParse(e.CommandArgument.ToString(), out numero))
        {

            int index = Convert.ToInt32(e.CommandArgument);
            if ((index) < GridView1.Rows.Count)
            {
                GridViewRow row = GridView1.Rows[index];

                Id_Persona = Convert.ToInt32(row.Cells[2].Text); //Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["ID_EXMEDICO"]);
            }                                 //String id = GridView1.DataKeys[row.RowIndex].Values["ID_DG"].ToString();
            int Id_Modulo = 0;


            //if (e.CommandName == "ExamenGral")
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('ExamenGral.aspx?Id_Persona=" + Id_Persona + "')", true);
            //}
            if (e.CommandName == "Interpretacion")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Interpretacion.aspx?Id_Persona=" + Id_Persona + "')", true);
            }
            else if (e.CommandName == "Toxicologico")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Toxicologico.aspx?Id_Persona=" + Id_Persona + "')", true);
            }
            else if (e.CommandName == "Laboratorio")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Laboratorio.aspx?Id_Persona=" + Id_Persona + "')", true);
            }
            else if (e.CommandName == "ExamenGral")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('ExamenGral.aspx?Id_Persona=" + Id_Persona + "&idModuloOrigen=" + Id_Modulo + "')", true);
            }
            else if (e.CommandName == "Audiometria")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Audiometria.aspx?Id_Persona=" + Id_Persona + "&idModuloOrigen=" + Id_Modulo + "')", true);
            }
            else if (e.CommandName == "Espirometria")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Espirometria.aspx?Id_Persona=" + Id_Persona + "&idModuloOrigen=" + Id_Modulo + "')", true);
            }
            else if (e.CommandName == "Radiologia")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Radiologia.aspx?Id_Persona=" + Id_Persona + "&idModuloOrigen=" + Id_Modulo + "')", true);
            }
            else if (e.CommandName == "Resumen")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenExamen", "OpenWindow('Resumen.aspx?Id_Persona=" + Id_Persona + "&idModuloOrigen=" + Id_Modulo + "')", true);
            }
            else if (e.CommandName == "Editar")
            {
                GridViewRow row = GridView1.Rows[index];
                getDatosPaciente(row);
            }
        }

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> Dic = new Dictionary<string, object>();
        try
        {

            GridView1.Visible = true;

            Dic.Add("@DG_ID_EMPRESA", "0185");
            Dic.Add("@strNombre", txtNombreBuscar.Text);
            Dic.Add("@ID_PERSONA", txtId.Text);
            Dic.Add("@DG_APELLIDO_PATERNO", txtApellidoP.Text);
            Dic.Add("@DG_FECHA_NACIMIENTO", String.IsNullOrEmpty(txtFecha.Text) ? Convert.ToDateTime("01/01/1900") : Convert.ToDateTime(txtFecha.Text));

            GridView1.DataSource = dbexam.getDataProspect("getExamenDatosGenerales", Dic);
            Session["TableSelect"] = GridView1.DataSource;
            GridView1.DataBind();



            Session["IdPaciente"] = null;


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

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        txtId.Text = string.Empty;
        txtNombreBuscar.Text = string.Empty;
        txtApellidoP.Text = string.Empty;
        txtFecha.Text = string.Empty;
    }

    protected void getDatosPaciente(GridViewRow gr)
    {
        try
        {
            string row = GridView1.DataKeys[gr.RowIndex].Values[0].ToString();
            txtDgNombre.Text = HttpUtility.HtmlDecode(gr.Cells[3].Text);
            txtDgNombre2.Text = HttpUtility.HtmlDecode(gr.Cells[4].Text.Replace("&nbsp;", string.Empty)); //.Text;
            txtDgApellidoP.Text = HttpUtility.HtmlDecode(gr.Cells[5].Text.Replace("&nbsp;", string.Empty));
            txtDgApellidoM.Text = HttpUtility.HtmlDecode(gr.Cells[6].Text.Replace("&nbsp;", string.Empty));
            txtDgFechaNac.Text = Convert.ToDateTime(gr.Cells[7].Text).ToString("dd/MM/yyyy");
            ddlEstatus.SelectedValue = row;
            ddlEstatus.Enabled = true;

            GridView1.Visible = false;
            Session["IdPaciente"] = gr.Cells[2].Text;
        }
        catch (Exception)
        {
            throw;
        }
    }

    #endregion

    #region Metodos
    private void llenaDrops()
    {
        ddlSexo.DataSource = oDataTable;
        ddlSexo.DataBind();

        ddlEstatus.DataSource = oDataStatus;
        ddlEstatus.DataBind();
    }

    #endregion


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        btnBuscar_Click(sender, e);

    }


    //private string SortDirection
    //{
    //    get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
    //    set { ViewState["SortDirection"] = value; }
    //}

    //protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    //{
    //    this.BindGrid(e.SortExpression);
    //}


    //private void BindGrid(string sortExpression = null)
    //{
    //    btnBuscar_Click(null, null);

    //    DataTable dt = (DataTable)GridView1.DataSource;
    //    if (sortExpression != null)
    //    {
    //        DataView dv = dt.AsDataView();
    //        this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

    //        dv.Sort = sortExpression + " " + this.SortDirection;
    //        GridView1.DataSource = dt;
    //    }
    //    else
    //    {
    //        GridView1.DataSource = dt;
    //    }
    //    GridView1.DataBind();


    //}



    //protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        ((DropDownList)e.Row.FindControl("ddlEstatus")).DataSource = oDataTable;
    //        ((DropDownList)e.Row.FindControl("ddlEstatus")).SelectedValue = ((DataTable)Session["TableSelect"]).Rows[e.Row.RowIndex]["DG_ID_ESTATUS"].ToString();
    //    }
    //}
}