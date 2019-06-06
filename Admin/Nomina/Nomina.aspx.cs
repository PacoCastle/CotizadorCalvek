using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventariosTableAdapters;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using NominaTableAdapters;
using System.Configuration;
using System.IO;
using System.Text;

public partial class Admin_Nomina_Nomina : System.Web.UI.Page
{
    private static int NUMFUNCION = 65;
    decimal PdeptoCargo = 0;
    decimal PdeptoAbono = 0;
    decimal PdeptoDif = 0;
    int intUsuarioId;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Web.UI.ScriptManager.GetCurrent(this).RegisterPostBackControl(btnPolizaP);
        //scriptManager.RegisterPostBackControl(this.lblbtndoc1);
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
        Response.Redirect(error);
        }

        InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
        intUsuarioId = Int32.Parse(infoSession.getValor(InfoSessionVO.USUARIOID).ToString());

        if (IsPostBack)
        {
            dgvPanelEmpDetP.DataBind();
            dgvPanelEmpleadoP.DataBind();
            dvgPanelRPP.DataBind();
            dvgPanelDeptoP.DataBind();
            //UpdatePanel1.Update();
        }


   
    }



    protected void btnConsulta_Click(object sender, EventArgs e)
    {
        
    }





    protected void lnkDepartamentoP_Command(object sender, CommandEventArgs As)
    {
        //string res = As.CommandName.ToString();
        //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Depto", "alert('" + res.ToString() + "');", true);


    }

    protected void dvgPanelDeptoP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        decimal diferencia = 0;
        string descripcion="";
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            PdeptoCargo += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Cargo"));
            PdeptoAbono += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Abono"));
            PdeptoDif += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Dif"));
            diferencia=Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Dif"));
            descripcion = DataBinder.Eval(e.Row.DataItem, "DEPARTAMENTO").ToString();
            LinkButton lbdepto = (LinkButton)e.Row.Cells[0].Controls[0];
            lbdepto.Text = descripcion;
            if (diferencia != 0)
            {
                //e.Row.BackColor=System.Drawing.Color.LightGray;
                Label lblDifC = (Label)e.Row.FindControl("label3");
                lblDifC.ForeColor = System.Drawing.Color.OrangeRed;
            }

            //btnPolizaP.Enabled = true;//Habilitar temporalmente
            
            if ((PdeptoDif == 0)  && (dvgPanelDeptoP.Rows.Count>0))
            {
                btnPolizaP.Enabled = true;
            }
            else
            {
                btnPolizaP.Enabled = false;//habilitar boton
            }
            


        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblCargo = (Label)e.Row.FindControl("lblCargoP");
            Label lblAbono = (Label)e.Row.FindControl("lblAbonoP");
            Label lblDif = (Label)e.Row.FindControl("lblDifP");
            lblCargo.Text = PdeptoCargo.ToString("c");
            lblAbono.Text = PdeptoAbono.ToString("c");
            lblDif.Text = PdeptoDif.ToString("c");

        }

    }

    protected void dvgPanelDeptoP_SelectedIndexChanged(object sender, EventArgs e)
    {

        dvgPanelRPP.SelectedIndex = -1;
        dgvPanelEmpleadoP.SelectedIndex = -1;
        dgvPanelEmpDetP.SelectedIndex = -1;
        txtRegistroPPar.Text = "";
        txtIdEmpleadoPar.Text = "";

        txtDeptoPar.Text = dvgPanelDeptoP.SelectedDataKey.Value.ToString();
  

    }
    protected void dvgPanelRPP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string RegistroPatronal ="";
        decimal diferencia = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            RegistroPatronal = DataBinder.Eval(e.Row.DataItem, "REGISTROPATRONAL").ToString();
            diferencia = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Dif"));
            LinkButton lbRegistroP = (LinkButton)e.Row.Cells[0].Controls[0];
            lbRegistroP.Text = RegistroPatronal;
            if ((diferencia < -1) || (diferencia > 1))
            {
                //e.Row.BackColor=System.Drawing.Color.LightGray;
                Label lblDifC = (Label)e.Row.FindControl("label5");
                lblDifC.ForeColor = System.Drawing.Color.OrangeRed;
            }

        }
    }
    protected void dvgPanelRPP_SelectedIndexChanged(object sender, EventArgs e)
    {
        dgvPanelEmpDetP.SelectedIndex = -1;
        dgvPanelEmpleadoP.SelectedIndex = -1;
        txtIdEmpleadoPar.Text = "";
        txtRegistroPPar.Text = dvgPanelRPP.SelectedDataKey.Value.ToString();
    }

    protected void dgvPanelEmpleadoP_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdEmpleadoPar.Text = dgvPanelEmpleadoP.SelectedDataKey.Value.ToString();
    }
    protected void dgvPanelEmpleadoP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string idempleado ="";
        decimal diferencia = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            idempleado = DataBinder.Eval(e.Row.DataItem, "idempleado").ToString();
            diferencia = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Dif"));
            LinkButton lbidempleado = (LinkButton)e.Row.Cells[0].Controls[0];
            lbidempleado.Text = idempleado;
            if ((diferencia < -1) || (diferencia > 1))
            {
                //e.Row.BackColor=System.Drawing.Color.LightGray;
                Label lblDifC = (Label)e.Row.FindControl("label10");
                lblDifC.ForeColor = System.Drawing.Color.OrangeRed;
            }

        }
    }

    
    protected void dgvCatalgo_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Update")
        {
            DataKey data = dgvCatalgo.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsCatalogo.UpdateParameters[0].DefaultValue = data.Values["CD_EMPLEADO"].ToString();
            sdsCatalogo.UpdateParameters[1].DefaultValue = data.Values["CD_RAZONSOCIAL"].ToString();
            sdsCatalogo.UpdateParameters[2].DefaultValue = data.Values["CD_CONCEPTO"].ToString();
            sdsCatalogo.UpdateParameters[3].DefaultValue = ((TextBox)dgvCatalgo.Rows[dgvCatalgo.EditIndex].FindControl("txtCuenta")).Text;
            sdsCatalogo.UpdateParameters[4].DefaultValue = ((DropDownList)dgvCatalgo.Rows[dgvCatalgo.EditIndex].FindControl("lstNaturaleza")).SelectedValue;
            sdsCatalogo.UpdateParameters[5].DefaultValue = "2";
            sdsCatalogo.UpdateParameters[6].DefaultValue = Session["usuarioId"].ToString();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "postu", "__doPostBack();", true);
            
        
         
        }
        if (e.CommandName == "Delete")
        {
            DataKey data = dgvCatalgo.DataKeys[Convert.ToInt32(e.CommandArgument)];

            sdsCatalogo.DeleteParameters[0].DefaultValue = data.Values["CD_EMPLEADO"].ToString();
            sdsCatalogo.DeleteParameters[1].DefaultValue = data.Values["CD_RAZONSOCIAL"].ToString();
            sdsCatalogo.DeleteParameters[2].DefaultValue = data.Values["CD_CONCEPTO"].ToString();
            sdsCatalogo.DeleteParameters[3].DefaultValue = "3";
            sdsCatalogo.DeleteParameters[4].DefaultValue = Session["usuarioId"].ToString();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "postd", "__doPostBack();", true);
            
        }
    }
    protected void dgvCatalgo_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdEmpleado.Text = lstEmpleado.SelectedValue.ToString(); //dgvCatalgo.SelectedDataKey.Values["CD_EMPLEADO"].ToString();
        txtEmpleado.Text = lstEmpleado.SelectedItem.ToString();  //dgvCatalgo.SelectedDataKey.Values["NB_EMPLEADO"].ToString();
        txtRazonSocial.Text = lstRazonSocial.SelectedValue.ToString(); //dgvCatalgo.SelectedDataKey.Values["CD_RAZONSOCIAL"].ToString();
        txtIdDepto.Text = lstDepartamento.SelectedValue.ToString();//dgvCatalgo.SelectedDataKey.Values["CD_DEPARTAMENTO"].ToString();
        txtDepto.Text = lstDepartamento.SelectedItem.ToString();//dgvCatalgo.SelectedDataKey.Values["NB_DEPARTAMENTO"].ToString();

        lstConceptos.DataBind();
        txtCuenta.Text = "";
        this.btnPopUp_ModalPopupExtender.Show();

    }
    //protected void lstConceptos_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    sdsTipo.DataBind();
    //}
    protected void btnCerrarPopUp_Click(object sender, ImageClickEventArgs e)
    {
        this.btnPopUp_ModalPopupExtender.Hide();
    }
    protected void btnInsertar_Click(object sender, ImageClickEventArgs e)
    {
        sdsConceptos.InsertParameters[0].DefaultValue = txtIdEmpleado.Text;
        sdsConceptos.InsertParameters[1].DefaultValue = txtRazonSocial.Text;
        sdsConceptos.InsertParameters[2].DefaultValue = txtCuenta.Text;
        sdsConceptos.InsertParameters[3].DefaultValue = "";
        sdsConceptos.InsertParameters[4].DefaultValue = lstConceptos.SelectedValue.ToString();
        sdsConceptos.InsertParameters[5].DefaultValue = lstConceptos.SelectedItem.ToString();
        sdsConceptos.InsertParameters[6].DefaultValue = lstNaturaleza.SelectedValue.ToString();
        sdsConceptos.InsertParameters[7].DefaultValue = "";
        sdsConceptos.InsertParameters[8].DefaultValue = "1";
        sdsConceptos.InsertParameters[9].DefaultValue = Session["usuarioId"].ToString();

        sdsConceptos.Insert();
        dgvCatalgo.DataBind();
        btnPopUp_ModalPopupExtender.Hide();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "postins", "__doPostBack();", true);
    }

    private void limpia_parametros()
    {
        txtDeptoPar.Text = "";
        txtRegistroPPar.Text = "";
        txtIdEmpleadoPar.Text = "";
        dvgPanelDeptoP.SelectedIndex = -1;
        lblresultado2.Text = "";
    }
    

    protected void lstRazonP_SelectedIndexChanged(object sender, EventArgs e)
    {
         limpia_parametros();
    }
        
    protected void lstAñoP_SelectedIndexChanged(object sender, EventArgs e)
    {
        limpia_parametros();
    }
    protected void lstPeriodo_SelectedIndexChanged(object sender, EventArgs e)
    {
        limpia_parametros();
    }
    protected void lstSemanaP_SelectedIndexChanged(object sender, EventArgs e)
    {
        limpia_parametros();
    }
    protected void btnPolizaP_Click(object sender, EventArgs e)
    {
        string nomfile="";
        int quantitycolumn = 12;
        int countcolumn = 1;
        try  
        {
            sp_inserta_nomina_gral_NETSUITETableAdapter sp_inserta_nomina_gral_NETSUITE = new sp_inserta_nomina_gral_NETSUITETableAdapter();
            sp_inserta_nomina_gral_NETSUITE.GetData(lstRazonP.SelectedItem.Value,Int32.Parse(lstSemanaP.SelectedItem.Value.ToString()),Int32.Parse(lstAñoP.SelectedItem.Value.ToString()),Int32.Parse(lstPeriodo.SelectedItem.Value.ToString()),intUsuarioId, ref nomfile);

            string constr = ConfigurationManager.ConnectionStrings["NOMINA"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT  [date],[exchange],[debit], [credit],[account],[currency],[subsidiary],[nota] [memo],[nota],[registropatronal],[location],[externalid] FROM [NOMINA].[dbo].[POLIZA_TEMP_NETSUITE] order by registropatronal,3 desc, 4 desc"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            //Build the CSV file data as a Comma separated string.
                            string csv = string.Empty;
                            foreach (DataColumn column in dt.Columns)
                            {
                                //Add the Header row for CSV file.
                                if (quantitycolumn == countcolumn)
                                {
                                    csv += column.ColumnName;
                                }
                                else
                                {
                                    csv += column.ColumnName + ',';
                                }
                                countcolumn++;
                            }
                          
                            //Add new line.
                            csv += "\r\n";
                            foreach (DataRow row in dt.Rows)
                            {
                                countcolumn = 1;
                                foreach (DataColumn column in dt.Columns)
                                {

                                    if (quantitycolumn == countcolumn)
                                    {
                                        csv += row[column.ColumnName].ToString().Replace(",", ";");
                                    }
                                    else
                                    {
                                        //Add the Data rows.
                                        csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
                                    }
                                    countcolumn++;
                                }
                                //Add new line.
                                csv += "\r\n";
                            }

                            //Download the CSV file.
                            /*
                            StreamWriter sw = new StreamWriter("d:\\prueba.csv");
                            sw.Write(csv);
                            sw.Close();
                            */
                            string attachment = "attachment; filename=" + "SICK_" + nomfile + ".csv";
                            HttpContext.Current.Response.Clear();
                            HttpContext.Current.Response.ClearHeaders();
                            HttpContext.Current.Response.ClearContent();
                            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
                            HttpContext.Current.Response.ContentType = "text/csv";
                            HttpContext.Current.Response.AddHeader("Pragma", "public");
                            HttpContext.Current.Response.Write(csv.ToString());
                            HttpContext.Current.Response.End();

                        }

                    }

                }

            }
         

          
           
        }
        catch (Exception ex)
        {
            
            lblresultado2.Text="Error en generación de archivo";

        }
        
    }
}
