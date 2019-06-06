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
using System.Net.Mail;

public partial class Cobranza_Depositos_formularioDepositos : System.Web.UI.Page
{
    private static int NUMFUNCION = 17;
    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        // determinar si el usuario tiene los permisos para aceptar una cotizacion con descuento.
        String error2 = Utilis.validaPermisos(Session, 18);
        if (error2.Equals("") && Request["depositoId"] != null)
        {
            btnDepositoRegistrado.Visible = true;
        }

        if (Request["depositoId"] != null && !IsPostBack)
        {
            DepositosVO VO = new DepositosVO();
            DepositosBL BL = new DepositosBL();
            VO.DepositoId = Int32.Parse(Request["DepositoId"].ToString());
            VO.Operacion = DepositosVO.BUSCAR;
            VO = (DepositosVO)BL.execute(VO);

            lstClientes.SelectedValue = VO.Cliente_codigo;
            txtFecha.Text = VO.FechaDeposito.ToString("d");
            lstOficina.SelectedValue = VO.OficinaId.ToString();
            lstCuenta.SelectedValue = VO.CuentaDepositoId.ToString();
            txtMonto.Text = VO.Monto.ToString();
            lstMoneda.SelectedValue = VO.MonedaId.ToString();
            //txtDocumentos.Text = VO.FolioAdmin1;
            ////lstPorcentaje.SelectedValue = VO.PorcentajeFolio1.ToString();
            //txtDocumentos2.Text = VO.FolioAdmin2;
            ////lstPorcentaje2.SelectedValue = VO.PorcentajeFolio2.ToString();
            //txtDocumentos3.Text = VO.FolioAdmin3;
            ////lstPorcentaje3.SelectedValue = VO.PorcentajeFolio3.ToString();
            //txtDocumentos4.Text = VO.FolioAdmin4;
            //txtDocumentos5.Text = VO.FolioAdmin5;
            txtMensajeSubirArchivo.Text = VO.Archivo;
            txtMensajeSubirArchivo.Visible = false;
            txtComentarios.Text = VO.Comentarios;
            Label1.Text = "Modificación de Depositos";
            btnInsertar.Text = "Actualiza";
            hlkArchivo.NavigateUrl = "~/Archivos/Depositos/" + VO.Archivo;
            hlkArchivo.Text = VO.Archivo;
            RequiredFieldValidator9.Enabled = false;

            btnAgregar2.Visible = true;
            if (VO.Afectado == 1)
            {
                btnDepositoRegistrado.Visible = false;
                lblEstatusDeposito.Visible = true;
                lblEstatusDeposito.Text = "REGISTRO AFECTADO";
                btnInsertar.Visible = false;
                btnAdjuntarArchivo.Visible = false;
                //btnMas1.Visible = false;
                fuDepositos.Visible = false;
                imgCalendario.Visible = false;
                lblCamposForzosos.Visible = false;

                txtFolio.Visible = false;
                lstTipoFolio2.Visible = false;
                btnAgregar2.Visible = false;
                sdsFoliosDepositos.EnableCaching = false;

            }
        }
        else
        {
            //txtFolio.Enabled = false;
            //lstTipoFolio2.Enabled = false;
            //btnAgregar2.Visible = false;
        }

    }

    protected void btnInsertar_Click(object sender, EventArgs e)
    {

        if (btnInsertar.Text.Equals("Insertar"))
        {
            Page.Validate("prueba");

            if (!Page.IsValid)
            {
                //lblMensaje.Text = "HAY ERRORES";  // Realizar acciones
            }
            else
            {
            if(txtFolio.Text.Trim().Length > 0)
                {
                    lstTipoFolio2.Visible = false;
                    txtFolio.Visible = false;
                    btnAgregar2.Visible = false;
                    funcAgregaFolioDeposito(txtFolio.Text, Int32.Parse(lstTipoFolio2.SelectedItem.Value));
                    txtFolio.Text = "";
                    GridView1.Visible = true;
                    GridView1.DataBind();
                }

            DepositosVO VO = new DepositosVO();
            DepositosBL BL = new DepositosBL();
            VO.Operacion = DepositosVO.INSERTAR;
            VO.Cliente_codigo = lstClientes.SelectedItem.Value;
            VO.FechaDeposito = new DateTime(Int32.Parse(txtFecha.Text.Substring(6)), Int32.Parse(txtFecha.Text.Substring(3, 2)), Int32.Parse(txtFecha.Text.Substring(0, 2)));
            VO.OficinaId = Int32.Parse(lstOficina.SelectedItem.Value);
            VO.CuentaDepositoId = Int32.Parse(lstCuenta.SelectedItem.Value);
            VO.Monto = Double.Parse(txtMonto.Text);
            VO.MonedaId = Int32.Parse(lstMoneda.SelectedItem.Value);
            //VO.FolioAdmin1 = txtDocumentos.Text.ToUpper();
            ////VO.PorcentajeFolio1 = Int32.Parse(lstPorcentaje.SelectedItem.Value);
            //VO.FolioAdmin2 = txtDocumentos2.Text.ToUpper();
            ////VO.PorcentajeFolio2 = Int32.Parse(lstPorcentaje2.SelectedItem.Value);
            //VO.FolioAdmin3 = txtDocumentos3.Text.ToUpper();
            ////VO.PorcentajeFolio3 = Int32.Parse(lstPorcentaje3.SelectedItem.Value);
            //VO.FolioAdmin4 = txtDocumentos4.Text.ToUpper();
            ////VO.PorcentajeFolio4 = Int32.Parse(lstPorcentaje4.SelectedItem.Value);
            //VO.FolioAdmin5 = txtDocumentos5.Text.ToUpper();
            ////VO.PorcentajeFolio5 = Int32.Parse(lstPorcentaje5.SelectedItem.Value);
            VO.FolioAdmin1 = "";
            VO.FolioAdmin2 = "";
            VO.FolioAdmin3 = "";
            VO.FolioAdmin4 = "";
            VO.FolioAdmin5 = "";
            VO.Archivo = txtMensajeSubirArchivo.Text.Split(',')[0].Replace("<B>", "").Replace("</B>", "");
            VO.UsuarioIdAlta = Int32.Parse(Session["usuarioID"].ToString());

            VO.Comentarios = txtComentarios.Text;
            VO = (DepositosVO)BL.execute(VO);
            if (VO.Resultado == 0)
            {
                lblMensaje.Text = "Los datos se insertaron correctamente.";
                //btnInsertar.Visible = false;
                InfoSessionVO infoSession;
                infoSession = (InfoSessionVO)Session["InfoSession"];

                String[] strCorreoCobranza = System.Configuration.ConfigurationSettings.AppSettings["correoCobranza"].ToString().Split(',');
                Mail.sendMail(infoSession.getValor(InfoSessionVO.CORREOELECTRONICO).ToString(), infoSession.getValor(InfoSessionVO.NOMBRECOMPLETO).ToString(), strCorreoCobranza[0], strCorreoCobranza[1], infoSession.getValor(InfoSessionVO.CORREOELECTRONICO).ToString(), infoSession.getValor(InfoSessionVO.NOMBRECOMPLETO).ToString(),"carlos.garcia@calvek.com","Inteligencia Comercial", "COBRANZA Alta Abono", "<p>Deposito registrado del cliente:" + lstClientes.SelectedItem.Text + " <BR>Levantado Por: " + infoSession.getValor(InfoSessionVO.NOMBRECOMPLETO) + "</p>", true);
                btnInsertar.Text = "Nuevo Deposito";
            }
        }
        }
        else if (btnInsertar.Text.Equals("Nuevo Deposito"))
        {
            fuDepositos.Enabled = true;
            btnAdjuntarArchivo.Enabled = true;
            //btnInsertar.Visible = true;
            btnInsertar.Text = "Insertar";

            lstClientes.SelectedValue=null;
            txtFecha.Text="";
            lstOficina.SelectedValue=null;
            lstCuenta.SelectedValue=null;
            txtMonto.Text="";
            lstMoneda.SelectedValue=null;

            //txtDocumentos.Text="";
            ////lstPorcentaje.SelectedValue=null;
            //txtDocumentos2.Text="";
            ////lstPorcentaje2.SelectedValue=null;
            //txtDocumentos3.Text="";
            ////lstPorcentaje3.SelectedValue=null;
            //txtDocumentos4.Text = "";
            ////lstPorcentaje4.SelectedValue=null;
            //txtDocumentos5.Text = "";
            ////lstPorcentaje5.SelectedValue=null;
            //txtMensajeSubirArchivo.Text="";

            lblMensaje.Text = "";
            lblMensaje.Visible = false;

        }
        else if (btnInsertar.Text.Equals("Actualiza"))
        {
            Page.Validate("prueba");

            if (!Page.IsValid)
            {
                //lblMensaje.Text = "HAY ERRORES";  // Realizar acciones
            }
            else
            {
            if(txtFolio.Text.Trim().Length > 0)
                {
                    lstTipoFolio2.Visible = false;
                    txtFolio.Visible = false;
                    btnAgregar2.Visible = false;
                    funcAgregaFolioDeposito(txtFolio.Text, Int32.Parse(lstTipoFolio2.SelectedItem.Value));
                    txtFolio.Text = "";
                    GridView1.Visible = true;
                    GridView1.DataBind();
                }

            DepositosVO VO = new DepositosVO();
            DepositosBL BL = new DepositosBL();

            VO.DepositoId = Int32.Parse(Request["DepositoId"].ToString());
            VO.Cliente_codigo = lstClientes.SelectedItem.Value;
            VO.FechaDeposito = new DateTime(Int32.Parse(txtFecha.Text.Substring(6)), Int32.Parse(txtFecha.Text.Substring(3, 2)), Int32.Parse(txtFecha.Text.Substring(0, 2)));
            VO.OficinaId = Int32.Parse(lstOficina.SelectedItem.Value);
            VO.CuentaDepositoId = Int32.Parse(lstCuenta.SelectedItem.Value);
            VO.Monto = Double.Parse(txtMonto.Text);
            VO.MonedaId = Int32.Parse(lstMoneda.SelectedItem.Value);
            //VO.FolioAdmin1 = txtDocumentos.Text.ToUpper();
            ////VO.PorcentajeFolio1 = Int32.Parse(lstPorcentaje.SelectedItem.Value);
            //VO.FolioAdmin2 = txtDocumentos2.Text.ToUpper();
            ////VO.PorcentajeFolio2 = Int32.Parse(lstPorcentaje2.SelectedItem.Value);
            //VO.FolioAdmin3 = txtDocumentos3.Text.ToUpper();
            ////VO.PorcentajeFolio3 = Int32.Parse(lstPorcentaje3.SelectedItem.Value);
            //VO.FolioAdmin4 = txtDocumentos4.Text.ToUpper();
            ////VO.PorcentajeFolio4 = Int32.Parse(lstPorcentaje4.SelectedItem.Value);
            //VO.FolioAdmin5 = txtDocumentos5.Text.ToUpper();
            ////VO.PorcentajeFolio5 = Int32.Parse(lstPorcentaje5.SelectedItem.Value);
            VO.FolioAdmin1 = "";
            VO.FolioAdmin2 = "";
            VO.FolioAdmin3 = "";
            VO.FolioAdmin4 = "";
            VO.FolioAdmin5 = "";
            VO.Archivo = txtMensajeSubirArchivo.Text.Split(',')[0].Replace("<B>", "").Replace("</B>", "");
            VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioId"].ToString());
            VO.Comentarios = txtComentarios.Text;
            VO.Operacion = DepositosVO.ACTUALIZAR;

            VO = (DepositosVO)BL.execute(VO);
            if (VO.Resultado == 0)
            {
                lblMensaje.Text = "Los datos se actualizaron correctamente";
            }
            else
            {
                lblMensaje.Text = "Los datos NO se actualizaron correctamente";
            }
            }
        }

        
    }
    protected void btnAdjuntarArchivo_Click(object sender, EventArgs e)
    {
        String strNombreArchivo = "";
        //fuDepositos.f
        //Guardamos el archivo en la carpeta “Archivos” del servidor, tu puedes guardarlo en larpeta que quieras de tu servidor
        fuDepositos.SaveAs(MapPath("~/Archivos/Depositos/" + fuDepositos.FileName.ToString()));
        //Mostramos un mensaje de exito al usuario
        strNombreArchivo = fuDepositos.FileName.ToString();
        txtMensajeSubirArchivo.Text = strNombreArchivo + ", se cargo con exito en el servidor";
        txtMensajeSubirArchivo.Visible = true;
        fuDepositos.Enabled = false;
        btnAdjuntarArchivo.Enabled = false;
        
    }
    protected void btnNuevoDeposito_Click(object sender, EventArgs e)
    {
        

    }

    protected void imgCalendario_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        //Calendar1.SelectedDate = System.DateTime.Today;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtFecha.Text = Calendar1.SelectedDate.Date.ToString("d");
        Calendar1.Visible = false;
    }

    //protected void btnMas1_Click(object sender, EventArgs e)
    //{

    //    Page.Validate("prueba2");

    //    if (Page.IsValid)
    //    {
    //        btnMas1.Visible = false;
    //        txtDocumentos2.Enabled = true;
    //        //lstPorcentaje2.Enabled = true;
    //        //lblPorcentaje2.Enabled = true;
    //        //RequiredFieldValidator8.Enabled = true;
    //        btnMas2.Visible = true;
    //        btnMenos2.Visible = true;
    //    }
    //    else
    //    {
    //        //lblMensaje.Text = "HAY ERRORES";  // Realizar acciones
    //    }
    //}
    //protected void btnMas2_Click(object sender, EventArgs e)
    //{
    //    Page.Validate("prueba3");

    //    if (Page.IsValid)
    //    {
    //        txtDocumentos3.Enabled = true;
    //        //lstPorcentaje3.Enabled = true;
    //        //lblPorcentaje3.Enabled = true;
    //        btnMas3.Visible = true;
    //        btnMenos3.Visible = true;
    //        btnMas2.Visible = false;
    //        btnMenos2.Visible = false;
    //    }
    //    else
    //    {
    //        //lblMensaje.Text = "HAY ERRORES";  // Realizar acciones
    //    }
    //}
    //protected void btnMenos2_Click(object sender, EventArgs e)
    //{
    //    //lstPorcentaje2.Enabled = false;
    //    txtDocumentos2.Enabled = false;
    //    //RequiredFieldValidator8.Enabled = false;
    //    if (!btnInsertar.Text.Equals("Actualiza"))
    //    {
    //        txtDocumentos2.Text = "";
    //        //lstPorcentaje2.SelectedValue = null;
    //    }
    //    //lblPorcentaje2.Enabled = false;
    //    btnMenos2.Visible = false;
    //    btnMas2.Visible = false;
    //    btnMas1.Visible = true;
    //}
    //protected void btnMenos3_Click(object sender, EventArgs e)
    //{

    //    txtDocumentos3.Enabled = false;
    //    //lstPorcentaje3.Enabled = false;
    //    if (!btnInsertar.Text.Equals("Actualiza"))
    //    {
    //        txtDocumentos3.Text = "";
    //        //lstPorcentaje3.SelectedValue = null;
    //    }
    //    //lblPorcentaje3.Enabled = false;
    //    btnMenos3.Visible = false;
    //    btnMas2.Visible = true;
    //    btnMenos2.Visible = true;
    //}

    //protected void btnMas3_Click(object sender, EventArgs e)
    //{
    //    Page.Validate("prueba4");

    //    if (Page.IsValid)
    //    {
    //        txtDocumentos4.Enabled = true;
    //        btnMas4.Visible = true;
    //        btnMenos4.Visible = true;
    //        btnMas3.Visible = false;
    //        btnMenos3.Visible = false;
    //    }
    //}
    //protected void btnMas4_Click(object sender, EventArgs e)
    //{
    //    Page.Validate("prueba5");

    //    if (Page.IsValid)
    //    {
    //        txtDocumentos5.Enabled = true;
    //        btnMenos5.Visible = true;
    //        btnMas4.Visible = false;
    //        btnMenos4.Visible = false;
    //    }
    //}

    //protected void btnMenos5_Click(object sender, EventArgs e)
    //{
    //    txtDocumentos5.Enabled = false;
    //    //lstPorcentaje3.Enabled = false;
    //    if (!btnInsertar.Text.Equals("Actualiza"))
    //    {
    //        txtDocumentos5.Text = "";
    //        //lstPorcentaje3.SelectedValue = null;
    //    }
    //    //lblPorcentaje3.Enabled = false;
    //    btnMenos5.Visible = false;
    //    btnMas4.Visible = true;
    //    btnMenos4.Visible = true;
    //}

    protected void btnDepositoRegistrado_Click(object sender, EventArgs e)
    {
        DepositosVO VO = new DepositosVO();
        DepositosBL BL = new DepositosBL();
        VO.Operacion = DepositosVO.DOCUMENTOAFECTADO;
        VO.DepositoId = Int32.Parse(Request["DepositoId"].ToString());
        VO.Afectado = 1;
        //VO.UsuarioIdAlta = Int32.Parse(Session["usuarioID"].ToString());
        VO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());
        VO = (DepositosVO)BL.execute(VO);
        if (VO.Resultado == 0)
        {
            //lblMensaje.Text = "DEPOSITO CON ESTATUS AFECTADO";
            btnDepositoRegistrado.Visible = false;
            btnInsertar.Visible = false;
            btnAdjuntarArchivo.Visible = false;
            //btnMas1.Visible = false;
            fuDepositos.Visible = false;
            imgCalendario.Visible = false;
            lblCamposForzosos.Visible = false;
            lblEstatusDeposito.Visible = true;
            lblEstatusDeposito.Text = "REGISTRO AFECTADO";

            txtFolio.Visible = false;
            lstTipoFolio2.Visible = false;
            btnAgregar2.Visible = false;

            //ObjectDataSource1.DataBind();b
            //ObjectDataSource1.Select();
            //GridView1.DataBind();
        }
    }


    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        lstTipoFolio2.Visible = false;
        txtFolio.Visible = false;
        btnAgregar2.Visible = false;

        funcAgregaFolioDeposito(txtFolio.Text, Int32.Parse(lstTipoFolio2.SelectedItem.Value));
        txtFolio.Text = "";
        GridView1.Visible = true;
        GridView1.DataBind();
    }

    protected void btnAgregar_Click2(object sender, EventArgs e)
    {
        funcAgregaFolioDeposito(((TextBox)GridView1.FooterRow.FindControl("Folio")).Text, Int32.Parse(((DropDownList)GridView1.FooterRow.FindControl("tipoDocumento")).SelectedItem.Value));
        ((TextBox)GridView1.FooterRow.FindControl("Folio")).Text = "";
        ((DropDownList)GridView1.FooterRow.FindControl("tipoDocumento")).SelectedIndex = 0;
        GridView1.DataBind();
    }

    protected Boolean funcAgregaFolioDeposito(string strFolio, int intTipoDocumento)
    {
        DepositosBL DBL = new DepositosBL();
        DepositosVO DVO = new DepositosVO();

        DVO.Operacion = DepositosVO.INSERTAR_FOLIODEPOSITO;
        DVO.FolioDocumento = strFolio.ToUpper();
        DVO.TipoDocumento = intTipoDocumento;
        if (Request["depositoId"] != null)
            DVO.DepositoId = Int32.Parse(Request["DepositoId"].ToString());
        else
            DVO.DepositoId = 0;

        DVO.UsuarioIdActualiza = Int32.Parse(Session["usuarioID"].ToString());

        DVO = (DepositosVO)DBL.execute(DVO);
        if (DVO.Resultado > 0)
        { return true; }
        else
        { return false; }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count <= 0)
        {
            lstTipoFolio2.Visible = true;
            txtFolio.Visible = true;
            btnAgregar2.Visible = true;
            GridView1.Visible = false;
            RequiredFieldValidator4.Enabled = true;
        }
        else
        {
            lstTipoFolio2.Visible = false;
            txtFolio.Visible = false;
            btnAgregar2.Visible = false;
            GridView1.Visible = true;
            RequiredFieldValidator4.Enabled = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
