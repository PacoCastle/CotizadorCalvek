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

public partial class Admin_Polizas_caidaPolizas : System.Web.UI.Page
{

    private static int NUMFUNCION = 33;

    Double dblTotalCargo = 0.0;
    Double dblTotalAbono = 0.0;
    int intNumeroPoliza = 0;
    int intTmpNumeroPoliza = 0;
    int intConteoDataList = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        // SEGURIDAD
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

    lblSucursal.Text = PreviousPage.sucursalId;
    lblMes.Text = PreviousPage.mesId;
    lblCliente.Text = PreviousPage.clienteId;
    lblFechaDe.Text = PreviousPage.fechaDe;
    lblFechaA.Text = PreviousPage.fechaA;
    lblTipoPoliza.Text = PreviousPage.tipoPoliza;
    }

    public String Get_CantidadCargo(String strValor)
    {
        if (strValor.Trim().Length > 0)
            {
            if (!intNumeroPoliza.Equals(intTmpNumeroPoliza))
               {
                dblTotalCargo = 0;
                dblTotalAbono = 0;
                intTmpNumeroPoliza = intNumeroPoliza;
               }
                    
            dblTotalCargo += Double.Parse(strValor);
            return String.Format("{0:#,##0.00}", Double.Parse(strValor));
            }
        else
            {
                return "";
            }
    }

    public String Get_CantidadAbono(String strValor)
    {
        if (strValor.Trim().Length > 0)
            {
            if (!intNumeroPoliza.Equals(intTmpNumeroPoliza))
                {
                    dblTotalCargo = 0;
                    dblTotalAbono = 0;
                    intTmpNumeroPoliza = intNumeroPoliza;
                }
            dblTotalAbono += Double.Parse(strValor);
            return String.Format("{0:#,##0.00}", Double.Parse(strValor));
            }
        else
            {
                return "";
            }
    }

    public String Get_totalCargo()
    {
        return String.Format("{0:#,##0.00}", dblTotalCargo);
    }

    public String Get_totalAbono()
    {
        return String.Format("{0:#,##0.00}", dblTotalAbono);
    }

    public String Get_numeroPoliza(String strValor)
    {
      intNumeroPoliza = int.Parse(strValor);
      return strValor;
    }


    public void DataList_ItemCreated(Object sender, DataListItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item ||
            e.Item.ItemType == ListItemType.AlternatingItem)
        {
            intConteoDataList++;

            // Retrieve the Label control in the current DataListItem.
            Label conteoLabel = (Label)e.Item.FindControl("lblSaltoPagina");
            Panel pnlSaltoLinea = (Panel)e.Item.FindControl("pnlSaltoLinea");
            Label lblDirCalvek = (Label)e.Item.FindControl("lblDirCalvek");
            Image imgLogoCalvek = (Image)e.Item.FindControl("imgLogoCalvek");
             
            //conteoLabel.Text = "Conteo: " + intConteoDataList.ToString() + " mod:" + intConteoDataList%2;
            if ((intConteoDataList % 3) == 1)
                {
                pnlSaltoLinea.Visible = false;
                lblDirCalvek.Visible = true;
                imgLogoCalvek.Visible = true;
                }
            else if((intConteoDataList % 3) == 0)
                {
                pnlSaltoLinea.Visible = true;
                lblDirCalvek.Visible = false;
                imgLogoCalvek.Visible = false;
                }
            else
                {
                pnlSaltoLinea.Visible = false;
                lblDirCalvek.Visible = false;
                imgLogoCalvek.Visible = false;
                }

                pnlSaltoLinea.Dispose();
                conteoLabel.Dispose();
                lblDirCalvek.Dispose();
                imgLogoCalvek.Dispose();
        }

    }

}