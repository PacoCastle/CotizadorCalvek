using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class CalendarioComisiones_CalendarioComisiones : System.Web.UI.Page
{
    private static int NUMFUNCION = 70;
    private static int isFunction;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        if (!IsPostBack)
        {
            txtFechaCalendario.Text = "01/" + DateTime.Now.ToString("MM/yyyy");
            AgregaFechaDiv.Visible = false;
            AgregaAgenteDiv.Visible = false;
            AgregaGarantiaDiv.Visible = false;
            EditAgenteDiv.Visible = false;
            garantiaFhEditDiv.Visible = false;

            txtSucursal.Enabled = false;
            txtSucursarEdit.Enabled = false;
            lblValidaFechas.Text = "";
            btnShowAgente.Visible = true;
        }
        //INFORMACION DE LA SESION
        InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
        lblUsuario.Text = infoSession.getValor(InfoSessionVO.USUARIOID).ToString();
        Session["usuarioId"] = infoSession.getValor(InfoSessionVO.USUARIOID);
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        AgregaFechaDiv.Visible = true;
    }

    protected void btnCancelar_OnClick(object sender, EventArgs e)
    {
        AgregaFechaDiv.Visible = false;
        this.txtFechaCalendario.Text = "01/" + DateTime.Now.ToString("MM/yyyy");
    }

    protected void fechasComision_RowDataBound(object o, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow) {
            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
        }

    }

    protected void actualizaEstatus_OnClick(object sender, EventArgs e)
    {
        Button objImage = (Button)sender;
        string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
        string idFechaComision = commandArgs[0];
        string usuarioId = lblUsuario.Text.ToString();

        fechaCalendarioComisionVO VO = new fechaCalendarioComisionVO();
        fechaCalendarioComisionBL BL = new fechaCalendarioComisionBL();

        VO.IdFechaCalendario = idFechaComision;
        VO.UsuarioModificacionId = usuarioId;

        VO.Operacion = fechaCalendarioComisionVO.ACTUALIZAR;
        VO = (fechaCalendarioComisionVO)BL.execute(VO);

        if (VO.Resultado > 0)
        {
            this.ctrPopup1.Show();
            this.dgvFechasComision.DataBind();
        }
        else
        {
            this.ctrPopup2.Show();
        }      

    }

    protected void btnAgregar_OnClick(object sender, EventArgs e)
    {
        //Se recuperan los parametros
        string fechaCalendarioCom = txtFechaCalendario.Text.ToString();
        string usuarioId = lblUsuario.Text.ToString();

        fechaCalendarioComisionVO VO = new fechaCalendarioComisionVO();
        fechaCalendarioComisionBL BL = new fechaCalendarioComisionBL();

        VO.FechaCalendario = fechaCalendarioCom;
        VO.UsuarioModificacionId = usuarioId;

        VO.Operacion = fechaCalendarioComisionVO.INSERTAR;
        VO = (fechaCalendarioComisionVO)BL.execute(VO);

        if (VO.Resultado > 0)
        {
            this.ctrPopup1.Show();
            this.txtFechaCalendario.Text = "01/" + DateTime.Now.ToString("MM/yyyy");
            this.AgregaFechaDiv.Visible = false;
            this.dgvFechasComision.DataBind();
        }
        else
        {
            this.ctrPopup2.Show();
        }      
    }

    protected void popupClose_Click(object sender, EventArgs e)
    {
        ctrPopup1.Hide();
        ctrPopup2.Hide();
        ctrPopup3.Hide();
        ctrPopup4.Hide();
        ctrPopup5.Hide();
        ctrPopup6.Hide();
    }

    protected void tabContainer_ActiveTabChanged(object sender, EventArgs e)
    {
        
    }

    //FUNCIONES DE AGENTES / GARANTIAS

    protected void btnShowAgente_Click(object sender, EventArgs e)
    {
        isFunction = 1;
        AgregaAgenteDiv.Visible = true;
    }

    protected void btnCancelarAgente_OnClick(object sender, EventArgs e)
    {
        AgregaAgenteDiv.Visible = false;
        AgregaGarantiaDiv.Visible = false;

        //Borrado de datos
        lstAgentes.Text = null;
        lstOficinas.Text = null;
        txtSucursal.Text = "";
        lstPuesto.Text = null;
        txtGarantia.Text = "";
        txtFhInicioGt.Text = "";
        txtFhVigenciaGt.Text = "";
        lblValidaFechas.Text = "";
        btnShowAgente.Visible = true;
        btnAddAgente.Text = "Aceptar";
        lstAgentes.Enabled = true;
        lstOficinas.Enabled = true;
    }

    protected void btnAgregarAgente_OnClick(object sender, EventArgs e)
    {
            //Se recuperan los parametros
            string idAgt = lstAgentes.SelectedValue.ToString();
            string nbAgt = lstAgentes.SelectedItem.ToString();
            string idOficina = lstOficinas.SelectedValue.ToString();
            string nbOficina = lstOficinas.SelectedItem.ToString();
            string nbSucursal = txtSucursal.Text.ToString();
            string idPuesto = lstPuesto.SelectedValue.ToString();
            string faGarantia = txtGarantia.Text.ToString();
            string fhInicioGt = txtFhInicioGt.Text.ToString();
            string fhVigenciaGt = txtFhVigenciaGt.Text.ToString();

            //Validacion de fechas, si contiene garantia
            if (!string.IsNullOrEmpty(faGarantia))
            {
                decimal garantiaValidate = System.Convert.ToDecimal(faGarantia);
                if (garantiaValidate != 0)
                {
                    if (!string.IsNullOrEmpty(fhInicioGt) && !string.IsNullOrEmpty(fhVigenciaGt))
                    {
                        DateTime fhInicioDt = DateTime.Parse(fhInicioGt);
                        DateTime fhVigenciaDt = DateTime.Parse(fhVigenciaGt);

                        //Fecha de inicio no puede ser mayor a Vigencia
                        if (fhInicioDt >= fhVigenciaDt)
                        {
                            lblValidaFechas.Text = "La Fecha de Inicio no puede ser mayor o igual a la fecha de Vigencia";
                            return;
                        }
                    }
                    else
                    {
                        lblValidaFechas.Text = "Los campos Inicio y Vigencia son Requeridos";
                        return;
                    }
                
                }
            }

            //Comienza el insert de datos
            fechaCalendarioComisionVO VO = new fechaCalendarioComisionVO();
            fechaCalendarioComisionBL BL = new fechaCalendarioComisionBL();

            VO.IdAgente = idAgt;
            VO.NbAgente = nbAgt;
            VO.IdOficina = Convert.ToInt32(idOficina);
            VO.NbOficina = nbOficina;
            VO.NbSucursal = nbSucursal;
            VO.IdPuesto = Convert.ToInt32(idPuesto);

            if (!string.IsNullOrEmpty(faGarantia))
            { 
                decimal gtValidate = System.Convert.ToDecimal(faGarantia);
                if (gtValidate != 0)
                {
                    if (!string.IsNullOrEmpty(fhInicioGt))
                    {
                        VO.FhInicio = DateTime.Parse(fhInicioGt);
                    }
                    if (!string.IsNullOrEmpty(fhVigenciaGt))
                    {
                        VO.FhVigencia = DateTime.Parse(fhVigenciaGt);
                    }
                }           
            }
                    
            if (string.IsNullOrEmpty(faGarantia))
            {
                faGarantia = "0";
            }
            VO.FaGarantia = System.Convert.ToDecimal(faGarantia);
            VO.Operacion = fechaCalendarioComisionVO.INSERTARAGT;
            VO = (fechaCalendarioComisionVO)BL.execute(VO);

            if (VO.Resultado > 0)
            {
                this.ctrPopup1.Show();
                AgregaAgenteDiv.Visible = false;
                AgregaGarantiaDiv.Visible = false;
                this.dgvAgentesGarantias.DataBind();
                this.lstAgentesFltr.DataBind();
                this.lstPuestosFltr.DataBind();
                this.lstSucursalesFltr.DataBind();

                //Borrado de datos
                lstAgentes.Text = null;
                lstOficinas.Text = null;
                txtSucursal.Text = "";
                lstPuesto.Text = null;
                txtGarantia.Text = "";
                txtFhInicioGt.Text = "";
                txtFhVigenciaGt.Text = "";
                lblValidaFechas.Text = "";

            }
            else if (VO.Resultado == -1)
            {
                this.ctrPopup4.Show();
            }
            else
            {
                this.ctrPopup5.Show();
            }
    }

    protected void oficina_onChange(object sender, EventArgs e)
    {
        string idOficina = lstOficinas.SelectedValue.ToString();

        if (idOficina == "1" || idOficina == "6")
        {
            txtSucursal.Text = "Queretaro";
        }
        else

            if (idOficina == "3" || idOficina == "7")
            {
                txtSucursal.Text = "Celaya";
            }
            else

                if (idOficina == "9" || idOficina == "8")
                {
                    txtSucursal.Text = "Irapuato";
                }
                else

                    if (idOficina == "5" || idOficina == "2")
                    {
                        txtSucursal.Text = "San Luis";
                    }
                    else
                    {
                        txtSucursal.Text = " ";
                    }
    }

    protected void puesto_onChange(object sender, EventArgs e)
    {
        string idPuesto = lstPuesto.SelectedValue.ToString();

        if (idPuesto == "2" || idPuesto == "3" || idPuesto == "4" || idPuesto == "5")
        {
            AgregaGarantiaDiv.Visible = true;
        }
        else
        {
            AgregaGarantiaDiv.Visible = false;
            txtGarantia.Text = "";
            txtFhInicioGt.Text = "";
            txtFhVigenciaGt.Text = "";
            lblValidaFechas.Text = "";
        }
    }

    protected void buscaEditAgt_OnClick(object sender, EventArgs e)
    {

        Button objImage = (Button)sender;
        string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
        string idAgenteGarantia = commandArgs[0];

        isFunction = 2;
        EditAgenteDiv.Visible = true;
        btnShowAgente.Visible = false;
        grdFiltrosDiv.Visible = false;
        lstAgentesEdit.Enabled = false;
        lstOficinaEdit.Enabled = false;
        AgregaAgenteDiv.Visible = false;

        fechaCalendarioComisionVO VO = new fechaCalendarioComisionVO();
        fechaCalendarioComisionBL BL = new fechaCalendarioComisionBL();

        VO.IdAgenteGarantia = idAgenteGarantia;
        VO.Operacion = fechaCalendarioComisionVO.BUSCARAGT;
        VO = (fechaCalendarioComisionVO)BL.execute(VO);

        if (VO.Resultado == 0)
        {
            txtAgenteGarantiaOc.Text = VO.IdAgenteGarantia;
            lstAgentesEdit.SelectedValue = VO.IdAgente;
            lstOficinaEdit.SelectedValue = VO.IdOficinaStr;
            txtSucursarEdit.Text = VO.NbSucursal;
            lstPuestoEdit.SelectedValue = VO.IdPuestoStr;
            if (VO.IdPuestoStr == "2" || VO.IdPuestoStr == "3" || VO.IdPuestoStr == "4" || VO.IdPuestoStr == "5")
            {
                garantiaFhEditDiv.Visible = true;
                if (!string.IsNullOrEmpty(VO.FaGarantiaStr) && VO.FaGarantiaStr != "0.00")
                {
                    txtGarantiaEdit.Text = VO.FaGarantiaStr;
                }
            }

            if (!string.IsNullOrEmpty(VO.FhInicioStr))
            {
                txtFhInicioEdit.Text = VO.FhInicioStr;
            }
            if (!string.IsNullOrEmpty(VO.FhVigenciaStr))
            {
                txtFhVigenciaEdit.Text = VO.FhVigenciaStr;
            }

        }

    }

    protected void deleteAgt_OnClick(object sender, EventArgs e)
    {

        Button objImage = (Button)sender;
        string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
        string idAgenteGarantia = commandArgs[0];

        fechaCalendarioComisionVO VO = new fechaCalendarioComisionVO();
        fechaCalendarioComisionBL BL = new fechaCalendarioComisionBL();

        VO.IdAgenteGarantiaInt = Convert.ToInt32(idAgenteGarantia);
        VO.Operacion = fechaCalendarioComisionVO.ESTATUSAGT;
        VO = (fechaCalendarioComisionVO)BL.execute(VO);

        if (VO.Resultado == 0)
        {
            this.ctrPopup1.Show();
            this.dgvAgentesGarantias.DataBind();
        }
        else
        {
            this.ctrPopup5.Show();
        }

    }

    protected void ayudaGarantia_OnClick(object sender, EventArgs e)
    {
        ctrPopup6.Show();
    }

    protected void btnCancelarAgenteEdit_OnClick(object sender, EventArgs e)
    {
        EditAgenteDiv.Visible = false;
        garantiaFhEditDiv.Visible = false;
        btnShowAgente.Visible = true;
        grdFiltrosDiv.Visible = true;


        //Borrado de datos
        lstAgentesEdit.Text = null;
        lstOficinaEdit.Text = null;
        txtSucursarEdit.Text = "";
        lstPuestoEdit.Text = null;
        txtGarantiaEdit.Text = "";
        txtFhInicioEdit.Text = "";
        txtFhVigenciaEdit.Text = "";
        lblValidaFechas2.Text = "";
        lstAgentesEdit.Enabled = true;
        lstOficinaEdit.Enabled = true;
    }

    protected void puestoEditar_onChange(object sender, EventArgs e)
    {
        string idPuesto = lstPuestoEdit.SelectedValue.ToString();

        if (idPuesto == "2" || idPuesto == "3" || idPuesto == "4" || idPuesto == "5")
        {
            garantiaFhEditDiv.Visible = true;
        }
        else
        {
            garantiaFhEditDiv.Visible = false;
            txtGarantiaEdit.Text = "";
            txtFhInicioEdit.Text = "";
            txtFhVigenciaEdit.Text = "";
            lblValidaFechas2.Text = "";
        }
    }

    protected void btnEditAgt_OnClick(object sender, EventArgs e)
    {
            //Se recuperan los parametros
            string idAgenteGrantia = txtAgenteGarantiaOc.Text.ToString();
            string idPuesto = lstPuestoEdit.SelectedValue.ToString();
            string faGarantia = txtGarantiaEdit.Text.ToString();
            string fhInicioGt = txtFhInicioEdit.Text.ToString();
            string fhVigenciaGt = txtFhVigenciaEdit.Text.ToString();
          
            //Validacion de fechas, si contiene garantia
            if (!string.IsNullOrEmpty(faGarantia))
            {
                decimal garantiaValidate = System.Convert.ToDecimal(faGarantia);
                if (garantiaValidate != 0)
                {
                    if (!string.IsNullOrEmpty(fhInicioGt) && !string.IsNullOrEmpty(fhVigenciaGt))
                    {
                        DateTime fhInicioDt = DateTime.Parse(fhInicioGt);
                        DateTime fhVigenciaDt = DateTime.Parse(fhVigenciaGt);

                        //Fecha de inicio no puede ser mayor a Vigencia
                        if (fhInicioDt >= fhVigenciaDt)
                        {
                            lblValidaFechas2.Text = "La Fecha de Inicio no puede ser mayor o igual a la fecha de Vigencia";
                            return;
                        }
                    }
                    else
                    {
                        lblValidaFechas2.Text = "Los campos Inicio y Vigencia son Requeridos";
                        return;
                    }
                }
            }

            //Comienza la actualizacion de datos
            fechaCalendarioComisionVO VO = new fechaCalendarioComisionVO();
            fechaCalendarioComisionBL BL = new fechaCalendarioComisionBL();

            VO.IdAgenteGarantiaInt = Convert.ToInt32(idAgenteGrantia);
            VO.IdPuesto = Convert.ToInt32(idPuesto);
           
            if (!string.IsNullOrEmpty(faGarantia))
            {
                decimal gtValidate = System.Convert.ToDecimal(faGarantia);
                if (gtValidate != 0)
                {
                    if (!string.IsNullOrEmpty(fhInicioGt))
                    {
                        VO.FhInicio = DateTime.Parse(fhInicioGt);
                    }
                    if (!string.IsNullOrEmpty(fhVigenciaGt))
                    {
                        VO.FhVigencia = DateTime.Parse(fhVigenciaGt);
                    }
                }
            }
            
            if (string.IsNullOrEmpty(faGarantia))
            {
                faGarantia = "0";
            }
            VO.FaGarantia = System.Convert.ToDecimal(faGarantia);            
            VO.Operacion = fechaCalendarioComisionVO.EDITAGT;
            VO = (fechaCalendarioComisionVO)BL.execute(VO);

            if (VO.Resultado == 0)
            {
                this.ctrPopup1.Show();
                this.dgvAgentesGarantias.DataBind();

                EditAgenteDiv.Visible = false;
                btnShowAgente.Visible = true;
                grdFiltrosDiv.Visible = true;

                //Borrado de datos
                lstAgentesEdit.Text = null;
                lstOficinaEdit.Text = null;
                txtSucursarEdit.Text = "";
                lstPuestoEdit.Text = null;
                txtGarantiaEdit.Text = "";
                txtFhInicioEdit.Text = "";
                txtFhVigenciaEdit.Text = "";
                lblValidaFechas2.Text = "";
            }
            else
            {
                this.ctrPopup5.Show();
            }
    }

    protected void dgvAgentesGarantias_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[7].Text == "0.00") { 
                e.Row.Cells[7].Text = " ";
            }
        }
    }
}
