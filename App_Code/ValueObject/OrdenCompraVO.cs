using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ClienteVO
/// </summary>
public class OrdenCompraVO
{

    public static int ACTUALIZAR = 1;
    public static int INSERTAR = 2;
    public static int BUSCAR = 3;
    public static int DUPLICAORDENCOMPRA = 4;
    public static int INSERTA_SEGUIMIENTO = 5;

    public static int INSERTAR_FOLIOFACTURA = 12; // Inserta los folios a: ordenCompraFactura

    private int ordenCompraId = 0;
    private int proveedorId = 0;
    private String fechaEntrega = null;
    private String contacto = null;
    private String viaEmbarque = null;
    private String fob = null;
    private DateTime fechaAlta;
    private int usuarioId = 0;
    private DateTime fechaModificacion ;
    private int usuarioIdActualizo = 0;
    private int monedaId = 0;
    private String nombreProyecto = null;
    private String nombreJob = null;
    private Double porcentajeDescuento = 0;
    private Double costoEnvio = 0;
    private Double porcentajeImpuesto = 0;
    private Double costoImportacion = 0;
    private String datosTransferencia = null;
    private String instruccionesEmbarque = null;
    private String terminos = null;
    private int estatusOrdenCompraId = 0;
    private String factura = null;
    private String otroDocumento = null;
    private byte docRecibido = 0;
    private int origenId = 0;
    private int idNacional = 0;
    private int idInternacional = 0;

    private String accountName = null;
    private String address = null;
    private String accountNumber = null;
    private String bankName = null;
    private String bankAddress = null;
    private String aba = null;
    private byte pagoDeContado = 0;

    private String folioFacturaCompra = null;
    private String ordenServicio = null;
    private String pedimento = null;
    private String fechaPedimento = null;

    private String otroClasificacionOC = null;
    private String nombreJefe = "";
    
    private String comentario = "";
    private int seguimientoOrdenCompraId = 0;

    private String nombreProveedor = "";
    private String nombreEstatusOrdenCompra = "";
    private String nombreMoneda = "";
    private String nombreOrigen = "";

    private int operacion;
    private int? resultado;
    private int oficinaId = 0;

    public OrdenCompraVO()
    {
    ordenCompraId = 0;
    proveedorId = 0;
    fechaEntrega = null;
    contacto = null;
    viaEmbarque = null;
    fob = null;
    //fechaAlta ;
    usuarioId = 0;
    //fechaModificacion;
    usuarioIdActualizo = 0;
    monedaId = 0;
    nombreProyecto = null;
    nombreJob = null;
    porcentajeDescuento = 0;
    costoEnvio = 0;
    porcentajeImpuesto = 0;
    costoImportacion = 0;
    datosTransferencia = null;
    instruccionesEmbarque = null;
    terminos = null;
    estatusOrdenCompraId = 0;
    factura = null;
    otroDocumento = null;
    docRecibido = 0;
    origenId = 0;
    AccountName = null;
    Address = null;
    AccountNumber = null;
    BankName = null;
    BankAddress = null;
    Aba = null;
    pagoDeContado = 0;
    ordenServicio = null;
    pedimento = null;
    fechaPedimento = null;

    otroClasificacionOC = null;
    nombreJefe = "";
    comentario = "";
    seguimientoOrdenCompraId = 0;

    operacion = 0;
    oficinaId = 0;
    resultado = 0;
    }

     
    public int OrdenCompraId
    {
        get
        {
            return ordenCompraId;
        }
        set
        {
            ordenCompraId = value;
        }
    }
     
    public int ProveedorId
    {
        get
        {
            return proveedorId;
        }
        set
        {
            proveedorId = value;
        }
    }
     
    public String FechaEntrega
    {
        get
        {
            return fechaEntrega;
        }
        set
        {
            fechaEntrega = value;
        }
    }

    public String Contacto
    {
        get
        {
            return contacto;
        }
        set
        {
            contacto = value;
        }
    }
     
    public String ViaEmbarque
    {
        get
        {
            return viaEmbarque;
        }
        set
        {
            viaEmbarque = value;
        }
    }
    
    public String Fob
    {
        get
        {
            return fob;
        }
        set
        {
            fob = value;
        }
    }
     
    public DateTime FechaAlta
    {
        get
        {
            return fechaAlta;
        }
        set
        {
            fechaAlta = value;
        }
    }

    
    public int UsuarioId
    {
        get
        {
            return usuarioId;
        }
        set
        {
            usuarioId = value;
        }
    }
     
    public DateTime FechaModificacion
    {
        get
        {
            return fechaModificacion;
        }
        set
        {
            fechaModificacion = value;
        }
    }

    public int UsuarioIdActualizo
    {
        get
        {
            return usuarioIdActualizo;
        }
        set
        {
            usuarioIdActualizo = value;
        }
    }

    public int MonedaId
    {
        get
        {
            return monedaId;
        }
        set
        {
            monedaId = value;
        }
    }
    
