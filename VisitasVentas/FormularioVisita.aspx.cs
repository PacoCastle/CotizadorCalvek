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

public partial class VisitasVentas_FormularioVisita : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Request["visitaId"] == null)
            {
                lstEmpresa.SelectedIndex = 1;
            }

        if (Request["visitaId"] != null)
        {
            if(!Page.IsPostBack)
            {
            lblEtiquetaVisita.Visible = true;
            lblEtiquetaVisita.Text = lblEtiquetaVisita.Text + " " + Request["visitaId"];

            visitasVentasVO visitasVO = new visitasVentasVO();
            visitasVentasBL visitasBL = new visitasVentasBL();
            visitasVO.Operacion = visitasVentasVO.BUSCAR;
            visitasVO.VisitaVentasId = Int32.Parse(Request["visitaId"]);
            visitasVO = (visitasVentasVO)visitasBL.execute(visitasVO);

            //visitasVO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString()); //Int32.Parse(lstIngVentas.SelectedItem.Value);
            lstEmpresa.SelectedValue = visitasVO.ClienteId;
            //gvwContactoVisitado.DataBind();

            txtFecha.Text = visitasVO.FechaVisita;
            lstNovedad.SelectedValue = visitasVO.NovedadVisitaId.ToString();
            lstObjVisita.SelectedValue = visitasVO.ObjetivoVisitaId.ToString();
            lstSigPaso.SelectedValue = visitasVO.SiguientePasoId.ToString();
            lstSolApoyo.SelectedValue = visitasVO.SolicitudApoyoId.ToString();
            txtTemaApoyo.Text = visitasVO.TemaApoyo;

            lstEstatusActual2.SelectedValue = visitasVO.EstatusActualId.ToString();

            if (visitasVO.BanderaVenta > 0)
                {
                rblBanderaVenta.SelectedValue = visitasVO.BanderaVenta.ToString();
                }

            txtObservaciones.Text = visitasVO.Observaciones;
            txtComentarios.Text = visitasVO.Comentarios;
            lstTema.SelectedValue = visitasVO.TemaPresentadoId.ToString();

            //if (visitasVO.OtroNovedad.Length > 0)
            //    {
            //    txtOtroNovedad.Visible = true;
            //    }
            //if (visitasVO.OtroObjetivo.Length > 0)
            //    {
            //    txtOtroObjVisita.Visible = true;
            //    }
            //if (visitasVO.OtroSiguientePaso.Length > 0)
            //    {
            //    txtOtroSigPaso.Visible = true;
            //    }
            //if (visitasVO.OtroSolicitudApoyo.Length > 0)
            //    {
            //    txtOtroSolApoyo.Visible = true;
            //    }
            //if (visitasVO.OtroTemaPresentado.Length > 0)
            //    {
            //    txtOtroTemaPresent.Visible = true;
            //    }
            //if (visitasVO.OtroEstatusActual.Length > 0)
            //    {
            //    txtOtroEstatusActual2.Visible = true;
            //    }
            //if (visitasVO.OtroCliente.Length > 0)
            //    {
            //        txtOtroCliente.Visible = true;
            //    }
            //if (visitasVO.OtroContactoCliente.Length > 0)
            //    {
            //        txtContactoVisitado.Visible = true;
            //    }

            txtOtroNovedad.Text = visitasVO.OtroNovedad;
            txtOtroObjVisita.Text = visitasVO.OtroObjetivo;
            txtOtroSigPaso.Text = visitasVO.OtroSiguientePaso;
            //txtOtroSolApoyo.Text = visitasVO.OtroSolicitudApoyo;
            txtOtroTemaPresent.Text = visitasVO.OtroTemaPresentado;
            //txtOtroEstatusActual2.Text = visitasVO.OtroEstatusActual;
            txtOtroCliente.Text = visitasVO.OtroCliente;
            txtContactoVisitado.Text = visitasVO.OtroContactoCliente;

            if (visitasVO.BanderaSeguimiento == 1)
                {
                ckbSeguimiento.Checked = true;
                }
            else
                {
                ckbSeguimiento.Checked = false;
                }

                if (visitasVO.ClienteId == "99999")
                    gvwContactoVisitado.Visible = false;

            muestraOcualtaSeguimientoVisita(true);
                
            //cargaCheckbox(visitasVO.ArrListaContactos);
            }
        }
        else
        {
            muestraOcualtaSeguimientoVisita(false);
        }

        if(!Page.IsPostBack)
        {
            lblMensaje2.Text = "";
            lblMensaje.Text = "";
        }

    }
    protected void imgCalendario_Click(object sender, ImageClickEventArgs e)
    {
       // Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
      //  txtFecha.Text = Calendar1.SelectedDate.Date.ToString("d");
      //  Calendar1.Visible = false;
    }

    protected void GridViewInsert(object sender, EventArgs e)
    {
        TextBox nombre = (TextBox)gvwContactoVisitado.FooterRow.FindControl("nombre");
        TextBox telefono = (TextBox)gvwContactoVisitado.FooterRow.FindControl("telefono");
        //TextBox puesto = (TextBox)gvwContactoVisitado.FooterRow.FindControl("puesto");
        DropDownList puesto = (DropDownList)gvwContactoVisitado.FooterRow.FindControl("puesto");
        DropDownList lstDepartamento = (DropDownList)gvwContactoVisitado.FooterRow.FindControl("lstDepartamento");
        TextBox celular = (TextBox)gvwContactoVisitado.FooterRow.FindControl("celular");
        TextBox correo = (TextBox)gvwContactoVisitado.FooterRow.FindControl("correo");

        //TextBox nombre = (TextBox)gvwDepartamentos.FindControl("nombre");
        if (nombre != null)
        {
            if (nombre.Text.Trim().Length > 0)
            {
                sdsContactosVisitas.InsertParameters[0].DefaultValue = lstEmpresa.SelectedValue;
                sdsContactosVisitas.InsertParameters[1].DefaultValue = nombre.Text.Trim().ToUpper();
                sdsContactosVisitas.InsertParameters[2].DefaultValue = telefono.Text.Trim();
                sdsContactosVisitas.InsertParameters[3].DefaultValue = Session["usuarioID"].ToString();

                sdsContactosVisitas.InsertParameters[4].DefaultValue = puesto.SelectedValue; //.Text.Trim().ToUpper();
                sdsContactosVisitas.InsertParameters[5].DefaultValue = lstDepartamento.SelectedValue;
                sdsContactosVisitas.InsertParameters[6].DefaultValue = celular.Text.Trim();
                sdsContactosVisitas.InsertParameters[7].DefaultValue = correo.Text.Trim();

                sdsContactosVisitas.Insert();
                //lblMensaje.Text = "Alta exitosa";
                //lblMensaje2.Text = lblMensaje.Text;
                nombre.Dispose();
                telefono.Dispose();
                puesto.Dispose();
                lstDepartamento.Dispose();
                celular.Dispose();
                correo.Dispose();
            }
        }

        muestraOcualtaCamposContacto(false);
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        //TextBox nombre = (TextBox)gvwContactoVisitado.FooterRow.FindControl("nombre");
        TextBox nombre = gvwContactoVisitado.Controls[0].Controls[0].FindControl("nombre") as TextBox;
        //TextBox telefono = (TextBox)gvwContactoVisitado.FooterRow.FindControl("telefono");
        TextBox telefono = gvwContactoVisitado.Controls[0].Controls[0].FindControl("telefono") as TextBox;
        
        //TextBox puesto = gvwContactoVisitado.Controls[0].Controls[0].FindControl("puesto") as TextBox;
        DropDownList puesto = gvwContactoVisitado.Controls[0].Controls[0].FindControl("puesto") as DropDownList;

        DropDownList lstDepartamento = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lstDepartamento") as DropDownList;
        TextBox celular = gvwContactoVisitado.Controls[0].Controls[0].FindControl("celular") as TextBox;
        TextBox correo = gvwContactoVisitado.Controls[0].Controls[0].FindControl("correo") as TextBox;


        //TextBox nombre = (TextBox)gvwDepartamentos.FindControl("nombre");
        if (nombre != null)
        {
            if (nombre.Text.Trim().Length > 0)
            {
                sdsContactosVisitas.InsertParameters[0].DefaultValue = lstEmpresa.SelectedValue;
                sdsContactosVisitas.InsertParameters[1].DefaultValue = nombre.Text.Trim().ToUpper();
                sdsContactosVisitas.InsertParameters[2].DefaultValue = telefono.Text.Trim();
                sdsContactosVisitas.InsertParameters[3].DefaultValue = Session["usuarioID"].ToString();

                sdsContactosVisitas.InsertParameters[4].DefaultValue = puesto.SelectedValue;  //.Text.Trim().ToUpper();
                sdsContactosVisitas.InsertParameters[5].DefaultValue = lstDepartamento.SelectedValue;
                sdsContactosVisitas.InsertParameters[6].DefaultValue = celular.Text.Trim();
                sdsContactosVisitas.InsertParameters[7].DefaultValue = correo.Text.Trim();
                
                sdsContactosVisitas.Insert();
                //lblMensaje.Text = "Alta exitosa";
                //lblMensaje2.Text = lblMensaje.Text;
                nombre.Dispose();
                telefono.Dispose();
                puesto.Dispose();
                lstDepartamento.Dispose();
                celular.Dispose();
                correo.Dispose();
            }
        }
        muestraOcualtaCamposContactoVacio(false);
    }
    protected void btnContinuar_Click1(object sender, EventArgs e)
    {
        visitasVentasVO visitasVO = new visitasVentasVO();
        visitasVentasBL visitasBL = new visitasVentasBL();
        if (lstEstatusActual2.SelectedIndex == -1)
            {
                visitasVO.EstatusActualId = 0;
                visitasVO.OtroEstatusActual = "";
            }
        else
            {
                visitasVO.EstatusActualId = Int32.Parse(lstEstatusActual2.SelectedItem.Value);
                //visitasVO.OtroEstatusActual = txtOtroEstatusActual2.Text.Trim().ToUpper();
                visitasVO.OtroEstatusActual = "";

            }

        if (rblBanderaVenta.SelectedIndex == -1)
            {
                visitasVO.BanderaVenta = 0;
            }
            else
            {
                visitasVO.BanderaVenta = Int32.Parse(rblBanderaVenta.SelectedValue);
            }


            visitasVO.Observaciones = txtObservaciones.Text.Trim().ToUpper();

            visitasVO.BanderaSeguimiento = (ckbSeguimiento.Checked) ? 1 : 0;
            visitasVO.OtroCliente = txtOtroCliente.Text.Trim().ToUpper();
            visitasVO.OtroContactoCliente = txtContactoVisitado.Text.Trim().ToUpper();


     if (Request["visitaId"] == null)
        {
                visitasVO.Operacion = visitasVentasVO.INSERTAR;
                //visitasVO.VisitaVentasId =  
                visitasVO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString()); //Int32.Parse(lstIngVentas.SelectedItem.Value);
                visitasVO.ClienteId = lstEmpresa.SelectedItem.Value;
                visitasVO.FechaVisita = txtFecha.Text.Trim();
                //visitasVO.DepartamentoVisitaId = Int32.Parse(lstDepartamento.SelectedItem.Value);
                visitasVO.NovedadVisitaId = Int32.Parse(lstNovedad.SelectedItem.Value);
                visitasVO.ObjetivoVisitaId = Int32.Parse(lstObjVisita.SelectedItem.Value);
                visitasVO.SiguientePasoId = Int32.Parse(lstSigPaso.SelectedItem.Value);
                visitasVO.SolicitudApoyoId = Int32.Parse(lstSolApoyo.SelectedItem.Value);
                visitasVO.TemaApoyo = txtTemaApoyo.Text.Trim().ToUpper();
                visitasVO.Comentarios = txtComentarios.Text.Trim().ToUpper();
                visitasVO.TemaPresentadoId = Int32.Parse(lstTema.SelectedItem.Value);
                visitasVO.UsuarioIdModifico = Int32.Parse(Session["usuarioID"].ToString());
                visitasVO.OtroNovedad = txtOtroNovedad.Text.Trim().ToUpper();
                visitasVO.OtroObjetivo = txtOtroObjVisita.Text.Trim().ToUpper();
                visitasVO.OtroSiguientePaso = txtOtroSigPaso.Text.Trim().ToUpper();
                //visitasVO.OtroSolicitudApoyo = txtOtroSolApoyo.Text.Trim().ToUpper();
                visitasVO.OtroSolicitudApoyo = "";
                visitasVO.OtroTemaPresentado = txtOtroTemaPresent.Text.Trim().ToUpper();
                visitasVO.BanderaVenta = 0;

                ArrayList arrListaContactos = getListaContactos();
                // valida contactos
                if (arrListaContactos!=null && arrListaContactos.Count > 0 || txtContactoVisitado.Text.Trim().Length > 0)
                {
                visitasVO = (visitasVentasVO)visitasBL.execute(visitasVO);
                if (visitasVO.Resultado > 0)
                  {
                  btnContinuar.Visible = false;
                  lblMensaje.Text = "Datos Guardados - " + visitasVO.Resultado.ToString();
                  lblMensaje2.Text = lblMensaje.Text;
                      if (visitasVO.ClienteId != "99999") // si es diferente al cliente OTRO
                      {
                        if (arrListaContactos != null && arrListaContactos.Count > 0)
                            {
                              //controlFacturasVO VO = new controlFacturasVO();
                              //controlFacturasBL BL = new controlFacturasBL();
                              visitasVO.Operacion = visitasVentasVO.ACTUALIZACONTACTOS;
                              visitasVO.ArrListaContactos = arrListaContactos;
                              visitasVO.UsuarioIdModifico = Int32.Parse(Session["usuarioID"].ToString());
                              visitasVO = (visitasVentasVO)visitasBL.execute(visitasVO);
                              //if (VO.Resultado == 0)
                            }
                      }
                  }

           }//valida Contacto
        else
            {
                lblMensaje.Text = "Debe seleccionar o capturar algún contacto.";
                if (visitasVO.ClienteId != "99999")
                {
                gvwContactoVisitado.Visible = true;
                sdsContactosVisitas.EnableViewState = true;
                }
            }

      }//- insert--
     else
         {
          visitasVO.Operacion = visitasVentasVO.ACTUALIZAR;
          visitasVO.VisitaVentasId = Int32.Parse(Request["visitaId"].ToString());
          visitasVO = (visitasVentasVO)visitasBL.execute(visitasVO);
          //rfvOtroEstatusActual2.Enabled = false;
         }
    }

    private ArrayList getListaContactos()
    {
        try
            {
            ArrayList listaContactos = new ArrayList();
            String index = "-1";
            if (gvwContactoVisitado.Rows.Count > 0 )
                {
                foreach (GridViewRow row in gvwContactoVisitado.Rows)
                    {
                        index = gvwContactoVisitado.DataKeys[row.RowIndex].Value.ToString();
                        bool result = ((CheckBox)row.FindControl("ckbContacto")).Checked;
                        if (result)
                        {
                            listaContactos.Add(index);
                        }
                    }
                }
            return listaContactos;
            }
        catch(Exception exc)
            {
                return null;
            }
    }

    private void cargaCheckbox(ArrayList array)
    {
        if (array != null && array.Count > 0)
        {
            String index;
            CheckBox myCheckBox;
            foreach (GridViewRow row in gvwContactoVisitado.Rows)
            {
                index = gvwContactoVisitado.DataKeys[row.RowIndex].Value.ToString();
                myCheckBox = (CheckBox)row.FindControl("ckbContacto");
                if (array.Contains(index))
                {
                    myCheckBox.Checked = true;
                }
                else
                {
                    myCheckBox.Checked = false;
                }
                myCheckBox.Dispose();
            }
        }
    }

    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        muestraOcualtaCamposContacto(true);
        //btnNuevo.Visible = false;
    }

    protected void muestraOcualtaCamposContacto(Boolean bandera)
    {
        TextBox nombre = (TextBox)gvwContactoVisitado.FooterRow.FindControl("nombre");
        //TextBox puesto = (TextBox)gvwContactoVisitado.FooterRow.FindControl("puesto");
        DropDownList puesto = (DropDownList)gvwContactoVisitado.FooterRow.FindControl("puesto");
        DropDownList lstDepartamento = (DropDownList)gvwContactoVisitado.FooterRow.FindControl("lstDepartamento");
        TextBox telefono = (TextBox)gvwContactoVisitado.FooterRow.FindControl("telefono");
        TextBox celular = (TextBox)gvwContactoVisitado.FooterRow.FindControl("celular");
        TextBox correo = (TextBox)gvwContactoVisitado.FooterRow.FindControl("correo");

       Label lblNombre = (Label)gvwContactoVisitado.FooterRow.FindControl("lblNombre");
       Label lblPuesto = (Label)gvwContactoVisitado.FooterRow.FindControl("lblPuesto");
       Label lblDepartamento = (Label)gvwContactoVisitado.FooterRow.FindControl("lblDepartamento");
       Label lblTelefono = (Label)gvwContactoVisitado.FooterRow.FindControl("lblTelefono");
       Label lblCelular = (Label)gvwContactoVisitado.FooterRow.FindControl("lblCelular");
       Label lblCorreo = (Label)gvwContactoVisitado.FooterRow.FindControl("lblCorreo");

       Button Button2 = (Button)gvwContactoVisitado.FooterRow.FindControl("Button2");
       Button btnNuevo = (Button)gvwContactoVisitado.FooterRow.FindControl("btnNuevo");

       nombre.Visible = bandera;
       puesto.Visible = bandera;
       lstDepartamento.Visible = bandera;
       telefono.Visible = bandera;
       celular.Visible = bandera;
       correo.Visible = bandera;

       lblNombre.Visible = bandera;
       lblPuesto.Visible = bandera;
       lblDepartamento.Visible = bandera;
       lblTelefono.Visible = bandera;
       lblCelular.Visible = bandera;
       lblCorreo.Visible = bandera;

       Button2.Visible = bandera;
       btnNuevo.Visible = !bandera;

       nombre.Dispose();
       puesto.Dispose();
       lstDepartamento.Dispose();
       telefono.Dispose();
       celular.Dispose();
       correo.Dispose();

       lblNombre.Dispose();
       lblPuesto.Dispose();
       lblDepartamento.Dispose();
       lblTelefono.Dispose();
       lblCelular.Dispose();
       lblCorreo.Dispose();
       Button2.Dispose();
       btnNuevo.Dispose();

    }

    protected void muestraOcualtaCamposContactoVacio(Boolean bandera)
    {
        TextBox nombre = gvwContactoVisitado.Controls[0].Controls[0].FindControl("nombre") as TextBox;
        TextBox telefono = gvwContactoVisitado.Controls[0].Controls[0].FindControl("telefono") as TextBox;
        //TextBox puesto = gvwContactoVisitado.Controls[0].Controls[0].FindControl("puesto") as TextBox;
        DropDownList puesto = gvwContactoVisitado.Controls[0].Controls[0].FindControl("puesto") as DropDownList;
        DropDownList lstDepartamento = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lstDepartamento") as DropDownList;
        TextBox celular = gvwContactoVisitado.Controls[0].Controls[0].FindControl("celular") as TextBox;
        TextBox correo = gvwContactoVisitado.Controls[0].Controls[0].FindControl("correo") as TextBox;

        Label lblNombre = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lblNombre") as Label;
        Label lblPuesto = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lblPuesto") as Label;
        Label lblDepartamento = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lblDepartamento") as Label;
        Label lblTelefono = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lblTelefono") as Label;
        Label lblCelular = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lblCelular") as Label;
        Label lblCorreo = gvwContactoVisitado.Controls[0].Controls[0].FindControl("lblCorreo") as Label;

        Button Button2 = gvwContactoVisitado.Controls[0].Controls[0].FindControl("Button2") as Button;
        Button btnNuevo = gvwContactoVisitado.Controls[0].Controls[0].FindControl("btnNuevo") as Button;

        nombre.Visible = bandera;
        puesto.Visible = bandera;
        lstDepartamento.Visible = bandera;
        telefono.Visible = bandera;
        celular.Visible = bandera;
        correo.Visible = bandera;

        lblNombre.Visible = bandera;
        lblPuesto.Visible = bandera;
        lblDepartamento.Visible = bandera;
        lblTelefono.Visible = bandera;
        lblCelular.Visible = bandera;
        lblCorreo.Visible = bandera;

        Button2.Visible = bandera;
        btnNuevo.Visible = !bandera;

        nombre.Dispose();
        puesto.Dispose();
        lstDepartamento.Dispose();
        telefono.Dispose();
        celular.Dispose();
        correo.Dispose();

        lblNombre.Dispose();
        lblPuesto.Dispose();
        lblDepartamento.Dispose();
        lblTelefono.Dispose();
        lblCelular.Dispose();
        lblCorreo.Dispose();
        Button2.Dispose();
        btnNuevo.Dispose();

    }
    protected void btnNuevoVacio_Click(object sender, EventArgs e)
    {
        muestraOcualtaCamposContactoVacio(true);
    }
    protected void muestraOcualtaSeguimientoVisita(Boolean bandera)
    {
        lblTitulo3.Visible = bandera;
        lblEtiqueta11.Visible = bandera;
        lblEtiqueta12.Visible = bandera;
        lblEtiqueta13.Visible = bandera;
        lstEstatusActual2.Visible = bandera;
        rblBanderaVenta.Visible = bandera;
        txtObservaciones.Visible = bandera;
        //gvwContactoVisitado.Visible = bandera;
    }

    protected void lnkNuevaVisita_Click(object sender, EventArgs e)
    {

        lblEtiquetaVisita.Text = "Visita No.";
        lblEtiquetaVisita.Visible = false;

        //Calendar1.SelectedDate = new DateTime();

        lstEmpresa.SelectedIndex = 1; // 0
        txtFecha.Text = "";
        //Calendar1.Visible = false;
        lstNovedad.SelectedIndex = 0;
        lstTema.SelectedIndex = 0;
        lstObjVisita.SelectedIndex = 0;
        txtComentarios.Text = "";
        lstSigPaso.SelectedIndex = 0;
        lstSolApoyo.SelectedIndex = 0;
        txtTemaApoyo.Text = "";
        lstEstatusActual2.SelectedIndex = 0;
        rblBanderaVenta.SelectedIndex = 0;
        txtObservaciones.Text = "";
        lblMensaje2.Text = "";
        lblMensaje.Text = "";
        btnContinuar.Visible = true;

        txtOtroCliente.Text = "";
        txtOtroNovedad.Text = "";
        txtOtroTemaPresent.Text = "";
        txtOtroObjVisita.Text = "";
        txtOtroSigPaso.Text = "";
        //txtOtroSolApoyo.Text = "";
        //txtOtroEstatusActual2.Text = "";
        txtOtroCliente.Text = "";
        txtContactoVisitado.Text = "";

        //lblOtroNovedad.Visible = false;
        //txtOtroNovedad.Visible = false;
        //rfvOtroNovedad.Enabled = false;

        //lblOtroTemaPresent.Visible = false;
        //txtOtroTemaPresent.Visible = false;
        //rfvOtroTemaPresent.Enabled = false;

        //lblOtroObjVisita.Visible = false;
        //txtOtroObjVisita.Visible = false;
        //rfvOtroObjVisita.Enabled = false;

        //lblOtroSigPaso.Visible = false;
        //txtOtroSigPaso.Visible = false;
        //rfvOtroSigPaso.Enabled = false;

        //lblOtroSolApoyo.Visible = false;
        //txtOtroSolApoyo.Visible = false;
        //rfvOtroSolApoyo.Enabled = false;

        //lblOtroEstatusActual2.Visible = false;
        //txtOtroEstatusActual2.Visible = false;
        //rfvOtroEstatusActual2.Enabled = false;

        //lblOtroCliente.Visible = false;
        //txtOtroCliente.Visible = false;
        //rfvOtroCliente.Enabled = false;

        txtContactoVisitado.Visible = false;
        ckbSeguimiento.Checked = false;

    }

    protected void gvwContactoVisitado_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
        {
          try
              {
                String strInstruccion = DataBinder.Eval(e.Row.DataItem, "banderaContacto").ToString();
              if (strInstruccion == "1")
                  {
                      CheckBox ckbContacto = (CheckBox)e.Row.FindControl("ckbContacto");
                      ckbContacto.Checked = true;
                      ckbContacto.Dispose();
                  }
              }
          catch (Exception exc)
              {
              }
        }
    }

    protected void lstEmpresa_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvwContactoVisitado.Visible = true;

        if (lstEmpresa.SelectedItem.Text.ToUpper() == "OTRO")
        {
            lblOtroCliente.Visible = true;
            txtOtroCliente.Visible = true;
            rfvOtroCliente.Enabled = true;

            txtContactoVisitado.Visible = true;
            gvwContactoVisitado.Visible = false;
            sdsContactosVisitas.EnableViewState = false;
        }
        else
        {
            lblOtroCliente.Visible = false;
            txtOtroCliente.Visible = false;
            txtOtroCliente.Text = "";
            rfvOtroCliente.Enabled = false;

            txtContactoVisitado.Visible = false;
            gvwContactoVisitado.Visible = true;
            sdsContactosVisitas.EnableViewState = true;
        }
    }
}
