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

public partial class OrdenesCompra_listadoOrdenesCompra : System.Web.UI.Page
{
    private static int NUMFUNCION = 20;
    int intNumeroPartida = 0;
    Double DblTotal = 0.0;
    int intConteoPartidas;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //lstRazonSocial.Items.Add("OTRO");
        }

        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        ////Permiso para generar OC de otro Agente.
        //error = Utilis.validaPermisos(Session, 40);
        //if (error.Equals(""))
        //{
        //    lstAgenteOficina.Visible = true;
        //    lblUsuario.Visible = true;
        //}
        
        lblFecha.Text = DateTime.Now.ToString("d");

        if (Request["ordenCompraId"] != null && !IsPostBack)
        {
            //GridView1.Columns[9].Visible = true; // Folios

            OrdenCompraBL OCBL = new OrdenCompraBL();
            OrdenCompraVO OCVO = new OrdenCompraVO();
            OCVO.Operacion = OrdenCompraVO.BUSCAR;
            OCVO.OrdenCompraId = Int32.Parse(Request["ordenCompraId"].ToString());
            OCVO = (OrdenCompraVO)OCBL.execute(OCVO);

            lblFecha.Text = OCVO.FechaAlta.ToString("d");
            lblFechaEntrega.Text = OCVO.FechaEntrega;
            lblContacto.Text = OCVO.Contacto;
            lblViaEmbarque.Text = OCVO.ViaEmbarque;
            lblFob.Text = OCVO.Fob;
            lblMoneda.Text = OCVO.NombreMoneda; //OCVO.MonedaId.ToString();
            lblProyecto.Text = OCVO.NombreProyecto;

            //desactivaClasificacionOC();

            if (OCVO.NombreJob.Trim().Length > 0)
                {         
                lblClasificacion.Text = "JOB";
                lblClasificacionValor.Text = OCVO.NombreJob;
                }

            if (OCVO.OrdenServicio.Trim().Length > 0)
                {
                lblClasificacion.Text = "O.S.";
                lblClasificacionValor.Text = OCVO.OrdenServicio;
                }

            if (OCVO.OtroClasificacionOC.Trim().Length > 0)
                {
                lblClasificacion.Text = "OTRO";
                lblClasificacionValor.Text = OCVO.OtroClasificacionOC;
                }

                lblDescuentoTex.Text = OCVO.PorcentajeDescuento.ToString("F2");
                lblEnvio.Text = OCVO.CostoEnvio.ToString("F2");
                lblImpuestoTex.Text = OCVO.PorcentajeImpuesto.ToString("F2");
                lblImpuestoImportacion.Text = OCVO.CostoImportacion.ToString("F2");
                lblDatosTransferencia.Text = OCVO.DatosTransferencia;
                lblIntruccionesEmbarque.Text = OCVO.InstruccionesEmbarque;
                lblTerminos.Text = OCVO.Terminos;
                lblEstatusTex.Text = OCVO.NombreEstatusOrdenCompra;//OCVO.EstatusOrdenCompraId.ToString();
                //txtFactura.Text = OCVO.Factura;
                lblPedimento.Text = OCVO.Pedimento;
                lblFechaPedimento.Text = OCVO.FechaPedimento;


                lblOrigen.Text = OCVO.NombreOrigen; //OCVO.OrigenId.ToString();

            if (OCVO.OrigenId==2)//Internacional
                {
                lblEtiRFC.Text = "TAX ID:";
                camposBancoInterVisibles(true, false);
                }

                lblAccountNameTex.Text = OCVO.AccountName;
                lblAddressTex.Text = OCVO.Address;
                lblAccountNumberTex.Text = OCVO.AccountNumber;
                lblBankNameTex.Text = OCVO.BankName;
                lblBankAddressTex.Text = OCVO.BankAddress;
                lblAbaTex.Text = OCVO.Aba;

            lblNombreProveedor.Text = OCVO.NombreProveedor;

            lblEtiquetaOrdenCompra.Visible = true;
            lblOrdenCompra.Visible = true;
            lblOrdenCompraOculto.Text = Request["ordenCompraId"].ToString();
            lblOrdenCompra.Text = (OCVO.OrigenId == 1 ? "N-" + OCVO.IdNacional.ToString() : "I-" + OCVO.IdInternacional.ToString());//Request["ordenCompraId"].ToString();
            //lblOrdenCompra2.Text = lblOrdenCompra.Text;//Request["ordenCompraId"].ToString();


            //if (OCVO.DocRecibido == 1)
            //    ckbDocRecibido.Checked = true;

            if (OCVO.PagoDeContado == 1)
                ckbPagodeContado.Checked = true;

            //// determinar si el usuario tiene los permisos para modificar el campo de factura y Estatus.
            //String error2 = Utilis.validaPermisos(Session, 21);
            //if (error2.Equals(""))
            //{
            //    txtFolio.Enabled = true;
            //    //btnAgregar.Enabled = true;

            //    lstEstatus.Enabled = true;
            //    lblFactura.Enabled = true;
            //    lblEstatus.Enabled = true;
            //    lblOtroDocumento.Enabled = true;
            //    txtOtroDocumento.Enabled = true;
            //    ckbDocRecibido.Enabled = true;
            //}

            //lstOrigen.Enabled = false;

            //---
            ProveedoresBL BL = new ProveedoresBL();
            ProveedoresVO VO = new ProveedoresVO();
            VO.Operacion = ProveedoresVO.BUSCAR;
            VO.ProveedorId = OCVO.ProveedorId;
            VO = (ProveedoresVO)BL.execute(VO);


  
            lblRFC.Text = VO.Rfc;


            lblDireccionId.Text = VO.DireccionId.ToString();
            DireccionesBL DBL = new DireccionesBL();
            DireccionesVO DVO = new DireccionesVO();
            DVO.Operacion = DireccionesVO.BUSCAR;
            DVO.DireccionId = VO.DireccionId;
            DVO = (DireccionesVO)DBL.execute(DVO);



                lblDireccion.Text = DVO.Calle;
                lblColonia.Text = DVO.Colonia.Trim();
                lblCiudad.Text = DVO.Ciudad;
                lblEstado.Text = DVO.Estado;
                lblCP.Text = DVO.Cp;
                lblEmail.Text = DVO.Email;
                //txtEmail.Text = DVO.Email;
                lblTelefono.Text = DVO.Telefono1;
                lblFax.Text = DVO.Fax;
            //}

            lblEmail.Visible = false;
            //btnCaida.Visible = true;

           
        }
        else
        {
            //Session["DetalleId"] = "";
            //Session["Cantidad"] = "";
            //Session["Descripcion"] = "";
            //Session["PrecioUnitario"] = "";
        }
    }





    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        ArrayList arrValoresPendientes = getValoresPendientes();

     //if(GridView1.Rows.Count > 0)
       if(arrValoresPendientes.Count > 0)
        {

            OrdenCompraBL OCBL = new OrdenCompraBL();
            OrdenCompraVO OCVO = new OrdenCompraVO();
            OCVO.Operacion = OrdenCompraVO.INSERTA_SEGUIMIENTO;
            OCVO.OrdenCompraId = Int32.Parse(lblOrdenCompraOculto.Text);
            OCVO.Factura = txtFolio.Text.Trim().ToUpper();
            OCVO.Comentario = "";
            OCVO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());
            OCVO = (OrdenCompraVO)OCBL.execute(OCVO);
            if (OCVO.Resultado > 0)
            {
                OCVO.SeguimientoOrdenCompraId = (int)OCVO.Resultado;
                    DetalleOrdenCompraBL DOCBL = new DetalleOrdenCompraBL();
                    DetalleOrdenCompraVO DOCVO = new DetalleOrdenCompraVO();
                    DOCVO.Operacion = DetalleOrdenCompraVO.INSERTA_SEGUIMIENTO_DETALLE;
                    DOCVO.SeguimientoOrdenCompraId = OCVO.SeguimientoOrdenCompraId;
                    DOCVO.OrdenCompraId = OCVO.OrdenCompraId;
                    DOCVO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());
                    DOCVO.ArrPendientes = arrValoresPendientes;
                    DOCVO = (DetalleOrdenCompraVO)DOCBL.execute(DOCVO);
                    if (DOCVO.Resultado > 0)
                    {
                        lblEstatusOrdenCompra.Text = "Información Guardada Id: " + OCVO.SeguimientoOrdenCompraId.ToString();
                        lblMensaje.Text = lblEstatusOrdenCompra.Text;
                        lblEstatusOrdenCompra.Visible = true;
                        //GridView1.DataBind();
                        GridView2.DataBind();
                    }
            }

        }
    else
        {
         lblEstatusOrdenCompra.Text = "NO SE GUARDO NINGUN VALOR";
         lblMensaje.Text = lblEstatusOrdenCompra.Text;
         lblEstatusOrdenCompra.Visible = true;
         lblMensaje.Visible = true;
        }
    
    }

    private ArrayList getValoresPendientes()
    {
        ArrayList listaPendientes = new ArrayList();
        String strValor = "";
        Double DblPendientes = 0;
        foreach (GridViewRow row in GridView1.Rows)
        {
            DblPendientes = Double.Parse(GridView1.DataKeys[row.RowIndex][2].ToString());

            TextBox pendiente = (TextBox)row.FindControl("pendiente");
            strValor = pendiente.Text.Trim();
            //strValor = ((TextBox)row.FindControl("pendiente")).Text.Trim();
            if(strValor.Length > 0)
            {
                if (Double.Parse(strValor) > 0)
                    {
                    if (DblPendientes < Double.Parse(strValor))
                    {
                        strValor = DblPendientes.ToString();
                        pendiente.Text = strValor;
                    }
                    ArrayList arrTmp = new ArrayList();
                    arrTmp.Add(GridView1.DataKeys[row.RowIndex][0].ToString()); // detellaOrdenCompraId
                    arrTmp.Add(strValor); // cantidad surtida
                    listaPendientes.Add(arrTmp);
                    pendiente.Enabled = false;
                }
            }
            pendiente.Dispose();

        }
        return listaPendientes;
    }

    protected void calculaTotal()
    {
        try
        {
            Double dblTotal = 0;
            dblTotal = Math.Round(((Double.Parse(lblSubtotal.Text) + Double.Parse(lblEnvio.Text) + Double.Parse(lblImpuesto.Text) + Double.Parse(lblImpuestoImportacion.Text)) - Double.Parse(lblDescuento.Text)), 2);
            lblTotal.Text = String.Format("{0:#,##0.00}", dblTotal);//dblTotal.ToString();
            lblMensaje.Text = "";
        }
        catch (Exception e)
        {
            lblMensaje.Text = "Ocurrio un error de captura";
        }
    }

    protected void calculaImpuesto()
    {
        try
        {
        Double dblImpuesto = 0;
        dblImpuesto = Math.Round(((Double.Parse(lblImpuestoTex.Text) / 100) * ((Double.Parse(lblSubtotal.Text) + Double.Parse(lblEnvio.Text)) - Double.Parse(lblDescuento.Text))), 2);
        lblImpuesto.Text = String.Format("{0:#,##0.00}", dblImpuesto);//dblImpuesto.ToString();
        lblMensaje.Text = "";
        }
        catch (Exception e)
        {
            lblMensaje.Text = "Ocurrio un error de captura";
        }
    }

    protected void calculaDescuento()
    {
        try
        {
        Double DblDescuento = 0;
        DblDescuento = Math.Round((Double.Parse(lblDescuentoTex.Text) / 100) * Double.Parse(lblSubtotal.Text), 2);
        lblDescuento.Text = String.Format("{0:#,##0.00}", DblDescuento);//DblDescuento.ToString();
        lblMensaje.Text = "";
        }
        catch (Exception e)
        {
            lblMensaje.Text = "Ocurrio un error de captura";
        }

    }

    public int get_numeroPartida()
    {
        intNumeroPartida += 1;
        return intNumeroPartida;
    }

    public Double Get_Amount(Double Total)
    {
        DblTotal += Total;
        lblSubtotal.Text = String.Format("{0:#,##0.00}", Math.Round(DblTotal, 2)); //Math.Round(DblTotal, 2).ToString("C2");
        calculaDescuento();
        calculaImpuesto();
        calculaTotal();
        return Total;
    }

    protected void OrdenCompras_Command(object sender, GridViewCommandEventArgs e)
        {
         if(e.CommandName=="Cancel")
         {
           // Do your cancel stuff here.
         }
         if (e.CommandName == "Edit")
         {
             // Do your cancel stuff here.
         }
         if (e.CommandName == "Update")
         {
             // Do your cancel stuff here.
         }

        }

        protected void OrdenCompras_Deleting(object sender, GridViewDeleteEventArgs e)
        {
        int detalleOrdenCompraID = (int)GridView1.DataKeys[e.RowIndex].Value;
             lblMensaje.Text = "detalleOrdenCompraID:" + detalleOrdenCompraID.ToString();
        }



    protected void Grid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            intConteoPartidas++;
        }

    }
    
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count <= 0)
        {
            GridView1.Visible = false;
        }
        else
        {
            GridView1.Visible = true;
        }
    }

    public void limpiaOcualtaEtiquetas()
    {
        lblDireccion.Text = "";
        lblColonia.Text = "";
        lblCiudad.Text = "";
        lblEstado.Text = "";
        lblCP.Text = "";
        lblEmail.Text = "";
        lblTelefono.Text = "";
        lblFax.Text = "";
        lblRFC.Text = "";

        lblDireccion.Visible = false;
        lblColonia.Visible = false;
        lblDireccionId.Text = "0";
        lblCiudad.Visible = false;
        lblEstado.Visible = false;
        lblCP.Visible = false;
        lblEmail.Visible = false;
        lblTelefono.Visible = false;
        lblFax.Visible = false;
        lblRFC.Visible = false;
    }



    public void limpiaPantalla()
    {
    
    lblEstatusOrdenCompra.Text = "";
    lblDireccionId.Text = "";
    lblOrdenCompraOculto.Text = "";
    //lblEtiquetaOC.Visible = false;
    lblEtiquetaOrdenCompra.Visible = false;
    lblOrdenCompra.Text = "";
    //lblOrdenCompra2.Text = "";
    lblOrdenCompra.Visible = false;
    //lblOrdenCompra2.Visible = false;
    lblMensaje.Text = "";
    lblFecha.Text = DateTime.Now.ToString("d");
    
    //lstRazonSocial.Enabled = true;
    //lstRazonSocial.SelectedIndex = 0;
 
    txtFolio.Text="";
    ckbPagodeContado.Checked = false;
    //ckbDocRecibido.Checked = false;

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.ShowFooter = false;
           
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        GridView1.ShowFooter = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.ShowFooter = true;
    }

    public void camposBancoInterVisibles(Boolean blnBandera, Boolean blnLimpiar)
    {
        lblBankInformation.Visible = blnBandera;
        lblAccountName.Visible = blnBandera;
        lblAccountNumber.Visible = blnBandera;
        lblBankAddress.Visible = blnBandera;
        lblAddress.Visible = blnBandera;
        lblBankName.Visible = blnBandera;
        lblABA.Visible = blnBandera;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                String strPendientes = DataBinder.Eval(e.Row.DataItem, "pendientes").ToString();
                if (strPendientes == "0")
                {//deshablita los campos del documento y accion
                    try
                    {
                        TextBox pendiente = (TextBox)e.Row.FindControl("pendiente");
                        pendiente.Visible = false;
                        pendiente.Dispose();
                        Label lblPendientes = (Label)e.Row.FindControl("lblPendientes");
                        lblPendientes.Visible = true;
                        lblPendientes.Dispose();
                        Button btnFechaEntrega = (Button)e.Row.FindControl("btnFechaEntrega");
                        btnFechaEntrega.Visible = false;
                        btnFechaEntrega.Dispose();
                        Label lblFechaEntrega = (Label)e.Row.FindControl("lblFechaEntrega");
                        lblFechaEntrega.Visible = true;
                        lblFechaEntrega.Dispose();
                    }
                    catch (Exception ex)
                    {
                        //Console.WriteLine("{0} Exception caught.", e);
                    }

                }
            }

            if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == DataControlRowState.Alternate)
            {

            }
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click2(object sender, EventArgs e)
    {

    }
}
