using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalogos_Pacientes_CapturaRegistro : System.Web.UI.Page
{

    private static int NUMFUNCION = 13;
    private string papeleta;
    private int value_papeleta,valor_parse,dpapeleta,statuspapeleta;
    private int contador=0;
    private string status;
    private int sfolio;
    private string sservicio;
    private int scantidad;
    private double scosto;
    private DataSet ds = new DataSet();
    private DataTable dt = new DataTable();
    private double returntotal;
    private int conserv;
    private int count;
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
           

            if (!IsPostBack)
            {
                div_agregar.Visible = false;
            }
        }
        catch (Exception ex)
        {
        }
    }//FIN DE LOAD

    protected void BtnBuscar(object sender, EventArgs e)
    {
        
        papeleta = txtpapeleta.Text.Trim();
        this.valor_parse = Int32.Parse(papeleta);
        int ret_val = Val_num(valor_parse);
        if (ret_val == 1)
        {

            if (Status_Registro(valor_parse) == 1)
            {
                lblTitle.Text = "AMI";
                lblModalBody.Text = "LA PAPELETA CON EL FOLIO #" + valor_parse + " YA SE ENCUENTRA REGISTRADA COMPLETAMENTE";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                txtpapeleta.Text = "";
            }
            else if (Status_Registro(valor_parse) == 2) {

                textfol.Text = "LA PAPELETA A COMPLETAR ES LA PERTENECIENTE AL FOLIO #";
                folio.Text = papeleta;
                div_agregar.Visible = true;
                DropDownListEstatus.SelectedIndex = 2;
                refreshdata();
                Recuperar_ex(valor_parse);

                CargarServicios(valor_parse);
                if (Validar_Servicios(valor_parse) == 1)
                {
                    Label1.Text = "Total: ";
                    Label2.Text = "$" + SumarServicio(valor_parse);
                    descripcion.Text = "";
                    cantidad.Text = "";
                    costo.Text = "";
                }
            }
            else
            {
                textfol.Text = "LA PAPELETA A REGISTRAR ES LA PERTENECIENTE AL FOLIO #";
                folio.Text = papeleta;
                div_agregar.Visible = true;
                refreshdata();
                DropDownListEstatus.SelectedIndex = -1;
            }
            
        }
        else {
            lblTitle.Text = "AMI";
            lblModalBody.Text = "LA PAPELETA CON EL FOLIO #" + valor_parse + " NO SE ENCUENTRA REGISTRADA.";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            div_agregar.Visible = false;
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
    protected int Val_num(int papeleta)
    {
        value_papeleta = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * from TU_PER_CAT_PAPELETA where FOLIO='" + papeleta + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    value_papeleta = 1;
                }
                con.Close();
            }
        }
        return value_papeleta;
    }//FIN RETORNAR PERFIL



    protected void BtnGUARDAR(object sender, EventArgs e)
    {
        div_agregar.Visible = true;
        this.status = DropDownListEstatus.Text.Trim();
        int val_status = Int32.Parse(status);

        papeleta = folio.Text.Trim();
        valor_parse = Int32.Parse(papeleta);

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM TU_PER_CAT_REGISTRO WHERE FOLIO=@FOLIO", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@FOLIO", valor_parse);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM TU_PER_CAT_DETALLE_PAPELETA WHERE FOLIO=@FOLIO", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@FOLIO", valor_parse);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        int can = Validar_checkbox();
        if (can != 0)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                CheckBox checkBox = item.FindControl("chkbx") as CheckBox;
                if (checkBox.Checked)
                {
                    string id_ex= checkBox.Attributes["Value"];


                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
                    {
                        using (SqlCommand cmd = new SqlCommand("insert into TU_PER_CAT_DETALLE_PAPELETA(folio,id_examen) values(@folio,@id_examen)", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("folio", valor_parse);
                            cmd.Parameters.AddWithValue("id_examen", id_ex);
                            int i = cmd.ExecuteNonQuery();

                            con.Close();
                        }
                    }

                  
                }

            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("insert into TU_PER_CAT_REGISTRO(FOLIO,STATUS) values(@folio,@status)", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("folio", valor_parse);
                    cmd.Parameters.AddWithValue("status", val_status);
                    int i = cmd.ExecuteNonQuery();

                    con.Close();
                }
            }
            if (val_status==1) {
                div_agregar.Visible = false;
                lblTitle.Text = "AMI";
                lblModalBody.Text = "SE HA REGISTRADO COMO COMPLETA LA PAPELETA PERTENECIENTE AL FOLIO #" + valor_parse;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                //textfol.Text = "SE HA REGISTRADO LA PAPELETA CORRESPONDIENTE AL FOLIO #"+ valor_parse;
                txtpapeleta.Text = "";
            }
            else if (val_status == 2)
            {
                div_agregar.Visible = false;
                lblTitle.Text = "AMI";
                lblModalBody.Text = "SE HA REGISTRADO COMO INCOMPLETA LA PAPELETA PERTENECIENTE AL FOLIO #" + valor_parse;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                //textfol.Text = "SE HA REGISTRADO LA PAPELETA CORRESPONDIENTE AL FOLIO #"+ valor_parse;
                txtpapeleta.Text = "";
            }
           
        }

        else
        {
            lblTitle.Text = "ERROR";
            lblModalBody.Text = "DEBES SELECCIONAR ALMENOS 1 EXAMEN PARA DAR DE ALTA EL PERFIL";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        }
        //Response.Redirect("CapturaRegistro.aspx");
    }



    protected int Val_DetallePapeleta(int papeleta)
    {
        dpapeleta = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * from TU_PER_CAT_REGISTRO where FOLIO='" + papeleta + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dpapeleta = 1;
                }
                con.Close();
            }
        }
        return dpapeleta;
    }//FIN RETORNAR PERFIL


    protected int Status_Registro(int papeleta)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT STATUS from TU_PER_CAT_REGISTRO where FOLIO='" + papeleta + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    statuspapeleta = Int32.Parse(dr["STATUS"].ToString());
                }
                con.Close();
            }
        }
        return statuspapeleta;
    }//FIN RETORNAR PERFIL




    protected void Recuperar_ex(int folio)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select id_examen from TU_PER_CAT_DETALLE_PAPELETA where FOLIO= '" + folio + "'", con))
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
    }//fin de recuperar

    protected void Btnagregar(object sender, EventArgs e)
    {
        sfolio = Convert.ToInt32(folio.Text);
        sservicio = descripcion.Text;
        scantidad = Convert.ToInt32(cantidad.Text);
        scosto = Convert.ToDouble(costo.Text);

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
         {
             using (SqlCommand cmd = new SqlCommand("insert into TU_PER_CAT_SERVICIOS(FOLIO,SERVICIO,CANTIDAD,COSTO) values(@FOLIO,@SERVICIO,@CANTIDAD,@COSTO)", con))
             {
                 con.Open();
                 cmd.Parameters.AddWithValue("FOLIO", sfolio);
                 cmd.Parameters.AddWithValue("SERVICIO", sservicio);
                 cmd.Parameters.AddWithValue("CANTIDAD", scantidad);
                 cmd.Parameters.AddWithValue("COSTO", scosto);
                 int i = cmd.ExecuteNonQuery();

                 con.Close();
             }
         }
        CargarServicios(sfolio);
        
            Label1.Text = "Total: ";
            Label2.Text = "$" + SumarServicio(sfolio);
            descripcion.Text = "";
            cantidad.Text = "";
            costo.Text = "";
    }//fin de Agregar

     private void CargarServicios(int RFolio)
     {

        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[5] {
                            new DataColumn("ID SERVICIO", typeof(int)),
                            new DataColumn("DESCRIPCION DEL SERVICIO", typeof(string)),
                            new DataColumn("CANTIDAD", typeof(int)),
                            new DataColumn("COSTO",typeof(double)),
                            new DataColumn("TOTAL",typeof(double))
        });


        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ID_SERVICIO,FOLIO,SERVICIO,CANTIDAD,COSTO,CANTIDAD * COSTO as TOTAL FROM TU_PER_CAT_SERVICIOS WHERE FOLIO=" + RFolio, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    string rid = dr["ID_SERVICIO"].ToString();
                    string rservicio = dr["SERVICIO"].ToString();
                    string rcantidad = dr["CANTIDAD"].ToString();
                    string rcosto = dr["COSTO"].ToString();
                    string rtotal = dr["TOTAL"].ToString();
                    dt.Rows.Add(rid,rservicio,rcantidad,rcosto,rtotal);
                }
                con.Close();
            }
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    private double SumarServicio(int SFolio) {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select SUM(CANTIDAD * COSTO) as total from TU_PER_CAT_SERVICIOS where folio=" + SFolio, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    returntotal = Convert.ToDouble(dr["total"].ToString());
                }
                con.Close();
            }
        }
        return returntotal;
    }

    protected void Eliminar(object sender, EventArgs e)
    {
        sfolio = Convert.ToInt32(folio.Text);
        LinkButton btn = (LinkButton)(sender);
        string ID = btn.CommandArgument;
        int id = int.Parse(ID);
        string id_servicio = GridView1.Rows[id].Cells[1].Text;

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM TU_PER_CAT_SERVICIOS WHERE ID_SERVICIO=@ID_SERVICIO", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@ID_SERVICIO", id_servicio);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        CargarServicios(sfolio);
        if (ValidarDelete(sfolio) == 1)
        {
            Label1.Text = "Total: ";
            Label2.Text = "$" + SumarServicio(sfolio);
        }
        else
        {
            Label1.Text = "";
            Label2.Text = "";
        }
    }

    protected int Validar_Servicios(int VFolio)
    {
        this.conserv = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_SERVICIOS WHERE FOLIO="+ VFolio, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.conserv = 1;
                }
                con.Close();

            }
        }
        return this.conserv;
    }

    protected int ValidarDelete(int fol)
    {
        this.count = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TU_PER_CAT_SERVICIOS WHERE FOLIO=" + fol, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.count = 1;
                }
                con.Close();

            }
        }
        return this.count;
    }
}