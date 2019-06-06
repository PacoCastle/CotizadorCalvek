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

public partial class Catalogos_Pacientes_caida_papeleta : System.Web.UI.Page
{
    private static int NUMFUNCION = 14;
    private string rfc,a,RFCPAC;
    private string id_empresa,id_p;
    private string id_perfil;
    private string comentarios;
    private string examen;
    private string saludo,vendedor_nombre;
    private int sexo;
    private string sexo_cad,nom_vendedor;
    private int contador_fila=0;
    private int aux;
    private string FA,fecha_alta,nombre_empresa,fecha_naci,fecha_nacimiento;
    private string ret_nombre, ret_apaterno, ret_amaterno, ret_rfc, ret_razonsocial, ret_perfil, retornar_razonsocial, retornar_perfil,rcoment;
    private string id;
    private string nombre_pac;
    private string apaterno_pac;
    private string amaterno_pac;
    private string nombre_completo;
    private string no_folio;
    private string folio;
    private int edad_user;
    private int edad;
    private string fa;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.saludo = "hola";

        try
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!error.Equals(""))
            {
                Response.Redirect(error);
            }
            error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!Page.IsPostBack)
            {
                fa = String.IsNullOrEmpty(Request.QueryString["fecha_alta"]) ? "" : Request.QueryString["fecha_alta"].ToString();
                rfc = String.IsNullOrEmpty(Request.QueryString["rfc"]) ? "" : Request.QueryString["rfc"].ToString();
                id_empresa = String.IsNullOrEmpty(Request.QueryString["id_empresa"]) ? "" : Request.QueryString["id_empresa"].ToString();
                id_perfil = String.IsNullOrEmpty(Request.QueryString["id_perfil"]) ? "" : Request.QueryString["id_perfil"].ToString();
                comentarios = String.IsNullOrEmpty(Request.QueryString["imprimir"]) ? "" : Request.QueryString["imprimir"].ToString();

                System.Diagnostics.Debug.WriteLine("Fecha_Alta: " + fa.ToString());
                System.Diagnostics.Debug.WriteLine("RFC: " + rfc);
                System.Diagnostics.Debug.WriteLine("Id_empresa: " + id_empresa);
                System.Diagnostics.Debug.WriteLine("id_perfil: " + id_perfil);
                System.Diagnostics.Debug.WriteLine("imprimir: " + comentarios);
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + fa + "')", true);
                lbpaciente.Text = Retornar_Nombre_Paciente(rfc);
                lblRFC.Text = rfc;
                lbrazonsocial.Text = Retornar_RazonSocial(id_empresa);
                lbperfil.Text = Retornar_Perfil(id_perfil);
                labfechaalta.Text = fa;
                lblFecha.Text = Retornar_Fecha(rfc, id_empresa, id_perfil);
                folio = RetornarFolio(rfc, id_empresa, id_perfil, fa);
                lbfolio.Text = folio;
                lbempresa.Text = Retornar_Empresa(id_perfil);
                telp.Text = RetornarTelPaciente(rfc);
                // lbedad.Text = Retornar_Edad(rfc);
                
                edad_user = Devolver_Edad(rfc);
                lbsexo.Text = Devolver_Sexo(rfc);
                
                fnaci.Text = Retornar_Fecha_nacimiento(rfc);
                vendedor.Text = Retornar_Usernombre(Retornar_UserPerfil(id_perfil));
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + edad_user + "')", true);
                lbedad.Text = edad_user.ToString() +" años";


                Llenado_Labels(id_perfil);
            }

            }
        catch (Exception ex)
        {
        }

    }
    
    protected void Llenado_Labels(string id_per)
    {
        this.saludo = "";
        string html = "";
    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
    {
            using (SqlCommand cmd = new SqlCommand("select TPCE.NOMBRE_EXAMEN as EXAMEN from TU_PER_CAT_DETALLEPERFIL TPCDP JOIN TU_PER_CAT_EXAMEN TPCE ON TPCDP.ID_EXAMEN=TPCE.ID_EXAMEN where id_perfil= '" + id_per + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                lbexamen.Text = "<br>EXAMENES MEDICOS";
                html += "<table border='0' style='width:870px' cellpadding='0' cellspacing='0'>";
                
                while (dr.Read())
                {
                    if (this.contador_fila == 0) {
                        html += "<tr>";
                    }
                    if (dr["EXAMEN"].ToString() == "EX_MEDICO")
                    {
                        html += "<td align='center'  style='width:25%'>";
                        html += "<table border='1' style='width:100%' cellpadding='0' cellspacing='0'>";
                        html += "<tr>";
                        html += "<td align='center' bgcolor='Teal' style='width: 25%'><b><font face='arial' SIZE=2>" + "<a href='../../Examenes/ExamenGral.aspx?Id_Persona=" + this.folio+ "&idModuloOrigen=1'>" + dr["EXAMEN"].ToString() + "</a>" + "</font></b></td>";
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td align='center'  style='width: 25%' ><input type='checkbox' checked disabled ></td>";
                        html += "</tr>";
                        html += "</table>";
                        html += "</td>";
                    }
                    else if (dr["EXAMEN"].ToString() == "ESPIROMETRIA")
                    {
                        html += "<td align='center'  style='width:25%'>";
                        html += "<table border='1' style='width:100%' cellpadding='0' cellspacing='0'>";
                        html += "<tr>";
                        html += "<td align='center' bgcolor='Teal' style='width: 25%'><b><font face='arial' SIZE=2>" + "<a href='../../Examenes/Espirometria.aspx?Id_Persona=" + this.folio + "&idModuloOrigen=1'>" + dr["EXAMEN"].ToString() + "</a>" + "</font></b></td>";
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td align='center'  style='width: 25%' ><input type='checkbox' checked disabled ></td>";
                        html += "</tr>";
                        html += "</table>";
                        html += "</td>";
                    }
                    else if (dr["EXAMEN"].ToString() == "AUDIOMETRIA")
                    {
                        html += "<td align='center'  style='width:25%'>";
                        html += "<table border='1' style='width:100%' cellpadding='0' cellspacing='0'>";
                        html += "<tr>";
                        html += "<td align='center' bgcolor='Teal' style='width: 25%'><b><font face='arial' SIZE=2>" + "<a href='../../Examenes/Audiometria.aspx?Id_Persona=" + this.folio + "&idModuloOrigen=1'>" + dr["EXAMEN"].ToString() + "</a>" + "</font></b></td>";
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td align='center'  style='width: 25%' ><input type='checkbox' checked disabled ></td>";
                        html += "</tr>";
                        html += "</table>";
                        html += "</td>";
                    }
                    else
                    {
                        html += "<td align='center'  style='width:25%'>";
                        html += "<table border='1' style='width:100%' cellpadding='0' cellspacing='0'>";
                        html += "<tr>";
                        html += "<td align='center' bgcolor='Teal' style='width: 25%'><b><font face='arial' SIZE=2>" + dr["EXAMEN"].ToString() + "</font></b></td>";
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td align='center'  style='width: 25%' ><input type='checkbox' checked disabled ></td>";
                        html += "</tr>";
                        html += "</table>";
                        html += "</td>";
                    }
                        this.contador_fila++;
                    if (this.contador_fila == 4)
                    {
                        html += "</tr><br>";
                        this.contador_fila=0;
                    }
                   
                }
                html += "</tr>";
                html += "</table>";
            }
    }
        html += "<br><br>";
        if (comentarios == "1")
        {
            lbcoment.Text = "Comentarios: "+Comentarios(rfc);
        }
       
        html += "<br><br><br><br><br><br>";
        html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;________________________________";
        html += "<br>";
        html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Conforme Acuerdo Privacidad";

        Label1.Text = html;
    }//llenado de labels



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
    }//FIN RETORNAR PERFIL

    protected string Retornar_RazonSocial(string id_empresa)
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

    protected string Retornar_Fecha_nacimiento(string RFC_NAC)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT CONVERT (char(10), FECHA_NACIMIENTO, 103) as FECHA_NACIMIENTO FROM TU_PER_REG_PACIENTE where RFC= '" + RFC_NAC + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.fecha_naci = dr["FECHA_NACIMIENTO"].ToString();
                }
                con.Close();
                return fecha_naci;
            }
        }
    }//FIN RETORNAR FECHA DE NACIMIENTO


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

    protected string Retornar_Fecha(string rfc, string id_empresa, string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT CONVERT (char(10), FECHA_ALTA, 103) as FECHA_ALTA FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL where RFC= '" + rfc + "' AND ID_EMP= '" + id_empresa + "' AND ID_PER= '" + id_perfil + "'", con))
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
    }//FIN RETORNAR FECHA

    protected string Retornar_FechaTime(string rfc, string id_empresa, string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT FECHA_ALTA FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL where RFC= '" + rfc + "' AND ID_EMP= '" + id_empresa + "' AND ID_PER= '" + id_perfil + "'", con))
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
    }//FIN RETORNAR FECHA
    protected string RetornarFolio(string rfc, string id_empresa, string id_perfil, string FechaAlta)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT FOLIO FROM TU_PER_CAT_PAPELETA where RFC= '" + rfc + "' AND ID_EMPRESA= '" + id_empresa + "' AND ID_PERFIL= '" + id_perfil + "' AND FECHA_ALTA = '"+FechaAlta+"'", con))
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

    protected string Retornar_Empresa(string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select EMPRESA2 from TU_PER_CAT_PERFILES where ID_PERFIL='" + id_perfil + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.nombre_empresa = dr["EMPRESA2"].ToString();
                }
                con.Close();
                return this.nombre_empresa;
            }
        }
    }//FIN RETORNAR NOMBRE EMPRESA


    

   /* protected int Devolver_Edad(string rfc_user)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select Edad from TU_PER_REG_PACIENTE where RFC='" + rfc_user + "'"))
            {
               
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
              
                while (dr.Read())
                {
                    this.edad = 2;
                }
                con.Close();
               
            }
        }
        
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "ed" + "')", true);
        return this.edad;
    }//FIN RETORNAR NOMBRE EMPRESA*/

    protected int Devolver_Edad(string rfc_user)
    {
        this.edad = 0;
        // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "ENTRE" + "')", true);
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
         {
             using (SqlCommand cmd = new SqlCommand("select Edad from TU_PER_REG_PACIENTE where RFC='" + rfc_user + "'", con))
             {
                 con.Open();
                 SqlDataReader dr = cmd.ExecuteReader();
                 while (dr.Read())
                 {
                    this.edad = Convert.ToInt32(dr["Edad"].ToString());
                  //this.edad = 89;
                }
            }
                 con.Close();
             }
         
        
        return this.edad;
    }//fin de validar examen


    protected string Comentarios(string rfc)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Comentarios from TU_PER_REG_PACIENTE where RFC='" + rfc + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.rcoment = dr["Comentarios"].ToString();
                }
                con.Close();
                return this.rcoment;
            }
        }
    }//FIN RETORNAR PERFIL
    protected string Devolver_Sexo(string rfc_user)
    {
        this.sexo = 0;
        this.sexo_cad = "";
        // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "ENTRE" + "')", true);
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select sexo from TU_PER_REG_PACIENTE where RFC='" + rfc_user + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.sexo = Convert.ToInt32(dr["sexo"].ToString());
                    //this.edad = 89;
                }
            }
            con.Close();
        }

        if (sexo == 1)
        {
            sexo_cad = "Femenino";
        }
        else if (sexo == 2)
        {
            sexo_cad = "Masculino";
        }
            return this.sexo_cad;
    }//fin de validar examen


    protected void regresar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AltaPaciente.aspx");
    }



    protected string Retornar_UserPerfil(string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select ID_ASESOR from TU_PER_CAT_PERFILES where ID_PERFIL='"+id_perfil+"'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.id_p = dr["ID_ASESOR"].ToString();
                }
                con.Close();
                return this.id_p;
            }
        }
    }//FIN
    protected string Retornar_Usernombre(string id_vendedor)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select C3 from KDUV where C2='" + id_vendedor + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.vendedor_nombre = dr["C3"].ToString();
                }
                con.Close();
                return this.vendedor_nombre;
            }
        }
    }//FIN RETORNAR RAZON SOCIAL

    protected string RetornarTelPaciente(string RFCP)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select Telefono from TU_PER_REG_PACIENTE where RFC='" + RFCP + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.RFCPAC = dr["Telefono"].ToString();
                }
                con.Close();
                return this.RFCPAC;
            }
        }
    }//FIN RETORNAR RAZON SOCIAL
}