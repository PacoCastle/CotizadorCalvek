using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Data;

//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using System.IO;
//using iTextSharp.text.html.simpleparser;
using System.Web.UI.WebControls;

public partial class Catalogos_Pacientes_impresion_papeleta : System.Web.UI.Page
{

    private static int NUMFUNCION = 49;
    private string nombre_completo;
    private string nombre_pac;
    private string apaterno_pac;
    private string amaterno_pac;
    private string retornar_razonsocial;
    private string retornar_perfil;
    private string nombre_ex;

    private string FA;
    private DateTime fecha_alta;

    private string nombre_paciente;
    private string nombre_empresa;
    private string nombre_perfil;
    private string no_folio;
    private string folio;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!error.Equals(""))
            {
                Response.Redirect(error);
            }
            error = Utilis.validaPermisos(Session, 50);
            if (!Page.IsPostBack)
            {
                refreshdata();
                nombre_paciente = String.IsNullOrEmpty(Request.QueryString["rfc"]) ? "" : Request.QueryString["rfc"].ToString();
                nombre_empresa = String.IsNullOrEmpty(Request.QueryString["id_empresa"]) ? "" : Request.QueryString["id_empresa"].ToString();
                nombre_perfil = String.IsNullOrEmpty(Request.QueryString["id_perfil"]) ? "" : Request.QueryString["id_perfil"].ToString();

                txtpaciente.Text = Retornar_Nombre_Paciente(nombre_paciente);
                txtrfc.Text = nombre_paciente;
                txtempresa.Text = Retornar_Nombre_Empresa(nombre_empresa);
                txtperfil.Text = Retornar_Perfil(nombre_perfil);
                txtfechaAlta.Text = Retornar_Fecha(nombre_paciente, nombre_empresa, nombre_perfil);
                folio = RetornarFolio(nombre_paciente, nombre_empresa, nombre_perfil);
                labfolio.Text = folio;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("select id_examen from TU_PER_CAT_DETALLEPERFIL where id_perfil= '" + nombre_perfil + "'", con))
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            foreach (GridViewRow gvrow in GridView1.Rows)
                            {
                                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                                var lblID = gvrow.FindControl("Label1") as Label;
                                if (lblID.Text == dr["id_examen"].ToString())
                                {
                                    checkbox.Checked = true;
                                }
                            }//fin foreach
                        }
                        con.Close();
                    }
                }
            }

        }
        catch (Exception ex)
        {
        }

    }



    protected void Alta_Papeleta(object sender, EventArgs e)
    {
        nombre_paciente = String.IsNullOrEmpty(Request.QueryString["rfc"]) ? "" : Request.QueryString["rfc"].ToString();
        nombre_empresa = String.IsNullOrEmpty(Request.QueryString["id_empresa"]) ? "" : Request.QueryString["id_empresa"].ToString();
        nombre_perfil = String.IsNullOrEmpty(Request.QueryString["id_perfil"]) ? "" : Request.QueryString["id_perfil"].ToString();

        txtpaciente.Text = Retornar_Nombre_Paciente(nombre_paciente);
        txtrfc.Text = nombre_paciente;
        txtempresa.Text = Retornar_Nombre_Empresa(nombre_empresa);
        txtperfil.Text = Retornar_Perfil(nombre_perfil);
        folio = RetornarFolio(nombre_paciente, nombre_empresa, nombre_perfil);
        StringBuilder sb = new StringBuilder();
        /*sb.Append("<header class='clearfix'>");
        sb.Append("<h1>AMI</h1>");
        sb.Append("<div>Empresa:"+ Retornar_Nombre_Empresa(nombre_empresa) + "</div>");
        sb.Append("<div>Paciente: "+ Retornar_Nombre_Paciente(nombre_paciente) + "</div>");
        sb.Append("<div>RFC: "+ nombre_paciente + "</div>");
        sb.Append("<div>Perfil: "+Retornar_Perfil(nombre_perfil)+"</div>");
        sb.Append("</header>");*/
        sb.Append("<table width='100%' border=0>");
        sb.Append("<tr>");
        sb.Append("<td align='left'><img src='http://localhost:24802/Imagenes/logoAMI.PNG' WIDTH=160 HEIGHT=120></td>");
        sb.Append("<td align='right'>Folio: "+folio+"</td>");
        sb.Append("</tr>");
        sb.Append("</table>");

        sb.Append("<table width='100%' border=1>");
        sb.Append("<tr>");
        sb.Append("<td><table width='100%' border='0' cellspacing='0' cellpadding='0'>");

        sb.Append("<tr>");
        sb.Append("<td colspan='2' align='center'> <H3><b>CONTROL DE PRUEBAS MEDICAS</b></H3> </td>");
        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<td><H5><b>EMPRESA:</b></H5></td>");
        sb.Append("<td>"+ Retornar_Nombre_Empresa(nombre_empresa) + "</td>");
        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<td><H5><b>PACIENTE:</H5></b></td>");
        sb.Append("<td>"+ Retornar_Nombre_Paciente(nombre_paciente) + "</td>");
        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<td><H5><b>RFC:</b></H5></td>");
        sb.Append("<td>"+ nombre_paciente + "</td>");
        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<td><H5><b>PERFIL:</b></H5></td>");
        sb.Append("<td>"+Retornar_Perfil(nombre_perfil)+"</td>");
        sb.Append("</tr>");
        sb.Append("<tr>");
        sb.Append("<td><H5><b>FECHA ALTA:</b></H5></td>");
        sb.Append("<td>" + Retornar_Fecha(nombre_paciente, nombre_empresa, nombre_perfil) + "</td>");
        sb.Append("</tr>");

        sb.Append("</table></td>");
        sb.Append("</tr>");
        sb.Append("</table>");

        sb.Append("<br>");
        sb.Append("<table border=1>");
        sb.Append("<thead>");
        sb.Append("<tr>");
        sb.Append("<th align='center' BGCOLOR='Teal'><H5>ID EXAMEN</H5></th>");
        sb.Append("<th align='center' BGCOLOR='Teal'><H5>EXAMEN</H5></th>");
        sb.Append("</tr>");
        sb.Append("</thead>");
        sb.Append("<tbody>");
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select id_examen from TU_PER_CAT_DETALLEPERFIL where id_perfil= '" + nombre_perfil + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    string nom_ex= Retornar_Nombre_Examen(dr["id_examen"].ToString());
                    foreach (GridViewRow gvrow in GridView1.Rows)
                    {
                        var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                        var lblID = gvrow.FindControl("Label1") as Label;

                        if (lblID.Text == dr["id_examen"].ToString())
                        {
                            checkbox.Checked = true;
                            sb.Append("<tr>");
                            sb.Append("<td align='center'><H6><b>" + lblID.Text + "</b></H6></td>");
                            sb.Append("<td align='center'><H6><b>" + nom_ex + "</b></H6></td>");
                            sb.Append("</tr>");
                        }
                    }//fin foreach
                }
                con.Close();
            }
        }

        sb.Append("</tbody>");
        sb.Append("</table>");


        sb.Append("<br>");
        sb.Append("<br>");
        sb.Append("<p align='center'>________________________________</p>");
        sb.Append("<br>");
        sb.Append("<p align='center'>Conforme Acuerdo Privacidad</p>");

        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        //StringWriter sw = new StringWriter();
        //HtmlTextWriter hw = new HtmlTextWriter(sw);

        //panelPDF.RenderControl(hw);
        //StringReader sr = new StringReader(sb.ToString());
        //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
        //HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
        //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        //pdfDoc.Open();
        //htmlParser.Parse(sr);
        
        //pdfDoc.Close();
        //Response.Write(pdfDoc);
        //Response.End();
        
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        return;
    }


    public void refreshdata()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT [ID_EXAMEN], [NOMBRE_EXAMEN] FROM [TU_PER_CAT_EXAMEN]", con))
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }//refreshdata
    protected string Retornar_Nombre_Paciente(string rfc_paciente)
    {
        nombre_completo = "";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_REG_PACIENTE where RFC='" + rfc_paciente + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.nombre_pac = dr["Nombre"].ToString();
                    this.apaterno_pac = dr["Apaterno"].ToString();
                    this.amaterno_pac = dr["Amaterno"].ToString();
                    this.nombre_completo += this.nombre_pac + " " + this.apaterno_pac + " " + this.amaterno_pac;
                }
                con.Close();
                return this.nombre_completo;
            }
        }
    }//FIN RETORNARnombre


    protected string Retornar_Nombre_Empresa(string id_empresa)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select cliente_razonSocial from clientes where cliente_codigo='" + id_empresa + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.retornar_razonsocial = dr["cliente_razonSocial"].ToString();
                }
                con.Close();
                return this.retornar_razonsocial;
            }
        }
    }//FIN RETORNAR RAZON SOCIAL

    protected string Retornar_Perfil(string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT PERF_DESCRIPCION from TU_PER_CAT_PERFILES where ID_PERFIL='" + id_perfil + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.retornar_perfil = dr["PERF_DESCRIPCION"].ToString();
                }
                con.Close();
                return this.retornar_perfil;
            }
        }
    }//FIN RETORNAR PERFIL


    protected string Retornar_Nombre_Examen(string id_ex)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT NOMBRE_EXAMEN FROM TU_PER_CAT_EXAMEN where ID_EXAMEN='" + id_ex + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.nombre_ex = dr["NOMBRE_EXAMEN"].ToString();
                }
                con.Close();
                return this.nombre_ex;
            }
        }
    }//FIN RETORNAR EXAMEN


    protected string Retornar_Fecha(string rfc, string id_empresa, string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT CONVERT (char(10), FECHA_ALTA, 103) as FECHA_ALTA FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL where RFC= '" + rfc + "' AND ID_EMP= '"+id_empresa+"' AND ID_PER= '"+id_perfil+"'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.FA = dr["FECHA_ALTA"].ToString();
                }
                con.Close();
                return FA;
            }
        }
    }//FIN RETORNAR EXAMEN

    protected string RetornarFolio(string rfc, string id_empresa, string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT FOLIO FROM TU_PER_CAT_PAPELETA where RFC= '" + rfc + "' AND ID_EMPRESA= '" + id_empresa + "' AND ID_PERFIL= '" + id_perfil + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.no_folio = dr["FOLIO"].ToString();
                }
                con.Close();
                return this.no_folio;
            }
        }
    }//FIN RETORNAR FOLIO
}