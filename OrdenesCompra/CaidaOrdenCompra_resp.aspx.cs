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

public partial class OrdenesCompra_CaidaOrdenCompra : System.Web.UI.Page
{
    private static int NUMFUNCION = 20;
    int intNumeroPartida = 0;
    Double DblTotal = 0.0;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        OrdenCompraBL OCBL = new OrdenCompraBL();
        OrdenCompraVO OCVO = new OrdenCompraVO();
        OCVO.Operacion = OrdenCompraVO.BUSCAR;
        OCVO.OrdenCompraId = Int32.Parse(Request["ordenCompraId"].ToString());
        OCVO = (OrdenCompraVO)OCBL.execute(OCVO);

        lblFecha.Text = OCVO.FechaAlta.ToString("d");
        
        lblFechaEntrega.Text = OCVO.FechaEntrega;
        lblContacto.Text = OCVO.Contacto;
        lblDatosTransferencia.Text = OCVO.DatosTransferencia;
        lblInstruccionesEmbarque.Text = OCVO.InstruccionesEmbarque;
        lblTerminos.Text = OCVO.Terminos;
        lblFob.Text = OCVO.Fob;
        lblProyecto.Text = OCVO.NombreProyecto;
        lblJob.Text = OCVO.NombreJob;
        lblViaEmbarque.Text = OCVO.ViaEmbarque;
        lblMoneda.Text = OCVO.MonedaId.ToString();
        Label6.Text = OCVO.OrdenServicio.ToString();
        lblNombreJefe.Text = OCVO.NombreJefe;

        lblDescuento.Text = OCVO.PorcentajeDescuento.ToString("F2");
        lblEnvio.Text = String.Format("{0:#,##0.00}", OCVO.CostoEnvio);//OCVO.CostoEnvio.ToString("F2");
        lblImpuesto.Text = OCVO.PorcentajeImpuesto.ToString("F2");
        lblImpImportacion.Text = String.Format("{0:#,##0.00}", OCVO.CostoImportacion);//OCVO.CostoImportacion.ToString("F2");

        try
        {
          if (OCVO.AccountName.Trim().Length == 0)
            {
            ((Panel)GridView1.FooterRow.FindControl("pnlBankInformation")).Visible = false;
            }
          else
            {
            ((Label)GridView1.FooterRow.FindControl("lblAccountName")).Text = OCVO.AccountName;
            ((Label)GridView1.FooterRow.FindControl("lblNameAddress")).Text = OCVO.Address;
            ((Label)GridView1.FooterRow.FindControl("lblBankName")).Text = OCVO.BankName;
            ((Label)GridView1.FooterRow.FindControl("lblAccountNumber")).Text = OCVO.AccountNumber;
            ((Label)GridView1.FooterRow.FindControl("lblAba")).Text = OCVO.Aba;
            ((Label)GridView1.FooterRow.FindControl("lblBankAddress")).Text = OCVO.BankAddress;
            }
        }
        catch (Exception ex)
        {
            //((Panel)GridView1.FooterRow.FindControl("pnlBankInformation")).Visible = false;
        }

       lblOrdenCompraId.Text = (OCVO.OrigenId == 1 ? "N-" + OCVO.IdNacional.ToString() : "I-" + OCVO.IdInternacional.ToString());

        ProveedoresBL BL = new ProveedoresBL();
        ProveedoresVO VO = new ProveedoresVO();
        VO.Operacion = ProveedoresVO.BUSCAR;
        VO.ProveedorId = OCVO.ProveedorId;
        VO = (ProveedoresVO)BL.execute(VO);

        //txtContacto.Text = VO.Representante;
        lblProveedor.Text = VO.Nombre;
        lblNombreProveedor.Text = VO.Nombre;
        lblRFC.Text = VO.Rfc;

        DireccionesBL DBL = new DireccionesBL();
        DireccionesVO DVO = new DireccionesVO();
        DVO.Operacion = DireccionesVO.BUSCAR;
        DVO.DireccionId = VO.DireccionId;
        DVO = (DireccionesVO)DBL.execute(DVO);


