using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using cotizadorTableAdapters;
using InterfaceAdminPaqTableAdapters;
using catalogosTableAdapters;

/// <summary>
/// Summary description for Cliente
/// </summary>
public class ClienteBL:IBusinessLogic
{
	public ClienteBL()
	{
		//
		// TODO: Add constructor logic here
		//

	}

    private set_insertaDatosClienteTableAdapter setICliente = new set_insertaDatosClienteTableAdapter();
    private buscaClienteRfcTableAdapter clienteRfc = new buscaClienteRfcTableAdapter();
    private buscaClienteCodigoTableAdapter clienteCodigo = new buscaClienteCodigoTableAdapter();
    private get_buscaClienteTableAdapter clienteId = new get_buscaClienteTableAdapter();
    private listaClientesTableAdapter listaClientesAdmin = new listaClientesTableAdapter();
    private get_buscaClienteCodigoTableAdapter clienteSqlCodigo = new get_buscaClienteCodigoTableAdapter();
    private get_buscaClienteAdminIdTableAdapter busClienteAdminId = new get_buscaClienteAdminIdTableAdapter();
        //
    //private get_listaClientesActivosTableAdapter listaClientes = new get_listaClientesActivosTableAdapter();

    private DataTable datos = null;
    private ClienteVO VOReg = null;

    public Object execute(Object O)
    {
        VOReg = (ClienteVO)O;

        if (VOReg.Operacion == ClienteVO.ACTUALIZAR)
        {
            return actualizaCliente();
        }
        else if (VOReg.Operacion == ClienteVO.INSERTAR)
        {
            return insertaCliente();
        }
        else if (VOReg.Operacion == ClienteVO.BUSCAR)
        {
            return buscarCliente();
        }
        else if (VOReg.Operacion == ClienteVO.BUSCAR_ADMIN_RFC)
        {
            return buscarClienteAdminRfc();
        }
        else if (VOReg.Operacion == ClienteVO.BUSCAR_ADMIN_CODIGO)
        {
            return buscarClienteAdminCodigo();
        }
        else if (VOReg.Operacion == ClienteVO.LISTACLIENTES)
        {
            return ListaClentes();
        }
        else if (VOReg.Operacion == ClienteVO.BUSCAR_SQL_CODIGO)
        {
            return buscarClienteSqlCodigo();
        }
        else if (VOReg.Operacion == ClienteVO.BUSCAR_ADMIN_ID)
        {
            return buscarClienteSqlId();
        }

        return VOReg;
    }

    private object actualizaCliente()
    {
        return null;
    }

    private object insertaCliente()
    {
        int? res = -1;
        setICliente.GetData(VOReg.Clienteid, VOReg.Cliente_codigo, VOReg.Cliente_razonSocial, VOReg.Cliente_rfc, VOReg.Cliente_calle, VOReg.Cliente_usuarioId, VOReg.Cliente_Representante, VOReg.Cliente_TelefonoContacto, VOReg.Cliente_CorreoElectronico, VOReg.Cliente_Fax, VOReg.Cliente_noExterno, VOReg.Cliente_noInterno, VOReg.Cliente_CodigoPostal, VOReg.Cliente_Estado, VOReg.Cliente_Municipio, VOReg.Cliente_colonia, VOReg.Cliente_tipoCliente, ref res);
        //if (res > 0)
        //{
            VOReg.Resultado = res;
        //}
        return VOReg;
    }

    private object buscarCliente()
    {
        datos = clienteId.GetData(VOReg.Clienteid);
        if (datos.Rows.Count > 0)
        {

            VOReg.Cliente_codigo = datos.Rows[0]["cliente_codigo"].ToString();
            VOReg.Cliente_razonSocial = datos.Rows[0]["cliente_razonSocial"].ToString();
            VOReg.Cliente_rfc = datos.Rows[0]["cliente_rfc"].ToString();
            VOReg.Cliente_calle = datos.Rows[0]["cliente_calle"].ToString();
            VOReg.Cliente_usuarioId = Int32.Parse(datos.Rows[0]["cliente_usuarioId"].ToString());
            VOReg.Cliente_Representante = datos.Rows[0]["cliente_Representante"].ToString();
            VOReg.Cliente_TelefonoContacto = datos.Rows[0]["cliente_telefono"].ToString();
            VOReg.Cliente_CorreoElectronico = datos.Rows[0]["cliente_correo"].ToString();
            VOReg.Cliente_Fax = datos.Rows[0]["cliente_fax"].ToString();
            VOReg.Cliente_noExterno = datos.Rows[0]["cliente_numExt"].ToString();
            VOReg.Cliente_noInterno = datos.Rows[0]["cliente_numInt"].ToString();
            VOReg.Cliente_CodigoPostal = datos.Rows[0]["cliente_codigoPostal"].ToString();
            VOReg.Cliente_Estado = datos.Rows[0]["cliente_estado"].ToString();
            VOReg.Cliente_Municipio = datos.Rows[0]["cliente_municipio"].ToString();
            VOReg.Cliente_colonia = datos.Rows[0]["cliente_colonia"].ToString();
            VOReg.Cliente_tipoCliente = Int32.Parse(datos.Rows[0]["cliente_tipoCliente"].ToString());
            VOReg.Cliente_LimiteCredito = Double.Parse(datos.Rows[0]["cliente_limiteCredito"].ToString());
            VOReg.Cliente_DiasCredito = Int32.Parse(datos.Rows[0]["cliente_diasCredito"].ToString());
            VOReg.Cliente_ActRazon = datos.Rows[0]["ban_ActRazonSocial"].ToString();
            //VOReg.Cliente_descuento = 0;

            return VOReg;
        }
        return VOReg;
    }

