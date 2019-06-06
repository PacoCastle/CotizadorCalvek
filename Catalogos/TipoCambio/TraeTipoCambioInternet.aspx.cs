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
using System.Net;
using System.IO;
using System.Text;

public partial class Catalogos_TipoCambio_TraeTipoCambioInternet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCodigo.Text = "intGuardar: " + Request.QueryString["intGuardar"];
        lblCodigo.Text += " intDay: " + Request.QueryString["intDay"];
        lblCodigo.Text += " intMonth: " + Request.QueryString["intMonth"];
        lblCodigo.Text += " intYear: " + Request.QueryString["intYear"];

        String strDay = "";
        String strMonth = "";
        String strYear = "";

        DateTime CurrTime = DateTime.Now;

        if (Request.QueryString["intDay"] != null && Request.QueryString["intMonth"] != null && Request.QueryString["intYear"] != null)
        {
            strDay = Request.QueryString["intDay"].ToString();
            strMonth = Request.QueryString["intMonth"].ToString();
            strYear = Request.QueryString["intYear"].ToString();
        }
        else
        {

            strDay = Right("00" + CurrTime.Day.ToString(), 2);
            strMonth = Right("00" + CurrTime.Month.ToString(), 2) ;
            strYear = CurrTime.Year.ToString();
        }

        // strfecha = strDay + "/" + strMonth + "/" + strYear;

        string fileName = "E:\\cotizador\\CotizadorCalvek\\Logs\\logTipoCambio.txt";
        //FileStream stream = new FileStream(fileName, FileMode.OpenOrCreate, FileAccess.Write);
        FileStream stream = new FileStream(fileName, FileMode.Append);
        StreamWriter writer = new StreamWriter(stream);
        writer.WriteLine("--------------------  {0:d}  --------------------", CurrTime);

        try
        {
            String baseUri = "http://www.diariooficial.gob.mx/indicadores_detalle.php?cod_tipo_indicador=158&dfecha=" + strDay + "%2F" + strMonth + "%2F" + strYear + "&hfecha=" + strDay + "%2F" + strMonth + "%2F" + strYear;
        lblCodigo.Text += "<BR>" + baseUri;
        HttpWebRequest connection =
        (HttpWebRequest)HttpWebRequest.Create(baseUri);

        connection.Method = "GET";
        HttpWebResponse response = (HttpWebResponse)connection.GetResponse();

        StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.UTF8);

        string sLine = "";
        ArrayList arrText = new ArrayList();

        while (sLine != null)
        {
            sLine = sr.ReadLine();
            if (sLine != null)
                arrText.Add(sLine);
        }
        sr.Close();

        String strCadena;
        int intConteo = 0;
        foreach (string sOutput in arrText)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(sOutput, "width=\"52%\"", System.Text.RegularExpressions.RegexOptions.IgnoreCase))
            {
                strCadena = sOutput.Trim();
                strCadena = strCadena.Replace('<', ',');
                strCadena = strCadena.Replace('>', ',');
                string[] words = strCadena.Split(',');
                ////lblCodigo.Text += "<BR>" + sOutput.Trim();
                //foreach (string s in words)
                //{
                //    lblCogido.Text += "<BR>" + s;
                //}
                intConteo++;
                
                lblCodigo.Text += "<BR>Conteo: " + intConteo + " valor:" + words[2].Trim();

                if (intConteo == 2)
                {
                    if (Request.QueryString["intGuardar"] != null && Request.QueryString["intGuardar"].ToString() == "1")
                    {
                        TipoCambioVO VO = new TipoCambioVO();
                        TipoCambioBL BL = new TipoCambioBL();
                        DateTime fechaTipoCambio = new DateTime(Int32.Parse(strYear), Int32.Parse(strMonth), Int32.Parse(strDay));
                        //VO.MonedaId = 1;
                        VO.FechaTipoCambio = fechaTipoCambio;
                        VO.Cambio = Double.Parse(words[2].Trim());
                        VO.Operacion = TipoCambioVO.INSERTAR;
                        VO = (TipoCambioVO)BL.execute(VO);
                        if (VO.Resultado == 0)
                        {
                            lblCodigo.Text += "<BR>SE INSERTO CORRECTAMENTE";
                            writer.WriteLine("SE INSERTO CORRECTAMENTE EN BD");
            //try
            //                {
            //                String baseUri2 = "http://mexmessag.nextelinternational.com/cgi/iPageExt.dll?ignore=4421481820&subject=alerta_TipoCambio&message=" + VO.FechaTipoCambio + "%20Tipo%20de%20cambio:%20" + VO.Cambio + "%20correctamente%20Y%20Pagina&oneWayPTNs=4421481820&cmd=sendPage";
            //                HttpWebRequest connection2 = (HttpWebRequest)HttpWebRequest.Create(baseUri2);

            //                connection.Method = "GET";
            //                HttpWebResponse response2 = (HttpWebResponse)connection2.GetResponse();
            //                //----
            //                }
            //                catch (Exception ex)
            //                {
            //                    writer.WriteLine("Excepcion: " + ex.Message);
            //                }

                        }
                        else
                        {
                            lblCodigo.Text += "<BR>FALLO LA INSERCION";
                            writer.WriteLine("NO SE INSERTO EL REGISTRO EN BD");
                        }
                    }
                }
                writer.WriteLine("" +words[2].Trim());

            }
        }


    }
    catch (Exception ex)
    {
        writer.WriteLine("Excepcion: " + ex.Message);
    }


        writer.Close();
        //Response.Write("<script type=\"text/javascript\">window.open('','_self','');window.close();</script>");

    }

    private string Right(string s, int count)
    {
        string newString = String.Empty;
        if (!string.IsNullOrEmpty(s) && count > 0)
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