        lblDireccion.Text = DVO.Calle + " " + DVO.NoExterior + " " + DVO.NoInterior + ", " + DVO.Colonia + ", " + DVO.Cp + ", " + DVO.Ciudad + ", " + DVO.Estado;
        lblEMail.Text = DVO.Email;

        lblTelefono.Text = DVO.Telefono1;
        lblFax.Text = DVO.Fax;

        TipoCambioVO VOtipoCambio = new TipoCambioVO();
        TipoCambioBL BLtipoCambio = new TipoCambioBL();
        VOtipoCambio.MonedaId = OCVO.MonedaId;
        VOtipoCambio.Operacion = TipoCambioVO.BUSCAR;
        VOtipoCambio = (TipoCambioVO)BLtipoCambio.execute(VOtipoCambio);

        if (VOtipoCambio.Descripcion != null)
        {
            lblMoneda.Text = VOtipoCambio.Descripcion;
        }

        usuarioVO VOUsuario = new usuarioVO();
        UsuarioBL BLUsuario = new UsuarioBL();
        VOUsuario.Operacion = usuarioVO.BUSCAR;
        VOUsuario.Usuarioid = OCVO.UsuarioId;
        VOUsuario = (usuarioVO)BLUsuario.execute(VOUsuario);

        lblNombreAgente.Text = VOUsuario.Usuario_nombrecompleto;
        
        InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
        if (Int32.Parse(infoSession.getValor(InfoSessionVO.OFICINA).ToString()) != 4)
        {
            Image1.ImageUrl = "~/Imagenes/caidaCalvek.JPG";
        }
        else
        {
            Image1.ImageUrl = "~/Imagenes/logoCalvekAutomation.jpg";
        }

        OCBL = null;
        OCVO = null;
        BL = null;
        VO = null;
        DBL = null;
        DVO = null;
        VOUsuario = null;
        BLUsuario = null;
        infoSession = null;
    }

    public int get_numeroPartida()
    {
        intNumeroPartida += 1;
        return intNumeroPartida;
    }

    public Double Get_Amount(Double Total)
    {
        DblTotal += Total;

        //lblSubTotal.Text = Math.Round(DblTotal, 2).ToString("F2");
        lblSubTotal.Text = String.Format("{0:#,##0.00}", Math.Round(DblTotal, 2));
        calculaDescuento();
        calculaImpuesto();
        calculaTotal();

        return Total;
    }

    public Double Get_SubTotal()
    {
        Double SubTotal = DblTotal;// *(Double)Application["Shipping"];
        //TotalAmount += Shipping;
        //lblSubTotal.Text = Math.Round(DblTotal, 2).ToString("F2");
        lblSubTotal.Text = String.Format("{0:#,##0.00}", Math.Round(DblTotal, 2)); 
        calculaDescuento();
        calculaImpuesto();
        calculaTotal();

        return SubTotal;
    }

    protected void calculaDescuento()
    {
            Double DblDescuento = 0;
            DblDescuento = Math.Round((Double.Parse(lblDescuento.Text) / 100) * Double.Parse(lblSubTotal.Text), 2);
            lblCantidadDescuento.Text = String.Format("{0:#,##0.00}", DblDescuento);
    }

    protected void calculaImpuesto()
    {
            Double dblImpuesto = 0;
            dblImpuesto = Math.Round(((Double.Parse(lblImpuesto.Text) / 100) * ((Double.Parse(lblSubTotal.Text) + Double.Parse(lblEnvio.Text)) - Double.Parse(lblCantidadDescuento.Text))), 2);
            lblCantImpuesto.Text = String.Format("{0:#,##0.00}", dblImpuesto);
    }

    protected void calculaTotal()
    {
            Double dblTotal = 0;
            dblTotal = Math.Round(((Double.Parse(lblSubTotal.Text) + Double.Parse(lblEnvio.Text) + Double.Parse(lblCantImpuesto.Text) + Double.Parse(lblImpImportacion.Text)) - Double.Parse(lblCantidadDescuento.Text)), 2);
            lblTotal.Text = String.Format("{0:#,##0.00}", dblTotal);
    }

}
