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
using System.Text.RegularExpressions;

public partial class Catalogos_Productos_ArchivoProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
         * guardar log de operaciones y registros hechos
         * guardar log de errores
         * Preguntar la operacion a ejecutar actualizacion o insercion
         */
    }
    protected void cblCampos_SelectedIndexChanged(object sender, EventArgs e)
    {
        //strBidType = "";
        //for (int counter = 0; counter < cblCampos.Items.Count; counter++)
        //{
        //    if (cblCampos.Items[counter].Selected)
        //    {
        //        lblMensaje.Text += cblCampos.Items[counter].Value + " / ";
        //    }
        //}

        txtMensaje.Text = "El archivo debe contener las columnas: MODELO-PARTE (sin comas)";
        Boolean bdnCampos = false;
        foreach (ListItem cBox in cblCampos.Items)
        {
            if (cBox.Selected)
            {
                bdnCampos = true;
                switch (Int32.Parse(cBox.Value))
                {
                    case 1:
                        txtMensaje.Text += "," + cBox.Text + " (sin comas)";
                        break;
                    case 2:
                        txtMensaje.Text += "," + cBox.Text + " (númerico, sin signos)";
                        break;
                    case 3:
                        txtMensaje.Text += "," + cBox.Text + " (dolares,pesos,euros)";
                        break;
                    case 4:
                        txtMensaje.Text += "," + cBox.Text + " (númerico, sin signos)";
                        break;
                    default:
                        txtMensaje.Text = "";
                        break;
                }
            }

        } 
        if(!bdnCampos)
            txtMensaje.Text = "";

    }

    protected void btnAgregaArchivo_Click(object sender, EventArgs e)
    {

        int intConteoCampos = 0;
        int intConteoCamposArchivos = 0;

        Boolean blnError = false;
        Boolean blnCampoPrecio = false;
        Boolean blnCampoMoneda = false;
        Boolean blnCampoTE = false;
        Boolean bdnCampos = false;
        Boolean bdnTipoArchivo = true;

        String strMensajeError="";

        int intPosicionPrecio=0;
        int intPosicionMoneda=0;
        int intPosicionTE = 0;

        String strExtensionArchivo = fulArchivoProductos.FileName.ToString().Substring(fulArchivoProductos.FileName.ToString().Length-3);
        String strRuta = MapPath("~/Archivos/AdmProductos/" + fulArchivoProductos.FileName.ToString());

        if (strExtensionArchivo.ToUpper() == "TXT" || strExtensionArchivo.ToUpper() == "CSV")
            {
                    bdnCampos = true;
                    // Subiendo archivo
                    fulArchivoProductos.SaveAs(strRuta);

                    // Mostramos un mensaje de exito al usuario
                    lblNombreArchivo.Text = fulArchivoProductos.FileName.ToString();
                    lblMensajeArchivo.Text = " se agrego con éxito.";

                    lblArchivo.Visible = false;
                    fulArchivoProductos.Visible = false;
                    btnAgregaArchivo.Visible = false;
                    lblNombreArchivo.Visible = true;
                    lblMensajeArchivo.Visible = true;

                    //----

                    foreach (ListItem cBox in cblCampos.Items)
                    {
                        if (cBox.Selected)
                        {
                            bdnCampos = true;
                            switch (Int32.Parse(cBox.Value))
                            {
                                case 1:
                                    //Descripción
                                    break;
                                case 2:
                                    //Precio
                                    blnCampoPrecio = true;
                                    intPosicionPrecio = intConteoCampos;
                                    intPosicionPrecio++;
                                    break;
                                case 3:
                                    //Moneda
                                    blnCampoMoneda = true;
                                    intPosicionMoneda = intConteoCampos;
                                    intPosicionMoneda++;
                                    break;
                                case 4:
                                    //Tiempo de entrega
                                    blnCampoTE = true;
                                    intPosicionTE = intConteoCampos;
                                    intPosicionTE++;
                                    break;
                                default:
                                    //nada
                                    break;
                            }
                            intConteoCampos++;
                        }
                    }
            }
        else
            {
                bdnTipoArchivo = false;
            }

            if (!bdnCampos || !bdnTipoArchivo)
        {
            blnError = true;
            if (!bdnTipoArchivo)
                strMensajeError = "Solo acepta archivos: txt o csv.";
            else if (!bdnCampos)
                strMensajeError = "Debe estar seleccionado por lo menos una opción del listado de campos.";
        }
        else 
        {
            // sacar el numero de columnas que tiene el archivo y compararlo con los campos seleccionados.
            StreamReader objReader = new StreamReader(strRuta);
            string sLine = "";
            sLine = objReader.ReadLine();
            String[] strCamposArchivo = sLine.Split(',');
            if (sLine != null)
            {
                intConteoCamposArchivos = strCamposArchivo.Length;
                intConteoCampos++; // Agregando uno mas por la columna del modelo.
                if (intConteoCamposArchivos != intConteoCampos)
                {
                    // no coinciden mandar mensaje de no coincidencia.
                    blnError = true;
                    strMensajeError = "No coincide las columnas seleccionadas con las columnas del archivo. verifique y vuelva a cargarlo";
                }
                else
                {
                    // si coinciden el numero de campos, leer el archivo revisar formato de los campos. modelo(alfanumerico), descripcion(alfanumerico), precio(numerico) y moneda(texto, peso,dolar,euro)
                    while (sLine != null)
                    {
                        if(blnCampoPrecio)
                            {
                                Decimal decResultado;
                                if (!decimal.TryParse(strCamposArchivo[intPosicionPrecio], out decResultado) || decimal.Parse(strCamposArchivo[intPosicionPrecio])<0)
                                {
                                    blnError = true;
                                    strMensajeError = "Valor no valido en la columna Precio. [Parte:" + strCamposArchivo[0] + "]. Verifique la información y vuelva a cargar el archivo";
                                    break;
                                }
                                //string sPattern = "ñ";

                                //if (System.Text.RegularExpressions.Regex.IsMatch(strCamposArchivo[intPosicionPrecio], sPattern, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                                //{
                                //    blnError = true;
                                //    strMensajeError = "Valor no valido en la columna Precio. [Parte:" + strCamposArchivo[0] + "]";
                                //    break;
                                //}

                            }

                       if (blnCampoMoneda)
                            {
                                if (strCamposArchivo[intPosicionMoneda].ToUpper() == "PESOS")
                                 {
                                 }
                                 else if (strCamposArchivo[intPosicionMoneda].ToUpper() == "DOLARES")
                                 {
                                 }
                                 else if (strCamposArchivo[intPosicionMoneda].ToUpper() == "EUROS")
                                 {
                                 }
                                else
                                {
                                blnError = true;
                                strMensajeError = "Valor no valido en la columna Moneda. [Parte:" + strCamposArchivo[0] + "]. Verifique la información y vuelva a cargar el archivo";
                                break;
                                }
                            }
                       if (blnCampoTE)
                            {
                                Int32 intResultado;
                                if (!Int32.TryParse(strCamposArchivo[intPosicionTE], out intResultado))
                                {
                                    blnError = true;
                                    strMensajeError = "Valor no valido en la columna Tiempo de Entrega. [Parte:" + strCamposArchivo[0] + "]. Verifique la información y vuelva a cargar el archivo";
                                    break;
                                }
                            }
                        
                        sLine = objReader.ReadLine();
                        if (sLine != null)
                        strCamposArchivo = sLine.Split(',');
                    }
                }
            }
            else
            {
                // archivo vacio mandar mensaje
                blnError = true;
                strMensajeError = "El archivo no contiene información";
            }

            objReader.Close();
        }
        //----
        if (blnError)
        {
            lblMensajeConfirmacion.Text = strMensajeError;
            lblMensajeConfirmacion.ForeColor = System.Drawing.Color.Red;
            lblArchivo.Visible = true;
            fulArchivoProductos.Visible = true;
            btnAgregaArchivo.Visible = true;
            File.Delete(System.Configuration.ConfigurationManager.AppSettings["rutaArchivosProductos"].ToString() + lblNombreArchivo.Text);
        }
        else
        {
            lblMensajeConfirmacion.Visible = false;
            lblEtiquetaSelecciona.Visible = false;
            btnContinuar.Visible = true;
        }

        //----
    }

    protected void btnContinuar_Click(object sender, EventArgs e)
    {

        String strNombreArchivo = "";
        //Char separator = ',';
        //String Line;
        //String[] PartsLine;

        //DataTable DrResult = new DataTable();
        //int intNoColumnas = 0;

       
        //DrResult.Columns.Add(new DataColumn("ModeloA", typeof(System.String)));
        //DrResult.Columns.Add(new DataColumn("DescripcionA", typeof(System.String)));
        //DrResult.Columns.Add(new DataColumn("PrecioA", typeof(System.String)));
        //DrResult.Columns.Add(new DataColumn("MonedaA", typeof(System.String)));
        //DrResult.Columns.Add(new DataColumn("TiempoEntregaA", typeof(System.String)));
        //DataRow dr;

        foreach (ListItem cBox in cblCampos.Items)
        {
            if (cBox.Selected)
            {
                
                switch (Int32.Parse(cBox.Value))
                {
                    case 1:
                        txtBanderaDescripcion.Text = "1";
                        break;
                    case 2:
                        txtBanderaPrecio.Text = "1";
                        break;
                    case 3:
                        txtBanderaMoneda.Text = "1";
                        break;
                    case 4:
                        txtBanderaTE.Text = "1";
                        break;
                    default:
                        
                        break;
                }
            }

        }

        ////Guardamos el archivo en la carpeta “Archivos” del servidor, tu puedes guardarlo en larpeta que quieras de tu servidor
        ////fulArchivos.SaveAs(MapPath("~/Archivos/AdmProductos/" + fulArchivos.FileName.ToString()));

        ////Mostramos un mensaje de exito al usuario
        
        strNombreArchivo = lblNombreArchivo.Text;

        //txtRuta.Text = "C:\\cotizador\\CotizadorCalvek\\Archivos\\AdmProductos\\" + strNombreArchivo;
        txtRuta.Text = System.Configuration.ConfigurationManager.AppSettings["rutaArchivosProductos"].ToString() + strNombreArchivo;

        //StreamReader Sr = null;
        //try
        //{
        //    //StringBuilder stb = new StringBuilder();
        //    Sr = new StreamReader("C:\\cotizador\\CotizadorCalvek\\Archivos\\AdmProductos\\" + strNombreArchivo);
        //    //Sr = new StreamReader("C:\\Archivos\\AdmProductos\\" + strNombreArchivo);
        //    //Sr = new StreamReader(strRuta);
        //    int intContador = 0;
        //    while (Sr.Peek() != -1)
        //    {
        //        Line = Sr.ReadLine();
        //        PartsLine = Line.Split(separator);
        //        intNoColumnas = PartsLine.Length;

        //            DataRow DrNew = DrResult.NewRow();
        //            //for (int x = 0; x < DrResult.Columns.Count; x++)
        //            for (int x = 0; x < PartsLine.Length; x++)
        //            {
        //                DrNew[x] = PartsLine[x].ToString().Trim();
        //            }

        //            dr = DrResult.NewRow();
        //            dr["ModeloA"] = DrNew[0];
        //            dr["DescripcionA"] = DrNew[1];
        //            dr["PrecioA"] = DrNew[2];
        //            dr["MonedaA"] = DrNew[3];
        //            dr["TiempoEntregaA"] = DrNew[4];

        //            DrResult.Rows.Add(dr);
        //            intContador += 1;
        //            DrNew = null;
        //        }

        //    //txtConteoCampos.Text = intNoColumnas.ToString();
        //   // GridView1.DataSource = DrResult;
        //   // GridView1.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    lblMensajeValidacion.Text = "error: " + ex;
        //}
        //finally
        //{
        //    Sr.Close();
        //    Sr.Dispose();
        //    Sr = null;
        //}

        gvProductos.Visible = true;
        btnActualizar.Visible = true;
        btnContinuar.Visible = false;

    }
    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        Response.Redirect("ActualizaProductos.aspx?strArchivo="+ txtRuta.Text +"&intMarcaId="+ lstMarcas.SelectedItem.Value.ToString() +"&intBanderaDescripcion="+ txtBanderaDescripcion.Text +"&intBanderaPrecio="+ txtBanderaPrecio.Text +"&intBanderaMoneda="+ txtBanderaMoneda.Text +"&intBanderaTE="+ txtBanderaTE.Text);
    }
}
