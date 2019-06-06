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

public partial class Cotizador_caidaCotizacion : System.Web.UI.Page
{
    private static int NUMFUNCION = 8;
    int intBanderaMuestraDescuento = 0;
    //int intBanderaMuestraDescuentoGral = 0;
    int intPrecioSinDescuento = 0;
    int intMostrarComentarios = 0;
    int intNumeroPartida = 0;
    double descuentogral = 0;
    double ivacot = 0;
    double Subtotal2 = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
        intBanderaMuestraDescuento = Int32.Parse(Request.QueryString["intMostrarDescuento"]);
        intPrecioSinDescuento = Int32.Parse(Request.QueryString["intPrecioSinDescuento"]);
        intMostrarComentarios = Int32.Parse(Request.QueryString["intMostrarComentarios"]);
        //intBanderaMuestraDescuentoGral = Int32.Parse(Request.QueryString["intDescGral"]);
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataRowView drv = dv[0];
        descuentogral = Double.Parse(drv["desctogral"].ToString());
        DataView dvi = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        DataRowView drvi = dvi[0];
        ivacot = Int32.Parse(drvi["iva"].ToString());
       
    }

    Double TotalAmount = 0.0;

    ////public Double Get_Amount(Double Price, int Quantity, int intDescuento)
    //public Double Get_Amount(Double Price, int Quantity)
    //{
    //    Double preAmount = 0.0;
    //    Double Amount = 0.0;
    //    //Double factorDescuento = 0;
    //    //factorDescuento = Double.Parse(intDescuento.ToString()) / 100;
    //    preAmount = Price * Quantity;
    //    Amount = Math.Round(preAmount, 2); //- (preAmount * factorDescuento);
    //    TotalAmount += Amount;
    //    return Amount;
    //}

    public Double Get_Amount(Double Price)
    {
        TotalAmount += Price;

        return Price;
    }

    public Double Get_SubTotalSinDesc()
    {
        //Double SubTotalSinDesc = TotalAmount;// *(Double)Application["Shipping"];
        //DesctoGral = Math.Round(TotalAmount * (descuentogral / 100), 2);
        Double SubTotalSinDesc = TotalAmount - Math.Round(TotalAmount * (descuentogral / 100), 2);
        //TotalAmount += Shipping;
        return SubTotalSinDesc;
    }

    public Double Get_SubTotal()
    {
        Double SubTotal = TotalAmount;// *(Double)Application["Shipping"];
        //TotalAmount += Shipping;
        Subtotal2 = TotalAmount;
        return SubTotal;
    }

    public Double Get_Interes()
    {
        
        Double Interes = Math.Round((TotalAmount - Math.Round(TotalAmount * (descuentogral / 100), 2)) * (ivacot / 100), 2);
        TotalAmount = TotalAmount - Math.Round(TotalAmount * (descuentogral / 100), 2) + Interes;
        return Interes;
    }

    public Double Get_Order_Total()
    {
        return Math.Round(TotalAmount, 2);
    }

    public Double Get_Descuento()
    {
        //Double DesctoGral = Math.Round(TotalAmount * (descuentogral / 100), 2); 
        Double DesctoGral = Math.Round(Subtotal2 * (descuentogral / 100), 2); 
        return DesctoGral;
    }


    protected void GridView_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (intBanderaMuestraDescuento < 1)
            {
                Label btnDescuento = (Label)e.Row.FindControl("Label2");
                btnDescuento.Visible = false;
                Label btnSimbolo = (Label)e.Row.FindControl("lblsimbolo");
                btnSimbolo.Visible = false;
                
            }
            if (intPrecioSinDescuento == 1)
            {
            //
                Label lblPrecio = (Label)e.Row.FindControl("Label8");
                lblPrecio.Visible = true;
                Label lblPrecioDescuento = (Label)e.Row.FindControl("Label4");
                lblPrecioDescuento.Visible = false;
            }
            if (intMostrarComentarios == 1)
            {
                Label lblMostrarComentarios = (Label)e.Row.FindControl("Label12");
                lblMostrarComentarios.Visible = true;
            }
            
           
        }

        if (e.Row.RowType == DataControlRowType.Header)
        {
            if (intBanderaMuestraDescuento < 1)
            {
                Label LBLDescuento = (Label)e.Row.FindControl("lblDescuento");
                LBLDescuento.Visible = false;
            }
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblsubtsindesc = (Label)e.Row.FindControl("label11");
            Label lblsubtsindescval = (Label)e.Row.FindControl("SubtSinDesc");
            Label lbldesc = (Label)e.Row.FindControl("label10");
            Label lbldescvalue = (Label)e.Row.FindControl("Descuento");
            if (descuentogral > 0)
            {
                

                //lblsubtsindesc.Enabled = true;
                //lblsubtsindescval.Enabled = true;
                //lblsubtsindesc.Visible = true;
                //lblsubtsindescval.Visible = true;


                


                //lbldesc.Enabled = true;
                //lbldescvalue.Enabled = true;
                lbldesc.Visible = true;
                lbldescvalue.Visible = true;


            }
            else
            {
                //lblsubtsindesc.Enabled = false;
                //lblsubtsindescval.Enabled = false;

                //lbldesc.Enabled = false;
                //lbldescvalue.Enabled = false;

                lbldesc.Visible = false;
                lbldescvalue.Visible = false;
                //lblsubtsindesc.Visible = false;
                //lblsubtsindescval.Visible = false;
            }

            
        }
        
    }

    public int get_numeroPartida()
    {
        intNumeroPartida += 1;
        return intNumeroPartida;
    }

    

}
