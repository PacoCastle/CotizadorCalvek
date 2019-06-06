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
using cotizadorTableAdapters;


public partial class Catalogos_TipoCambio_TraeTipoCambioEuro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        Button1_Click(sender,e);
        Response.Write("<script type=\"text/javascript\">window.open('','_self','');window.close();</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Net.WebClient client = new System.Net.WebClient();
        Stream d;
        StreamReader r;
        string line;
        string linen;
        int cuenta=0;
        bool encontrado=false;
        //d = client.OpenRead("http://www.banxico.org.mx/SieInternet/consultarDirectorioInternetAction.do?accion=consultarCuadroAnalitico&idCuadro=CA113&sector=6&presentacionCompacta=true&locale=es"); // Accede a la pagina que quieres buscar11.
        d = client.OpenRead("http://www.banxico.org.mx/SieInternet/consultarDirectorioInternetAction.do?accion=consultarCuadroAnalitico&idCuadro=CA113&sector=6&locale=es"); // Accede a la pagina que quieres buscar11.
        r = new StreamReader(d); // lee la informacion o contenido de la web     
        line = r.ReadLine(); // recorre linea x linea la web   
        while(line!=null) // mientras exista contenido     
        {         
                 
            line = r.ReadLine(); 
            if (line!=null)
            {
                linen = line.Replace(" ","");
                if ((linen=="Euro3/") || (encontrado))
                {
                    cuenta++;
                    encontrado=true;
                }
                if (cuenta==4)
                {
                    Label1.Text = linen;
                    break;
                }
            }
        }
        d.Close();
        try
        {
            if (Label1.Text != "")
            {
                int? res = -1;
                set_insertaTipoCambio_EUROTableAdapter setTipoCAmbioEuro = new set_insertaTipoCambio_EUROTableAdapter();
                setTipoCAmbioEuro.GetData(System.Convert.ToDouble(Label1.Text),ref res);

                if (res == 1)
                {
                    Label1.Text = "OK";
                }
                else
                {
                    Label1.Text = "ERROR";
                }
            }
        }
        catch (Exception ex)
        {
            Label1.Text = "ERROR CATCH";
        }      
        
    }    
}