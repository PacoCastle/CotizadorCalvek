<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaClienteCotizador.aspx.cs" Inherits="Catalogos_Clientes_AltaClienteCotizador" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SICK - ALTA CLIENTE</title>
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
    <div title="SICK ALTA CLIENTE">
                 <asp:Panel ID="Panel1" runat="server" Height="60px" Width="150px">              
                        <table style="width: 543px; height: 139px;">
                            <tr>
                                <td colspan="2" style="height: 15px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" ForeColor="White"
                                        Height="17px" Text="ALTA CLIENTES" Width="201px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label1" runat="server" Text="Tipo Cliente" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:DropDownList ID="lstTipoCliente" runat="server" DataSourceID="ObjectDataSource1"
                                        DataTextField="descripcion" DataValueField="tipoClienteId" OnSelectedIndexChanged="lstTipoCliente_SelectedIndexChanged" Font-Size="9pt">
                                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaTipoClienteTableAdapter">
                                    </asp:ObjectDataSource>
                                    <input id="txtAltaCodigo" type="hidden" /></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; text-align: right; height: 5px;">
                                    <asp:Label ID="Label4" runat="server" Text="Razon Social:" Width="84px" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; text-align: left; height: 5px;">
                                    <asp:TextBox ID="txtAltaRazonSocial" runat="server" Width="325px" Font-Size="9pt" ></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                 runat="server" ControlToValidate="txtAltaRazonSocial" ErrorMessage="La Razon Social es campo Requerido"
                                 Width="148px" Display="Dynamic" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label5" runat="server" Text="RFC:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:TextBox ID="txtAltaRfc" runat="server" Font-Size="9pt"></asp:TextBox>
                                    <asp:Label ID="lblRfc" runat="server" Font-Size="7pt" Text="AAAA123456###" ForeColor="Gray"></asp:Label><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAltaRfc"
                         ErrorMessage="El RFC es campo Requerido" Width="119px" Display="Dynamic" Font-Size="7pt"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtAltaRfc"
                                        Display="Dynamic" ErrorMessage="No es valida la longitud del RFC" ValidationExpression="^\w{12,13}$" Width="135px" Font-Size="7pt"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label14" runat="server" Text="Representante:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:TextBox ID="txtAltaRepresentante" runat="server" Width="326px" Font-Size="9pt"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAltaRepresentante"
                             Display="Dynamic" ErrorMessage="El Representante es Requerido" Width="124px" Enabled="False" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; text-align: right; height: 5px;">
                                    <asp:Label ID="Label2" runat="server" Text="Teléfono Contacto:" Width="119px" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; text-align: left; height: 5px;">
                                    <asp:TextBox ID="txtAltaTelefonoContacto" runat="server" Width="149px" Font-Size="9pt"></asp:TextBox><br />
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtAltaTelefonoContacto"
                         Display="Dynamic" ErrorMessage="El Teléfono de contacto no es correcto" ValidationExpression="\d{10}"
                         Width="156px" Font-Size="7pt"></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAltaTelefonoContacto"
                         Display="Dynamic" ErrorMessage="El Teléfono de Contacto es Requerido" Width="164px" Enabled="False" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 4px; text-align: right">
                                    <asp:Label ID="Label9" runat="server" Text="Correo Electrónico:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 4px; text-align: left">
                                    <asp:TextBox ID="txtAltaCorreo" runat="server" Font-Size="9pt"></asp:TextBox><br />
                                    <asp:RegularExpressionValidator
                             ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAltaCorreo"
                             Display="Dynamic" ErrorMessage="El correo Electrónico no es valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             Width="138px" Font-Size="7pt"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label10" runat="server" Text="Fax:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:TextBox ID="txtAltaFax" runat="server" Font-Size="9pt"></asp:TextBox><br />
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtAltaFax"
                         Display="Dynamic" ErrorMessage="El Fax no es correcto" ValidationExpression="\d{10}"
                         Width="93px" Font-Size="7pt"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label6" runat="server" Text="Calle:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:TextBox ID="txtAltaCalle" runat="server" Width="326px" Font-Size="9pt"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAltaCalle"
                         ErrorMessage="La Calle es campo Requerido" Width="118px" Display="Dynamic" Font-Size="7pt"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 3px; text-align: right">
                                    <asp:Label ID="Label8" runat="server" Text="No Externo:" Font-Size="10pt"></asp:Label>
                                </td>
                                <td style="width: 334px; height: 3px; text-align: left">
                                    <asp:TextBox ID="txtAltaNoExterno" runat="server" Width="76px" Font-Size="9pt"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="No Interno:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:TextBox ID="txtAltaNoInterno" runat="server" Width="77px" Font-Size="9pt"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label3" runat="server" Text="C.P.:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:TextBox ID="txtAltaCodigoPostal" runat="server" Width="94px" Font-Size="9pt" ></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" Text=">>" OnClick="Button1_Click" BorderStyle="None" BorderWidth="1px" /><br />
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtAltaCodigoPostal"
                         Display="Dynamic" ErrorMessage="El Código Postal no es valido" ValidationExpression="\d{5}"
                         Width="126px" Font-Size="7pt"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label11" runat="server" Text="Estado:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:DropDownList ID="lstAltaEstado" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Estado" DataValueField="Estado" Font-Size="9pt">
                                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_estadoSepomexTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtAltaCodigoPostal" Name="codigoPostal" PropertyName="Text"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label12" runat="server" Text="Municipio:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:DropDownList ID="lstAltaMunicipio" runat="server" DataSourceID="ObjectDataSource3" DataTextField="Municipio" DataValueField="Municipio" Font-Size="9pt">
                                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_municipioSepomexTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtAltaCodigoPostal" Name="codigoPostal" PropertyName="Text"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 5px; text-align: right">
                                    <asp:Label ID="Label13" runat="server" Text="Colonia:" Font-Size="10pt"></asp:Label></td>
                                <td style="width: 334px; height: 5px; text-align: left">
                                    <asp:DropDownList ID="lstColonia" runat="server" DataSourceID="ObjectDataSource4"
                                        DataTextField="Colonia" DataValueField="Colonia" Font-Size="9pt">
                                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_coloniaSepomexTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtAltaCodigoPostal" Name="codigoPostal" PropertyName="Text"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center; height: 3px;">
                                    <asp:Label ID="lblClienteId" runat="server" Visible="False"></asp:Label>
                                    <asp:Button ID="btnAltaCliente" runat="server" Text="Continuar" OnClick="btnAltaCliente_Click" BorderStyle="None" BorderWidth="1px" Font-Size="9pt" />
                                    </td>
                            </tr>
                        </table>
                     <tr>
                     <td colspan="4" style="height: 8px; text-align: center">
                     <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="#C00000" Height="28px"
                         Visible="False" Width="532px" Font-Size="8pt"></asp:Label>
                     &nbsp; &nbsp; &nbsp;&nbsp;
                 </asp:Panel>
        <br />
        &nbsp;</div>
    </form>
</body>
</html>
