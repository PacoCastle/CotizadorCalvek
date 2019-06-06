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
using System.Drawing;
using System.Data.SqlClient;

public partial class Cobranza_reporteRemisiones : System.Web.UI.Page
{
    private static int NUMFUNCION = 46;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }
    
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
           string connString = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
            SqlConnection Cnn = new SqlConnection(connString);
            string sError = null;
            //int valResultado = 0;

            try
            {

                SqlCommand cmd = new SqlCommand("set_insertRemisionesAcciones", Cnn);
                cmd.CommandType = CommandType.StoredProcedure;                

                cmd.Parameters.Add("@CD_TIPO", SqlDbType.Int);
                cmd.Parameters["@CD_TIPO"].Value = rblTipo.SelectedValue;

                cmd.Parameters.Add("@NB_ACCION", SqlDbType.VarChar, 65);
                cmd.Parameters["@NB_ACCION"].Value = txtAccion.Text;

                cmd.Parameters.Add("@CD_USUARIO", SqlDbType.Int);
                cmd.Parameters["@CD_USUARIO"].Value = Session["usuarioID"].ToString();

                Cnn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                sError = ex.Number + "-" + ex.Message;
               
            }
            catch (Exception ex)
            {
                sError = ex.Source + "-" + ex.Message;
               
            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('" + txtAccion.Text + "');", true); 
                if ((Cnn != null))
                {
                    if (Cnn.State == ConnectionState.Open)
                    {
                        Cnn.Close();
                        //cerrar conexion
                        Cnn = null;
                        //destruir objeto
                    }
                }
            }
        
    }

    
}
