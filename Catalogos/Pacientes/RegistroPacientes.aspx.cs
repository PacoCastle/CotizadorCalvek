using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Text;
using System.Web.Services;
using System.Globalization;

public partial class Catalogos_Pacientes_RegistroPacientes : System.Web.UI.Page
{
    private static int NUMFUNCION = 14;
    private string rfc;
    private string buscar_rfc;
    private string buscar_no_papeleta;
    private string buscar_empresa;
    private string buscar_fecha;
    private string ret_nombre,ret_apaterno,ret_amaterno,ret_rfc,ret_razonsocial,ret_perfil,retornar_razonsocial,retornar_perfil;
    private string nombre_pac;
    private string apaterno_pac;
    private string amaterno_pac;
    private string nombre_completo;
    private string fecha_alta_text;
    private string retornar_status="0";
    private string no_papeleta;
    private string retornar_rfc, retornar_idempresa, retornar_idperfil;
    private int statuspapeleta;
    private string id;
    private int dev_id;
    private DateTime falta;
    private DateTime retornar_fa;
    
    string html = "";

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
           
            if (!Page.IsPostBack)
            {
                //Refreshdata();
                IniciarLllenadoDropDown();
                div_agregar.Visible = false;

            }
        }
        catch (Exception ex)
        {
        }
    }



    protected void BtnBRFC(object sender, EventArgs e)
          {
                this.rfc = txtrfcbuscar.Text.Trim();
                label_rfc.Text = rfc;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL WHERE RFC= '" + this.rfc + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    Refreshdata();
                    LINK_AGREGAR.Text = "AGREGAR PERFIL";
                    div_agregar.Visible = false;
                }
                else
                {
                    Refreshdata();
                    LINK_AGREGAR.Text = "";
                    div_agregar.Visible = false;

                    lblTitle.Text = "REGISTRO PACIENTES";
                    lblModalBody.Text = "NO SE ENCUENTRAN DATOS CON ESTE RFC, DA DE ALTA EL PACIENTE POR FAVOR.";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                }

            }
        }

    }//FIN DE BUSCAR RFC


    public void Refreshdata()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT tpcdpp.RFC AS RFC, tprp.Nombre AS NOMBRE, tprp.Apaterno AS APELLIDO_PATERNO, tprp.Amaterno AS APELLIDO_MATERNO, c.cliente_razonSocial AS EMPRESA, tpcp.PERF_DESCRIPCION AS PERFIL, tp.FOLIO AS FOLIO, tp.ESTATUS FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL tpcdpp JOIN TU_PER_REG_PACIENTE tprp ON tpcdpp.RFC=tprp.RFC JOIN clientes c ON CAST(tpcdpp.ID_EMP AS INT)=c.cliente_codigo JOIN TU_PER_CAT_PERFILES tpcp ON tpcdpp.ID_PER=tpcp.ID_PERFIL JOIN TU_PER_CAT_PAPELETA tp on tp.RFC = tpcdpp.RFC and tp.ID_EMPRESA=tpcdpp.ID_EMP AND tp.ID_PERFIL=tpcdpp.ID_PER AND tp.FECHA_ALTA = tpcdpp.FECHA_ALTA WHERE tpcdpp.RFC  = '" + this.buscar_rfc + "'", con))
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
    }//fin refresh

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = "Ver Papeleta";
            e.Row.Cells[1].Text = "Editar Papeleta";
            e.Row.Cells[2].Text = "RFC";
            e.Row.Cells[3].Text = "Nombre";
            e.Row.Cells[4].Text = "Paterno";
            e.Row.Cells[5].Text = "Materno";
            e.Row.Cells[6].Text = "Empresa";
            e.Row.Cells[7].Text = "Perfil";
            e.Row.Cells[8].Text = "Folio";
            
        }
    }

    public void Refreshdata2()
    {
        this.buscar_empresa = listempresa.Text.Trim();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT tpcdpp.RFC AS RFC, tprp.Nombre AS NOMBRE, tprp.Apaterno AS APELLIDO_PATERNO, tprp.Amaterno AS APELLIDO_MATERNO, c.cliente_razonSocial AS EMPRESA, tpcp.PERF_DESCRIPCION AS PERFIL, tp.FOLIO AS FOLIO, tp.ESTATUS FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL tpcdpp JOIN TU_PER_REG_PACIENTE tprp ON tpcdpp.RFC=tprp.RFC JOIN clientes c ON CAST(tpcdpp.ID_EMP AS INT)=c.cliente_codigo JOIN TU_PER_CAT_PERFILES tpcp ON tpcdpp.ID_PER=tpcp.ID_PERFIL JOIN TU_PER_CAT_PAPELETA tp on tp.RFC = tpcdpp.RFC and tp.ID_EMPRESA=tpcdpp.ID_EMP AND tp.ID_PERFIL=tpcdpp.ID_PER AND tp.FECHA_ALTA = tpcdpp.FECHA_ALTA WHERE c.cliente_razonSocial  = '" + this.buscar_empresa + "'", con))
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();

                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }//fin refresh

    public void Refreshdata3()
    {
        this.buscar_fecha = txtFecha.Text.Trim();
        var z = Convert.ToDateTime(buscar_fecha).ToString("yyyy-MM-dd");

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT tpcdpp.RFC AS RFC, tprp.Nombre AS NOMBRE, tprp.Apaterno AS APELLIDO_PATERNO, tprp.Amaterno AS APELLIDO_MATERNO, c.cliente_razonSocial AS EMPRESA, tpcp.PERF_DESCRIPCION AS PERFIL, tp.FOLIO AS FOLIO, tp.ESTATUS FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL tpcdpp JOIN TU_PER_REG_PACIENTE tprp ON tpcdpp.RFC = tprp.RFC JOIN clientes c ON CAST(tpcdpp.ID_EMP AS INT) = c.cliente_codigo JOIN TU_PER_CAT_PERFILES tpcp ON tpcdpp.ID_PER = tpcp.ID_PERFIL JOIN TU_PER_CAT_PAPELETA tp on tp.RFC = tpcdpp.RFC and tp.ID_EMPRESA = tpcdpp.ID_EMP AND tp.ID_PERFIL = tpcdpp.ID_PER AND tp.FECHA_ALTA = tpcdpp.FECHA_ALTA WHERE CAST(tpcdpp.FECHA_ALTA as DATE) = '" + z+"'", con))
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();

                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }//fin refresh

    public void Refreshdata4()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT tpcdpp.RFC AS RFC, tprp.Nombre AS NOMBRE, tprp.Apaterno AS APELLIDO_PATERNO, tprp.Amaterno AS APELLIDO_MATERNO, c.cliente_razonSocial AS EMPRESA, tpcp.PERF_DESCRIPCION AS PERFIL, tp.FOLIO AS FOLIO, tp.ESTATUS FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL tpcdpp JOIN TU_PER_REG_PACIENTE tprp ON tpcdpp.RFC=tprp.RFC JOIN clientes c ON CAST(tpcdpp.ID_EMP AS INT)=c.cliente_codigo JOIN TU_PER_CAT_PERFILES tpcp ON tpcdpp.ID_PER=tpcp.ID_PERFIL JOIN TU_PER_CAT_PAPELETA tp on tp.RFC = tpcdpp.RFC and tp.ID_EMPRESA=tpcdpp.ID_EMP AND tp.ID_PERFIL=tpcdpp.ID_PER AND tp.FECHA_ALTA = tpcdpp.FECHA_ALTA", con))
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView4.DataSource = dt;
                GridView4.DataBind();

                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }//fin refresh

    private string nombre, apaterno, amaterno, fnacimiento, rfcalta, id_empresa, id_perfil;
    private DateTime f_n,f_a;
   
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



    protected void BtnGuardar(object sender, EventArgs e)
    {
        this.rfcalta = txtrfc.Text.Trim();
        this.fecha_alta_text = fecha_alta.Text.Trim();
        this.f_a = Convert.ToDateTime(fecha_alta.Text.Trim());
        this.id_empresa = empresa.Text.Trim();
        this.id_perfil = perfil.Text.Trim();
        falta = Convert.ToDateTime(((HiddenField)Master.FindControl("hdnDate")).Value);


        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO TU_PER_CAT_DETALLE_PACIENTE_PERFIL (RFC,ID_EMP,ID_PER,FECHA_ALTA)VALUES(@RFC,@ID_EMP,@ID_PER,@FECHA_ALTA);", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@RFC", this.rfcalta);
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
                    cmd.Parameters.AddWithValue("RFC", this.rfcalta);
                    cmd.Parameters.AddWithValue("ID_EMPRESA", this.id_empresa);
                    cmd.Parameters.AddWithValue("ID_PERFIL", this.id_perfil);
                    cmd.Parameters.AddWithValue("FECHA_ALTA", this.falta);
                int i = cmd.ExecuteNonQuery();

                    con.Close();
                }
            }


            lblTitle.Text = "CORRECTO";
            lblModalBody.Text = "SE HA AÑADIDO EL PERFIL AL RFC " + this.rfcalta;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);


            Refreshdata();
            LINK_AGREGAR.Text = "";
            div_agregar.Visible = false;
            CamposVacios();
        

       

       /**/

    }

    protected void CamposVacios()
    {
        txtrfcbuscar.Text = "";
        txtpapeleta.Text = "";
        listempresa.SelectedIndex = -1;
        txtFecha.Text = "";
        this.GridView1.Visible = false;
        this.GridView2.Visible = false;
        this.GridView3.Visible = false;
        this.GridView4.Visible = false;
    }



    protected string Retornar_PerfilUso(string rfc_paciente, string id_emp, string id_perf)
    {
      
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL where RFC='" + rfc_paciente + "' and ID_EMP= '"+ id_emp + "' and ID_PER= '"+ id_perf + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    retornar_status = "1";
                }
                con.Close();
            }
        }
        return retornar_status;
    }//FIN RETORNAR PERFIL

    protected int Retornar_ID()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 ID FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL ORDER BY ID DESC", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dev_id = Convert.ToInt32(dr["ID"].ToString());
                }
                con.Close();
            }
        }
        return dev_id;
    }//FIN RETORNAR PERFIL




    protected void BtnPa(object sender, EventArgs e)
    {
        this.no_papeleta = txtpapeleta.Text.Trim();
        int numero_papeleta = Int32.Parse(no_papeleta);

        if (Retornar_StatusPapeleta(numero_papeleta) == 1)
        {
            Retornar_rfcpapeleta(numero_papeleta);
            Retornar_idempresa(numero_papeleta);
            Retornar_idperfil(numero_papeleta);

            Response.Redirect("caida_papeleta.aspx?rfc=" + Retornar_rfcpapeleta(numero_papeleta) + "&id_empresa=" + Retornar_idempresa(numero_papeleta) + "&id_perfil=" + Retornar_idperfil(numero_papeleta));
        }
        else {
            lblTitle.Text = "AMI";
            lblModalBody.Text = "EL FOLIO #" + numero_papeleta + " NO SE ENCUENTRA REGISTRADO";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        }

    }


    protected string Retornar_rfcpapeleta(int FOLIO)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT RFC FROM TU_PER_CAT_PAPELETA where FOLIO=" + FOLIO , con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.retornar_rfc = dr["RFC"].ToString();
                }
                con.Close();
            }
        }
        return retornar_rfc;
    }//FIN RETORNAR RFC



    protected string Retornar_idperfil(int FOLIO)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ID_PERFIL FROM TU_PER_CAT_PAPELETA where FOLIO=" + FOLIO, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.retornar_idperfil = dr["ID_PERFIL"].ToString();
                }
                con.Close();
            }
        }
        return retornar_idperfil;
    }//FIN RETORNAR id_perfil
    protected string Retornar_id(int FOLIO)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ID_DETALLE_PACIENTE_PERFIL FROM TU_PER_CAT_PAPELETA where FOLIO=" + FOLIO, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.id = dr["ID_DETALLE_PACIENTE_PERFIL"].ToString();
                }
                con.Close();
            }
        }
        return id;
    }//FIN RETORNAR id_perfil



    protected string Retornar_idempresa(int FOLIO)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ID_EMPRESA FROM TU_PER_CAT_PAPELETA where FOLIO=" + FOLIO, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.retornar_idempresa = dr["ID_EMPRESA"].ToString();
                }
                con.Close();
            }
        }
        return retornar_idempresa;
    }//FIN RETORNAR ID_EMPRESA

    protected int Retornar_StatusPapeleta(int FOLIO)
    {
        this.statuspapeleta = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_PAPELETA where FOLIO=" + FOLIO, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.statuspapeleta = 1;
                }
                con.Close();
            }
        }
        return statuspapeleta;
    }//FIN RETORNAR ID_EMPRESA
     /****************************************************************************************************************************************/
     /****************************************************************************************************************************************/
     /****************************************************************************************************************************************/
   
    protected void BBuscar(object sender, EventArgs e)
    {
        this.buscar_rfc = txtrfcbuscar.Text.Trim();
        this.buscar_no_papeleta = txtpapeleta.Text.Trim();
        this.buscar_empresa = listempresa.Text.Trim();
        this.buscar_fecha = txtFecha.Text.Trim();


        if (buscar_rfc != "")
        {
            txtrfcbuscar.Text = "";
            txtpapeleta.Text = "";
            listempresa.SelectedIndex = -1;
            txtFecha.Text = "";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_DETALLE_PACIENTE_PERFIL WHERE RFC = '" + this.buscar_rfc + "'", con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        Refreshdata();
                        LINK_AGREGAR.Text = "AGREGAR PERFIL";
                        div_agregar.Visible = false;

                        this.GridView1.Visible = true;
                        this.GridView2.Visible = false;
                        this.GridView3.Visible = false;
                        this.GridView4.Visible = false;
                    }
                    else
                    {
                        Refreshdata();
                        LINK_AGREGAR.Text = "";
                        div_agregar.Visible = false;

                        lblTitle.Text = "REGISTRO PACIENTES";
                        lblModalBody.Text = "NO SE ENCUENTRAN DATOS CON ESTE RFC, DA DE ALTA EL PACIENTE POR FAVOR.";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                        this.GridView1.Visible = false;
                        this.GridView2.Visible = false;
                        this.GridView3.Visible = false;
                        this.GridView4.Visible = false;
                    }

                }
            }
        }
        else if (buscar_no_papeleta != "")
        {

            int numero_papeleta = Int32.Parse(buscar_no_papeleta);

            if (Retornar_StatusPapeleta(numero_papeleta) == 1)
            {
                Retornar_rfcpapeleta(numero_papeleta);
                Retornar_idempresa(numero_papeleta);
                Retornar_idperfil(numero_papeleta);
                var z = Retornar_Fecha_Alta(numero_papeleta).ToString("yyyy-MM-dd H:mm:ss.fff");
                Response.Redirect("caida_papeleta.aspx?rfc=" + Retornar_rfcpapeleta(numero_papeleta) + "&id_empresa=" + Retornar_idempresa(numero_papeleta) + "&id_perfil=" + Retornar_idperfil(numero_papeleta) + "&fecha_alta=" + z);
                LINK_AGREGAR.Text = "";
                div_agregar.Visible = false;
                txtrfcbuscar.Text = "";
                txtpapeleta.Text = "";
                listempresa.SelectedIndex = -1;
                txtFecha.Text = "";
                this.GridView1.Visible = false;
                this.GridView3.Visible = false;
                this.GridView4.Visible = false;
            }
            else
            {
                LINK_AGREGAR.Text = "";
                div_agregar.Visible = false;
                lblTitle.Text = "AMI";
                lblModalBody.Text = "EL FOLIO #" + numero_papeleta + " NO SE ENCUENTRA REGISTRADO";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                txtrfcbuscar.Text = "";
                txtpapeleta.Text = "";
                listempresa.SelectedIndex = -1;
                txtFecha.Text = "";
                this.GridView1.Visible = false;
                this.GridView3.Visible = false;
                this.GridView4.Visible = false;
            }
        }
        else if (buscar_empresa != "0")
        {
            Refreshdata2();
            txtrfcbuscar.Text = "";
            txtpapeleta.Text = "";
            //listempresa.SelectedIndex = -1;
            txtFecha.Text = "";
            this.GridView1.Visible = false;
            this.GridView2.Visible = true;
            this.GridView3.Visible = false;
            this.GridView4.Visible = false;
        }
        else if (buscar_fecha != "")
        {
            var z = Convert.ToDateTime(buscar_fecha).ToString("yyyy-MM-dd");
            LINK_AGREGAR.Text = "";
            buscar_fecha = z;
            Refreshdata3();
            txtrfcbuscar.Text = "";
            txtpapeleta.Text = "";
            listempresa.SelectedIndex = -1;
            //txtFecha.Text = "";
            this.GridView1.Visible = false;
            this.GridView2.Visible = false;
            this.GridView3.Visible = true;
            this.GridView4.Visible = false;
            /*div_agregar.Visible = false;
            DateTime myDate = DateTime.Parse(buscar_fecha);
            var z = myDate.ToString("yyyy-MM-dd");
            buscar_fecha = z;
            Refreshdata3();
            txtrfcbuscar.Text = "";
            txtpapeleta.Text = "";
            listempresa.SelectedIndex = -1;
            txtFecha.Text = "";
            this.GridView1.Visible = false;
            this.GridView2.Visible = false;
            this.GridView3.Visible = true;
            this.GridView4.Visible = false;*/
        }
        else {
            Refreshdata4();
            txtrfcbuscar.Text = "";
            txtpapeleta.Text = "";
            listempresa.SelectedIndex = -1;
            txtFecha.Text = "";
            this.GridView1.Visible = false;
            this.GridView2.Visible = false;
            this.GridView3.Visible = false;
            this.GridView4.Visible = true;
        }


            label_rfc.Text = buscar_rfc;

        }//FIN DE BUSCAR RFC


    protected void AGREGAR_PERFIL(object sender, EventArgs e)
    {
        div_agregar.Visible = true;
        string fecha = DateTime.Now.ToShortDateString();
        fecha_alta.Text = fecha;
        txtrfc.Text = label_rfc.Text;

    }//AGREGAR_PERFIL

   
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VER")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int numero_papeleta = Int32.Parse(GridView1.Rows[index].Cells[8].Text);
            
                Retornar_rfcpapeleta(numero_papeleta);
                Retornar_idempresa(numero_papeleta);
                Retornar_idperfil(numero_papeleta);
                var z=Retornar_Fecha_Alta(numero_papeleta).ToString("yyyy-MM-dd H:mm:ss.fff");
            
            Response.Redirect("caida_papeleta.aspx?rfc=" + Retornar_rfcpapeleta(numero_papeleta) + "&id_empresa=" + Retornar_idempresa(numero_papeleta) + "&id_perfil=" + Retornar_idperfil(numero_papeleta)+ "&fecha_alta=" + z);
            
        }

        if (e.CommandName == "EDITAR")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int folio = Int32.Parse(GridView1.Rows[index].Cells[8].Text);
            var z = Retornar_Fecha_Alta(folio).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("EditarPapeleta.aspx?rfc=" + Retornar_rfcpapeleta(folio) + "&folio=" + folio + "&id_empresa=" + Retornar_idempresa(folio) + "&id_perfil=" + Retornar_idperfil(folio) + "&fecha_alta=" + z);

        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VER")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int numero_papeleta = Int32.Parse(GridView2.Rows[index].Cells[8].Text);

            Retornar_rfcpapeleta(numero_papeleta);
            Retornar_idempresa(numero_papeleta);
            Retornar_idperfil(numero_papeleta);
            var z = Retornar_Fecha_Alta(numero_papeleta).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("caida_papeleta.aspx?rfc=" + Retornar_rfcpapeleta(numero_papeleta) + "&id_empresa=" + Retornar_idempresa(numero_papeleta) + "&id_perfil=" + Retornar_idperfil(numero_papeleta) + "&fecha_alta=" + z);

        }
        if (e.CommandName == "EDITAR")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int folio = Int32.Parse(GridView2.Rows[index].Cells[8].Text);
            var z = Retornar_Fecha_Alta(folio).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("EditarPapeleta.aspx?rfc=" + Retornar_rfcpapeleta(folio) + "&folio=" + folio + "&id_empresa=" + Retornar_idempresa(folio) + "&id_perfil=" + Retornar_idperfil(folio) + "&fecha_alta=" + z);

        }
    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VER")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int numero_papeleta = Int32.Parse(GridView3.Rows[index].Cells[8].Text);

            Retornar_rfcpapeleta(numero_papeleta);
            Retornar_idempresa(numero_papeleta);
            Retornar_idperfil(numero_papeleta);
            var z = Retornar_Fecha_Alta(numero_papeleta).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("caida_papeleta.aspx?rfc=" + Retornar_rfcpapeleta(numero_papeleta) + "&id_empresa=" + Retornar_idempresa(numero_papeleta) + "&id_perfil=" + Retornar_idperfil(numero_papeleta) + "&fecha_alta=" + z);

        }
        if (e.CommandName == "EDITAR")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int folio = Int32.Parse(GridView3.Rows[index].Cells[8].Text);
            var z = Retornar_Fecha_Alta(folio).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("EditarPapeleta.aspx?rfc=" + Retornar_rfcpapeleta(folio) + "&folio=" + folio + "&id_empresa=" + Retornar_idempresa(folio) + "&id_perfil=" + Retornar_idperfil(folio) + "&fecha_alta=" + z);

        }
    }
    protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VER")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int numero_papeleta = Int32.Parse(GridView4.Rows[index].Cells[8].Text);

            Retornar_rfcpapeleta(numero_papeleta);
            Retornar_idempresa(numero_papeleta);
            Retornar_idperfil(numero_papeleta);
            var z = Retornar_Fecha_Alta(numero_papeleta).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("caida_papeleta.aspx?rfc=" + Retornar_rfcpapeleta(numero_papeleta) + "&id_empresa=" + Retornar_idempresa(numero_papeleta) + "&id_perfil=" + Retornar_idperfil(numero_papeleta) + "&fecha_alta=" + z);

        }
        if (e.CommandName == "EDITAR")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int folio = Int32.Parse(GridView4.Rows[index].Cells[8].Text);
            var z = Retornar_Fecha_Alta(folio).ToString("yyyy-MM-dd H:mm:ss.fff");

            Response.Redirect("EditarPapeleta.aspx?rfc=" + Retornar_rfcpapeleta(folio) + "&folio=" + folio + "&id_empresa=" + Retornar_idempresa(folio) + "&id_perfil=" + Retornar_idperfil(folio) + "&fecha_alta=" + z);

        }
    }


    string actrfc;
    string actid_emp;
    string actid_per;
    string afecha_alta;
    DateTime actfecha_alta;
    protected void ACT(object sender, EventArgs e) {
        CamposVacios();
      /*  using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select * from TU_PER_CAT_DETALLE_PACIENTE_PERFIL", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.actrfc = dr["RFC"].ToString();
                    this.actid_emp = dr["ID_EMP"].ToString();
                    this.actid_per = dr["ID_PER"].ToString();
                    this.afecha_alta = dr["FECHA_ALTA"].ToString();
                    actfecha_alta = Convert.ToDateTime(afecha_alta);
                    System.Diagnostics.Debug.WriteLine("rfc: "+ actrfc);
                    System.Diagnostics.Debug.WriteLine("Empresa: "+ actid_emp);
                    System.Diagnostics.Debug.WriteLine("Perfil: "+ actid_per);
                    System.Diagnostics.Debug.WriteLine("SomeText: "+ actfecha_alta);

                    ACT_DATOS(actrfc, actid_emp, actid_per, actfecha_alta);
                }
                con.Close();
            }
        }*/
    }//fin act
    protected void ACT_DATOS(string RFC,string ID_EMPRESA,string ID_PERFIL,DateTime FECHA_ALTA) {
        txtrfcbuscar.Text = "";
        txtpapeleta.Text = "";
        txtFecha.Text = "";
        listempresa.SelectedIndex = -1;
        
        /* using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
    {
        using (SqlCommand cmd = new SqlCommand("UPDATE TU_PER_CAT_PAPELETA SET " +
            "FECHA_ALTA=@FECHA_ALTA" +
            " WHERE RFC=@RFC AND ID_EMPRESA=@ID_EMPRESA AND ID_PERFIL=@ID_PERFIL", con))
        {
            con.Open();
            cmd.Parameters.AddWithValue("@FECHA_ALTA", FECHA_ALTA);
            cmd.Parameters.AddWithValue("@RFC", RFC);
            cmd.Parameters.AddWithValue("@ID_EMPRESA", ID_EMPRESA);
            cmd.Parameters.AddWithValue("@ID_PERFIL", ID_PERFIL);
            int rows = cmd.ExecuteNonQuery();
            con.Close();
            System.Diagnostics.Debug.WriteLine("ACT: " + rows);
        }
    }*/
    }


    protected DateTime Retornar_Fecha_Alta(int FOLIO)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT FECHA_ALTA FROM TU_PER_CAT_PAPELETA where FOLIO=" + FOLIO, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.retornar_fa = Convert.ToDateTime(dr["FECHA_ALTA"].ToString());
                }
                con.Close();
            }
        }
        return retornar_fa;
    }//FIN RETORNAR id_perfil

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        GridView1.PageIndex = e.NewPageIndex;
        this.GridView2.Visible = false;
        this.GridView3.Visible = false;
        this.GridView4.Visible = false;
        Refreshdata();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        this.GridView1.Visible = false;
        this.GridView3.Visible = false;
        this.GridView4.Visible = false;
        Refreshdata2();
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        this.GridView1.Visible = false;
        this.GridView2.Visible = false;
        this.GridView4.Visible = false;
        Refreshdata3();
    }
    protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView4.PageIndex = e.NewPageIndex;
        this.GridView1.Visible = false;
        this.GridView2.Visible = false;
        this.GridView3.Visible = false;
        Refreshdata4();
    }

}