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
using System.Data.OleDb;
using System.Data;

public partial class Cobranza_subirArchivoDeposito : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bSubirArchivo_Click(object sender, EventArgs e)
    {
        String strNombreArchivo="";
        //Guardamos el archivo en la carpeta “Archivos” del servidor, tu puedes guardarlo en larpeta que quieras de tu servidor
        fuCargarArchivo.SaveAs(MapPath("~/Archivos/" + fuCargarArchivo.FileName.ToString()));
        //Mostramos un mensaje de exito al usuario
        strNombreArchivo = fuCargarArchivo.FileName.ToString();
        lMensajeExito.Text = "El archivo: " + strNombreArchivo + " se cargo con exito en el servidor";

        String sheetName = "Hoja1";

        if(Right(strNombreArchivo,4)==".xls")
        {
        OleDbConnection dbConn = null;
        DataTable resultTable = new DataTable(sheetName);
        // Build connection string.
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + "D:\\cotizador\\CotizadorCalvek\\Archivos\\" + strNombreArchivo + ";Extended Properties=Excel 8.0;";
        // Create connection and open it.
        dbConn = new OleDbConnection(connString);
        dbConn.Open();

        if (!sheetName.EndsWith("$"))
            {
                sheetName += '$';
            }
            string query = string.Format("SELECT * FROM [{0}]", sheetName);
        using (OleDbDataAdapter adapter = new OleDbDataAdapter(query, dbConn))
            {
                adapter.Fill(resultTable);
            }

            lblResultados.Text += resultTable.Rows.Count + "<BR>";
        foreach (DataColumn a in resultTable.Columns)
            {
                //Console.WriteLine(a.DataType.ToString() + " " + a.ToString());
                lblResultados.Text += a.DataType.ToString() + " " + a.ToString();
            }

        }

    }
    public string Right(string s, int count)
    {
        string newString = String.Empty;
        if (s != null && count > 0)
        {
            int startIndex = s.Length - count;
            if (startIndex > 0)
                newString = s.Substring(startIndex, count);
            else
                newString = s;
        }
        return newString;
    }
}
