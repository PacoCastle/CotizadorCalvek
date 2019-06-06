<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaClienteComodin.aspx.cs" Inherits="Catalogos_Clientes_AltaClienteCotizador" title="SICK CLIENTE COMODIN"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SICK</title>
    <script type="text/javascript" language='JavaScript'>
        function muestraDatos()
        {
        
        var blnBanderaError=false;
        var strError="";
        
        var e = document.getElementById("lstTipoCliente");
        var strTipoCliente = e.options[e.selectedIndex].value;
        var strRFC = document.form1.txtAltaRfc.value;
        
        if(strTipoCliente == 1 && strRFC.length != 13)
        {
        blnBanderaError = true;
        strError="La longitud del RFC no es valido";
        }
        //alert("TIPOCLIENTE:" + strTipoCliente + " LONGITUD:" + strRFC.length + " BANDERA ERR:" + blnBanderaError +" ERROR:" + strError);
        
        
        if(strTipoCliente == 2 && strRFC.length != 12)
        {
        blnBanderaError = true;
        strError="La longitud del RFC no es valido";
        }
        
        if(!blnBanderaError && strTipoCliente == 1)
        {
        
        var Template = /^\D+$/;
            if( !(Template.test(strRFC.substring(0,4))) ) // valida los 4 primeros digitos
            {
            blnBanderaError = true;
            strError="Formato del RFC no es valido";
            }
            
            Template = /^\d+$/;
            if( !(Template.test(strRFC.substring(4,10))) ) // valida los siguientes 6 digitos
            {
            blnBanderaError = true;
            strError="Formato del RFC no es valido";
            }
        if(!blnBanderaError)
            {
            document.form1.txtAltaCodigo.value = strRFC.substring(0,4) + "-" + strRFC.substring(4,10) + "-" + strRFC.substring(10)
            }
            
        }
        else if(!blnBanderaError && strTipoCliente == 2)
        {
           var Template = /^\D+$/;
            if( !(Template.test(strRFC.substring(0,3))) ) // valida los 3 primeros digitos
            {
            blnBanderaError = true;
            strError="Formato del RFC no es valido";
            }
            
            Template = /^\d+$/;
            if( !(Template.test(strRFC.substring(3,9))) ) // valida los siguientes 6 digitos
            {
            blnBanderaError = true;
            strError="Formato del RFC no es valido";
            }
            
            if(!blnBanderaError)
            {
            document.form1.txtAltaCodigo.value = strRFC.substring(0,3) + "-" + strRFC.substring(3,9) + "-" + strRFC.substring(9)
            }
            
        }
        
        return !blnBanderaError;
        }
        
        
        
        
    </script>
</head>
<body>
    <form id="form1" runat="server" name="form1">
    <div>
                 <asp:Panel ID="Panel1" runat="server" Height="60px" Width="150px">              
                        <table style="width: 543px; height: 139px;">
                            <tr>
                                <td colspan="2" style="height: 20px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="16pt" ForeColor="White"
                                        Height="31px" Text="CLIENTE COMODIN" Width="301px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; text-align: right; height: 20px;">
                                    <asp:Label ID="Label4" runat="server" Text="Razon Social:" Width="84px"></asp:Label></td>
                                <td style="width: 334px; text-align: left; height: 20px;">
                                    <asp:TextBox ID="txtAltaRazonSocial" runat="server" Width="325px" ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                 runat="server" ControlToValidate="txtAltaRazonSocial" ErrorMessage="La Razon Social es campo Requerido"
                                 Width="235px" Display="Dynamic"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="Label14" runat="server" Text="Representante:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:TextBox ID="txtAltaRepresentante" runat="server" Width="326px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAltaRepresentante"
                             Display="Dynamic" ErrorMessage="El Representante es Requerido" Width="388px" Enabled="False"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="Label6" runat="server" Text="Calle:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:TextBox ID="txtAltaCalle" runat="server" Width="326px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="Label8" runat="server" Text="No Externo:"></asp:Label>
                                </td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:TextBox ID="txtAltaNoExterno" runat="server" Width="76px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="No Interno:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:TextBox ID="txtAltaNoInterno" runat="server" Width="77px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="Label11" runat="server" Text="Estado:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:DropDownList ID="lstAltaEstado" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Estado" DataValueField="Estado">
                                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="catalogosTableAdapters.sp_getListaEstadoSepomexTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 20px; text-align: right">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:DropDownList ID="lstTipoCambio" runat="server" DataSourceID="ObjectDataSource1"
                                        DataTextField="descripcion" DataValueField="tipoCambioId">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaTipoCambioTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="2" Name="intOrdenar" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo Documento:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:DropDownList ID="lstTipoDocumento" runat="server" DataSourceID="ObjectDataSource3"
                                        DataTextField="descripcion" DataValueField="tipoDocumentoId">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaTipoDocumentoTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 20px; text-align: right">
                                    <asp:Label ID="lblDocumento" runat="server" Text="Documento:"></asp:Label></td>
                                <td style="width: 334px; height: 20px; text-align: left">
                                    <asp:TextBox ID="txtDocumento" runat="server" Width="330px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center; height: 20px;">
                                    <asp:Label ID="lblClienteId" runat="server" Visible="False"></asp:Label>
                                    <asp:Button ID="btnAltaCliente" runat="server" Text="Continuar" OnClick="btnAltaCliente_Click" />
                                    <input id="txtAltaCodigo" type="hidden" /></td>
                            </tr>
                        </table>
                     <tr>
                     <td colspan="4" style="height: 8px; text-align: center">
                     <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="#C00000" Height="28px"
                         Visible="False" Width="388px"></asp:Label>
                     &nbsp; &nbsp; &nbsp;&nbsp;
                 </asp:Panel>
        <br />
        &nbsp;</div>
    </form>
</body>
</html>
