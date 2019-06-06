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

public partial class Admin_compras_caidaCompras : System.Web.UI.Page
{
    private static int NUMFUNCION = 40;
    int intNumeroPartida = 0;
    Double DblTotal = 0.0;



    protected void Page_Load(object sender, EventArgs e)
    {
        lblFecha.Text = Request["Fecha"].ToString();//DateTime.Now.ToString("d");
        LINEAID.Text = Request["strLineaId"].ToString(); //PreviousPage.strLineaId;
        Marca.Text = Request["strMarca"].ToString(); //PreviousPage.strMarca;


        sucursal.Text = Request["strSucursal"].ToString(); //PreviousPage.strSucursal;
        TipoDocumento.Text = Request["strTipoDocumento"].ToString(); //PreviousPage.strTipoDocumento;
        ////Agentes.Text = PreviousPage.strAgentes;
        ////Cliente.Text = PreviousPage.strCliente;
        ////Pedido.Text = PreviousPage.strPedido;

        compraId.Text = Request["strCompraId"].ToString(); //PreviousPage.strCompraId;

        lblClave.Text = Request["strClaveProveedor"].ToString(); //PreviousPage.strClaveProveedor;
        lblProveedor.Text = Request["strNombreProveedor"].ToString(); //PreviousPage.strNombreProveedor;
        lblComentario.Text = Request["strComentario"].ToString(); //PreviousPage.strComentario;

        switch (sucursal.Text)
        {
            case "001":
                lblSucursal.Text = "Automatización";
                
                //lblFolio.Text = "XA3501-A" + Right(("000000" + PreviousPage.strFolioDocumento), 6);
                lblFolio.Text = "XA350" + Request["Tipo"].ToString() + "-A" + Right(("000000" + Request["strFolioDocumento"].ToString()), 6);
                break;
            case "002":
                lblSucursal.Text = "San Luis";
                lblFolio.Text = "XA350" + Request["Tipo"].ToString() + "-S" + Right(("000000" + Request["strFolioDocumento"].ToString()), 6);
                break;
            case "003":
                lblSucursal.Text = "Queretaro";
                lblFolio.Text = "XA350" + Request["Tipo"].ToString() + "-Q" + Right(("000000" + Request["strFolioDocumento"].ToString()), 6);
                break;
            case "004":
                lblSucursal.Text = "Celaya";
                lblFolio.Text = "XA350" + Request["Tipo"].ToString() + "-C" + Right(("000000" + Request["strFolioDocumento"].ToString()), 6);
                break;
            default:
                break;
        }

        Moneda.Text = Request["strMoneda"].ToString();//PreviousPage.strMoneda;

        switch (Moneda.Text)
        {
            case "1":
                lblMoneda.Text = "PESOS";
                break;
            case "2":
                lblMoneda.Text = "DOLARES";
                break;
            case "3":
                lblMoneda.Text = "EUROS";
                break;
            default:
                break;
        }

    }

    public int get_numeroPartida()
    {
        intNumeroPartida += 1;
        return intNumeroPartida;
    }

    public Double Get_Amount(int intCantidad2, Double dblCosto2)
    {
        DblTotal = intCantidad2 * dblCosto2;

        //lblSubTotal.Text = Math.Round(DblTotal, 2).ToString("F2");
        lblSubtotal1.Text = String.Format("{0:#,##0.00}", Math.Round(Double.Parse(lblSubtotal1.Text) + DblTotal, 2));
        calculaSubTotal2();
        calculaTotal();
        return DblTotal;
    }


    public void calculaSubTotal2()
    {
        Double dblTotal = 0;
        Double dblFlete = 0;
        Double dblDescuento = 0;

        if(lblFlete.Text!="")
            dblFlete = Double.Parse(lblFlete.Text);
        else
            lblFlete.Text = String.Format("{0:#,##0.00}", 0);

        if(lblDescuento.Text!="")
            dblDescuento = Double.Parse(lblDescuento.Text);
        else
            lblDescuento.Text = String.Format("{0:#,##0.00}", 0);

        dblTotal = Math.Round(((Double.Parse(lblSubtotal1.Text) + dblFlete - dblDescuento)), 2);
        lblSubtotal2.Text = String.Format("{0:#,##0.00}", dblTotal);
    }

    public void calculaTotal()
    {
        Double dblTotal = 0;
        Double dblIEPS = 0;
        Double dblIVA = 0;

        if(lblIEPS.Text!="")
            dblIEPS = Double.Parse(lblIEPS.Text);
        else
            lblIEPS.Text = String.Format("{0:#,##0.00}", 0);


        if (lblSubtotal2.Text != "")
            {
             if (Int32.Parse(Request["Tipo"].ToString())==1)
                 {
                    dblIVA = Double.Parse(lblSubtotal2.Text) * (0.16);
                    lblIVA.Text = String.Format("{0:#,##0.00}", dblIVA);
                }
                else
                {
                    dblIVA = 0;
                    lblIVA.Text = String.Format("{0:#,##0.00}", 0);
                }
            }
        else
            {
            dblIVA = 0;
            lblIVA.Text = String.Format("{0:#,##0.00}", 0);
            }

        dblTotal = Math.Round(((Double.Parse(lblSubtotal2.Text) + dblIEPS + dblIVA)), 2);
        lblTotal.Text = String.Format("{0:#,##0.00}", dblTotal);
    }

    public static string Right(string param, int length)
    {
    //start at the index based on the lenght of the sting minus
    //the specified lenght and assign it a variable
    string result = param.Substring(param.Length - length, length);
    //return the result of the operation
    return result;
    }

}
