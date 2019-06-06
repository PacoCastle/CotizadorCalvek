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
using System.Drawing;

public partial class Cotizador_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCotizacion.Text = Request["cotizacionid"].ToString();

        int intLogoComponentes = Int32.Parse(Request.QueryString["intLogoComponentes"]);

        cotizacionVO VOcotizacion = new cotizacionVO();
        CotizacionBL BLcotizacion = new CotizacionBL();

        ClienteVO VOcliente = new ClienteVO();
        ClienteBL BLcliente = new ClienteBL();

        TipoCambioVO VOtipoCambio = new TipoCambioVO();
        TipoCambioBL BLtipoCambio = new TipoCambioBL();

        usuarioVO VOUsuario = new usuarioVO();
        UsuarioBL BLUsuario = new UsuarioBL();

        if (Request["cotizacionid"] != null)
        {
            VOcotizacion.Operacion = cotizacionVO.BUSCAR;
            VOcotizacion.CotizacionId = Int32.Parse(Request["cotizacionid"]);
            VOcotizacion = (cotizacionVO)BLcotizacion.execute(VOcotizacion);
        }

        lblFechaCotizacion.Text = String.Format("{0:dd/MM/yyyy}", VOcotizacion.FechaCaida.ToString());
        
        lblLAB.Text = VOcotizacion.LAB;
        lblCondicionesPago.Text = VOcotizacion.CondicionesPago;
        lblRepresentante.Text = VOcotizacion.RepresentanteLegal;

        VOUsuario.Operacion = usuarioVO.BUSCAR;
        VOUsuario.Usuarioid = VOcotizacion.UsuarioId;
        VOUsuario = (usuarioVO)BLUsuario.execute(VOUsuario);

        lblAsesor.Text = VOUsuario.Usuario_nombrecompleto;
        lblAsesor2.Text = VOUsuario.Usuario_nombrecompleto;
        lblEmail.Text = VOUsuario.Usuario_correoElectronico;
        lblRadio.Text = VOUsuario.Usuario_radio;
        lblVigencia.Text = VOcotizacion.FechaVencimiento;

                VOcliente.Clienteid = VOcotizacion.ClienteIdNuevo;
                VOcliente.Operacion = ClienteVO.BUSCAR;
                VOcliente = (ClienteVO)BLcliente.execute(VOcliente);
                if (VOcliente.Cliente_razonSocial != null)
                {
                    lblRazonSocial.Text = VOcliente.Cliente_razonSocial;
                    lblDireccionCliente.Text = VOcliente.Cliente_calle;
                    lblTelefonoCliente.Text = VOcliente.Cliente_TelefonoContacto;
                }

        VOtipoCambio.MonedaId = VOcotizacion.TipoMoneda;
        VOtipoCambio.Operacion = TipoCambioVO.BUSCAR;
        VOtipoCambio = (TipoCambioVO)BLtipoCambio.execute(VOtipoCambio);

        lblNotas.Text = VOcotizacion.Notas.ToString().ToUpper();

        if (VOtipoCambio.Descripcion != null)
        {
            lblMoneda.Text = VOtipoCambio.Descripcion;
            lblMoneda2.Text = VOtipoCambio.Descripcion;
        }

        lblCondicion1.Text = "Los Precios anteriores están en " + lblMoneda2.Text + ", al tipo de cambio del día de pago (con excepción de los indicados en M.N).";
        lblCondicion2.Text = "Condiciones de pago:" + lblCondicionesPago.Text;
        lblCondicion3.Text = "LAB:" + lblLAB.Text;
        lblCondicion4.Text = "TODA CANCELACIÓN CAUSARA UN CARGO DEL 30% SOBRE EL MONTO DEL PEDIDO.";
        lblCondicion5.Text = "EXISTENCIA SUJETA AL DIA DE FECHA DE COTIZACION, SALVO PREVIA VENTA.";
			
			lblCondicion4.Font.Bold = true;
			lblCondicion5.Font.Bold = true;
			lblCondicion4.Font.Size = 10;
			lblCondicion5.Font.Size = 8;
			lblCondicion3.Font.Size = 8;
			lblCondicion2.Font.Size = 8;
			lblCondicion1.Font.Size = 8;


        if (lblMoneda.Text == "PESOS")
        {
            
            lblCondicion1.Text = "Condiciones de pago:" + lblCondicionesPago.Text;
            lblCondicion2.Text = "LAB:" + lblLAB.Text;
            lblCondicion3.Text = "TODA CANCELACIÓN CAUSARA UN CARGO DEL 30% SOBRE EL MONTO DEL PEDIDO.";
            lblCondicion4.Text = "EXISTENCIA SUJETA AL DIA DE FECHA DE COTIZACION, SALVO PREVIA VENTA.";
			
			lblCondicion3.Font.Bold = true;
			lblCondicion4.Font.Bold = true;
			lblCondicion3.Font.Size = 10;
			lblCondicion4.Font.Size = 8;
			lblCondicion2.Font.Size = 8;
			lblCondicion1.Font.Size = 8;
			lblCondicion5.Visible = false;

        }
        else
        {
            lblCondicion1.Text = "Los Precios anteriores están en " + lblMoneda2.Text + ", sujeto al tipo de cambio del día de pago.";
            lblCondicion2.Text = "Condiciones de pago:" + lblCondicionesPago.Text;
            lblCondicion3.Text = "LAB:" + lblLAB.Text;
            lblCondicion4.Text = "TODA CANCELACIÓN CAUSARA UN CARGO DEL 30% SOBRE EL MONTO DEL PEDIDO.";
            lblCondicion5.Text = "EXISTENCIA SUJETA AL DIA DE FECHA DE COTIZACION, SALVO PREVIA VENTA.";
			
			lblCondicion4.Font.Bold = true;
			lblCondicion5.Font.Bold = true;
			//lblCondicion4.Font.Size = 10;
			//lblCondicion5.Font.Size = 7;
			//lblCondicion3.Font.Size = 8;
			//lblCondicion2.Font.Size = 8;
			//lblCondicion1.Font.Size = 8;			
			lblCondicion4.Font.Size = 10;
			lblCondicion5.Font.Size = 8;
			lblCondicion3.Font.Size = 8;
			lblCondicion2.Font.Size = 8;
			lblCondicion1.Font.Size = 8;

        }


        //InfoSessionVO infoSession = (InfoSessionVO)Session["InfoSession"];
        //if (Int32.Parse(infoSession.getValor(InfoSessionVO.OFICINA).ToString()) == 2)
        //{
            if (intLogoComponentes == 0)
                {
                Image1.ImageUrl = "~/Imagenes/caida1.JPG";


                lblCuenta1.Text = "BBVA MX : No. Cuenta 0448265798 / Cbe. Interbancaria 012700004482657983";
                lblCuenta2.Text = "BBVA DLLS : No. Cuenta 0448265828 / Cbe. Interbancaria 012700004482658283";
                lblCuenta3.Text = "BANAMEX MX : No. Cuenta 5492531 / Cbe. Interbancaria 002700038354925318";
                lblCuenta4.Text = "BANAMEX DLLS : No. Cuenta 9440978 / Cbe. Interbancaria 002700038394409784";


                }
            if (intLogoComponentes == 1)
            {
                Image1.ImageUrl = "~/Imagenes/caidaCalvekComponentes.JPG";
               
                lblCuenta1.Text = "BBVA MX : No. Cuenta 0188427836 / Cbe. Interbancaria 012700001884278361";
                lblCuenta2.Text = "BBVA DLLS : No. Cuenta 0188588643 / Cbe. Interbancaria 012700001885886435";
                lblCuenta3.Text = "BANAMEX MX : No. Cuenta 2504076 / Cbe. Interbancaria 002700700325040767";
                lblCuenta4.Text = "BANAMEX DLLS : No. Cuenta 9442067 / Cbe. Interbancaria 002700038394420670";

            }
            if (intLogoComponentes == 2)
                {
                    Image1.ImageUrl = "~/Imagenes/caidaCalvekBajio.JPG";

                    lblCuenta1.Text = "BBVA MX : No. Cuenta 0191998102 / Cbe. Interbancaria 012700001919981028";
                    lblCuenta2.Text = "BBVA DLLS : No. Cuenta 0191998153 / Cbe. Interbancaria 012700001919981536";
                    lblCuenta3.Text = "BANAMEX MX : No. Cuenta 2162880 / Cbe. Interbancaria 002700700521628802";
                    lblCuenta4.Text = "BANAMEX DLLS : No. Cuenta 9442180 / Cbe. Interbancaria 002700038394421801";
                }

            

        //}

    }
}
