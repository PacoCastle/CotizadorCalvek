using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_DIOT_asignacionPeriodoAcreditacion2 : System.Web.UI.Page
{

    private static int NUMFUNCION = 44;

    Double fltOtrasErogaciones = 0.0, fltImporteAntErogaciones=0.0 ;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        //txtAno.Text = System.DateTime.Now.ToString("yyyy");
    }
  
    protected void btnAplicaPeriodo_Click(object sender, EventArgs e)
    {
        int inrRevision = revisaFechaAcreditacionPolizas();

        if (inrRevision == 1)
        {
        DiotVO VO = new DiotVO();
        DiotBL BL = new DiotBL();
        VO.Operacion = DiotVO.INSERTAR;

        int anoAcreditacion = Int32.Parse(txtAnoAcreditacion.Text.Trim());
        int mesAcreditacion = Int32.Parse(lstMesAcreditacion.SelectedValue.ToString());

        VO.AnoAcreditamiento = anoAcreditacion;
        VO.MesAcreditamiento = mesAcreditacion;
        VO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());

        //ArrayList arrListaPolizas = getListaPolizas();
        //ArrayList listaPolizas = new ArrayList();

        String strSucursal = "";

        if (gvPolizas.Rows.Count > 0)
            {
                foreach (GridViewRow row in gvPolizas.Rows)
                {
                    strSucursal = gvPolizas.DataKeys[row.RowIndex][0].ToString().Trim();
                    CheckBox ckbPoliza = ((CheckBox)row.FindControl("ckbPoliza"));
                    bool result = ckbPoliza.Checked;
                    if (result)
                    {
                        //String strFecha = row.Cells[3].Text;
                        String strFecha = gvPolizas.DataKeys[row.RowIndex][1].ToString().Trim();
                        String anoPoliza = strFecha.Substring(6, 4);
                        String mesPoliza = strFecha.Substring(3, 2);

                        if (anoAcreditacion >= Int32.Parse(anoPoliza))
                        {
                            //if (mesAcreditacion >= Int32.Parse(mesPoliza))
                            //{
                                //VO.PolizaId = Int32.Parse(row.Cells[1].Text);
                                VO.PolizaId = Int32.Parse(gvPolizas.DataKeys[row.RowIndex][2].ToString().Trim());
                                //VO.Cuenta = row.Cells[2].Text.Trim();
                                VO.Cuenta = gvPolizas.DataKeys[row.RowIndex][3].ToString().Trim();
                                VO.Sucursal = strSucursal.Trim();
                                //VO.ClaveProveedor = row.Cells[4].Text.Trim();
                                VO.ClaveProveedor = gvPolizas.DataKeys[row.RowIndex][4].ToString().Trim();
                                //VO.TipoPoliza = row.Cells[9].Text.Trim();
                                VO.TipoPoliza = gvPolizas.DataKeys[row.RowIndex][6].ToString().Trim();
                                //VO.SerieDocumento = row.Cells[10].Text.Split('-')[0].Trim();
                                //VO.FolioDocumento = row.Cells[10].Text.Split('-')[1].Trim();
                                //VO.SerieDocumento = gvPolizas.DataKeys[row.RowIndex][5].ToString().Trim().Split('-')[0].Trim();
                                //VO.FolioDocumento = gvPolizas.DataKeys[row.RowIndex][5].ToString().Trim().Split('-')[1].Trim();
                                VO.SerieDocumento = gvPolizas.DataKeys[row.RowIndex][5].ToString().Substring(4).ToString().Trim().Split('-')[0].Trim();
                                VO.FolioDocumento = gvPolizas.DataKeys[row.RowIndex][5].ToString().Substring(4).ToString().Trim().Split('-')[1].Trim();

                                
                                VO = (DiotVO)BL.execute(VO);
                                //if (VO.Resultado == 0)

                                //listaPolizas.Add(index);
                            //}
                            //else
                            //{
                            //    ckbPoliza.Text = "Fecha menos al periodo de acreditamiento";
                            //}
                        }
                        //else
                        //{
                        //    ckbPoliza.Text = "Fecha menos al periodo de acreditamiento";
                        //}


                    }
                    // ckbPoliza.Dispose();
                }

            }
            lblMensajeEx.Text = "Cambio Exitoso";
        }

      if(inrRevision == 2)
        {
            lblMensaje.Text = "Fecha menor o igual al periodo de acreditamiento";
        }

      if(inrRevision == 0)
        {
            lblMensaje.Text = "Seleccione alguna póliza";
        }

    }

    private int revisaFechaAcreditacionPolizas()
    {
        //  2   Fecha Acreditación menor
        //  1   Correcto
        //  0   No hay elementos


        lblMensaje.Text = "";
        lblMensajeEx.Text = "";
        int intBandera = 0;

        int anoAcreditacion = Int32.Parse(txtAnoAcreditacion.Text.Trim());
        int mesAcreditacion = Int32.Parse(lstMesAcreditacion.SelectedValue.ToString());

            ArrayList listaPolizas = new ArrayList();
            String index = "-1";
            if (gvPolizas.Rows.Count > 0)
            {
                foreach (GridViewRow row in gvPolizas.Rows)
                {
                    index = gvPolizas.DataKeys[row.RowIndex][0].ToString().Trim();
                    
                    CheckBox ckbPoliza = ((CheckBox)row.FindControl("ckbPoliza"));
                    bool result = ckbPoliza.Checked;
                    if (result)
                    {
                    //String strFecha = row.Cells[3].Text;
                    String strFecha = gvPolizas.DataKeys[row.RowIndex][1].ToString().Trim();
                    String anoPoliza = strFecha.Substring(6, 4);
                    String mesPoliza = strFecha.Substring(3, 2);

                    if (anoAcreditacion < Int32.Parse(anoPoliza))
                        {
                            intBandera = 2;
                            //return 1;
                        }
                    else
                        {
                            intBandera = 1;
                            if (mesAcreditacion < Int32.Parse(mesPoliza))
                            {
                                //intBandera = 2;
                                //return 1;
                            }
                        }
                        
                    }
                   // ckbPoliza.Dispose();
                }
            }

     return intBandera;
    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        //lblTemporal.Text = lstMes.SelectedValue.ToString();
        
        sdsPolizasDiot.EnableViewState = true;
        gvPolizas.Visible = true;
        panelAplica.Visible = true;
        lblEtiDetalle.Visible = true;

        txtAnoAcreditacion.Text = txtAno.Text;
        
        //lstMesAcreditacion.SelectedIndex = lstMes.SelectedIndex + 1;
        
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox thisTextBox = (TextBox)sender;
        fltOtrasErogaciones = Double.Parse(thisTextBox.Text);
        //fltOtrasErogaciones = Double.Parse(((TextBox)gvPolizas.FindControl("txtOtrasErogaciones")).Text.Trim());
        
    }

    public String get_otrasErogaciones()
    {
        return String.Format("{0:#,##0.00}", fltOtrasErogaciones);
    }

    public String get_impRetenciones(String strImporteIVA, String strImporteBase)
    {
        Double fltImporteIVA = Double.Parse(strImporteIVA);
        Double fltImporteBase = Double.Parse(strImporteBase);

        fltImporteAntErogaciones = fltImporteIVA + fltImporteBase + fltOtrasErogaciones;

        return String.Format("{0:#,##0.00}", fltImporteAntErogaciones);  
    }

    public String get_totalErogacion(String strIVAretenido, String strISRretenido)
    {
        Double fltIVAretenido = Double.Parse(strIVAretenido);
        Double fltISRretenido = Double.Parse(strISRretenido);

        Double fltTotalErogacion = fltImporteAntErogaciones - (fltIVAretenido + fltISRretenido);

        return String.Format("{0:#,##0.00}", fltTotalErogacion);
    }


    protected void gvPolizas_rowCommand(Object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Insert")
        {

            //TextBox otrasErogaciones = (TextBox)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("otrasErogaciones");
            sdsPolizasDiot.InsertParameters[0].DefaultValue = ((Label)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lblPoliza")).Text.Trim(); // Poliza
            sdsPolizasDiot.InsertParameters[1].DefaultValue = ((Label)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lbltmpCuenta")).Text.Trim(); // cuenta
            sdsPolizasDiot.InsertParameters[2].DefaultValue = ((Label)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lblTmpTipoPoliza")).Text.Trim(); // TipoPoliza
            sdsPolizasDiot.InsertParameters[3].DefaultValue = ((Label)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lblTmpDocumento")).Text.Trim(); // Documento
            sdsPolizasDiot.InsertParameters[4].DefaultValue = ((DropDownList)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lstProveedores")).SelectedValue.ToString(); // claveProveedor --
            sdsPolizasDiot.InsertParameters[5].DefaultValue = gvPolizas.DataKeys[gvPolizas.EditIndex][0].ToString().Trim(); // sucursal

            //sdsPolizasDiot.InsertParameters[6].DefaultValue = ((Label)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lblTmpImporte")).Text.Trim(); // Importe
            sdsPolizasDiot.InsertParameters[6].DefaultValue = ((TextBox)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("Importe")).Text.Trim(); // Importe
            //sdsPolizasDiot.InsertParameters[7].DefaultValue = gvPolizas.DataKeys[gvPolizas.EditIndex][3].ToString().Trim(); // Tasa
            sdsPolizasDiot.InsertParameters[7].DefaultValue = ((DropDownList)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lstPorcentajeIva")).SelectedValue.ToString(); // Tasa
            //sdsPolizasDiot.InsertParameters[8].DefaultValue = gvPolizas.DataKeys[gvPolizas.EditIndex][1].ToString().Trim(); // IVAretenidoOri
            //sdsPolizasDiot.InsertParameters[9].DefaultValue = gvPolizas.DataKeys[gvPolizas.EditIndex][2].ToString().Trim(); // ISRretenidoOri
            sdsPolizasDiot.InsertParameters[8].DefaultValue = ((TextBox)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("otrasErogaciones")).Text.Trim(); // otrasErogaciones
            sdsPolizasDiot.InsertParameters[9].DefaultValue = Session["usuarioID"].ToString(); // intUsuarioId
            sdsPolizasDiot.InsertParameters[10].DefaultValue = "0"; // resultado
            sdsPolizasDiot.Insert();

        }
    }

    protected void gvPolizas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //e.Row.RowState

        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))
        {
            //e.Row.Cells.RemoveAt(0);
            //e.Row.Cells.RemoveAt(1);
            e.Row.Cells.RemoveAt(11);
            e.Row.Cells.RemoveAt(10);
            e.Row.Cells.RemoveAt(9);
            e.Row.Cells.RemoveAt(8);
            e.Row.Cells.RemoveAt(7);
            e.Row.Cells.RemoveAt(6);
            e.Row.Cells.RemoveAt(5);
            e.Row.Cells.RemoveAt(4);
            e.Row.Cells.RemoveAt(3);
            e.Row.Cells.RemoveAt(2);

            e.Row.Cells[1].ColumnSpan = 11;
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        ((Panel)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("pnlMovimientos")).Visible=false;
        
    }


    protected void lstProveedores_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((DropDownList)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("lstPorcentajeIva")).Items.Clear();
    }
    protected void lstMes_SelectedIndexChanged(object sender, EventArgs e)
    {
        lstProveedorReporte.Items.Clear();
    }   

    protected void GridView1_rowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
          
        {
            GridView GridView1 = (GridView)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("GridView1");
            DataKey data = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)];
            SqlDataSource SqlDataSource1 = (SqlDataSource)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("SqlDataSource1");           

            SqlDataSource1.UpdateParameters[0].DefaultValue = data.Values["Folio"].ToString();
            SqlDataSource1.UpdateParameters[1].DefaultValue = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("Importe")).Text;
            SqlDataSource1.UpdateParameters[2].DefaultValue = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("otrasErogaciones")).Text;
            SqlDataSource1.UpdateParameters[3].DefaultValue = ((DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("Tasa")).SelectedValue.ToString();
            SqlDataSource1.UpdateParameters[4].DefaultValue = data.Values["ivaRetenidoProv"].ToString();
            SqlDataSource1.UpdateParameters[5].DefaultValue = data.Values["isrRetenidoProv"].ToString();
            SqlDataSource1.UpdateParameters[5].DefaultValue = Session["usuarioID"].ToString();
            SqlDataSource1.UpdateParameters[5].DefaultValue = "0";

            SqlDataSource1.Update();
           
            GridView1.Dispose();
           
            SqlDataSource1.Dispose();

            GridView GridView2 = (GridView)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("GridView2");
            SqlDataSource SqlDataSource2 = (SqlDataSource)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("SqlDataSource2");       

            SqlDataSource2.SelectParameters[0].DefaultValue = data.Values["Folio"].ToString();
            SqlDataSource2.SelectParameters[1].DefaultValue = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("Importe")).Text;
            SqlDataSource2.SelectParameters[2].DefaultValue = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("otrasErogaciones")).Text;
            SqlDataSource2.SelectParameters[3].DefaultValue = ((DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("Tasa")).SelectedValue.ToString();
            SqlDataSource2.SelectParameters[4].DefaultValue = data.Values["ivaRetenidoProv"].ToString();
            SqlDataSource2.SelectParameters[5].DefaultValue = data.Values["isrRetenidoProv"].ToString();
            SqlDataSource2.SelectParameters[5].DefaultValue = Session["usuarioID"].ToString();
            SqlDataSource2.SelectParameters[5].DefaultValue = "0";

            //SqlDataSource2.s

            //SqlDataSource2.Select(SqlDataSource1.SelectParameters[0].DefaultValue = data.Values["Folio"].ToString());
           
            GridView2.Dispose();

            SqlDataSource2.Dispose();
            

        }
        if (e.CommandName == "Delete")
        {
          
            GridView GridView1 = (GridView)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("GridView1");
            DataKey data = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)];
            SqlDataSource SqlDataSource2 = (SqlDataSource)gvPolizas.Rows[gvPolizas.EditIndex].FindControl("SqlDataSource2");

            SqlDataSource2.SelectParameters[0].DefaultValue = data.Values["Folio"].ToString();
            SqlDataSource2.SelectParameters[1].DefaultValue = Convert.ToString(GridView1.Rows[0].FindControl("Importe"));
            SqlDataSource2.SelectParameters[2].DefaultValue = Convert.ToString(GridView1.Rows[0].FindControl("otrasErogaciones"));
            SqlDataSource2.SelectParameters[3].DefaultValue = Convert.ToString(GridView1.Rows[0].FindControl("Tasa"));
            SqlDataSource2.SelectParameters[4].DefaultValue = data.Values["ivaRetenidoProv"].ToString();
            SqlDataSource2.SelectParameters[5].DefaultValue = data.Values["isrRetenidoProv"].ToString();
            SqlDataSource2.SelectParameters[5].DefaultValue = Session["usuarioID"].ToString();
            SqlDataSource2.SelectParameters[5].DefaultValue = "0";

            GridView1.Dispose();

            SqlDataSource2.Dispose();


        }
    }

    protected void txtrazonsocial_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMensaje.Text = "";
        lblMensajeEx.Text = "";
    }

}