    private object buscarClienteAdminRfc()
    {
        datos = clienteRfc.GetData(VOReg.Cliente_rfc);
        if (datos.Rows.Count > 0)
        {
            VOReg.Clienteid = Int32.Parse(datos.Rows[0]["Id"].ToString());
            VOReg.Cliente_codigo = datos.Rows[0]["CODIGO"].ToString();
            VOReg.Cliente_razonSocial = datos.Rows[0]["RAZONSOCIAL"].ToString();
            VOReg.Cliente_rfc = datos.Rows[0]["RFC"].ToString();
            return VOReg;
        }
        return VOReg;
    }

    private object buscarClienteAdminCodigo()
    {
        datos = clienteCodigo.GetData(VOReg.Cliente_codigo);
        if (datos.Rows.Count > 0)
        {
            VOReg.Clienteid = Int32.Parse(datos.Rows[0]["Id"].ToString());
            VOReg.Cliente_codigo = datos.Rows[0]["CODIGO"].ToString();
            VOReg.Cliente_razonSocial = datos.Rows[0]["RAZONSOCIAL"].ToString();
            VOReg.Cliente_rfc = datos.Rows[0]["RFC"].ToString();
            VOReg.Cliente_descuento = Double.Parse(datos.Rows[0]["DESCUENTO"].ToString());

            VOReg.Cliente_Representante = datos.Rows[0]["CREPLEGAL"].ToString();
            VOReg.Cliente_calle = datos.Rows[0]["CALLE"].ToString();
            VOReg.Cliente_noExterno = datos.Rows[0]["NOEXT"].ToString();
            VOReg.Cliente_noInterno = datos.Rows[0]["NOINT"].ToString();
            VOReg.Cliente_CodigoPostal = datos.Rows[0]["CODIGOPOSTAL"].ToString();
            VOReg.Cliente_Estado = datos.Rows[0]["ESTADO"].ToString();
            VOReg.Cliente_Municipio = datos.Rows[0]["MUNICIPIO"].ToString();
            VOReg.Cliente_colonia = datos.Rows[0]["COLONIA"].ToString();
            
            return VOReg;
        }
        return VOReg;
    }

    private object ListaClentes()
    {


        //int a = 0, b = 0, c = 0;
        //String[,] arrClientes = null, arrAdmin = null, arrSQL = null;

        //datos = listaClientesAdmin.GetData();
        //if (datos.Rows.Count > 0)
        //{
        //    arrAdmin = new String[2, (datos.Rows.Count)];
        //    while (a < datos.Rows.Count)
        //    {
        //        arrAdmin[0, a] = datos.Rows[a]["CODIGO"].ToString();
        //        arrAdmin[1, a] = "-" + datos.Rows[a]["RAZONSOCIAL"].ToString();
        //        a++;
        //    }

        //}

        //datos = null;
        //datos = listaClientes.GetData();
        //if (datos.Rows.Count > 0)
        //{
        //    arrSQL = new String[2, (datos.Rows.Count)];
        //    while (b < datos.Rows.Count)
        //    {
        //        arrSQL[0, b] = datos.Rows[b]["codigo"].ToString();
        //        arrSQL[1, b] = "+" + datos.Rows[b]["razonSocial"].ToString();
        //        b++;
        //    }
        //}

        //arrClientes = new String[2, (a+b)+1];

        //for (c = 0; c <= arrAdmin.GetLength(1)-1; c++)
        //{
        //    arrClientes[0, c] = arrAdmin[0, c].ToString();
        //    arrClientes[1, c] = arrAdmin[1, c].ToString();
        //}

        //for (int d = 0; d <= arrSQL.GetLength(1) - 1; d++)
        //{
        //    arrClientes[0, d + c] = arrSQL[0, d].ToString();
        //    arrClientes[1, d + c] = arrSQL[1, d].ToString();
        //}

