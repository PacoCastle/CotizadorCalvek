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
using System.Data;

public partial class ejemplos_pruebaSubeArchivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bSubirArchivo_Click(object sender, EventArgs e)
    {
        
         //Guardamos el archivo en la carpeta “Archivos” del servidor, tu puedes guardarlo en larpeta que quieras de tu servidor
        fuCargarArchivo.SaveAs(MapPath("~/Archivos/" + fuCargarArchivo.FileName.ToString()));
        //Mostramos un mensaje de exito al usuario
        lMensajeExito.Text = "El archivo: " + fuCargarArchivo.FileName.ToString() + " se cargo con exito en el servidor";
        //Llamo el metodo listar archivos subidos al servidor
        ListarArchivosServidor(); 
    }

    private void ListarArchivosServidor()
    {

    //Clase para el manejo de archivos
    FileInfo InformacioArchivo;
    //LLenar un arreglo con la lista de archivos que estan en la carpeta “Archivos” del servidor
    string[] ListaArchivos = Directory.GetFiles(MapPath("~/Archivos/").ToString());
    //Declaro un objeto DataTable para llenarlo con la informacion de los archivos
    DataTable TablaArchivos = new DataTable();
    //Declaro un objeto DataTable para agregar las filas al DataTable
    DataRow FilasTablaArchivos;
    //LLamo el metodo CrearTablaArchivos para darle formato al DataTable
    TablaArchivos = CrearTablaArchivos();
    //Recorro el arreglo con toda la lista de archvivos

        foreach (string archivo in ListaArchivos)
        {
            //Declaro un objeto de tipo FileInfo y le llevo el nombre del archivo
            InformacioArchivo = new FileInfo(archivo);
            //Crea una fila con el formato del DataTable
            FilasTablaArchivos = TablaArchivos.NewRow();
            //Guardo la informaccion del archivo en la fila
            FilasTablaArchivos["NombreArchivo"] = InformacioArchivo.Name.ToString();
            FilasTablaArchivos["Tamaño"] = InformacioArchivo.Length.ToString("#,#") + " bytes";
            FilasTablaArchivos["Fecha"] = InformacioArchivo.CreationTime.ToString();
            //Agrego la fila al DataTable
            TablaArchivos.Rows.Add(FilasTablaArchivos);
        }

    //Lleno el GridVieww con el DataTable “TablaArchivos”
    gListaArchivos.DataSource = TablaArchivos.DefaultView;
    gListaArchivos.DataBind();

    }

    private DataTable CrearTablaArchivos()
    {
    //Declaro un objeto de tipo DataTable
    DataTable dt = new DataTable();
    //Declaro un objeto de tipo DataColumn
    DataColumn Columnas;
    //Nueva instancia del objeto “Columnas”
    Columnas = new DataColumn();
    //Tipo de dato de la columna
    Columnas.DataType = System.Type.GetType("System.String");
    //Nombre de la columna
    Columnas.ColumnName = "NombreArchivo";
    //Agrego la columna al DataTable
    dt.Columns.Add(Columnas);

    Columnas = new DataColumn();
    Columnas.DataType = System.Type.GetType("System.String");Columnas.ColumnName = "Tamaño";
    dt.Columns.Add(Columnas);

    Columnas = new DataColumn();
    Columnas.DataType = System.Type.GetType("System.String");
    Columnas.ColumnName = "Fecha";

    dt.Columns.Add(Columnas);

    return dt;

    }




}
