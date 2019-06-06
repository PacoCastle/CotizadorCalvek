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

public partial class Admin_Incidencias_incidencias : System.Web.UI.Page
{

    private static int NUMFUNCION = 45;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        btnGuardar.Visible = false;

        sdsIncidencia.InsertParameters[0].DefaultValue = lstDepartamento.SelectedValue.ToString();
        sdsIncidencia.InsertParameters[1].DefaultValue = lstOficina.SelectedValue.ToString();
        sdsIncidencia.InsertParameters[2].DefaultValue = txtComentario.Text.Trim();
        sdsIncidencia.InsertParameters[3].DefaultValue = Session["usuarioID"].ToString();
        sdsIncidencia.InsertParameters[4].DefaultValue = "10";
        //sdsIncidencia.InsertParameters[4].Direction = ParameterDirection.InputOutput;
        sdsIncidencia.Insert();
        //string strPrueba = sdsIncidencia.InsertParameters[4].ToString();

        lblMensaje.Text = " Incidencia Guardada ";

        btnNuevo.Visible = true;


    }

    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        btnNuevo.Visible = false;

        lstDepartamento.SelectedIndex = -1;
        lstOficina.SelectedIndex = -1;
        txtComentario.Text = "";

        lblMensaje.Text = "";

        lstOficina.Focus();

        btnGuardar.Visible = true;


    }

}