        //VOReg.ArrClientes = arrClientes;

        //return VOReg;
        return null;
        
    }

    private object buscarClienteSqlCodigo()
    {
        datos = clienteSqlCodigo.GetData(VOReg.Cliente_codigo);
        if (datos.Rows.Count > 0)
        {
            VOReg.Clienteid = Int32.Parse(datos.Rows[0]["clienteId"].ToString());
            VOReg.Cliente_codigo = datos.Rows[0]["cliente_codigo"].ToString();
            VOReg.Cliente_razonSocial = datos.Rows[0]["cliente_razonSocial"].ToString();
            VOReg.Cliente_rfc = datos.Rows[0]["cliente_rfc"].ToString();
            VOReg.Cliente_calle = datos.Rows[0]["cliente_calle"].ToString();
            VOReg.Cliente_usuarioId = Int32.Parse(datos.Rows[0]["cliente_usuarioId"].ToString());

            VOReg.Cliente_Representante = datos.Rows[0]["cliente_Representante"].ToString();
            VOReg.Cliente_TelefonoContacto = datos.Rows[0]["cliente_telefono"].ToString();
            VOReg.Cliente_CorreoElectronico = datos.Rows[0]["cliente_correo"].ToString();
            VOReg.Cliente_Fax = datos.Rows[0]["cliente_fax"].ToString();
            VOReg.Cliente_noExterno = datos.Rows[0]["cliente_numExt"].ToString();
            VOReg.Cliente_noInterno = datos.Rows[0]["cliente_numInt"].ToString();
            VOReg.Cliente_CodigoPostal = datos.Rows[0]["cliente_codigoPostal"].ToString();
            VOReg.Cliente_Estado = datos.Rows[0]["cliente_estado"].ToString();
            VOReg.Cliente_Municipio = datos.Rows[0]["cliente_municipio"].ToString();
            VOReg.Cliente_colonia = datos.Rows[0]["cliente_colonia"].ToString();
            VOReg.Cliente_tipoCliente = Int32.Parse(datos.Rows[0]["cliente_tipoCliente"].ToString());
            VOReg.Cliente_LimiteCredito = Double.Parse(datos.Rows[0]["cliente_limiteCredito"].ToString());
            //VOReg.Cliente_DiasCredito = Int32.Parse(datos.Rows[0]["cliente_diasCredito"].ToString());
            //VOReg.Cliente_descuento = 0;
            return VOReg;
        }
        return VOReg;
    }

    private object buscarClienteSqlId()
    {
        datos = busClienteAdminId.GetData(VOReg.Cliente_idAdmin);
        if (datos.Rows.Count > 0)
        {
            VOReg.Clienteid = Int32.Parse(datos.Rows[0]["clienteId"].ToString());
            VOReg.Cliente_codigo = datos.Rows[0]["cliente_codigo"].ToString();
            VOReg.Cliente_razonSocial = datos.Rows[0]["cliente_razonSocial"].ToString();
            VOReg.Cliente_rfc = datos.Rows[0]["cliente_rfc"].ToString();
            VOReg.Cliente_calle = datos.Rows[0]["cliente_calle"].ToString();
            VOReg.Cliente_usuarioId = Int32.Parse(datos.Rows[0]["cliente_usuarioId"].ToString());
            VOReg.Cliente_Representante = datos.Rows[0]["cliente_Representante"].ToString();
            VOReg.Cliente_TelefonoContacto = datos.Rows[0]["cliente_telefono"].ToString();
            VOReg.Cliente_CorreoElectronico = datos.Rows[0]["cliente_correo"].ToString();
            VOReg.Cliente_Fax = datos.Rows[0]["cliente_fax"].ToString();
            VOReg.Cliente_noExterno = datos.Rows[0]["cliente_numExt"].ToString();
            VOReg.Cliente_noInterno = datos.Rows[0]["cliente_numInt"].ToString();
            VOReg.Cliente_CodigoPostal = datos.Rows[0]["cliente_codigoPostal"].ToString();
            VOReg.Cliente_Estado = datos.Rows[0]["cliente_estado"].ToString();
            VOReg.Cliente_Municipio = datos.Rows[0]["cliente_municipio"].ToString();
            VOReg.Cliente_colonia = datos.Rows[0]["cliente_colonia"].ToString();
            VOReg.Cliente_tipoCliente = Int32.Parse(datos.Rows[0]["cliente_tipoCliente"].ToString());
            VOReg.Cliente_LimiteCredito = Double.Parse(datos.Rows[0]["cliente_limiteCredito"].ToString());
            return VOReg;
        }
        return VOReg;
    }

}
