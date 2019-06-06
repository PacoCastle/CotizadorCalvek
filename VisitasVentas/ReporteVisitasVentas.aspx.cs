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
using System.Collections.Specialized;
using System.IO;
using System.Data.Common;


public partial class VisitasVentas_ReporteVisitasVentas : System.Web.UI.Page
{
    private static int NUMFUNCION = 39;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD Acceso a Visitas Ventas
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        Boolean blnPerfilAdministradorVisitas = false;
        Boolean blnPerfilSupervisorVisitas = false;
        Boolean blnPerfilAgenteVisitas = false;

        if(!Page.IsPostBack)
            {
           lblAgente.Text = Session["usuarioID"].ToString();

        // determinar si el usuario tiene los permisos como administrador de Visitas Ventas.
        String error2 = Utilis.validaPermisos(Session, 36);
        if (error2.Equals(""))
        {
            blnPerfilAdministradorVisitas = true;
            lblTipoUsuario.Text = "0";
            lstAgente.Visible = true;
            odsAgentes.EnableViewState = true;
            lblEtiAgente.Visible = true;
        }

        // determinar si el usuario tiene los permisos como supervisor de Visitas Ventas.
        error2 = Utilis.validaPermisos(Session, 37);
        if (error2.Equals(""))
        {
            blnPerfilSupervisorVisitas = true;
            lblTipoUsuario.Text = "1";
            lstAgente.Visible = true;
            odsAgentes.EnableViewState = true;
            lblEtiAgente.Visible = true;
        }

        // determinar si el usuario tiene los permisos como Agente de Visitas Ventas.
        error2 = Utilis.validaPermisos(Session, 38);
        if (error2.Equals(""))
        {
            blnPerfilAgenteVisitas = true;
            lblTipoUsuario.Text = "2";
        }
        }

    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {

        String strNombreArchivo = Page.Header.Title; // nombre de la pagina -> nombre base del archivo
        String[] cadena = HttpContext.Current.Request.RawUrl.Split('/');
        String strCarpeta = cadena[(cadena.Length) - 2]; //

        // Existe Carpeta, No - crear.
        DirectoryInfo diCarpetaArchivo = new DirectoryInfo(MapPath("~/Archivos/ArchivosExcel/" + strCarpeta));
        if (!diCarpetaArchivo.Exists)
        {
            diCarpetaArchivo.Create();
        }

        // Existe Archivo, No - crear
        if (!File.Exists(MapPath("~/Archivos/ArchivosExcel/" + strCarpeta + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".xls")))
        {
            File.Copy(MapPath("~/Archivos/ArchivosExcel/BasesNoBorrar/Base_VISITA-REPORTE.xls"), MapPath("~/Archivos/ArchivosExcel/" + strCarpeta + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".xls"));
        }
        else // elimina y vuelve a copiar
        {
            File.Delete(MapPath("~/Archivos/ArchivosExcel/" + strCarpeta + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".xls"));
            File.Copy(MapPath("~/Archivos/ArchivosExcel/BasesNoBorrar/Base_VISITA-REPORTE.xls"), MapPath("~/Archivos/ArchivosExcel/" + strCarpeta + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".xls"));
        }

        // lee datos datagrid
        int i, h;
        String[,] strValores = new String[GridView1.Rows.Count, GridView1.Rows[0].Cells.Count];

        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            for (h = 0; h < GridView1.Rows[i].Cells.Count; h++)
            {
                strValores[i, h] = quitaCaracteresRaros(GridView1.Rows[i].Cells[h].Text).ToUpper();
            }
        }


        // conexion al archivo,  insercion de datos
        string strConnnectionOle = "Provider=Microsoft.Jet.OLEDB.4.0;" +
        "Data Source=" + MapPath("~/Archivos/ArchivosExcel/" + strCarpeta + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".xls") +";" +
        "Extended Properties=" + '"' + "Excel 8.0;HDR=YES" + '"';

        DbProviderFactory factory = DbProviderFactories.GetFactory("System.Data.OleDb");

        using (DbConnection connection = factory.CreateConnection())
        {
            connection.ConnectionString = strConnnectionOle;
            using (DbCommand command = connection.CreateCommand())
            {
             connection.Open();
             for (i = 0; i < GridView1.Rows.Count; i++)
                   {
                    command.CommandText = "INSERT INTO [Hoja1$](ID,Usuario,Cliente,Fecha,Novedad,Tema,Objetivo,Comentarios,Siguiente_Paso,Solicitud_Apoyo,Tema_Apoyo,Estatus_Actual,Venta,Observaciones,Contacto) VALUES(" + strValores[i, 0] + ",\"" + strValores[i, 1] + "\",\"" + strValores[i, 2] + "\",\"" + strValores[i, 3] + "\",\"" + strValores[i, 4] + "\",\"" + strValores[i, 5] + "\",\"" + strValores[i, 6] + "\",\"" + strValores[i, 7] + "\",\"" + strValores[i, 8] + "\",\"" + strValores[i, 9] + "\",\"" + strValores[i, 10] + "\",\"" + strValores[i, 11] + "\",\"" + strValores[i, 12] + "\",\"" + strValores[i, 13] + "\",\"" + strValores[i, 14] + "\")";
                    command.ExecuteNonQuery();
                    }
             connection.Close();
            }
        }

        factory = null;
        strValores = null;

        lblBanderaBoton.Text = "1";
        btnExcel.Visible = false;
        hlnkArchivoReporte.Visible = true;
        hlnkArchivoReporte.NavigateUrl = "~/Archivos/ArchivosExcel/" + strCarpeta + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".xls";
    }

    protected void imgCalendario_Click(object sender, ImageClickEventArgs e)
    {
       if(Page.IsPostBack)
        {
        lblBandera.Text = "1";
        Calendar1.Visible = true;
        }
    }

    protected void imgCalendario2_Click(object sender, ImageClickEventArgs e)
    {
       if(Page.IsPostBack)
        {
        lblBandera.Text = "2";
        Calendar1.Visible = true;
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if(lblBandera.Text=="1")
            txtFechaDe.Text = Calendar1.SelectedDate.Date.ToString("d");

        if(lblBandera.Text=="2")
            txtFechaA.Text = Calendar1.SelectedDate.Date.ToString("d");

        lblBandera.Text = "";
        Calendar1.Visible = false;
        odsBuscaVisitasVentas.EnableViewState = false;
        GridView1.Visible = false;

    }
    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        odsBuscaVisitasVentas.EnableViewState = true;
        GridView1.Visible = true;
        btnExcel.Visible = false;
        lblBanderaBoton.Text = "0";
        hlnkArchivoReporte.Visible = false;
    }

    public String quitaCaracteresRaros(String strCadena)
    {

        strCadena = strCadena.Replace("&nbsp;", " ");
        strCadena = strCadena.Replace("&#225;", "Á");
        strCadena = strCadena.Replace("&#201;", "É");
        strCadena = strCadena.Replace("&#205;", "Í");
        strCadena = strCadena.Replace("&#211;", "Ó");
        strCadena = strCadena.Replace("&#218;", "Ú");
        return strCadena;
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.Header)
        //{
        //}
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (lblBanderaBoton.Text == "0")
            {
            btnExcel.Visible = true;
            }
            else
            {
                btnExcel.Visible = false;
            }
        }
        //if (e.Row.RowType == DataControlRowType.Footer)
        //{
        //}
    }

    protected void lstAgente_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblEtiAgente.Visible = true;
        lblAgente.Text = lstAgente.SelectedItem.Value;
        btnExcel.Visible = true;
    }
}
