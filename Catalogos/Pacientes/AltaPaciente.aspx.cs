using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalogos_Pacientes_AltaPaciente : System.Web.UI.Page
{

    private static int NUMFUNCION = 12;
    private int contador_fila = 0;
    private string rfc;
    private string telefono;
    private string ret_nombre, ret_apaterno, ret_amaterno, ret_rfc, ret_razonsocial, ret_perfil, retornar_razonsocial, retornar_perfil;
    private string nombre_pac;
    private string apaterno_pac;
    private string amaterno_pac;
    private string nombre_completo;
    private string fecha_alta_text, nombre_empresa;
    private int ret_check_rfc = 0;
    private string edad;
    private string comentarios;
    private string listcomentarios;
    private int edad_usuario;
    private string sexo;
    private string plaza;
    private string anio;
    private string mes;
    private string dia;
    private string fecha_nacimiento_act;
    private string per_sp;
    private int ret_valper, ret_valex;
    private string id_sinper;
    string RFCalta;
    string CadenaRFC;
    string primerasdos;
    string art;
    string nombresinmj;
    string apaternosart;
    string amaternosart;
    string CambioPalIncon;
    string rem;
    int b;
    private int contador = 0;
    DateTime falta;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!error.Equals(""))
            {
                Response.Redirect(error);
            }
            error = Utilis.validaPermisos(Session, NUMFUNCION);
            //string fecha = DateTime.Now.ToShortDateString();
            //falta = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);
            div_visualizar.Visible = false;
            div_sinperfil.Visible = false;
            plaza = this.Session["ubicacion"].ToString();
            SinPerfil2();

            do
            {
                id_sinper = GenerarIdSinPerfil();
            } while (Validar_IdPerfil(id_sinper) != 0);
            if (!IsPostBack)
            {
                IniciarLllenadoDropDown();

               
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void IniciarLllenadoDropDown()
    {
        empresa.DataSource = Consultar("SELECT * FROM TU_CG_CLIENTES");
        empresa.DataTextField = "NOMBRE";
        empresa.DataValueField = "ID_CTE";
        empresa.DataBind();
        empresa.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        perfil.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
    }
    public DataSet Consultar(String strSQL)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KEPLER"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }



    public DataSet Consultar2(String strSQL)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }

    private string nombre, apaterno, amaterno, fnacimiento, rfcalta, id_empresa, id_perfil;
    private DateTime f_n, f_a;
    protected void BtnGuardar(object sender, EventArgs e)
    {   
        falta = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);
        var z = falta.ToString("yyyy-MM-dd H:mm:ss.fff");
        this.sexo = "";
        this.rfcalta = txtrfc.Text.Trim();
        this.nombre = txtnombre.Text.Trim();
        this.apaterno = txtapaterno.Text.Trim();
        this.amaterno = txtmaterno.Text.Trim();
        this.telefono = txtTelefono.Text.Trim();
        this.sexo = listgenero.Text.Trim();

        DateTime fe_n = Convert.ToDateTime(fnac.Text);
        var FechaNacimiento = fe_n.ToString("yyyy-MM-dd");

        // this.fecha_alta_text = fecha_alta.Text.Trim();
        // this.f_a = Convert.ToDateTime(fecha_alta.Text.Trim());

        this.id_empresa = empresa.Text.Trim();
        this.id_perfil = perfil.Text.Trim();

        this.comentarios = txtcomentarios.Text.Trim();
        this.listcomentarios = DropDownListComentarios.Text.Trim();

        this.fecha_nacimiento_act = FechaNacimiento;
        this.f_n= Convert.ToDateTime(fecha_nacimiento_act);
        DateTime nac = DateTime.Parse(fecha_nacimiento_act);
        DateTime act = System.DateTime.Today;
        edad_usuario = CalcularEdad(nac, act);

        if (Checkrfc(rfcalta) == 1)
        {
            CamposVacios();
            lblTitle.Text = "AMI";
            lblModalBody.Text = "EL RFC " + this.rfcalta.ToUpper() + " YA SE ENCUENTRA DADO DE ALTA!!!";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        }
        else
        {
            if (perfil.Text.Trim() == "1")
            {
                int can_selec = Validar_checkbox();
                if (can_selec != 0)
                {
                    //INSERTAMOS EL REGISTRO DEL PACIENTE
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                    {
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_REG_PACIENTE (RFC,Nombre,Apaterno,Amaterno,Fecha_Nacimiento,Telefono,Edad,Comentarios,Sexo)VALUES(@RFC,@Nombre,@Apaterno,@Amaterno,@Fecha_Nacimiento,@Telefono,@Edad,@Comentarios,@Sexo);", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@RFC", this.rfcalta.ToUpper());
                            cmd.Parameters.AddWithValue("@Nombre", this.nombre.ToUpper());
                            cmd.Parameters.AddWithValue("@Apaterno", this.apaterno.ToUpper());
                            cmd.Parameters.AddWithValue("@Amaterno", this.amaterno.ToUpper());
                            cmd.Parameters.AddWithValue("@Fecha_Nacimiento", FechaNacimiento);
                            cmd.Parameters.AddWithValue("@Telefono", this.telefono);
                            cmd.Parameters.AddWithValue("@Edad", this.edad_usuario);
                            cmd.Parameters.AddWithValue("@Comentarios", this.comentarios.ToUpper());
                            cmd.Parameters.AddWithValue("@Sexo", this.sexo);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    //entramos por que se selecciono al menos 1 examen
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
                                    cmd.Parameters.AddWithValue("id_perfil", id_sinper);
                                    int i = cmd.ExecuteNonQuery();

                                    con.Close();
                                }
                            }
                        }
                    }

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                    {
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_CAT_PERFILES (PERF_DESCRIPCION, FECHA_ALTA, CD_ESTATUS,ID_ASESOR,CONTACTO,TIEMPO_ENTREGA_ELECT,TIEMPO_ENTREGA_FISICO,GENERO,PUESTO_PACIENTE,ENTREGA_DE_EXP,TIPO_EXAMEN,ID_EMPRESA,EMPRESA2,PROYECTO,ID_PERFIL,EMAIL,EMAIL2,EMAIL3,TELEFONO,EXTENSION,TIPO_PERFIL,FORMATO_REPORTE,COMENTARIOS)VALUES(@PERF_DESCRIPCION, @FECHA_ALTA, @CD_ESTATUS, @ID_ASESOR, @CONTACTO, @TIEMPO_ENTREGA_ELECT, @TIEMPO_ENTREGA_FISICO, @GENERO, @PUESTO_PACIENTE, @ENTREGA_DE_EXP, @TIPO_EXAMEN, @ID_EMPRESA, @EMPRESA2, @PROYECTO,@ID_PERFIL,@EMAIL,@EMAIL2,@EMAIL3,@TELEFONO,@EXTENSION,@TIPO_PERFIL,@FORMATO_REPORTE,@COMENTARIOS);", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@PERF_DESCRIPCION", "SIN PERFIL");
                            cmd.Parameters.AddWithValue("@FECHA_ALTA", z);
                            cmd.Parameters.AddWithValue("@CD_ESTATUS", 1);
                            cmd.Parameters.AddWithValue("@ID_ASESOR", 99);
                            cmd.Parameters.AddWithValue("@CONTACTO", System.DBNull.Value);
                            //cmd.Parameters.AddWithValue("@EMAIL", this.email);
                            //cmd.Parameters.AddWithValue("@TELEFONO", this.telefono);
                            cmd.Parameters.AddWithValue("@TIEMPO_ENTREGA_ELECT", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@TIEMPO_ENTREGA_FISICO", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@GENERO", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@PUESTO_PACIENTE", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@ENTREGA_DE_EXP", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@TIPO_EXAMEN", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@ID_EMPRESA", this.id_empresa);
                            cmd.Parameters.AddWithValue("@EMPRESA2", "SIN PERFIL");
                            cmd.Parameters.AddWithValue("@PROYECTO", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@ID_PERFIL", this.id_sinper);

                            cmd.Parameters.AddWithValue("@EMAIL", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@EMAIL2", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@EMAIL3", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@TELEFONO", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@EXTENSION", System.DBNull.Value);

                            cmd.Parameters.AddWithValue("@TIPO_PERFIL", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@FORMATO_REPORTE", System.DBNull.Value);
                            cmd.Parameters.AddWithValue("@COMENTARIOS", System.DBNull.Value);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                    {
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_CAT_DETALLE_PACIENTE_PERFIL (RFC,ID_EMP,ID_PER,FECHA_ALTA)VALUES(@RFC,@ID_EMP,@ID_PER,@FECHA_ALTA);", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@RFC", this.rfcalta.ToUpper());
                            cmd.Parameters.AddWithValue("@ID_EMP", this.id_empresa);
                            cmd.Parameters.AddWithValue("@ID_PER", this.id_sinper);
                            cmd.Parameters.AddWithValue("@FECHA_ALTA", this.falta);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }


                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                    {
                        using (SqlCommand cmd = new SqlCommand("insert into TU_PER_CAT_PAPELETA(RFC,ID_EMPRESA,ID_PERFIL,FECHA_ALTA) values(@RFC,@ID_EMPRESA,@ID_PERFIL,@FECHA_ALTA)", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("RFC", this.rfcalta.ToUpper());
                            cmd.Parameters.AddWithValue("ID_EMPRESA", this.id_empresa);
                            cmd.Parameters.AddWithValue("ID_PERFIL", this.id_sinper);
                            cmd.Parameters.AddWithValue("@FECHA_ALTA", this.falta);
                            int i = cmd.ExecuteNonQuery();

                            con.Close();
                        }
                    }
                    Response.Redirect("caida_papeleta.aspx?rfc=" + this.rfcalta.ToUpper() + "&id_empresa=" + this.id_empresa + "&id_perfil=" + this.id_sinper + "&imprimir=" + this.listcomentarios + "&fecha_alta=" + z);
                    lblTitle.Text = "ok";
                    lblModalBody.Text = "Alta exitosa";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                }
                else
                {
                    lblTitle.Text = "ERROR";
                    lblModalBody.Text = "DEBES SELECCIONAR ALMENOS 1 EXAMEN PARA DAR DE ALTA EL PERFILnm";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                }
            }
            {
                //entramos por que se selecciono algun perfil de la lista
                //INSERTAMOS EL REGISTRO DEL PACIENTE
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_REG_PACIENTE (RFC,Nombre,Apaterno,Amaterno,Fecha_Nacimiento,Telefono,Edad,Comentarios,Sexo)VALUES(@RFC,@Nombre,@Apaterno,@Amaterno,@Fecha_Nacimiento,@Telefono,@Edad,@Comentarios,@Sexo);", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@RFC", this.rfcalta.ToUpper());
                        cmd.Parameters.AddWithValue("@Nombre", this.nombre.ToUpper());
                        cmd.Parameters.AddWithValue("@Apaterno", this.apaterno.ToUpper());
                        cmd.Parameters.AddWithValue("@Amaterno", this.amaterno.ToUpper());
                        cmd.Parameters.AddWithValue("@Fecha_Nacimiento", FechaNacimiento);
                        cmd.Parameters.AddWithValue("@Telefono", this.telefono);
                        cmd.Parameters.AddWithValue("@Edad", this.edad_usuario);
                        cmd.Parameters.AddWithValue("@Comentarios", this.comentarios.ToUpper());
                        cmd.Parameters.AddWithValue("@Sexo", this.sexo);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_CAT_DETALLE_PACIENTE_PERFIL (RFC,ID_EMP,ID_PER,FECHA_ALTA)VALUES(@RFC,@ID_EMP,@ID_PER,@FECHA_ALTA);", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@RFC", this.rfcalta.ToUpper());
                        cmd.Parameters.AddWithValue("@ID_EMP", this.id_empresa);
                        cmd.Parameters.AddWithValue("@ID_PER", this.id_perfil);
                        cmd.Parameters.AddWithValue("@FECHA_ALTA", this.falta);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }


                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("insert into TU_PER_CAT_PAPELETA(RFC,ID_EMPRESA,ID_PERFIL,FECHA_ALTA) values(@RFC,@ID_EMPRESA,@ID_PERFIL,@FECHA_ALTA)", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("RFC", this.rfcalta.ToUpper());
                        cmd.Parameters.AddWithValue("ID_EMPRESA", this.id_empresa);
                        cmd.Parameters.AddWithValue("ID_PERFIL", this.id_perfil);
                        cmd.Parameters.AddWithValue("@FECHA_ALTA", this.falta);
                        int i = cmd.ExecuteNonQuery();

                        con.Close();
                    }
                }
                Response.Redirect("caida_papeleta.aspx?rfc=" + this.rfcalta.ToUpper() + "&id_empresa=" + this.id_empresa + "&id_perfil=" + this.id_perfil + "&imprimir=" + this.listcomentarios + "&fecha_alta=" + z);
            }
        }

    }//fin de boton guardar

    protected int Validar_IdPerfil(string id_per)
    {
        this.ret_valper = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_PERFILES WHERE ID_PERFIL='" + id_per + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.ret_valper = 1;
                }
                con.Close();

            }
        }
        return this.ret_valper;
    }
    protected void CamposVacios()
    {

        txtnombre.Text = "";
        txtapaterno.Text = "";
        txtmaterno.Text = "";
        txtrfc.Text = "";
        empresa.SelectedIndex = -1;
        perfil.SelectedIndex = -1;
        txtTelefono.Text = "";
        prev.Text = "";
        listgenero.SelectedIndex = -1;
        fnac.Text = "";
    }
    protected void Empresaseleccionada(object sender, EventArgs e)
    {
        string empresa_id = empresa.SelectedValue;
        perfil.DataSource = Consultar2("select * FROM TU_PER_CAT_PERFILES WHERE ID_EMPRESA='" + empresa_id + "' and CD_ESTATUS = "+ 1 + "and PERF_DESCRIPCION NOT LIKE '%SIN PERFIL%'");
        perfil.DataTextField = "PERF_DESCRIPCION";
        perfil.DataValueField = "ID_PERFIL";
        perfil.DataBind();
        perfil.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        perfil.Items.Insert(1, new ListItem("SIN PERFIL", "1"));
    }
    protected void SinPerfil(object sender, EventArgs e)
    {
        per_sp = perfil.SelectedValue;
        if (per_sp=="1") {
            div_sinperfil.Visible = true;
            Examenes();

        }
    }
    protected void SinPerfil2()
    {
        per_sp = perfil.SelectedValue;
        if (per_sp == "1")
        {
            div_sinperfil.Visible = true;
            //Examenes();

        }
    }
    public string GenerarIdSinPerfil()
    {
        int longitud = 5;
        string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        res.Append("SIN");
        while (0 < longitud--)
        {
            res.Append(caracteres[rnd.Next(caracteres.Length)]);
        }

        return res.ToString();
    }
    public void Examenes()
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
        return contador;
    }//fin de validar_checkbox

    protected int Checkrfc(string check_rfc)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select * from TU_PER_REG_PACIENTE where RFC ='" + check_rfc + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.ret_check_rfc = 1;
                }
                con.Close();
            }
        }
        return ret_check_rfc;
    }//FIN RETORNAR PERFIL

    protected void Btnprevia(object sender, EventArgs e)
    {
        this.apaterno = txtapaterno.Text.Trim();
        this.amaterno = txtmaterno.Text.Trim();
        this.nombre = txtnombre.Text.Trim();

        //lblTitle.Text = "CORRECTO";
        //lblModalBody.Text = "RFC : " + RFCPaterno(this.apaterno)+RFCMaterno(this.amaterno)+ RFCNombre(this.nombre)+ Year(fnacimiento)+ Month(fnacimiento)+ Day(fnacimiento);
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        
         div_visualizar.Visible = true;
        this.rfcalta = txtrfc.Text.Trim();
        this.nombre = txtnombre.Text.Trim();
        this.apaterno = txtapaterno.Text.Trim();
        this.amaterno = txtmaterno.Text.Trim();
        this.id_empresa = empresa.Text.Trim();
        this.id_perfil = perfil.Text.Trim();

        DateTime fe_n = Convert.ToDateTime(fnac.Text);
        var FechaNacimiento = fe_n.ToString("yyyy-MM-dd");

        this.fecha_nacimiento_act = FechaNacimiento;
        DateTime nac = DateTime.Parse(fecha_nacimiento_act);
        DateTime act = System.DateTime.Today;
        int edad = CalcularEdad(nac, act);

        //prev.Text = "VISTA PREVIA";
        lbpaciente.Text = this.nombre.ToUpper() + " " + this.apaterno.ToUpper() + " " + this.amaterno.ToUpper();
        lblRFC.Text = this.rfcalta.ToUpper();
        lbrazonsocial.Text = Retornar_RazonSocial(id_empresa);
        lbperfil.Text = Retornar_Perfil(id_perfil);
        lblFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
        lbfolio.Text = "   ¿ ?";
        lbempresa.Text = Retornar_Empresa(id_perfil);
        labfechaalta.Text = DateTime.Now.ToString("dd/MM/yyyy");
        lbedad.Text = edad.ToString()+" Años Cumplidos";
        Llenado_Labels(id_perfil);
       
    }//fin de vista previa

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

   


    protected void Llenado_Labels(string id_per)
    {
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
                    if (this.contador_fila == 0)
                    {
                        html += "<tr>";
                    }
                    html += "<td align='center'  style='width:25%'>";
                    html += "<table border='1' style='width:100%' cellpadding='0' cellspacing='0'>";
                    html += "<tr>";
                    html += "<td align='center' bgcolor='Teal' style='width: 25%'><b><font face='arial' SIZE=2 color='white'>" + dr["EXAMEN"].ToString() + "</font></b></td>";
                    html += "</tr>";
                    html += "<tr>";
                    html += "<td align='center'  style='width: 25%' ><input type='checkbox' checked disabled ></td>";
                    html += "</tr>";
                    html += "</table>";
                    html += "</td>";
                    this.contador_fila++;
                    if (this.contador_fila == 4)
                    {
                        html += "</tr><br>";
                        this.contador_fila = 0;
                    }

                }
                html += "</tr>";
                html += "</table>";
            }
        }

        html += "<br><br><br>";
        html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;________________________________";
        html += "<br>";
        html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Conforme Acuerdo Privacidad";

        Label1.Text = html;
    }//llenado de labels



    protected string Retornar_Edad(string fecha_nacimiento)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select DATEDIFF(day, '"+ fecha_nacimiento + "', GETDATE()) / 365 as edad", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.edad = dr["edad"].ToString();
                }
                con.Close();
               
            }
        }
        return edad;
    }//FIN RETORNAR NOMBRE EMPRESA



    protected int CalcularEdad(DateTime birthDate, DateTime now)
    {
        int age = now.Year - birthDate.Year;
        if (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day))
            age--;
        return age;
    }
    protected void RFC(object sender, EventArgs e)
    {
        string CadenaRFC = "";
        this.sexo = "";
        this.sexo = listgenero.Text.Trim();

        DateTime fe_n = Convert.ToDateTime(fnac.Text);
        var FechaNacimiento = fe_n.ToString("yyyy-MM-dd");

        this.fecha_nacimiento_act = FechaNacimiento;

        if (txtapaterno.Text.Trim().Length == 0 || txtmaterno.Text.Trim().Length == 0 || txtnombre.Text.Trim().Length == 0 || fecha_nacimiento_act.Trim().Length == 0 || sexo == "0")
        {
            txtrfc.Text = "";
            
        }
        else
        {
            if (sexo == "1")
            {
                CadenaRFC += GeneraRFC() + "M";
            }
            if (sexo == "2")
            {
                CadenaRFC += GeneraRFC() + "H";
            }

            if (plaza == "1")
            {
                CadenaRFC += "Q" + "1";
            }
            if (plaza == "2")
            {
                CadenaRFC += "C" + "1";
            }
            if (plaza == "3")
            {
                CadenaRFC += "M" + "1";
            }
            if (plaza == "4")
            {
                CadenaRFC += "U" + "1";
            }
            txtrfc.Text = CadenaRFC;
        }
    }
    /************************************************************CODIGO GENERADOR DE RFC************************************************************************************/
    protected string GeneraRFC()
    {
        apaternosart = Validararticulos(txtapaterno.Text);
        apaternosart = apaternosart.Replace(" ", "");
        amaternosart = Validararticulos(txtmaterno.Text);
        amaternosart = amaternosart.Replace(" ", "");

        DateTime fe_n = Convert.ToDateTime(fnac.Text);
        var FechaNacimiento = fe_n.ToString("yyyy-MM-dd");

        this.fecha_nacimiento_act = FechaNacimiento;
        System.Diagnostics.Debug.WriteLine("x: " + fecha_nacimiento_act);
        System.Diagnostics.Debug.WriteLine("year: " + Year(fecha_nacimiento_act));
        System.Diagnostics.Debug.WriteLine("month: " + Month(fecha_nacimiento_act));
        System.Diagnostics.Debug.WriteLine("day: " + Day(fecha_nacimiento_act));
        if (apaternosart.Length <= 2)
        {
            string primerapaterno = apaternosart.Substring(0, 1);
            string primeramaterno = amaternosart.Substring(0, 1);

            if (ValidarMJ(txtnombre.Text).Length > 0)
            {
                string primeranombre = ValidarMJ(txtnombre.Text).Substring(0, 1);
                string segundanombre = ValidarMJ(txtnombre.Text).Substring(1, 1);
                CadenaRFC += primerapaterno + primeramaterno + primeranombre + segundanombre + Year(fecha_nacimiento_act) + Month(fecha_nacimiento_act) + Day(fecha_nacimiento_act);
               
                rem = ValidaExpresionesInconvenientes(CadenaRFC);
                //txtrfc.Text = rem;
                return rem;
            }
            else
            {
                CadenaRFC += RFCPaterno(apaternosart) + RFCMaterno(amaternosart) + RFCNombre(txtnombre.Text) + Year(fecha_nacimiento_act) + Month(fecha_nacimiento_act) + Day(fecha_nacimiento_act);
                rem = ValidaExpresionesInconvenientes(CadenaRFC);
                //txtrfc.Text = rem;
                return rem;
            }
        }
        else
        {
            if (ValidarMJ(txtnombre.Text).Length > 0)
            {
                CadenaRFC += RFCPaterno(apaternosart) + RFCMaterno(amaternosart) + RFCNombre(ValidarMJ(txtnombre.Text)) + Year(fecha_nacimiento_act) + Month(fecha_nacimiento_act) + Day(fecha_nacimiento_act);
                rem = ValidaExpresionesInconvenientes(CadenaRFC);
                //txtrfc.Text = rem;
                return rem;
            }
            else
            {
                CadenaRFC += RFCPaterno(apaternosart) + RFCMaterno(amaternosart) + RFCNombre(txtnombre.Text) + Year(fecha_nacimiento_act) + Month(fecha_nacimiento_act) + Day(fecha_nacimiento_act);
                rem = ValidaExpresionesInconvenientes(CadenaRFC);
                //txtrfc.Text = rem;
                return rem;
            }
        }
    }//fin de GeneraRFC
    protected string RFCPaterno(string paterno)
    {
        //Validararticulos
        string primera = paterno.Substring(0, 1);
        primerasdos += primera;

        for (int i = 1; i < 100; i++)
        {
            string c = paterno.Substring(i, 1);
            if (c == "A" || c == "E" || c == "I" || c == "O" || c == "U" || c == "a" || c == "e" || c == "i" || c == "o" || c == "u")
            {
                primerasdos += c;
                i = 100;
            }
        }
        return primerasdos.ToUpper();
    }//FIN RETORNAR LAS 2 PRIMERAS LETRAS DEL APELLIDO PATERNO

    protected string RFCMaterno(string materno)
    {
        string primer = materno.Substring(0, 1);
        return primer.ToUpper();
    }//FIN RETORNAR LA PRIMER LETRA DEL APELLIDO MATERNO

    protected string RFCNombre(string nombre)
    {
        string primer = nombre.Substring(0, 1);
        return primer.ToUpper();
    }//FIN RETORNAR LA PRIMER LETRA DEL NOMBRE


    protected string Year(string fecha_nacimiento)
    {
        string anio = fecha_nacimiento.Substring(2, 2);
        return anio;
    }//FIN RETORNAR NOMBRE EMPRESA

    protected string Month(string fecha_nacimiento)
    {
        string mes = fecha_nacimiento.Substring(5, 2);
        return mes;
    }//FIN RETORNAR NOMBRE EMPRESA

    protected string Day(string fecha_nacimiento)
    {
        string dia = fecha_nacimiento.Substring(8, 2);
        return dia;
    }//FIN RETORNAR NOMBRE EMPRESA

    protected string Validararticulos(string paterno)
    {
        string errString = paterno;
        art = errString.Replace("y", null).Replace("del", null).Replace("las", null).Replace("de", null).Replace("la", null).Replace("los", null);

        return art.ToUpper().Trim();
    }//FIN validar

    protected string ValidarMJ(string nombre)
    {
        string errString = nombre;
        nombresinmj = errString.Replace("maria", null).Replace("jose", null).Replace("maría", null).Replace("josé", null);

        return nombresinmj.ToUpper().Trim();
    }//FIN de retornar string sin maria y jose

    protected string ValidaExpresionesInconvenientes(string rfc)
    {
        string cambiorfc = rfc;
        CambioPalIncon = cambiorfc.Replace("BUEI", "BUEX").
                                   Replace("BUEY", "BUEX").
                                   Replace("CACA", "CACX").
                                   Replace("CACO", "CACX").
                                   Replace("CAGA", "CAGX").
                                   Replace("CAGO", "CAGX").
                                   Replace("CAKA", "CAKX").
                                   Replace("COGE", "COGX").
                                   Replace("COJA", "COJX").
                                   Replace("COJE", "COJX").
                                   Replace("COJI", "COJX").
                                   Replace("COJO", "COJX").
                                   Replace("CULO", "CULX").
                                   Replace("FETO", "FETX").
                                   Replace("GUEY", "GUEX").
                                   Replace("JOTO", "JOTX").
                                   Replace("KACA", "KACX").
                                   Replace("KACO", "KACX").
                                   Replace("KOGE", "KOGX").
                                   Replace("KOJO", "KOJX").
                                   Replace("KAKA", "KAKX").
                                   Replace("KULO", "KULX").
                                   Replace("MAME", "MAMX").
                                   Replace("MAMO", "MAMX").
                                   Replace("MEAR", "MEAX").
                                   Replace("MEON", "MEOX").
                                   Replace("MION", "MIOX").
                                   Replace("MOCO", "MOCK").
                                   Replace("MULA", "MULX").
                                   Replace("PEDA", "PEDX").
                                   Replace("PEDO", "PEDX").
                                   Replace("PENE", "PENX").
                                   Replace("PUTA", "PUTX").
                                   Replace("PUTO", "PUTX").
                                   Replace("QULO", "QULX").
                                   Replace("RATA", "RATX").
                                   Replace("KAGA", "KAGX").
                                   Replace("KAGO", "KAGX").
                                   Replace("RUIN", "RUIX");

        return CambioPalIncon.ToUpper().Trim();
    }//FIN de retornar string sin maria y jose
     /***********************************************************************************************************************************************************************/



}