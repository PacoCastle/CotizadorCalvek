<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clasificacionProductos.aspx.cs" Inherits="clasificacionProductos_clasificacionProductos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SICK-CLASIFICACION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div >
        <table style="width: 800px; background-color: #d7e8ff;">
            <tr>
                <td style="width: 5px">
                    &nbsp; &nbsp;&nbsp;
                </td>
                <td style="width: 232px" align="center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="CLASIFICACION DE PRODUCTOS"></asp:Label></td>
                <td style="width: 210px" align="right">
                    <asp:LinkButton ID="lnkbtnRegresar" runat="server" Font-Size="10pt" PostBackUrl="~/Principal/Default.aspx">Regresar</asp:LinkButton>
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Pendientes:"></asp:Label>
                    <asp:Label ID="lblPendientes" runat="server" Text="valorPendientes"></asp:Label><br />
                    <asp:Label ID="lblEtiquetaPenMarca" runat="server" Font-Bold="True" Text="Pendientes Marca:"></asp:Label>
                    <asp:Label ID="lblPendientesMarca" runat="server" Text="valorPendientesMarca"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Filtro:"></asp:Label></td>
                <td style="width: 210px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 67px">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Marca:"></asp:Label>
                    <asp:DropDownList ID="lstMarca" runat="server" DataSourceID="ObjectDataSource1" DataTextField="descripcion"
                        DataValueField="marcaAdminId" Font-Size="10pt">
                    </asp:DropDownList>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lstMarca"
                        ErrorMessage="Campo forzoso" Font-Size="9pt" InitialValue="0" ValidationGroup="procesa"></asp:RequiredFieldValidator>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.sp_listadoMarcasTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="usuario" SessionField="usuarioID" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td style="width: 210px; height: 67px;">
                    <asp:Button ID="Button1" runat="server" Font-Size="10pt" OnClick="Button1_Click"
                        Text="Obtener Registro" />
                    <asp:Label ID="lblMarcaAdminId" runat="server" Visible="False"></asp:Label></td>
                <td style="height: 67px">
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="width: 5px">
                </td>
                <td align="center" colspan="2" valign="middle">
                    <table style="width: 698px; height: 80px; background-color: #8bcfcc">
                        <tr>
                            <td align="left" style="width: 306px; height: 21px" valign="top">
                                <asp:Label ID="lblCodigo" runat="server" Font-Bold="True" Text="Código:"></asp:Label><asp:Label
                                    ID="txtCodigo" runat="server" Font-Italic="True"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCodigoN"
                                    Display="Dynamic" ErrorMessage="Campo forzoso" Font-Size="9pt" ValidationGroup="procesa"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCodigoN"
                                    Display="Dynamic" ErrorMessage="Campo forzoso" Font-Size="9pt" ValidationGroup="buscar"></asp:RequiredFieldValidator>
                                <asp:Button ID="btnModificar" runat="server" Font-Size="10pt" Height="24px" OnClick="btnModificar_Click"
                                    Text="Modificar" Visible="False" Width="69px" />
                                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="buscar" />
                                <asp:TextBox ID="txtCodigoN" runat="server" Font-Size="10pt" MaxLength="50"
                                    Width="214px" Visible="False" Enabled="False">--</asp:TextBox>
                                <asp:Label ID="lblBanderaBusqueda" runat="server" Text="0" Visible="False"></asp:Label>
                            </td>
                            <td align="left" rowspan="3" style="width: 40px" valign="top">
                                <asp:Label ID="lblEtiquetaNombre" runat="server" Font-Bold="True" Text="Nombre:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre"
                                    ErrorMessage="Campo forzoso" ValidationGroup="procesa" Font-Size="9pt" Width="109px"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblNombre" runat="server" Visible="False"></asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" Font-Size="10pt" Height="81px" Rows="5"
                                    TextMode="MultiLine" Width="400px" MaxLength="300" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 306px; height: 30px" valign="top">
                                <asp:Label ID="lblEtiquetaProcedencia" runat="server" Font-Bold="True" Text="Procedencia:"></asp:Label>
                                <asp:Label ID="lblProcedencia" runat="server" Font-Italic="True"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="lstProcedencia" ErrorMessage="Campo forzoso" ValidationGroup="procesa" Font-Size="9pt"></asp:RequiredFieldValidator><br />
                                <asp:DropDownList ID="lstProcedencia" runat="server" DataSourceID="ObjectDataSource2"
                                    DataTextField="CVALORCL01" DataValueField="CIDVALOR01" Font-Size="10pt" Enabled="False">
                                </asp:DropDownList><asp:ObjectDataSource
                                        ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.get_listaProcedenciaProductos_APTableAdapter">
                                    </asp:ObjectDataSource>
                                <asp:Label ID="lblprocedenciaAdminId" runat="server" Visible="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 306px; height: 43px" valign="top">
                                <asp:Label ID="lblEtiquetaUnidadMedida" runat="server" Font-Bold="True" Text="Unidad Medida:"></asp:Label>
                                <asp:Label ID="lblUnidadMedida" runat="server" Font-Italic="True"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="lstUnidadMedida" ErrorMessage="Campo forzoso" Font-Size="9pt" InitialValue="0" ValidationGroup="procesa"></asp:RequiredFieldValidator><br />
                                <asp:DropDownList ID="lstUnidadMedida" runat="server" DataSourceID="ObjectDataSource5"
                                    DataTextField="cnombreu01" DataValueField="cidunidad" Font-Size="10pt" Enabled="False">
                                </asp:DropDownList><asp:ObjectDataSource
                                        ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.get_listaUnidadMedida_APTableAdapter">
                                    </asp:ObjectDataSource>
                                <asp:Label ID="lblUnidadAdminId" runat="server" Visible="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 306px; height: 21px" valign="top">
                                <asp:Label ID="lblEtiquetaTipo" runat="server" Font-Bold="True" Text="Tipo:"></asp:Label>
                                <asp:Label ID="lblTipo" runat="server" Font-Italic="True"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="lstTipo" ErrorMessage="Campo forzoso" ValidationGroup="procesa" Font-Size="9pt" InitialValue="0"></asp:RequiredFieldValidator><br />
                                <asp:DropDownList ID="lstTipo" runat="server" AutoPostBack="True" DataSourceID="odsListaTipos"
                                    DataTextField="tipo" DataValueField="tipoId" Font-Size="10pt" Width="250px" Enabled="False" OnSelectedIndexChanged="lstTipo_SelectedIndexChanged" >
                                </asp:DropDownList><asp:ObjectDataSource
                                        ID="odsTipoXMarca" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.get_listaTiposProductos_APTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lstMarca" Name="MarcaId" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="odsListaTipos" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.get_listaTiposProductos_AllTableAdapter">
                                </asp:ObjectDataSource>
                                <asp:Label ID="lblTipoAdminId" runat="server" Visible="False"></asp:Label></td>
                            <td align="left" style="width: 40px; height: 21px" valign="top">
                                <asp:Label ID="lblEtiquetaSubTipo" runat="server" Font-Bold="True" Text="SubTipo:"></asp:Label><asp:Label
                                    ID="lblSubTipo" runat="server" Font-Italic="True"></asp:Label><br />
                                <asp:DropDownList ID="lstSubTipo" runat="server" DataSourceID="odsListaSubtipos"
                                    DataTextField="subTipo" DataValueField="subTipoId" Font-Size="10pt" Width="250px" Enabled="False">
                                </asp:DropDownList><asp:ObjectDataSource ID="odsSubTipoXTipo" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.get_listaCategoriaProductos_APTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lstMarca" Name="MarcaId" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="lstTipo" Name="TipoId" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="odsListaSubtipos" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="clasificacionProductosTableAdapters.get_listaSubtipos_AllTableAdapter">
                                </asp:ObjectDataSource>
                                <asp:Label ID="lblCategoriaAdminId" runat="server" Visible="False"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2" style="height: 24px" valign="top">
                                <asp:Label ID="lblEtiquetaClasificacion" runat="server" Font-Bold="True" Text="Se clasifico:" Visible="False"></asp:Label>
                                <asp:CheckBoxList ID="chkClasificacion" runat="server" Font-Size="10pt" Height="12px"
                                    RepeatDirection="Horizontal" Width="398px" Visible="False">
                                    <asp:ListItem Value="1">Categor&#237;a</asp:ListItem>
                                    <asp:ListItem Value="2">Procedencia</asp:ListItem>
                                </asp:CheckBoxList></td>
                        </tr>
                    </table>
                </td>
                <td colspan="1">
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 12px">
                    <table style="width: 920px">
                        <tr>
                            <td>
                                <asp:Label ID="lblValor" runat="server" Font-Bold="True" Text="Estatus:"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Usuario:"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Fecha:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblValorEstatus" runat="server" Text="valorEstatus"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblUsuario" runat="server" Text="valorUsuario"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFecha" runat="server" Text="valorFecha"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 5px">
                </td>
                <td style="width: 232px">
                    <asp:Label ID="lblSeguimientoId" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lblEstatusBusquedaId" runat="server" Visible="False"></asp:Label></td>
                <td style="width: 210px" align="right">
                    <asp:Button ID="btnContinuar" runat="server" Enabled="False" Font-Size="10pt" OnClick="btnContinuar_Click"
                        Text="continuar" ValidationGroup="procesa" /></td>
                <td>
                </td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
