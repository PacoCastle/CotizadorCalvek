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
using saludos;

public partial class ejemplos_pruebaSDK : System.Web.UI.Page
{
    private void InitializeComponent()
    {
        this.Calendar1.DayRender += new System.Web.UI.WebControls.DayRenderEventHandler(this.Calendar1_DayRender);
        this.Load += new System.EventHandler(this.Page_Load);

    }
    private void Calendar1_DayRender(Object source, DayRenderEventArgs e)
    {
        // Check for May 5 in any year, and format it.
        if (e.Day.Date.Day == 5 && e.Day.Date.Month == 5)
        {
            e.Cell.BackColor = System.Drawing.Color.Yellow;

            // Add some static text to the cell.
            Label lbl = new Label();
            lbl.Text = "<br>My Birthday!";
            e.Cell.Controls.Add(lbl);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //DateTime fecha = DateTime.Today;
        /*String agno = DateTime.Today.Year.ToString();
        String mes = DateTime.Today.Month.ToString().PadLeft(2, '0');
        String dia = DateTime.Today.Day.ToString().PadLeft(2, '0');
        Response.Write("año: " + agno);
        Response.Write("<br>mes: " + mes.PadLeft(2, '0'));
        Response.Write("<br>dia: " + dia.PadLeft(2, '0'));*/
        //prueba fallida
        //long result = 0;
        //result = AdminSDK.fInicializaSDK();
        //Response.Write("El resultado es: "+ result);
        /*String carpetaEmpresa = "E:/DiscoD/Proyectos/Cotizador/Empresas/prueba1";
        saludo prueba = new saludoClass();
        long result = 0;
        result = prueba.inicializa();
        Response.Write("El resultado es: " + result);
        result = prueba.AbrirEmpresa(ref carpetaEmpresa);
        Response.Write("<br>El resultado es: " + result);
        if (result == 0)
        {
            prueba.CerrarEmpresa();
            prueba.finaliza();
        }
        prueba.finaliza();
        Response.Write("<br>El resultado es: " + result);*/
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
}
