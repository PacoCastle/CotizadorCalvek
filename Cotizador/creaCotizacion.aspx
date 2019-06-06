<%@ Page Language="C#" AutoEventWireup="true" CodeFile="creaCotizacion.aspx.cs" Inherits="Cotizador_creaCotizacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SICK - BUSQUEDA CLIENTES</title>
    <link href="../Estilos/EstilosPrincipal.css" rel="Stylesheet" />
    <link href="../Estilos/Grid_AMI.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/sweetalert.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    <link type="text/css" href="<%=Page.ResolveUrl("~/scriptsJS/ExamenesCss/jquery-ui/jquery-ui.css")%>" rel="stylesheet" />
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery-ui/jquery.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery-ui/jquery-ui.min.js")%>"></script>

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/GetDate.js")%>"></script>
    <script type="text/javascript" language='JavaScript'>
        function muestraCalendario() {
            document.getElementById('txtFechaDocumento').value = showModalDialog('../Calendario/Calendario.aspx', 'txtFechaDocumento', 'dialogTop=100px; dialogLeft=250px; dialogWidth=206px; dialogHeight=205px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 113px;
            height: 16px;
        }

        .auto-style2 {
            height: 16px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnDate" ClientIDMode="Static" runat="server" />
        <table style="height: 160px" border="0">
            <tr>
                <td style="height: 33px; text-align: left; color: blue; background-color: #341C5E;">
                    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="16pt" ForeColor="White"
                        Height="31px" Text="BUSQUEDA CLIENTES" Width="263px"></asp:Label>
                </td>
                <td style="height: 33px; text-align: left; color: blue; background-color: #341C5E;">
                    <asp:Button ID="btnClienteComodin" runat="server" OnClick="Button1_Click1" Text="CLIENTE COMODIN" Font-Size="8pt" Width="103px" Visible="False" /></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 124px; text-align: left; width: 578px;">

                    <table style="width: 461px;" border="0">
                        <tr>
                            <td style="text-align: right; height: 20px; width: 113px;"></td>
                            <td style="text-align: left; height: 20px;"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 16px; text-align: left">
                                <asp:Panel ID="Panel1" runat="server" DefaultButton="Button2" Height="50px" Width="461px">
                                    <table style="width: 461px">
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label2" runat="server" Text="Razon Social:" Font-Size="12pt"></asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="txtRazon" runat="server" OnTextChanged="txtRazon_TextChanged"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td align="right">RFC:</td>
                                            <td>
                                                <asp:TextBox ID="txtRFC" runat="server"></asp:TextBox>
                                                <asp:Button ID="Button2" runat="server" Text="Buscar" OnClick="Button2_Click" Font-Size="9pt" Height="20px" Width="81px" /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:TextBox ID="hdCodigoUsuarioAdmin" runat="server" Visible="False"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td style="text-align: left" class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 151px">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None"
                                    OnRowCreated="GridView1_RowCreated" DataKeyNames="CODIGO"
                                    EmptyDataText="NO SE ENCONTRO INFORMACION" Visible="False" Height="143px"
                                    Width="746px" Font-Names="Verdana">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Literal ID="RadioButtonMarkup" runat="server"></asp:Literal>
                                            </ItemTemplate>
                                            <ControlStyle Font-Size="10pt" />
                                            <ItemStyle Font-Size="10pt" />
                                            <HeaderStyle Font-Size="10pt" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id">
                                            <ControlStyle Font-Size="10pt" ForeColor="Black" />
                                            <ItemStyle Font-Size="10pt" HorizontalAlign="Left" />
                                            <HeaderStyle Font-Size="10pt" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO">
                                            <ControlStyle Font-Size="10pt" ForeColor="Black" />
                                            <ItemStyle Font-Size="10pt" HorizontalAlign="Left" />
                                            <HeaderStyle Font-Size="10pt" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RAZONSOCIAL" HeaderText="RAZONSOCIAL" SortExpression="RAZONSOCIAL">
                                            <ControlStyle Font-Size="10pt" />
                                            <ItemStyle Font-Size="10pt" HorizontalAlign="Left" />
                                            <HeaderStyle Font-Size="10pt" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="RFC" SortExpression="RFC">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RFC") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnContinuar2" runat="server" Text="Continua>>" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RFC") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ControlStyle Font-Size="10pt" />
                                            <ItemStyle Font-Size="10pt" HorizontalAlign="Left" />
                                            <HeaderStyle Font-Size="10pt" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ID_KEPLER" HeaderText="CTE KEPLER"
                                            SortExpression="CTE KEPLER">
                                            <HeaderStyle Font-Size="10pt" />
                                            <ItemStyle Font-Size="10pt" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle ForeColor="Black" CssClass="itemStyle" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center" CssClass="headerStyle" />
                                    <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="headerStyle" />
                                    <AlternatingRowStyle ForeColor="Black" CssClass="alternateItemStyle" />
                                    <EditRowStyle BackColor="#999999" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_busquedaClientesTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtRazon" DefaultValue=" " Name="strRazonSocial"
                                            PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txtRFC" DefaultValue=" " Name="strRfc" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="odsClienteComodin" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_datosClienteComodinTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="usuarioId" SessionField="usuarioId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <br />
                            </td>
                        </tr>
                    </table>
                    &nbsp;

                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 11px; text-align: left; width: 578px;">
                    <table style="width: 754px" id="tabla1">
                        <tr>
                            <td style="width: 204px; text-align: right"></td>
                            <td style="width: 542px; text-align: left"></td>
                        </tr>
                        <tr>
                            <td style="width: 204px; text-align: right">
                                <asp:Label ID="lblMoneda" runat="server" Text="Moneda:"></asp:Label></td>
                            <td style="text-align: left; width: 542px;">
                                <asp:DropDownList ID="lstTipoCambio" runat="server" DataSourceID="ObjectDataSource2"
                                    DataTextField="descripcion" DataValueField="tipoCambioId">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaTipoCambioTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="2" Name="intOrdenar" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 204px; text-align: right">
                                <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo Documento:"></asp:Label></td>
                            <td style="text-align: left; width: 542px;">
                                <asp:DropDownList ID="lstTipoDocumento" runat="server" DataSourceID="ObjectDataSource3"
                                    DataTextField="descripcion" DataValueField="tipoDocumentoId">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaTipoDocumentoTableAdapter"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 204px; text-align: right">
                                <asp:Label ID="lblunidadnegocio" runat="server" Text="Unidad Negocio:"></asp:Label></td>
                            <td style="text-align: left; width: 542px;">
                                <asp:DropDownList ID="lstUnidadNegocio" runat="server" DataSourceID="ObjectDataSource4" DataTextField="unidad_negocio" DataValueField="unidad_negocio" Height="24px" Width="160px">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_unidad_negocioTableAdapter"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 204px; text-align: right; height: 26px;">
                                <asp:Label ID="lblDocumento" runat="server" Text="Documento:"></asp:Label></td>
                            <td style="text-align: left; width: 542px; height: 26px;">
                                <asp:TextBox ID="txtDocumento" runat="server" Width="330px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 24px">
                                <asp:Button ID="btnContinuar" runat="server" Text="CREAR COTIZACION" OnClick="btnContinuar_Click" Visible="False" /><asp:Button ID="btnHabilitaNuevo" runat="server" Text="NUEVO CLIENTE" OnClick="btnHabilitaNuevo_Click" Visible="False" />
                            </td>
                        </tr>
                    </table>
                    &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
        </table>



    </form>

</body>
</html>
