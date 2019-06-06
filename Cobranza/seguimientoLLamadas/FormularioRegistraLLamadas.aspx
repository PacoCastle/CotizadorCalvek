<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioRegistraLLamadas.aspx.cs" Inherits="Cobranza_seguimientoLLamadas_FormularioRegistraLLamadas" Title="SICK-REGISTRO DE LLAMADAS CLIENTES" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 804px" border="0">
        <tr>
            <td colspan="3" style="height: 11px; text-align: center; width: 731px;">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Text="Registro Llamadas"></asp:Label></td>
            <td colspan="1" rowspan="5" style="text-align: center; width: 9px;">
                &nbsp;</td>
            <td colspan="1" style="width: 93px; text-align: left" rowspan="5" valign="top">
                <table style="width: 100%">
                    <tr>
                        <td colspan="3">
                            <asp:Panel ID="pnlBotones" runat="server" Height="10px" Visible="False" Width="380px">
                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td style="width: 56px">
                                            <asp:Button ID="btnCliente" runat="server" BorderStyle="Groove" BorderWidth="1px"
                                                Font-Bold="True" ForeColor="Teal" OnClick="btnCliente_Click" Text="CLIENTE" Width="100px" /></td>
                                        <td style="width: 60px">
                                            <asp:Button ID="btnContacto" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                                ForeColor="Teal" OnClick="btnContacto_Click" Text="CONTACTO" Width="100px" /></td>
                                        <td>
                                            <asp:Button ID="btnHistorial" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                                ForeColor="Teal" OnClick="btnHistorial_Click" Text="HISTORIAL" Width="100px" /></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 6px">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:Panel ID="pnlDatosCliente" runat="server" BorderStyle="Outset" Height="100%"
                    Visible="False" Width="380px" BackColor="#E0E0E0">
                    <table style="width: 380px; height: 70px; text-align: left;">
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiRFC" runat="server" Font-Size="8pt" Text="RFC:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblRFC" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiRepresLegal" runat="server" Font-Size="8pt" Text="Representante Legal:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left; height: 2px;">
                                <asp:Label ID="lblRepreLegal" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiMoneda" runat="server" Font-Size="8pt" Text="Moneda:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblMoneda" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiLimCredito" runat="server" Font-Size="8pt" Text="Limite de crédito:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblLimCredito" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiDiasCredito" runat="server" Font-Size="8pt" Text="Días de crédito:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblDiasCredito" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiDiaPago" runat="server" Font-Size="8pt" Text="Día de pago:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblDiaPago" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiDireccion" runat="server" Font-Size="8pt" Text="Dirección:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblDireccion" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiNumeroExt" runat="server" Font-Size="8pt" Text="Numero externo:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblNumeroExt" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lbEtiNumeroInt" runat="server" Font-Size="8pt" Text="Numero Interno:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lbNumeroInt" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiColonia" runat="server" Font-Size="8pt" Text="Colonia:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblColonia" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiCodigoPostal" runat="server" Font-Size="8pt" Text="Código postal:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblCodigoPostal" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiEstado" runat="server" Font-Size="8pt" Text="Estado:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEstado" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiTelefono1" runat="server" Font-Size="8pt" Text="Teléfono 1:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblTelefono1" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiTelefono2" runat="server" Font-Size="10pt" Text="Teléfono 2:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblTelefono2" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblEtiTelefono3" runat="server" Font-Size="10pt" Text="Teléfono 3:"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 198px; text-align: left;">
                                <asp:Label ID="lblTelefono3" runat="server" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel><asp:Panel ID="pnlDatosContacto" runat="server" BorderStyle="Outset" Height="100%"
                    Visible="False" Width="380px" BackColor="#E0E0E0">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="1" style="text-align: center">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="10pt" Text="Cuentas X Pagar"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="height: 117px; width: 100%;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="contactoCXPId"
                                    DataSourceID="SqlDataSource1" Font-Size="8pt" ShowFooter="True" ShowHeader="False" Width="100%">
                                    <Columns>
                                        <asp:TemplateField SortExpression="NombreResponsable">
                                            <EditItemTemplate><table style="width: 100%">
                                                <tr>
                                                    <td>
                                                        Responsable:</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="NombreResponsable" runat="server" Font-Size="8pt" Height="12px"
                                                            Text='<%# Bind("NombreResponsable") %>' Width="205px"></asp:TextBox><asp:RequiredFieldValidator
                                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="NombreResponsable"
                                                                Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="8pt"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Teléfono:</td>
                                                    <td style="width: 132px">
                                                        <asp:TextBox ID="Telefono" runat="server" Font-Size="8pt" Height="12px" Text='<%# Bind("Telefono") %>'
                                                            Width="123px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Telefono"
                                                            Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="8pt"></asp:RequiredFieldValidator></td>
                                                    <td colspan="2">
                                                        Ext.:<asp:TextBox ID="Extension" runat="server" Font-Size="8pt" Height="12px" Text='<%# Bind("Extension") %>'
                                                            Width="39px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Celular:</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="TelefonoCelular" runat="server" Font-Size="8pt" Height="12px" Text='<%# Bind("TelefonoCelular") %>'
                                                            Width="205px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Email:</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="correoElectronico" runat="server" Font-Size="8pt" Height="12px"
                                                            Text='<%# Bind("correoElectronico") %>' Width="205px"></asp:TextBox><br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correoElectronico"
                                                            Display="Dynamic" ErrorMessage="El correo electrónico no es valido" Font-Size="8pt"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="206px"></asp:RegularExpressionValidator></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        Comentario:</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="Comentarios" runat="server" Font-Size="8pt" Height="39px" Text='<%# Bind("Comentarios") %>'
                                                            TextMode="MultiLine" Width="205px"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:Panel ID="pnlAltaContacto" runat="server" BackColor="#C0FFF0" BorderColor="Blue"
                                                    BorderStyle="Solid" BorderWidth="1px" Height="50px" Visible="False" Width="301px">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="height: 38px">
                                                                Responsable:</td>
                                                            <td colspan="3" style="height: 38px">
                                                                <asp:TextBox ID="txtNombreResponsable" runat="server" BorderColor="White" BorderStyle="Solid"
                                                                    Font-Size="8pt" Height="12px" Width="205px"></asp:TextBox><br />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombreResponsable"
                                                                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="8pt" ValidationGroup="guardarContacto"></asp:RequiredFieldValidator></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Teléfono:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtTelefono" runat="server" BorderStyle="Solid" Font-Size="8pt"
                                                                    Height="12px" MaxLength="15" BorderColor="White"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTelefono"
                                                                    Display="Dynamic" ErrorMessage="Campo Requerido" Font-Size="8pt" ValidationGroup="guardarContacto"></asp:RequiredFieldValidator></td>
                                                            <td>
                                                                Ext.:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtExtension" runat="server" BorderStyle="Solid" Height="12px" MaxLength="10"
                                                                    Width="39px" BorderColor="White"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 9px">
                                                                Celular:</td>
                                                            <td colspan="3" style="height: 9px">
                                                                <asp:TextBox ID="txtTelCelular" runat="server" BorderStyle="Solid" Font-Size="8pt" Height="12px"
                                                                    MaxLength="15" Width="205px" BorderColor="White"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Email:</td>
                                                            <td colspan="3">
                                                                <asp:TextBox ID="txtCorreo" runat="server" BorderStyle="Solid" Font-Size="8pt" Height="12px"
                                                                    MaxLength="80" Width="205px" BorderColor="White"></asp:TextBox><br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCorreo"
                                                                    Display="Dynamic" ErrorMessage="El correo electrónico no es valido" Font-Size="8pt"
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="guardarContacto"
                                                                    Width="201px"></asp:RegularExpressionValidator></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                Comentario:</td>
                                                            <td colspan="3">
                                                                <asp:TextBox ID="txtContComentarios" runat="server" BorderStyle="Solid" Font-Size="8pt" Height="39px"
                                                                    MaxLength="400" TextMode="MultiLine" Width="205px" BorderColor="White"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td colspan="2">
                                                                <asp:Button ID="btnGuardarContacto" runat="server" Font-Size="8pt" Text="Guardar" OnClick="btnGuardarContacto_Click" ValidationGroup="guardarContacto" /></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <asp:Button ID="btnNuevoContacto" runat="server" Font-Size="7pt" OnClick="btnNuevoContacto_Click"
                                                    Text="Nuevo" />
                                            </FooterTemplate>
                                            <ItemTemplate><table style="width: 100%">
                                                <tr>
                                                    <td>
                                                        Responsable:</td>
                                                    <td colspan="3">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NombreResponsable") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Teléfono:</td>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label></td>
                                                    <td colspan="2">
                                                        Ext.:<asp:Label ID="Label9" runat="server" Text='<%# Bind("Extension") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Celular:</td>
                                                    <td colspan="3">
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("TelefonoCelular") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Email:</td>
                                                    <td colspan="3">
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("correoElectronico") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        Comentario:</td>
                                                    <td colspan="3">
                                                        <asp:Label ID="Label12" runat="server" Height="46px" Text='<%# Bind("Comentarios") %>'
                                                            Width="205px"></asp:Label></td>
                                                </tr>
                                            </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="contactoCXPId" HeaderText="contactoCXPId" SortExpression="contactoCXPId"
                                            Visible="False" />
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                                    Text="Actualizar"></asp:LinkButton><br />
                                                <br />
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancelar"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                    Text="Editar"></asp:LinkButton><br />
                                                <br />
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete"
                                                    Font-Bold="False" Font-Size="8pt" ForeColor="#C00000" Text="Eliminar"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConSeguimientoLlamadas %>"
                        SelectCommand="get_datosContactosCobranza" SelectCommandType="StoredProcedure" DeleteCommand="update contactosCuentasXPagar set &#13;&#10;activo = 0,&#13;&#10;usuarioIdModificacion = @intUsuarioId,&#13;&#10;fechaModificacion = getdate()&#13;&#10;where contactoCXPID = @contactoCXPID&#13;&#10;&#13;&#10;insert into logEventos(origen,cambio,tipo,usuarioId,clienteId) &#13;&#10;values('CONTACTOS','contactoCXPId:'+ convert(varchar(20),@contactoCXPID),'ELIMINACION',@intUsuarioId,@intClienteId)&#13;&#10;" UpdateCommand="insert into logEventos(origen,cambio,tipo,usuarioId,clienteId)&#13;&#10;select 'CONTACTOS',&#13;&#10;'preActualizacion|'+NombreResponsable+'|'+Telefono+'|'+Extension+'|'+correoElectronico+'|'+TelefonoCelular+'|'+Comentarios+'|contactoCXPId:'+ convert(varchar(20),@contactoCXPID),&#13;&#10;&#9;'ACTUALIZACION',@intUsuarioId,clienteId&#13;&#10;from contactosCuentasXPagar&#13;&#10;where contactoCXPID = @contactoCXPID&#13;&#10;&#13;&#10;update contactosCuentasXPagar set&#13;&#10;NombreResponsable = upper(@NombreResponsable),&#13;&#10;Telefono = @Telefono,&#13;&#10;Extension = @Extension,&#13;&#10;correoElectronico = @correoElectronico,&#13;&#10;TelefonoCelular = @TelefonoCelular,&#13;&#10;Comentarios = @Comentarios,&#13;&#10;usuarioIdModificacion = @intUsuarioId,&#13;&#10;fechaModificacion = getdate()&#13;&#10;where contactoCXPID = @contactoCXPID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lstClientes" Name="intClienteId" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="intUsuarioId" Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" />
                            <asp:Parameter Name="contactoCXPID" />
                            <asp:ControlParameter ControlID="lstClientes" Name="intClienteId" PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NombreResponsable" />
                            <asp:Parameter Name="Telefono" />
                            <asp:Parameter Name="Extension" />
                            <asp:Parameter Name="correoElectronico" />
                            <asp:Parameter Name="TelefonoCelular" />
                            <asp:Parameter Name="Comentarios" />
                            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" />
                            <asp:Parameter Name="contactoCXPID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="pnlHistorial" runat="server" BorderStyle="Outset" Height="100%"
                    Visible="False" Width="380px" BackColor="#E0E0E0">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource4"
                        Font-Size="8pt" Width="380px" ForeColor="#333333" GridLines="None" ShowHeader="False">
                        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                        <Columns>
                            <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tipo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td>
                                                <strong>TIPO</strong></td>
                                            <td>
                                                <strong>ESTATUS</strong></td>
                                            <td>
                                                <strong>FECHA</strong></td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label></td>
                                            <td align="left" valign="top">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("estatus") %>'></asp:Label></td>
                                            <td align="left" valign="top">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <strong>Usuario: </strong>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("agenteLlamo") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <strong>COMENTARIO</strong></td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Comentario") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="Cobranza_seguimientoLlamadasTableAdapters.get_listaHistorialEventosClienteTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lstClientes" Name="intClienteId" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:SessionParameter DefaultValue="0" Name="intUsuarioId" SessionField="usuarioId"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top" style="width: 731px; height: 1px;">
                <table style="width: 752px; height: 70px;">
                    <tr>
                        <td>
                <asp:Label ID="lblEtiquetaCliente" runat="server" Text="Cliente:"></asp:Label></td>
                        <td>
                <asp:DropDownList ID="lstClientes" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="razonSocial" DataValueField="idClienteAdmin" AutoPostBack="True" 
                                OnSelectedIndexChanged="lstClientes_SelectedIndexChanged">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConSeguimientoLlamadas %>" 
                                SelectCommand="get_listaClientesActivos_cartera" 
                                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="lblEtiTipoContacto" runat="server" Text="Tipo Contacto" Visible="False"></asp:Label></td>
                        <td>
                <asp:RadioButtonList ID="rdilstTipoContacto" runat="server" AutoPostBack="True" Font-Size="9pt"
                    OnSelectedIndexChanged="rdilstTipoContacto_SelectedIndexChanged" Visible="False">
                    <asp:ListItem Value="1">LLAMADA</asp:ListItem>
                    <asp:ListItem Value="2">VISITA</asp:ListItem>
                </asp:RadioButtonList></td>
                    </tr>
                </table>
                &nbsp;
                <asp:Panel ID="pnlResultado" runat="server" BackColor="DarkGray" Height="21px" HorizontalAlign="Center"
                    Width="100%">
                    <asp:Label ID="lblEtiquetaResultado" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label></asp:Panel>
                <asp:Panel ID="pnlLlamada" runat="server" Height="100%" Width="100%" BackColor="#E0E0FF" BorderColor="SteelBlue" BorderStyle="Solid" BorderWidth="2px" Visible="False">
                    <table border="0" style="width: 100%; height: 70px">
                        <tr>
                            <td style="height: 24px;" colspan="2">
                                <asp:CheckBox ID="ckbNoExitosa" runat="server" Font-Size="9pt" Text="Llamada NO EXITOSA" AutoPostBack="True" OnCheckedChanged="ckbNoExitosa_CheckedChanged" Width="158px" /></td>
                            <td style="height: 24px">
                                <asp:CheckBox ID="ckbExitosa" runat="server" Font-Size="9pt" Text="Llamada EXITOSA" AutoPostBack="True" OnCheckedChanged="ckbExitosa_CheckedChanged" /></td>
                        </tr>
                        <tr>
                            <td valign="top" style="height: 211px">
                                <asp:Label ID="lblEtiEstatusLlamada" runat="server" Text="Estatus:" Font-Size="10pt" Visible="False"></asp:Label><br />
                                <asp:ListBox ID="lstEstatusNoExitosa" runat="server" DataSourceID="ObjectDataSource2" DataTextField="ESTATUS" DataValueField="ID_ESTATUS" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="lstEstatusNoExitosa_SelectedIndexChanged" Width="190px"></asp:ListBox>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Cobranza_seguimientoLlamadasTableAdapters.get_ListaEstatusNoContactoTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter Name="intCampana" Type="Int32" />
                                        <asp:Parameter Name="intUsuario" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ListBox ID="lstEstatusExitosa" runat="server" DataSourceID="ObjectDataSource3" DataTextField="ESTATUS" DataValueField="ID_ESTATUS" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="lstEstatusExitosa_SelectedIndexChanged" Width="190px"></asp:ListBox><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Cobranza_seguimientoLlamadasTableAdapters.get_ListaEstatusSIContactoTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter Name="intCampana" Type="Int32" />
                                        <asp:Parameter Name="intUsuario" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td valign="top" style="height: 211px">
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td style="height: 109px" valign="top">
                                            <asp:Label ID="lblEtiComentario" runat="server" Font-Size="10pt" Text="Comentario:"
                                                Visible="False"></asp:Label><br />
                                            <asp:TextBox ID="txtComentario" runat="server" Height="64px" MaxLength="800" Rows="4"
                                                TextMode="MultiLine" Visible="False" Width="300px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center" valign="top">
                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Visible="False" OnClick="btnGuardar_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top" style="height: 211px">
                                <asp:Calendar ID="calProxLlamada" runat="server" BackColor="White" BorderColor="Black"
                                    DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="7pt" ForeColor="Black"
                                    Height="68px" NextPrevFormat="FullMonth" OnSelectionChanged="calProxLlamada_SelectionChanged"
                                    TitleFormat="Month" Visible="False" VisibleDate="2010-01-11" Width="202px">
                                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                        ForeColor="#333333" Width="1%" />
                                    <TodayDayStyle BackColor="#CCCC99" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <DayStyle Width="14%" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333"
                                        Height="10pt" />
                                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White"
                                        Height="14pt" />
                                </asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                            </td>
                            <td style="height: 26px">
                                </td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlVisita" runat="server" Height="100%" Width="100%" BackColor="#E0F8F7" BorderColor="SteelBlue" BorderStyle="Solid" BorderWidth="2px" Visible="False">
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="width: 731px" valign="top">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="width: 731px" valign="top">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="width: 731px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="width: 731px; height: 20px">
            </td>
            <td colspan="1" style="text-align: center; width: 9px;">
            </td>
            <td colspan="1" style="width: 93px; text-align: left">
            </td>
        </tr>
    </table>
</asp:Content>

