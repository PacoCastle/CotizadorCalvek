using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalogos_Perfiles_ModificaPerfiles : System.Web.UI.Page
{
    private static int NUMFUNCION = 6;

    private string v_asesor,v_fechaalta,v_cliente,v_contacto,v_email, v_email2, v_email3, v_telefono,v_extension,v_nombre,v_empresa,v_proyecto,v_tee,v_tef,v_eexpdte,v_tipoexamen,v_genero,v_estatus,v_puesto,v_tipoperfil,v_formatoreporte,v_comentarios;
    private string asesor,cliente,puesto, examenes,emails;

    private string examen,email,tel;
    protected void Page_Load(object sender, EventArgs e)
    {
      
            try
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!error.Equals(""))
            {
                Response.Redirect(error);

            }
            error = Utilis.validaPermisos(Session, NUMFUNCION); // Se valida que el usuario tiene el permiso para Seguimiento
        }
        catch (Exception ex)
        {
        }
    }

    protected void Mver(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string ID = btn.CommandArgument;
        int id = int.Parse(ID);
        string id_perfil = GridView1.Rows[id].Cells[0].Text;
        string con_email="";

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * from TU_PER_CAT_PERFILES where id_perfil='" + id_perfil + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.v_asesor = dr["ID_ASESOR"].ToString();
                    this.v_fechaalta = Retornar_Fecha(id_perfil);
                    this.v_cliente = dr["ID_EMPRESA"].ToString();
                    this.v_contacto = dr["CONTACTO"].ToString();
                    this.v_email = dr["EMAIL"].ToString();
                    this.v_email2 = dr["EMAIL2"].ToString();
                    this.v_email3 = dr["EMAIL3"].ToString();
                    this.v_telefono = dr["TELEFONO"].ToString();
                    this.v_extension = dr["EXTENSION"].ToString();
                    this.v_puesto = dr["PUESTO_PACIENTE"].ToString();
                    this.v_nombre = dr["PERF_DESCRIPCION"].ToString();
                    this.v_empresa = dr["EMPRESA2"].ToString();
                    this.v_proyecto = dr["PROYECTO"].ToString();
                    this.v_tee = dr["TIEMPO_ENTREGA_ELECT"].ToString();
                    this.v_tef = dr["TIEMPO_ENTREGA_FISICO"].ToString();
                    this.v_eexpdte = dr["ENTREGA_DE_EXP"].ToString();
                    this.v_tipoexamen = dr["TIPO_EXAMEN"].ToString();
                    this.v_genero = dr["GENERO"].ToString();
                    this.v_estatus = dr["CD_ESTATUS"].ToString();
                    this.v_tipoperfil = dr["TIPO_PERFIL"].ToString();
                    this.v_formatoreporte = dr["FORMATO_REPORTE"].ToString();
                    this.v_comentarios = dr["COMENTARIOS"].ToString();

                    con_email += "*" + this.v_email + "<br/>";
                    if (v_email2 != "")
                    {
                        con_email += "*" + this.v_email2 + "<br/>";
                    }
                    if (v_email3 != "")
                    {
                        con_email += "*" + this.v_email3;
                    }

                    labver_titulo.Text = "AMI";
                    labver_header.Text = this.v_empresa+"-"+this.v_nombre;

                    labver_asesor.Text = Retornar_asesor(this.v_asesor);


                    labver_fechaalta.Text = this.v_fechaalta;
                    labver_cliente.Text =Retornar_cliente(this.v_cliente);
                    labver_contacto.Text = this.v_contacto;

                    labver_email.Text = con_email;

                    if (this.v_extension == "")
                    {
                        labver_telefono.Text = this.v_telefono;
                    }
                    else
                    {
                        labver_telefono.Text = this.v_telefono+" EXT:"+this.v_extension;
                    }
                    labver_puesto.Text = this.v_puesto;
                    labver_nombreperfil.Text = this.v_nombre;
                    labver_empresa.Text = this.v_empresa;
                    labver_proyecto.Text = this.v_proyecto;
                    labver_teelectronica.Text = this.v_tee;
                    labver_tefisica.Text = this.v_tef;
                    labver_eexpediente.Text = this.v_eexpdte;
                    labver_tipoexamen.Text = this.v_tipoexamen;
                    labver_genero.Text = this.v_genero;
                    labver_freporte.Text = this.v_formatoreporte;
                    labver_tperfil.Text = this.v_tipoperfil;
                    if (this.v_estatus == "1") { labver_estatus.Text = "ACTIVO"; } else if (this.v_estatus == "2") { labver_estatus.Text = "INACTIVO"; }
                    if (this.v_comentarios == "")
                    {
                        lbcomentarios.Text = "NINGUNO";
                    }
                    else {
                        lbcomentarios.Text = this.v_comentarios;
                    }
                    labver_examenes.Text=Retornar_examen(id_perfil);

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "modal_ver();", true);
                }
                con.Close();
            }
        }
    }

    protected string Retornar_asesor(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select c3 from KDUV where c2=" + id, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.asesor = dr["C3"].ToString();
                }
                con.Close();
                return this.asesor;
            }
        }
    }

    string retfecha;
    protected string Retornar_Fecha(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select FECHA_ALTA from TU_PER_CAT_PERFILES where ID_PERFIL = '" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    retfecha = dr["FECHA_ALTA"].ToString();
                }
                con.Close();
            }
        }
        return retfecha;
    }

    protected string Retornar_cliente(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select NOMBRE from TU_CG_CLIENTES where ID_CTE='" + id +"'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.cliente = dr["NOMBRE"].ToString();
                }
                con.Close();
                return this.cliente;
            }
        }
    }


    protected string Retornar_puesto(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select desc_paciente from TU_PER_CAT_PUESTOPAC where PUESTO_PACIENTE='" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.puesto = dr["desc_paciente"].ToString();
                }
                con.Close();
                return this.puesto;
            }
        }
    }


    protected string Retornar_examen(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT EX.NOMBRE_EXAMEN as examen FROM TU_PER_CAT_DETALLEPERFIL DPERFIL JOIN TU_PER_CAT_EXAMEN EX ON DPERFIL.ID_EXAMEN=EX.ID_EXAMEN WHERE DPERFIL.ID_PERFIL= '" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.examen = dr["examen"].ToString();
                    this.examenes +="*"+ this.examen + "<br />";
                }
                con.Close();
                return this.examenes;
            }
        }
    }
    /**************************************************************************************************************************************************/

    protected string Retornar_Email(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT EMAIL FROM TU_PER_CAT_PERFILES_EMAIL WHERE ID_PERFIL= '" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.email = dr["EMAIL"].ToString();
                    this.emails += "*" + this.email + "<br />";
                }
                con.Close();
                return this.emails;
            }
        }
    }




    protected string Retornar_Telefono(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_PERFILES_TELEFONOS WHERE ID_PERFIL= '" + id + "'", con))
            {
                tel = "";
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.v_telefono = dr["TELEFONO"].ToString();
                    this.v_extension = dr["EXTENSION"].ToString();
                    if (this.v_extension == "0")
                    {
                        tel += this.v_telefono;
                    }
                    else {
                        tel += this.v_telefono + "   EXTENSION: " + this.v_extension; 
                    }
                }
                con.Close();
                return this.tel;
            }
        }
    }
    /**************************************************************************************************************************************************/

    protected void Meliminar(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string ID = btn.CommandArgument;
        int id = int.Parse(ID);
        string id_perfil = GridView1.Rows[id].Cells[0].Text;


        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM TU_PER_CAT_PERFILES WHERE ID_PERFIL=@ID", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@ID", id_perfil);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        Response.Redirect("Perfiles.aspx");
        // labeditar_titulo.Text = "AMI";
        //labeditar.Text = "EL PERFIL : "+id_perfil+" HA SIDO ELIMNADO CON EXITO";
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "modal_editar();", true);
    }

    }