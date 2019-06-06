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
//using saludos;

public partial class Seguridad_FormularioUsuario : System.Web.UI.Page
{
    private static int NUMFUNCION = 3;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        if (Request["usuarioId"] != null && !IsPostBack)
        {
            cargaDatosActualiza();
        }
        OtrosUsuario.Visible = false;
        //String carpetaEmpresa = "C:/Compacw/Empresas/CALVEK";
        //long prueba = 0;
        //String lNombreAgente = "";
        //String lCodigoAgente = "";

        //int index = 0;
        //String cadena = "";

        //saludo nuevo = new saludo();
        //nuevo.fInicializaSDKW();
        //nuevo.fAbreEmpresaW(carpetaEmpresa);
        //prueba = nuevo.fPosPrimerAgenteW();

        //while (prueba == 0)
        //    {
        //        prueba = nuevo.fLeeDatoAgenteW("cCodigoA01", lCodigoAgente, 30);
        //        cadena = cadena + "<BR>" + index + ": " + lCodigoAgente;
        //        prueba = nuevo.fLeeDatoAgenteW("cNombreA01", lNombreAgente, 60);

        //        listUsuarioAdmin.Items.Add(new ListItem(lNombreAgente, lCodigoAgente));

        //        lCodigoAgente = "";
        //        lNombreAgente = "";

        //        prueba = nuevo.fPosSiguienteAgenteW();
        //        index++;
        //    }

        //    comodin.Text = "<BR>Codigos Agente: " + cadena;

        //nuevo.fCierraEmpresaW();
        //nuevo.fTerminaSDKW();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int usuarioId = 0;
        usuarioVO VO = new usuarioVO();
        UsuarioBL BL = new UsuarioBL();

