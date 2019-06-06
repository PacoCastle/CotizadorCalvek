using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Data;

public partial class Catalogos_Perfiles_editar_perfil : System.Web.UI.Page
{
    private static int NUMFUNCION = 7;
    private string asesor;
    private DateTime  fecha;
    private string cliente;
    private string contacto;
    private string email, email2, email3;
    private string telefono, extension;
    private string nombre_perfil;
    private string empresa_perfil;
    private string proyecto_perfil;
    private string TE;
    private string TF;
    private string entrega_expediente;
    private string tipo_examen;
    private string genero;
    private string status, id,cliente_value,asesor_value,puesto_value;
    private string ret_id_cliente;
    private string status_comentarios;
    private int contador = 0;
    private int ret_valex;
    private int ret_valexamen;
    private string puesto;
    private string ret_id_puesto;
    private string ID_MOD;
    private string comentarios_bd;
    private string id_examen;
    private string nombre_examen_agregar,comentarios;
    private string listtipoperfil;
    private string listreporte;
    private int ex_medico, ex_audiometria, ex_espirometria, ex_compimetria, ex_ecg, ex_tox3, ex_tox5, ex_tox6, ex_perfilcardiaco, ex_exudadofaringeo,
                ex_glucosa, ex_qs4, ex_qs5, ex_qs6, ex_qs12, ex_qs27, ex_perfilhepatico, ex_biometria, ex_gruporh, ex_ego,
                ex_corpro, ex_reaccionfebriles, ex_perfillipidos, ex_pieorina, ex_piesangre, ex_alcoholsangre, ex_pesp, ex_hemoglobinagluco, ex_rxcolumna, ex_rxtorax,
                ex_consulta, ex_otros, id_asesor_bd,ID_PER;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            refreshdata();
            if (Request["id_perfil"] != null)
            {
                ID_MOD = Request["id_perfil"];

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("select CONVERT (char(10), FECHA_ALTA, 103) as FECHA_ALTA from TU_PER_CAT_PERFILES where ID_PERFIL = '" + ID_MOD + "'", con))
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            txtRechargeDate.Text = dr["FECHA_ALTA"].ToString();
                        }
                        con.Close();
                    }
                }
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("select * FROM TU_PER_CAT_PERFILES where ID_PERFIL='" + ID_MOD + "'", con))
                    {

                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            string val_c = Retornar_Value(dr["ID_EMPRESA"].ToString());
                            string val_a = Retornar_Value_ASESOR(dr["ID_ASESOR"].ToString());
                            //string val_p = Retornar_Value_PUESTO(dr["PUESTO_PACIENTE"].ToString());

                            int v_a = Int32.Parse(val_a);
                            int v_c = Int32.Parse(val_c);
                            //int v_p = Int32.Parse(val_p);

                            int id_e = Int32.Parse(dr["CD_ESTATUS"].ToString());


                            lstAsesor.SelectedIndex = v_a;

                            listcliente.SelectedIndex = v_c;
                            txtContacto.Text = dr["CONTACTO"].ToString();
                            txtEmail.Text = dr["EMAIL"].ToString();
                            txtemail2.Text = dr["EMAIL2"].ToString();
                            txtemail3.Text = dr["EMAIL3"].ToString();
                            txtTelefono.Text = dr["TELEFONO"].ToString();
                            txtextension.Text = dr["EXTENSION"].ToString();
                            txtpuesto.Text = dr["PUESTO_PACIENTE"].ToString();
                            txtNombrePerfil.Text = dr["PERF_DESCRIPCION"].ToString();
                            txtEmpresaPerfil.Text = dr["EMPRESA2"].ToString();
                            txtProyectoPerfil.Text = dr["PROYECTO"].ToString();
                            listaTEE.SelectedValue = dr["TIEMPO_ENTREGA_ELECT"].ToString();
                            txtTF.Text = dr["TIEMPO_ENTREGA_FISICO"].ToString();
                            listaformaentrega.SelectedValue = dr["ENTREGA_DE_EXP"].ToString();
                            txtTipoExamen.Text = dr["TIPO_EXAMEN"].ToString();
                            listgenero.SelectedValue = dr["GENERO"].ToString();
                            DropDownListEstatus.SelectedIndex = id_e;
                            listatipoperfil.SelectedValue = dr["TIPO_PERFIL"].ToString();
                            listformatoreporte.SelectedValue = dr["FORMATO_REPORTE"].ToString();
                            txtcomentarios.Text = dr["COMENTARIOS"].ToString();
                        }
                        con.Close();
                    }
                }//fin using

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("select id_examen from TU_PER_CAT_DETALLEPERFIL where id_perfil= '" + ID_MOD + "'", con))
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            foreach (RepeaterItem item in Repeater1.Items)
                            {
                                CheckBox checkBox = item.FindControl("chkbx") as CheckBox;
                                string id_ex = checkBox.Attributes["Value"];
                                if (id_ex == dr["id_examen"].ToString())
                                {
                                    checkBox.Checked = true;
                                }


                            }//fin foreach

                        }
                        con.Close();
                    }
                }

              

            }//fin de if request
        }
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


    public void refreshdata()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlDataAdapter cmd = new SqlDataAdapter("SELECT [ID_EXAMEN], [NOMBRE_EXAMEN] FROM [TU_PER_CAT_EXAMEN] ORDER BY NOMBRE_EXAMEN ASC", con))
            {
                con.Open();
                DataTable dt = new DataTable();
                cmd.Fill(dt);

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                con.Close();
            }
        }
    }
    protected void BtnActualizar(object sender, EventArgs e)
    {
         string id_per_act = Request["id_perfil"];
         this.asesor = lstAsesor.Text.Trim();
         this.fecha = Convert.ToDateTime(txtRechargeDate.Text.Trim());
         this.cliente = listcliente.Text.Trim();
         this.contacto = txtContacto.Text.Trim();
         this.email = txtEmail.Text.Trim();
         this.email2 = txtemail2.Text.Trim();
         this.email3 = txtemail3.Text.Trim();
         this.telefono = txtTelefono.Text.Trim();
         this.extension = txtextension.Text.Trim();
         this.nombre_perfil = txtNombrePerfil.Text.Trim();
         this.empresa_perfil = txtEmpresaPerfil.Text.Trim();
         this.proyecto_perfil = txtProyectoPerfil.Text.Trim();
         this.TE = listaTEE.Text.Trim();
         this.TF = txtTF.Text.Trim();
         this.entrega_expediente = listaformaentrega.Text.Trim();
         this.tipo_examen = txtTipoExamen.Text.Trim();
         this.genero = listgenero.Text.Trim();
         this.status = DropDownListEstatus.Text.Trim();
         this.puesto = txtpuesto.Text.Trim();
         this.listtipoperfil = listatipoperfil.Text.Trim();
         this.listreporte = listformatoreporte.Text.Trim();
         this.comentarios = txtcomentarios.Text.Trim();
             int can = Validar_checkbox();
             if (can != 0)
             {

           using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
               {
                   using (SqlCommand cmd = new SqlCommand("UPDATE TU_PER_CAT_PERFILES SET " +
                       "PERF_DESCRIPCION=@PERF_DESCRIPCION," +
                       "FECHA_ALTA=@FECHA_ALTA," +
                       "CD_ESTATUS=@CD_ESTATUS," +
                       "ID_ASESOR=@ID_ASESOR," +
                       "CONTACTO=@CONTACTO," +
                       "TIEMPO_ENTREGA_ELECT=@TIEMPO_ENTREGA_ELECT," +
                       "TIEMPO_ENTREGA_FISICO=@TIEMPO_ENTREGA_FISICO," +
                       "GENERO=@GENERO," +
                       "PUESTO_PACIENTE=@PUESTO_PACIENTE," +
                       "ENTREGA_DE_EXP=@ENTREGA_DE_EXP," +
                       "TIPO_EXAMEN=@TIPO_EXAMEN," +
                       "ID_EMPRESA=@ID_EMPRESA," +
                       "EMPRESA2=@EMPRESA2," +
                       "PROYECTO=@PROYECTO,"+
                       "EMAIL=@EMAIL," +
                       "EMAIL2=@EMAIL2," +
                       "EMAIL3=@EMAIL3," +
                       "TELEFONO=@TELEFONO," +
                       "EXTENSION=@EXTENSION," +
                       "TIPO_PERFIL=@TIPO_PERFIL," +
                       "FORMATO_REPORTE=@FORMATO_REPORTE," +
                        "COMENTARIOS=@COMENTARIOS" +
                       " WHERE ID_PERFIL=@Id", con))
                   {
                       //int id_per_act = Int32.Parse(Request["id_perfil"]);
                       con.Open();
                      
                       cmd.Parameters.AddWithValue("@PERF_DESCRIPCION", this.nombre_perfil);
                       cmd.Parameters.AddWithValue("@FECHA_ALTA", this.fecha);
                       cmd.Parameters.AddWithValue("@CD_ESTATUS", this.status);
                       cmd.Parameters.AddWithValue("@ID_ASESOR", this.asesor);
                       cmd.Parameters.AddWithValue("@CONTACTO", this.contacto);
                       cmd.Parameters.AddWithValue("@TIEMPO_ENTREGA_ELECT", this.TE);
                       cmd.Parameters.AddWithValue("@TIEMPO_ENTREGA_FISICO", this.TF);
                       cmd.Parameters.AddWithValue("@GENERO", this.genero);
                       cmd.Parameters.AddWithValue("@PUESTO_PACIENTE", this.puesto);
                       cmd.Parameters.AddWithValue("@ENTREGA_DE_EXP", this.entrega_expediente);
                       cmd.Parameters.AddWithValue("@TIPO_EXAMEN", this.tipo_examen);
                       cmd.Parameters.AddWithValue("@ID_EMPRESA", this.cliente);
                       cmd.Parameters.AddWithValue("@EMPRESA2", this.empresa_perfil);
                       cmd.Parameters.AddWithValue("@PROYECTO", this.proyecto_perfil);
                       cmd.Parameters.AddWithValue("@Id", id_per_act);
                       cmd.Parameters.AddWithValue("@EMAIL", this.email);
                       cmd.Parameters.AddWithValue("@EMAIL2", this.email2);
                       cmd.Parameters.AddWithValue("@EMAIL3", this.email3);
                       cmd.Parameters.AddWithValue("@TELEFONO", this.telefono);
                       cmd.Parameters.AddWithValue("@EXTENSION", this.extension);
                       cmd.Parameters.AddWithValue("@TIPO_PERFIL", this.listtipoperfil);
                       cmd.Parameters.AddWithValue("@FORMATO_REPORTE", this.listreporte);
                       cmd.Parameters.AddWithValue("@COMENTARIOS", this.comentarios);
                    int rows = cmd.ExecuteNonQuery();
                       con.Close();
                   }
               }



            foreach (RepeaterItem item in Repeater1.Items)
            {
                CheckBox checkBox = item.FindControl("chkbx") as CheckBox;
                if (checkBox.Checked)
                {
                    string id_ex = checkBox.Attributes["Value"];
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                    {
                        using (SqlCommand cmd = new SqlCommand("insert into TU_PER_CAT_DETALLEPERFIL(ID_EXAMEN,ID_PERFIL) values(@id_examen,@id_perfil)", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("id_examen", id_ex);
                            cmd.Parameters.AddWithValue("id_perfil", id_per_act);
                            int i = cmd.ExecuteNonQuery();

                            con.Close();
                        }
                    }
                }
            }

            Response.Redirect("Perfiles.aspx");
     }
     else
     {
         lblTitle.Text = "ERROR";
         lblModalBody.Text = "DEBES SELECCIONAR ALMENOS 1 EXAMEN PARA DAR DE ALTA EL PERFIL";
         ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
     }
     
    }//fin btnactualizar

    protected int Validar_checkbox()
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            CheckBox checkBox = item.FindControl("chkbx") as CheckBox;

            if (checkBox.Checked)
            {
                contador++;
            }
        }
        if (contador >= 1)
        {
            string id_per = Request["id_perfil"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM TU_PER_CAT_DETALLEPERFIL WHERE ID_PERFIL=@ID", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@ID", id_per);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        return contador;
    }//fin de validar_checkbox

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
    }

        protected string retornar_id_asesor(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select C2 from KDUV WHERE C3='" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.id = dr["C2"].ToString();
                }
                con.Close();
                return this.id;
            }
        }
    }

    protected string retornar_id_empresa(string nombre)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select id_cte from TU_CG_CLIENTES WHERE NOMBRE='" + nombre + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.ret_id_cliente = dr["id_cte"].ToString();
                }
                con.Close();
                return this.ret_id_cliente;
            }
        }
    }



    protected string retornar_id_puesto(string puesto)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT PUESTO_PACIENTE FROM TU_PER_CAT_PUESTOPAC WHERE DESC_PACIENTE='" + puesto + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.ret_id_puesto = dr["PUESTO_PACIENTE"].ToString();
                }
                con.Close();
                return this.ret_id_puesto;
            }
        }
    }

    protected void Test(string val) {
        lblTitle.Text = "CORRECTO";
        lblModalBody.Text = "SE HA DADO DE ALTA EL PERFIL"+val;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
    }


    protected string Retornar_Value(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT VALOR FROM VALOR_CTE WHERE ID_CTE='" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.cliente_value = dr["VALOR"].ToString();
                }
                con.Close();
                return this.cliente_value;
            }
        }
    }



    protected string Retornar_Value_ASESOR(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM VALOR_ASESOR WHERE C2='" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.asesor_value = dr["VALOR"].ToString();
                }
                con.Close();
                return this.asesor_value;
            }
        }
    }



    protected string Retornar_Value_PUESTO(string id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT VALOR FROM VALOR_PUESTO WHERE PUESTO_PACIENTE='" + id + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.puesto_value = dr["VALOR"].ToString();
                }
                con.Close();
                return this.puesto_value;
            }
        }
    }



    protected void Agregar_Examen(object sender, EventArgs e)
    {

        this.nombre_examen_agregar = txtagregar.Text.Trim();
        do
        {
            this.id_examen = GenerarIdexamen();
        } while (Validar_IdExamen(id_examen) != 0);

        if (Validar_Examen(nombre_examen_agregar) == 0)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_CAT_EXAMEN (ID_EXAMEN,NOMBRE_EXAMEN)VALUES(@ID_EXAMEN, @NOMBRE_EXAMEN);", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@ID_EXAMEN", this.id_examen);
                    cmd.Parameters.AddWithValue("@NOMBRE_EXAMEN", this.nombre_examen_agregar.ToUpper());
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            refreshdata();
            txtagregar.Text = "";

            lblTitle.Text = "ALTA EXAMEN";
            lblModalBody.Text = "SE HA DADO DE ALTA EL EXAMEN: " + this.nombre_examen_agregar.ToUpper();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        }
        else
        {
            lblTitle.Text = "ALTA EXAMEN";
            lblModalBody.Text = "NO SE HA PODIDO DAR DE ALTA EL EXAMEN: " + this.nombre_examen_agregar.ToUpper() + ". ESTE EXAMEN YA SE ENCUENTRA REGISTRADO. ";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        }
    }//fin de Agregar_Examen
    protected int Validar_IdExamen(string id_ex)
    {
        this.ret_valex = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_EXAMEN WHERE ID_EXAMEN='" + id_ex + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.ret_valex = 1;
                }
                con.Close();

            }
        }
        return this.ret_valex;
    }
    public string GenerarIdexamen()
    {
        int longitud = 4;
        string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        res.Append("EX");
        while (0 < longitud--)
        {
            res.Append(caracteres[rnd.Next(caracteres.Length)]);
        }

        return res.ToString();
    }
    protected int Validar_Examen(string ex)
    {
        this.ret_valexamen = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select nombre_examen from TU_PER_CAT_EXAMEN where NOMBRE_EXAMEN='" + ex + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.ret_valexamen = 1;
                }
                con.Close();
            }
        }
        return this.ret_valexamen;
    }//fin de validar examen
}