    public String NombreProyecto
    {
        get
        {
            return nombreProyecto;
        }
        set
        {
            nombreProyecto = value;
        }
    }
    public String NombreJob
    {
        get
        {
            return nombreJob;
        }
        set
        {
            nombreJob = value;
        }
    }
    public Double PorcentajeDescuento
    {
        get
        {
            return porcentajeDescuento;
        }
        set
        {
            porcentajeDescuento = value;
        }
    }
    public Double CostoEnvio
    {
        get
        {
            return costoEnvio;
        }
        set
        {
            costoEnvio = value;
        }
    }
    public Double PorcentajeImpuesto
    {
        get
        {
            return porcentajeImpuesto;
        }
        set
        {
            porcentajeImpuesto = value;
        }
    }
    public Double CostoImportacion
    {
        get
        {
            return costoImportacion;
        }
        set
        {
            costoImportacion = value;
        }
    }
    public String DatosTransferencia
    {
        get
        {
            return datosTransferencia;
        }
        set
        {
            datosTransferencia = value;
        }
    }
    public String InstruccionesEmbarque
    {
        get
        {
            return instruccionesEmbarque;
        }
        set
        {
            instruccionesEmbarque = value;
        }
    }
    public String Terminos
    {
        get
        {
            return terminos;
        }
        set
        {
            terminos = value;
        }
    }
     
    public int EstatusOrdenCompraId
    {
        get
        {
            return estatusOrdenCompraId;
        }
        set
        {
            estatusOrdenCompraId = value;
        }
    }

    public String Factura
    {
        get
        {
            return factura;
        }
        set
        {
            factura = value;
        }
    }

    public String OtroDocumento
    {
        get
        {
            return otroDocumento;
        }
        set
        {
            otroDocumento = value;
        }
    }
    
    public byte DocRecibido
    {
        get
        {
            return docRecibido;
        }
        set
        {
            docRecibido = value;
        }
    }

    public int OrigenId
    {
        get
        {
            return origenId;
        }
        set
        {
            origenId = value;
        }
    }

    public int IdNacional
    {
        get
        {
            return idNacional;
        }
        set
        {
            idNacional = value;
        }
    }
    
    public int IdInternacional
    {
        get
        {
            return idInternacional;
        }
        set
        {
            idInternacional = value;
        }
    }

    public String AccountName
    {
        get
        {
            return accountName;
        }
        set
        {
            accountName = value;
        }
    }
    
    public String Address
    {
        get
        {
            return address;
        }
        set
        {
            address = value;
        }
    }

    public String AccountNumber
    {
        get
        {
            return accountNumber;
        }
        set
        {
            accountNumber = value;
        }
    }

    public String BankName
    {
        get
        {
            return bankName;
        }
        set
        {
            bankName = value;
        }
    }

    public String BankAddress
    {
        get
        {
            return bankAddress;
        }
        set
        {
            bankAddress = value;
        }
    }

    public String Aba
    {
        get
        {
            return aba;
        }
        set
        {
            aba = value;
        }
    }

    public byte PagoDeContado
    {
        get
        {
            return pagoDeContado;
        }
        set
        {
            pagoDeContado = value;
        }
    }

    public String FolioFacturaCompra
    {
        get
        {
            return folioFacturaCompra;
        }
        set
        {
            folioFacturaCompra = value;
        }
    }

    public String OrdenServicio
    {
        get
        {
            return ordenServicio;
        }
        set
        {
            ordenServicio = value;
        }
    }


    public String Pedimento
    {
        get
        {
            return pedimento;
        }
        set
        {
            pedimento = value;
        }
    }
    
    public String FechaPedimento
    {
        get
        {
            return fechaPedimento;
        }
        set
        {
            fechaPedimento = value;
        }
    }

    public String OtroClasificacionOC
    {
        get
        {
            return otroClasificacionOC;
        }
        set
        {
            otroClasificacionOC = value;
        }
    }

    public String NombreJefe
    {
        get
        {
            return nombreJefe;
        }
        set
        {
            nombreJefe = value;
        }
    }

    public String Comentario
    {
        get
        {
            return comentario;
        }
        set
        {
            comentario = value;
        }
    }

    public int SeguimientoOrdenCompraId
    {
        get
        {
            return seguimientoOrdenCompraId;
        }
        set
        {
            seguimientoOrdenCompraId = value;
        }
    }

    public String NombreProveedor
    {
        get
        {
            return nombreProveedor;
        }
        set
        {
            nombreProveedor = value;
        }
    }

    public String NombreEstatusOrdenCompra
    {
        get
        {
            return nombreEstatusOrdenCompra;
        }
        set
        {
            nombreEstatusOrdenCompra = value;
        }
    }

    public String NombreMoneda
    {
        get
        {
            return nombreMoneda;
        }
        set
        {
            nombreMoneda = value;
        }
    }

    public String NombreOrigen
    {
        get
        {
            return nombreOrigen;
        }
        set
        {
            nombreOrigen = value;
        }
    }

    public int Operacion
    {
        get
        {
            return operacion;
        }
        set
        {
            operacion = value;
        }
    }

    public int OficinaId
    {
        get
        {
            return oficinaId;
        }
        set
        {
            oficinaId = value;
        }
    }

    public int? Resultado
    {
        get
        {
            return resultado;
        }
        set
        {
            resultado = value;
        }
    }

}