        if (Request["usuarioId"] != null)
        {
            Button1.Text = "Procesar Cambio";
            Label1.Text = "Cambio de Informacion del Usuario";
            usuarioId = Int32.Parse(Request["usuarioId"]);
            VO.ActualizarPassword = 0;

            VO.Usuario_estatusId = Int32.Parse(listEstatus.SelectedValue);
            VO.Usuario_login = txtUsuarioId.Text;
            VO.Usuario_nombrecompleto = txtNombre.Text;
            VO.Usuario_oficinaId = 1;//Int32.Parse(listOficina.SelectedValue);
            VO.Usuario_perfilid = Int32.Parse(listPerfil.SelectedValue);
            VO.Usuario_codigoUsuarioAdmin = "0";//listUsuarioAdmin.SelectedValue;
            VO.Usuario_correoElectronico = txtCorreo.Text;
            VO.Usuario_radio = txtRadio.Text;
            VO.Usuarioid = usuarioId;
            VO.Usuario_jefeUsuarioId = 0;//Int32.Parse(lstJefe.SelectedValue);
            VO.Usuario_comisionId = 0;//Int32.Parse(lstComision.SelectedValue);
            VO.Usuario_administrativoId = 0;//Int32.Parse(lstAdministrativo.SelectedValue);
            VO.Usuario_ventasInternasId = 0;//Int32.Parse(lstVentasInternas.SelectedValue);

            if (ckCorreoOC.Checked)
            {
                VO.Usuario_correoOC = 1;
            }
            else
            {
                VO.Usuario_correoOC = 0;
            }

            if (ckCorreoTraspaso.Checked)
            {
                VO.Usuario_correoTraspaso = 1;
            }
            else
            {
                VO.Usuario_correoTraspaso = 0;
            }

            VO.Operacion = usuarioVO.ACTUALIZAR;

            VO = (usuarioVO)BL.execute(VO);
            if (VO.Resultado == 0)
            {
                Mensaje01.Text = "Los datos se actualizaron correctamente";
            }
            else
            {
                Mensaje01.Text = "Los datos NO se actualizaron correctamente";
            }
        }
        else
        {
            if (!txtPassword.Text.Equals(txtConformaPaswword.Text))
            {
                Mensaje01.Text = "El password no coincide.";
            }
            else
            {
                VO.ActualizarPassword = 0;

                VO.Usuario_login = txtUsuarioId.Text;
                VO.Usuario_contrasena = txtPassword.Text;
                VO.Usuario_nombrecompleto = txtNombre.Text;

                VO.Usuario_perfilid = Int32.Parse(listPerfil.SelectedValue);
                VO.Usuario_estatusId = Int32.Parse(listEstatus.SelectedValue);
                VO.Usuario_oficinaId = 1;//Int32.Parse(listOficina.SelectedValue);
                VO.Usuario_codigoUsuarioAdmin = "0";//listUsuarioAdmin.SelectedValue;
                VO.Usuario_correoElectronico = txtCorreo.Text.Trim();
                VO.Usuario_radio = txtRadio.Text.Trim();
                VO.Usuario_jefeUsuarioId = 0;//Int32.Parse(lstJefe.SelectedValue);
                VO.Usuario_administrativoId = 0;//Int32.Parse(lstAdministrativo.SelectedValue);
                VO.Usuario_ventasInternasId = 0;//Int32.Parse(lstVentasInternas.SelectedValue);

                if (ckCorreoOC.Checked)
                {
                    VO.Usuario_correoOC = 1;
                }
                else
                {
                    VO.Usuario_correoOC = 0;
                }

                if (ckCorreoTraspaso.Checked)
                {
                    VO.Usuario_correoTraspaso = 1;
                }
                else
                {
                    VO.Usuario_correoTraspaso = 0;
                }

                VO.Operacion = usuarioVO.INSERTAR;
                VO = (usuarioVO)BL.execute(VO);
                if (VO.Resultado > 0)
                {
                    usuarioId = (int)VO.Resultado;
                    Mensaje01.Text = "Los datos se insertaron correctamente";
                }
                else
                {
                    Mensaje01.Text = "Los datos NO se insertaron";
                }
            }

        }
    }

    private void cargaDatosActualiza()
    {

        usuarioVO VO = new usuarioVO();
        UsuarioBL BL = new UsuarioBL();
        int usuarioId = 0;
        int indiceagente = -1;
        int cuentaitems = 0;

        Button1.Text = "Procesar Cambio";
        Label1.Text = "Cambio de Informacion del Usuario";
        txtPassword.Visible = false;
        txtConformaPaswword.Visible = false;
        Label2.Visible = false;
        Button2.Visible = true;
        Button2.Attributes["OnClick"] = "new_window('CambioContrasena.aspx?usuarioId=" + Request["usuarioId"] + "');return false;";

        usuarioId = Int32.Parse(Request["usuarioId"]);
        VO.Operacion = usuarioVO.BUSCAR;
        VO.Usuarioid = usuarioId;

        VO = (usuarioVO)BL.execute(VO);

        txtUsuarioId.Text = VO.Usuario_login;
        txtNombre.Text = VO.Usuario_nombrecompleto;
        listOficina.SelectedValue = VO.Usuario_oficinaId.ToString();
        listEstatus.SelectedValue = VO.Usuario_estatusId.ToString();
        listPerfil.SelectedValue = VO.Usuario_perfilid.ToString();

        //listUsuarioAdmin.SelectedValue = VO.Usuario_codigoUsuarioAdmin.ToString();

        //indiceagente = listUsuarioAdmin.Items.IndexOf(listUsuarioAdmin.Items.FindByValue(VO.Usuario_codigoUsuarioAdmin.ToString()));
        listUsuarioAdmin.DataBind();
        cuentaitems = listUsuarioAdmin.Items.Count;
        //listUsuarioAdmin.Items.FindByValue(VO.Usuario_codigoUsuarioAdmin.ToString()).Selected = true;
        listUsuarioAdmin.SelectedIndex = listUsuarioAdmin.Items.IndexOf(listUsuarioAdmin.Items.FindByValue(VO.Usuario_codigoUsuarioAdmin.ToString()));

        txtCorreo.Text = VO.Usuario_correoElectronico;
        txtRadio.Text = VO.Usuario_radio;
        lstJefe.SelectedValue = VO.Usuario_jefeUsuarioId.ToString();
        lstAdministrativo.SelectedValue = VO.Usuario_administrativoId.ToString();
        lstVentasInternas.SelectedValue = VO.Usuario_ventasInternasId.ToString();


        lstComision.SelectedValue = VO.Usuario_comisionId.ToString();

        if (VO.Usuario_correoOC == 1)
        {
            ckCorreoOC.Checked = true;
        }
        else
        {
            ckCorreoOC.Checked = false;
        }

        if (VO.Usuario_correoTraspaso == 1)
        {
            ckCorreoTraspaso.Checked = true;
        }
        else
        {
            ckCorreoTraspaso.Checked = false;
        }

    }

    protected void listUsuarioAdmin_unonload(object sender, EventArgs e)
    {

    }

    protected void Page_UnLoad(object sender, EventArgs e)
    {

    }
}
