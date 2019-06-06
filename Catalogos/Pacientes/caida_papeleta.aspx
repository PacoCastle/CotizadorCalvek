<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="caida_papeleta.aspx.cs" Inherits="Catalogos_Pacientes_caida_papeleta" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>AMI-OC</title>
<script language="javascript" type="text/javascript">

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" style="width: 870px">
            <tr>
                <td colspan="2"  align="right"><asp:ImageButton ID="regresar" runat="server" ImageUrl="~/Imagenes/regresar.png" Width="20" Height="20" OnClick="regresar_Click" /></td>
            </tr>
            <tr>
                <td style="width: 18867px; height: 40px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/logoAMI.png" Height="67px" Width="244px" />
                </td>
                <td style="width: 578px; height: 40px">
                    <table style="width: 225px">
                        <tr>
                            <td>
                                <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <font face="arial"><strong><span style="font-size: 9pt">Folio:
                                            <asp:Label ID="lbfolio" runat="server" Font-Italic="True" Font-Bold="True" Font-Size="11pt"></asp:Label></span></strong></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <font face="arial"><span style="font-size: 9pt">Fecha:</span><asp:Label ID="lblFecha" runat="server" Font-Bold="True" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
<%-- campos de contacto ---%>
             <tr>
                <td colspan="2">
                     <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 100%">
                                <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Paciente:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbpaciente" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                        <td style="font-size: 12pt; height: 16px"><b><font face="arial"><span style="font-size: 9pt"> RFC:</span></font></b></td>
                                        <td style="font-size: 12pt; height: 16px"><font face="arial"><asp:Label ID="lblRFC" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Razon Social:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"> <font face="arial"><asp:Label ID="lbrazonsocial" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                        <td style="font-size: 12pt; height: 16px"><b><font face="arial"><span style="font-size: 9pt">Empresa:</span></font></b></td>
                                        <td style="font-size: 12pt; height: 16px"><font face="arial"><asp:Label ID="lbempresa" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Perfil:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbperfil" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                       <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Fecha Alta:</span></font></b></td>
                                       <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="labfechaalta" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Edad:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbedad" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                       <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Sexo:</span></font></b></td>
                                       <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbsexo" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                     <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">F.Nac:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="fnaci" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Vendedor:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="vendedor" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Tel:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="telp" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt"></span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="Label3" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                     </table>
                </td>
            </tr>
<%-- FIN de campos de contacto ---%>
             <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lbexamen" runat="server" Text="" Font-Bold="true"  Font-Size="15pt"></asp:Label>
                </td>
            </tr>
        </table>
        
    </div>
    </form>
    
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br><br><br>
    <asp:Label ID="lbcoment" runat="server" Text="" Width="870px" runat="server" Style="word-wrap: normal; word-break: break-all;" ></asp:Label>


</body>
</html>
