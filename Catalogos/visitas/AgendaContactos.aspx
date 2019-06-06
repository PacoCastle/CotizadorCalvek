<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AgendaContactos.aspx.cs" Inherits="Catalogos_visitas_Departamentos" Title="VISITAS-AGENDACONTACTOS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 814px">
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="lblEtiquetaTitulo" runat="server" Text="Contactos"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;<asp:Label ID="lblMensaje" runat="server" Font-Size="7pt"></asp:Label></td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
                <asp:Label ID="Label2" runat="server" Text="Cliente:"></asp:Label>
                <asp:DropDownList ID="lstClientes" runat="server" AutoPostBack="True" DataSourceID="odsClientes"
                    DataTextField="razonSocial" DataValueField="idClienteAdmin" Width="300px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsClientes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td style="height: 101px">
            </td>
            <td style="height: 101px">
                <asp:GridView ID="gvwSolicitudApoyo" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsSolicitudApoyoVisitas" Font-Size="8pt"
                    ForeColor="#333333" GridLines="None" ShowFooter="True" Height="81px" Width="791px" DataKeyNames="contactoVisitadoId" >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="contactoVisitadoId" HeaderText="Id" InsertVisible="False"
                            ReadOnly="True" SortExpression="contactoVisitadoId" />
                        <asp:TemplateField HeaderText="Nombre" SortExpression="nombre">
                            <EditItemTemplate>
                                &nbsp;<asp:Label ID="Label22" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Puesto" SortExpression="puesto">
                            <EditItemTemplate>
                                <asp:DropDownList ID="puestoId" runat="server" AppendDataBoundItems="True" DataSourceID="odsPuestoVisita"
                                    DataTextField="nombre" DataValueField="PuestoId" Font-Size="9pt" SelectedValue='<%# Bind("PuestoId") %>'
                                    Width="146px">
                                    <asp:ListItem Selected="True" Value="0"></asp:ListItem>
                                </asp:DropDownList><asp:ObjectDataSource ID="odsPuestoVisita" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaPuestoVisitaTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                                            Type="Int32" />
                                        <asp:Parameter DefaultValue="-1" Name="intActivo" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("puesto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Departamento" SortExpression="departamentoVisita">
                            <EditItemTemplate>
                                <asp:DropDownList ID="departamentoVisitaId" runat="server" DataSourceID="odsDepartamento"
                                    DataTextField="nombre" DataValueField="departamentoVisitaId" Font-Size="9pt" Width="122px" SelectedValue='<%# Bind("departamentoVisitaId") %>'>
                                    <asp:ListItem Selected="True" Value="0"></asp:ListItem>
                                </asp:DropDownList><asp:ObjectDataSource ID="odsDepartamento" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaDepartamentoVisitaTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="-1" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("departamentoVisita") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tel&#233;fono" SortExpression="telefono">
                            <EditItemTemplate>
                                <asp:TextBox ID="telefono" runat="server" Text='<%# Bind("telefono") %>' Width="120px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="telefono"
                                    Display="Dynamic" ErrorMessage="El Teléfono no es correcto" Font-Size="8pt" ValidationExpression="\d{10}"
                                    Width="158px"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Celular" SortExpression="celular">
                            <EditItemTemplate>
                                <asp:TextBox ID="celular" runat="server" Text='<%# Bind("celular") %>' Width="120px"></asp:TextBox><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="celular" Display="Dynamic"
                                    ErrorMessage="El Celular no es correcto" Font-Size="8pt" ValidationExpression="\d{10}"
                                    Width="156px"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("celular") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correo" SortExpression="correo">
                            <EditItemTemplate>
                                <asp:TextBox ID="correo" runat="server" Text='<%# Bind("correo") %>' Width="120px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correo"
                                    Display="Dynamic" ErrorMessage="El correo no es valido" Font-Size="8pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="nuevoContacto" Width="151px"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("correo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Estatus" HeaderText="Estatus" ReadOnly="True" SortExpression="Estatus" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Actualizar" />&nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Editar" />
                                <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete"
                                    Font-Bold="True" Font-Size="8pt" ForeColor="Red" Text="X" ToolTip="Quitar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsSolicitudApoyoVisitas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update ContactoVisitado set activo = 0&#13;&#10;where contactoVisitadoId = @contactoVisitadoId&#13;&#10;"
                    InsertCommand="insert into solicitudApoyoVisita(nombre,activo) values(@nombre,1)"
                    SelectCommand="get_listaContactosVisita" SelectCommandType="StoredProcedure" UpdateCommand="set_actualizaContactosVisita" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:ControlParameter ControlID="lstClientes" Name="intClienteId" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="contactoVisitadoId" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nombre" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="departamentoVisitaId" Type="Int32" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="celular" Type="String" />
                        <asp:Parameter Name="correo" Type="String" />
                        <asp:Parameter Name="contactoVisitadoId" Type="Int32" />
                        <asp:Parameter Name="puestoId" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="lblMensaje2" runat="server" Font-Size="7pt"></asp:Label></td>
            <td style="height: 101px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

