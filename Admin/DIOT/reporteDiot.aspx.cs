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
using System.IO;
using System.Text;

public partial class Admin_DIOT_reporteDiot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox1.Text = DateTime.Now.Year.ToString();
            TextBox2.Text = ("00" + (DateTime.Now.Month - 1).ToString()).Substring(("00" + (DateTime.Now.Month - 1).ToString()).Length - 2);
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        GridView1.Visible = true;
        Button1.Visible = true;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        String strNombreArchivo = Page.Header.Title; // nombre de la pagina -> nombre base del archivo
        String[] cadena = HttpContext.Current.Request.RawUrl.Split('/');
        String strCarpeta = cadena[(cadena.Length) - 2]; //

        // lee datos datagrid
        int i, h;
        String[,] strValores = new String[GridView1.Rows.Count, GridView1.Rows[0].Cells.Count];
        String[] strValoresRenglon = new String[GridView1.Rows.Count];

        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            for (h = 0; h < GridView1.Rows[i].Cells.Count; h++)
            {
                strValores[i, h] = quitaCaracteresRaros(GridView1.Rows[i].Cells[h].Text).ToUpper();
                strValoresRenglon[i] = strValoresRenglon[i] + ((h == 0) ? "" : "|") + quitaCaracteresRaros(GridView1.Rows[i].Cells[h].Text).ToUpper().Trim();
            }
            strValoresRenglon[i] = strValoresRenglon[i] + '|';
        }


        try
        {

            //StreamWriter sw = new StreamWriter("C:\\prueba.txt");
            StreamWriter sw = new StreamWriter(System.Configuration.ConfigurationManager.AppSettings["rutaArchivosDIOT"].ToString() + "\\" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".txt");
            
            for (h = 0; h < strValoresRenglon.Length; h++)
            {
                sw.WriteLine(strValoresRenglon[h]);
            }


            sw.Close();
        }
        catch (Exception exc)
        {
            //Console.WriteLine("Exception: " + e.Message);
        }
        finally
        {
            Console.WriteLine("Executing finally block.");
        }

        HyperLink1.Visible = true;
        HyperLink1.NavigateUrl = "";
        HyperLink1.NavigateUrl = "~/Archivos/DIOT/" + "/" + strNombreArchivo + "-" + Session["usuarioID"].ToString() + ".txt";


    }

    public String quitaCaracteresRaros(String strCadena)
    {

        strCadena = strCadena.Replace("&nbsp;", " ");
        strCadena = strCadena.Replace("&#225;", "Á");
        strCadena = strCadena.Replace("&#201;", "É");
        strCadena = strCadena.Replace("&#205;", "Í");
        strCadena = strCadena.Replace("&#211;", "Ó");
        strCadena = strCadena.Replace("&#218;", "Ú");
        strCadena = strCadena.Replace("&amp;", "&");
        if (strCadena == "0")
        {
            strCadena = "";
        }
        return strCadena;
    }
    protected void txtrazonsocial_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
