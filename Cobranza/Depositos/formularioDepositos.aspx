<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioDepositos.aspx.cs" Inherits="Cobranza_Depositos_formularioDepositos" Title="SICK - Depósitos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label><br />
    <br />
    <br />
    <table border="0" style="width: 628px; color: #000000; height: 256px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Alta de Depositos"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 12px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lstClientes"
                    ErrorMessage="Campo Requerido" Font-Size="10pt" ValidationGroup="prueba">*</asp:RequiredFieldValidator></td>
            <td style="width: 58px">
                <span style="font-size: 10pt">
                Cliente:</span></td>
            <td style="width: 222px">
                <asp:DropDownList ID="lstClientes" runat="server" DataSourceID="ObjectDataSource4" DataTextField="razonSocial" DataValueField="codigo">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
                </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 12px;">
            </td>
            <td style="width: 58px;">
                <span style="font-size: 10pt">
                Oficina:</span></td>
            <td style="width: 222px;">
                <asp:DropDownList ID="lstOficina" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="texto" DataValueField="valor" ValidationGroup="prueba">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                &nbsp;
            </td>
            <td rowspan="5" style="text-align: left" valign="bottom">
                <asp:Calendar ID="Calendar1" runat="server" Font-Size="7pt" Height="125px" OnSelectionChanged="Calendar1_SelectionChanged"
                    Visible="False" Width="231px" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" ForeColor="Black" NextPrevFormat="FullMonth">
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#333399" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 12px">
                </td>
            <td style="width: 58px">
                <span style="font-size: 10pt">
                Banco:</span></td>
            <td style="width: 222px">
                <asp:DropDownList ID="lstCuenta" runat="server" DataSourceID="ObjectDataSource1"
                    DataTextField="cuentaDeposito_Nombre" DataValueField="cuentaDepositoId" ValidationGroup="prueba">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaCuentasTableAdapter">
                </asp:ObjectDataSource>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 12px; height: 28px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMonto"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt" ValidationGroup="prueba">*</asp:RequiredFieldValidator></td>
            <td style="width: 58px; height: 28px">
                <span style="font-size: 10pt">
                Monto:</span></td>
            <td style="width: 222px; height: 28px">
                <asp:TextBox ID="txtMonto" runat="server" Width="67px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMonto"
                    ErrorMessage="Valor numerico" Font-Size="10pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 12px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lstMoneda"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt" ValidationGroup="prueba">*</asp:RequiredFieldValidator></td>
            <td style="width: 58px;">
                <span style="font-size: 10pt">
                Moneda:</span></td>
            <td style="width: 222px;">
                <asp:DropDownList ID="lstMoneda" runat="server" DataSourceID="ObjectDataSource3"
                    DataTextField="descripcion" DataValueField="monedaId">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaMonedaTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 12px; height: 29px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFecha"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt" ValidationGroup="prueba">*</asp:RequiredFieldValidator></td>
            <td style="width: 58px; height: 29px">
                <span style="font-size: 10pt">
                Fecha:</span></td>
            <td style="width: 222px; height: 29px">
                <asp:TextBox ID="txtFecha" runat="server" ValidationGroup="prueba"></asp:TextBox><asp:ImageButton ID="imgCalendario"
                    runat="server" Height="21px" ImageUrl="~/Imagenes/10129.ico" OnClick="imgCalendario_Click"
                    Width="23px" ValidationGroup="nada" />&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFecha"
                    ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="10pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" ValidationGroup="prueba"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 12px; height: 29px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtMensajeSubirArchivo"
                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="10pt" ValidationGroup="prueba">*</asp:RequiredFieldValidator></td>
            <td style="width: 58px; height: 29px">
                <span style="font-size: 10pt">
                Archivo:</span></td>
            <td colspan="2" style="height: 29px">
                <asp:FileUpload ID="fuDepositos" runat="server" />
                <asp:Button ID="btnAdjuntarArchivo" runat="server" Height="21px" Text="Agregar" OnClick="btnAdjuntarArchivo_Click" /><asp:TextBox ID="txtMensajeSubirArchivo" runat="server" BorderStyle="None" Font-Size="10pt"
                    Height="17px" ValidationGroup="prueba" Width="336px"></asp:TextBox><br/>
                <asp:HyperLink ID="hlkArchivo" runat="server" Font-Size="10pt">[hlkArchivo]</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 12px; height: 28px">
            </td>
            <td style="width: 58px; height: 28px">
                <span style="font-size: 10pt">
                Folio:</span></td>
            <td colspan="2" style="height: 28px; text-align: left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DepositoFolioId" DataSourceID="sdsFoliosDepositos" Font-Size="9pt" ShowFooter="True" ShowHeader="False" OnDataBound ="GridView1_DataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Folio" SortExpression="Folio">
                            <EditItemTemplate>
                                <asp:TextBox ID="Folio" runat="server" MaxLength="49" Text='' Width="119px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="tipoDocumento" runat="server" Font-Size="7pt" Height="15px" Width="70px" DataSourceID="odsTipoFolioDeposito" DataTextField="tipo" DataValueField="tipoFolioDepositoId" ValidationGroup="prueba2">
                                </asp:DropDownList><asp:TextBox ID="Folio" runat="server" MaxLength="49" Text='<%# Bind("Folio") %>'
                                    Width="100px" Font-Size="7pt" Height="12px" ValidationGroup="prueba2"></asp:TextBox>&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Folio"
                                    Display="Dynamic" ErrorMessage="Campo Necesario" ValidationGroup="prueba2">*</asp:RequiredFieldValidator>
                                <asp:ObjectDataSource ID="odsTipoFolioDeposito" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_listaTipoFolioDepositoTableAdapter">
                                </asp:ObjectDataSource>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("abreviatura") %>' Width="60px"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Folio") %>' Width="100px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Button ID="btnAgregar" runat="server" BorderStyle="Solid" BorderWidth="0px"
                                    CausesValidation="False" CommandName="Insert" Font-Bold="True" Font-Size="9pt"
                                    ForeColor="Green" OnClick="btnAgregar_Click2" Text="+" ValidationGroup="prueba2" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEliminar" runat="server" BorderStyle="Solid" BorderWidth="0px"
                                    CausesValidation="False" CommandName="Delete" Font-Bold="True" Font-Size="7pt"
                                    ForeColor="Red" Text="X" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsFoliosDepositos" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_depositoFolios" SelectCommandType="StoredProcedure" DeleteCommand="delete from DepositoFolio&#13;&#10;where DepositoFolioId = @DepositoFolioId&#13;&#10;">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="intDepositoId" QueryStringField="DepositoId" Type="Int32" DefaultValue="0" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="DepositoFolioId" />
                    </DeleteParameters>
                </asp:SqlDataSource><asp:DropDownList ID="lstTipoFolio2" runat="server" Font-Size="7pt" Height="15px" Width="60px" DataSourceID="odsTipoFolioDeposito2" DataTextField="tipo" DataValueField="tipoFolioDepositoId" ValidationGroup="prueba">
                </asp:DropDownList>
                <asp:TextBox ID="txtFolio" runat="server" Font-Size="7pt" Height="12px" MaxLength="49" Width="112px" ValidationGroup="prueba"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFolio"
                    Display="Dynamic" ErrorMessage="Valor Necesario" ValidationGroup="prueba">*</asp:RequiredFieldValidator>
                <asp:Button ID="btnAgregar2" runat="server" BackColor="Silver" BorderColor="Green"
                    BorderStyle="Solid" BorderWidth="0px" Font-Bold="True" Font-Size="10pt" ForeColor="Green"
                    OnClick="btnAgregar_Click" Text="+" ValidationGroup="prueba" Visible="False" />
                <asp:ObjectDataSource
                        ID="odsTipoFolioDeposito2" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_listaTipoFolioDepositoTableAdapter">
                    </asp:ObjectDataSource>
                </td>
        </tr>
        <tr>
            <td style="width: 12px; height: 28px">
            </td>
            <td style="width: 58px; height: 28px">
                <span style="font-size: 10pt">Comentario:</span></td>
            <td colspan="2" style="height: 28px; text-align: left">
                <asp:TextBox ID="txtComentarios" runat="server" Height="39px" Rows="3" Width="467px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 12px;">
            </td>
            <td style="width: 58px;">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" Font-Size="9pt" Height="21px" Width="61px" ValidationGroup="prueba" /></td>
            <td style="width: 222px;">
                <span>
                    <asp:Label ID="lblCamposForzosos" runat="server" Font-Size="8pt" ForeColor="#FF0033" Text="* campos forzosos"></asp:Label>
                    <asp:Label ID="lblEstatusDeposito" runat="server" Font-Bold="True" Font-Size="10pt"
                        Visible="False"></asp:Label></span></td>
            <td>
                <asp:Button ID="btnDepositoRegistrado" runat="server" Font-Size="10pt" Height="22px"
                    OnClick="btnDepositoRegistrado_Click" Text="Deposito Registrado" Visible="False"
                    Width="129px" /></td>
        </tr>
    </table>
</asp:Content>

