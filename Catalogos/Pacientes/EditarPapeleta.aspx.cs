using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalogos_Pacientes_EditarPapeleta : System.Web.UI.Page
{
    private static int NUMFUNCION = 14;
    private string sexo;
    private string fecha_nacimiento_act;
    private string plaza;
    string art;
    string nombresinmj;
    string apaternosart;
    string amaternosart;
    string CambioPalIncon;
    string rem;
    string CadenaRFC;
    string primerasdos;

    private string ret_falta;
    private string fa;
    private string rfc;
    private string id_empresa,id_empresaO;
    private string id_perfil,id_perfilO;
    private string folio;
    private string EstatusO;
    private string retCP;
    private DateTime retfn;
    private string retid_emp;
    private string retid_per;
    private string cliente_value;
    private int val;
    private string vendedor_nombre;
    private string id_p;
    private string rfcalta;
    private string fecha_de_alta;
    private string rfc_resp;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            plaza = this.Session["ubicacion"].ToString();
            if (!error.Equals(""))
            {
                Response.Redirect(error);
            }
            if (!Page.IsPostBack)
            {
                
                IniciarLllenadoDropDown();
                folio = String.IsNullOrEmpty(Request.QueryString["folio"]) ? "" : Request.QueryString["folio"].ToString();
                fa = String.IsNullOrEmpty(Request.QueryString["fecha_alta"]) ? "" : Request.QueryString["fecha_alta"].ToString();
                rfc = String.IsNullOrEmpty(Request.QueryString["rfc"]) ? "" : Request.QueryString["rfc"].ToString();
                id_empresa = String.IsNullOrEmpty(Request.QueryString["id_empresa"]) ? "" : Request.QueryString["id_empresa"].ToString();
                id_perfil = String.IsNullOrEmpty(Request.QueryString["id_perfil"]) ? "" : Request.QueryString["id_perfil"].ToString();
                
                string val_c = Retornar_Value(id_empresa);
                int val_p = RetornarConjuntoPerf(id_empresa, id_perfil);
                txtfolio.Text = folio;
                txtfecha.Text = fa;
                txtrfc.Text = rfc;
                txtnombre.Text = RetornarTPRP(RetornarCP(folio, "RFC"), "Nombre");
                txtapaterno.Text = RetornarTPRP(RetornarCP(folio, "RFC"), "Apaterno");
                txtmaterno.Text = RetornarTPRP(RetornarCP(folio, "RFC"), "Amaterno");
                fnac.Text = String.Format("{0:dd/MM/yyyy}", RetornarFN(RetornarCP(folio, "RFC")));
                listgenero.SelectedIndex = Convert.ToInt32(RetornarTPRP(RetornarCP(folio, "RFC"), "Sexo"));
                ListEstatus.SelectedValue = RetornarCP(folio, "ESTATUS");


                empresa.SelectedIndex = Int32.Parse(val_c);
                ValueList();
                perfil.SelectedIndex = val_p;

                txttelefono.Text = RetornarTPRP(RetornarCP(folio, "RFC"), "Telefono");
                txtvendedor.Text = Retornar_Usernombre(Retornar_UserPerfil(id_perfil));

                fecha_de_alta = String.Format("{0:yyyy-MM-dd HH:mm:ss}", fa); 
            }
         
            error = Utilis.validaPermisos(Session, NUMFUNCION); // Se valida que el usuario tiene el permiso para Seguimiento

        }
        catch (Exception ex)
        {

        }
    }

    protected void ValueList()
    {
        string empresa_id = empresa.SelectedValue;
        perfil.DataSource = Consultar2("select * FROM TU_PER_CAT_PERFILES WHERE ID_EMPRESA='" + empresa_id + "'");
        perfil.DataTextField = "PERF_DESCRIPCION";
        perfil.DataValueField = "ID_PERFIL";
        perfil.DataBind();
        perfil.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
    }
    protected void Empresaseleccionada(object sender, EventArgs e)
    {
        string empresa_id = empresa.SelectedValue;
        perfil.DataSource = Consultar2("select * FROM TU_PER_CAT_PERFILES WHERE ID_EMPRESA='" + empresa_id + "'");
        perfil.DataTextField = "PERF_DESCRIPCION";
        perfil.DataValueField = "ID_PERFIL";
        perfil.DataBind();
        perfil.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
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

    protected void RFC(object sender, EventArgs e)
    {
        string CadenaRFC = "";
        this.sexo = "";
        this.sexo = listgenero.Text.Trim();
        this.fecha_nacimiento_act = fnac.Text.Trim();

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



    /*******************************************************/
    protected string GeneraRFC()
    {
        apaternosart = Validararticulos(txtapaterno.Text);
        apaternosart = apaternosart.Replace(" ", "");
        amaternosart = Validararticulos(txtmaterno.Text);
        amaternosart = amaternosart.Replace(" ", "");
      
        this.fecha_nacimiento_act = fnac.Text.Trim();

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
        string anio = fecha_nacimiento.Substring(8, 2);
        return anio;
    }//FIN RETORNAR NOMBRE EMPRESA

    protected string Month(string fecha_nacimiento)
    {
        string mes = fecha_nacimiento.Substring(3, 2);
        return mes;
    }//FIN RETORNAR NOMBRE EMPRESA

    protected string Day(string fecha_nacimiento)
    {
        string dia = fecha_nacimiento.Substring(0, 2);
        return dia;
    }//FIN RETORNAR NOMBRE EMPRESA
     /**************************************************************************************************************************************************/
    protected void BtnEditar(object sender, EventArgs e)
    {
        CultureInfo provider = CultureInfo.InvariantCulture;

        rfcalta = txtrfc.Text.Trim();
        id_empresa = empresa.Text.Trim();
        id_perfil = perfil.Text.Trim();
        fa = String.IsNullOrEmpty(Request.QueryString["fecha_alta"]) ? "" : Request.QueryString["fecha_alta"].ToString();
        folio = String.IsNullOrEmpty(Request.QueryString["folio"]) ? "" : Request.QueryString["folio"].ToString();
        rfc = String.IsNullOrEmpty(Request.QueryString["rfc"]) ? "" : Request.QueryString["rfc"].ToString();
        id_empresaO = String.IsNullOrEmpty(Request.QueryString["id_empresa"]) ? "" : Request.QueryString["id_empresa"].ToString();
        id_perfilO = String.IsNullOrEmpty(Request.QueryString["id_perfil"]) ? "" : Request.QueryString["id_perfil"].ToString();
        fecha_de_alta = String.Format("{0:yyyy-MM-dd HH:mm:ss}", fa);
        sexo = listgenero.Text.Trim();
        DateTime fe_n = Convert.ToDateTime(fnac.Text);
        var z = fe_n.ToString("yyyy-MM-dd");
        EstatusO = ListEstatus.Text.Trim();


        lblTitle.Text = "CORRECTO";
         lblModalBody.Text = "RFC: "+rfcalta+" NOMBRE: "+ txtnombre.Text + " APATERNO: "+ txtapaterno.Text + " AMATERNO: "+ txtmaterno.Text+" FN: "+ z + " TELEFONO: "+txttelefono.Text+" Sexo: "+ sexo +" resp: "+ rfc;
         ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE TU_PER_REG_PACIENTE SET RFC=@RFC, Nombre=@NOMBRE, Apaterno=@APATERNO, Amaterno=@AMATERNO, Fecha_Nacimiento=@FECHA_NACIMIENTO, Telefono=@TELEFONO, Sexo=@SEXO WHERE RFC='"+rfc+"'", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@RFC", txtrfc.Text.ToUpper());
                cmd.Parameters.AddWithValue("@NOMBRE", txtnombre.Text.ToUpper());
                cmd.Parameters.AddWithValue("@APATERNO", txtapaterno.Text.ToUpper());
                cmd.Parameters.AddWithValue("@AMATERNO", txtmaterno.Text.ToUpper());
                cmd.Parameters.AddWithValue("@FECHA_NACIMIENTO", z);
                cmd.Parameters.AddWithValue("@TELEFONO", txttelefono.Text);
                cmd.Parameters.AddWithValue("@SEXO", listgenero.Text);
                int c = cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE TU_PER_CAT_DETALLE_PACIENTE_PERFIL SET RFC=@RFC,ID_EMP=@ID_EMP,ID_PER=@ID_PER WHERE RFC='"+rfc+"' AND ID_EMP = '"+id_empresaO+"' AND ID_PER = '"+id_perfilO+"' AND FECHA_ALTA=@FECHA_ALTA", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@RFC", this.rfcalta.ToUpper());
                cmd.Parameters.AddWithValue("@ID_EMP", this.id_empresa);
                cmd.Parameters.AddWithValue("@ID_PER", this.id_perfil);
                cmd.Parameters.AddWithValue("@FECHA_ALTA", this.fecha_de_alta);
                int a = cmd.ExecuteNonQuery();
                con.Close();
            }
        }


        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE TU_PER_CAT_PAPELETA SET RFC=@RFC,ID_EMPRESA=@ID_EMPRESA,ID_PERFIL=@ID_PERFIL,ESTATUS=@ESTATUS WHERE RFC = '"+rfc+"' AND ID_EMPRESA = '"+ id_empresaO +"' AND ID_PERFIL = '"+id_perfilO+"' AND FECHA_ALTA=@FECHA_ALTA AND FOLIO=@FOLIO", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("FOLIO", this.folio);
                cmd.Parameters.AddWithValue("RFC", this.rfcalta.ToUpper());
                cmd.Parameters.AddWithValue("ID_EMPRESA", this.id_empresa);
                cmd.Parameters.AddWithValue("ID_PERFIL", this.id_perfil);
                cmd.Parameters.AddWithValue("FECHA_ALTA", this.fecha_de_alta);
                cmd.Parameters.AddWithValue("ESTATUS", this.EstatusO);
                int b = cmd.ExecuteNonQuery();

                con.Close();
            }
        }
       // Response.Redirect("RegistroPacientes.aspx?");
        //Response.Redirect("caida_papeleta.aspx?rfc=" + rfcalta + "&id_empresa=" + id_empresa + "&id_perfil=" + id_perfil + "&fecha_alta=" + fecha_de_alta);


        lblTitle.Text = "CORRECTO";
        lblModalBody.Text = "SE HA ACTUALIZADO LA PAPELETA # " + this.folio;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        Response.Redirect("RegistroPacientes.aspx?");



        /*  Refreshdata();
          LINK_AGREGAR.Text = "";
          div_agregar.Visible = false;
          CamposVacios();*/

    }
    /***************************************************************************************************************************************************/
    protected string RetornarFA(string FOLIO)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_PAPELETA WHERE FOLIO=" + FOLIO , con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ret_falta = dr["FECHA_ALTA"].ToString();
                }
                con.Close();
            }
        }
        return ret_falta;
    }//FIN RETORNAR PERFIL


    protected string RetornarCP(string FOLIO, string campo)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_PAPELETA WHERE FOLIO=" + FOLIO, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    retCP = dr[campo].ToString();
                }
                con.Close();
            }
        }
        return retCP;
    }//FIN RETORNAR PERFIL

    protected string RetornarTPRP(string RFC, string campo)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_REG_PACIENTE WHERE RFC = '" + RFC +"'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    retCP = dr[campo].ToString();
                }
                con.Close();
            }
        }
        return retCP;
    }//FIN RETORNAR PERFIL

    protected DateTime RetornarFN(string RFC)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT fecha_nacimiento FROM TU_PER_REG_PACIENTE WHERE RFC = '" + RFC + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    retfn = DateTime.Parse(dr["fecha_nacimiento"].ToString());
                }
                con.Close();
            }
        }
        return retfn;
    }//FIN RETORNAR PERFIL

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


    protected int RetornarConjuntoPerf(string idemp,string idperf)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ROW_NUMBER() OVER(ORDER BY ID_PERFIL ASC) AS VALOR, ID_PERFIL AS ID_PERFIL, PERF_DESCRIPCION AS perfiles FROM TU_PER_CAT_PERFILES  where ID_EMPRESA = '"+ idemp+"'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cliente_value = dr["ID_PERFIL"].ToString();
                    if (cliente_value == idperf) {
                        val = Int32.Parse(dr["VALOR"].ToString());
                    }
                }
                con.Close();
                return val;
            }
        }

    }



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

    protected string Retornar_UserPerfil(string id_perfil)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select ID_ASESOR from TU_PER_CAT_PERFILES where ID_PERFIL='" + id_perfil + "'", con))
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
}