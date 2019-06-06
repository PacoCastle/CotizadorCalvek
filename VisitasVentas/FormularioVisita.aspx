<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioVisita.aspx.cs" Inherits="VisitasVentas_FormularioVisita" Title="VISITA-FORMULARIO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
	
<script type="text/javascript">

function OnChangeNovedad(dropdown,campotexto,etiqueta)
{
    var myindex  = dropdown.selectedIndex;
    //var SelValue = dropdown.options[myindex].value;
    var SelTexto = dropdown.options[myindex].text;
    //alert(SelTexto);
    if(SelTexto == "OTRO")
    {
        document.getElementById(campotexto).removeAttribute('disabled');
        document.getElementById(campotexto).focus();
        document.getElementById(etiqueta).style.color="#000080";
    }
    else
    {
        document.getElementById(campotexto).value="";
        document.getElementById(campotexto).setAttribute('disabled');
        document.getElementById(etiqueta).style.color='#808080';
    }
    
    return true;
}

</script>

    <table style="width: 749px">
        <tr>
            <td colspan="4" style="height: 34px; text-align: center">
                <asp:Label ID="lblTitulo1" runat="server" Font-Bold="True" Text="Datos generales de la Visita"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 85px">
                <asp:LinkButton ID="lnklistado" runat="server" Font-Size="10pt" PostBackUrl="~/VisitasVentas/listadoVisitas.aspx">ListadoVisitas</asp:LinkButton></td>
            <td>
                <asp:LinkButton ID="lnkNuevaVisita" runat="server" Font-Size="10pt" 
                    PostBackUrl="~/VisitasVentas/FormularioVisita.aspx" OnClick="lnkNuevaVisita_Click">Nuevo</asp:LinkButton>
                <asp:Label ID="lblEtiquetaVisita" runat="server" Font-Size="10pt" Text="Visita No."
                    Visible="False"></asp:Label></td>
            <td colspan="2">
                <asp:Label ID="lblMensaje" runat="server" Font-Size="10pt" ForeColor="#00CC00"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 85px">
                <asp:Label ID="lblEtiqueta3" runat="server" Text="Empresa visitada:" Font-Size="9pt" Width="115px"></asp:Label></td>
            <td>
                <asp:DropDownList ID="lstEmpresa" runat="server" Font-Size="9pt" DataSourceID="odsCliente" DataTextField="razonSocial" DataValueField="idClienteAdmin" AutoPostBack="True" Width="400px" AppendDataBoundItems="True" OnSelectedIndexChanged="lstEmpresa_SelectedIndexChanged">
                    <asp:ListItem Value="99999">OTRO</asp:ListItem>
                </asp:DropDownList>
                <asp:CheckBox ID="ckbSeguimiento" runat="server" Font-Size="9pt" 
                    Text="Seguimiento" />
                <asp:ObjectDataSource ID="odsCliente" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lstEmpresa"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" InitialValue="0"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator><br />
                <asp:Label ID="lblOtroCliente" runat="server" Font-Bold="True" Font-Size="7pt" ForeColor="Navy"
                    Text="Especifique:" Visible="False"></asp:Label><asp:TextBox ID="txtOtroCliente" runat="server"
                        Font-Size="9pt" MaxLength="50" Visible="False" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOtroCliente" runat="server" ControlToValidate="txtOtroCliente"
                    Display="Dynamic" Enabled="False" ErrorMessage="Campo requerido" Font-Size="7pt"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator></td>
            <td valign="top">
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 85px">
                <asp:Label ID="lblEtiqueta2" runat="server" Text="Fecha de la visita:" Font-Size="9pt" Width="123px"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFecha" runat="server" Font-Size="9pt" MaxLength="10" Width="88px" ></asp:TextBox>
                <asp:Label ID="Label4" runat="server" Font-Size="7pt" Text="dd/mm/aaaa" Width="77px"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFecha"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" SetFocusOnError="True"
                    ValidationGroup="procesar"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFecha"
                        ErrorMessage="fecha invalida" Font-Size="7pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                        
                </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="gvwContactoVisitado" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="contactoVisitadoId" DataSourceID="sdsContactosVisitas" Font-Size="7pt" Height="1px" ShowFooter="True" onRowDataBound="gvwContactoVisitado_RowDataBound" Caption="<B>Contacto Visitado</B>" ShowHeader="False" Width="404px">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Insert"
                                    Font-Bold="True" Font-Size="8pt" ForeColor="Green" OnClick="GridViewInsert" Text="+"
                                    ToolTip="Agregar" Visible="False" ValidationGroup="nuevoContacto" /><br />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbContacto" runat="server" />
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete"
                                    Font-Bold="True" Font-Size="8pt" ForeColor="Red" Text="X" ToolTip="Quitar" Visible="False" />
                            </ItemTemplate>
                            <ItemStyle ForeColor="Red" Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate><table style="width: 0px; height: 0px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNombre" runat="server" Text="Nombre:" Visible="False"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="nombre" runat="server" Font-Size="9pt" Height="13px" MaxLength="80" Width="100px" Visible="False"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPuesto" runat="server" Text="Puesto:" Visible="False"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="puesto" runat="server" DataSourceID="odsPuestoVisita" DataTextField="nombre"
                                                DataValueField="PuestoId" Font-Size="9pt" Visible="False" Width="107px">
                                            </asp:DropDownList><asp:ObjectDataSource ID="odsPuestoVisita" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaPuestoVisitaTableAdapter">
                                                <SelectParameters>
                                                    <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                                                        Type="Int32" />
                                                    <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDepartamento" runat="server" Text="Departamento:" Visible="False"></asp:Label></td>
                                        <td>
                <asp:DropDownList ID="lstDepartamento" runat="server" Font-Size="9pt" DataSourceID="odsDepartamento" DataTextField="nombre" DataValueField="departamentoVisitaId" Width="107px" Visible="False">
                </asp:DropDownList><asp:ObjectDataSource ID="odsDepartamento" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaDepartamentoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" Visible="False"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="telefono" runat="server" Font-Size="9pt" Height="13px" MaxLength="10"
                                                Width="100px" Visible="False"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="telefono"
                                                Display="Dynamic" ErrorMessage="El Teléfono no es correcto" Font-Size="8pt" ValidationExpression="\d{10}"
                                                ValidationGroup="nuevoContacto" Width="158px"></asp:RegularExpressionValidator></td>
                                    </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCelular" runat="server" Text="Celular:" Visible="False"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="celular" runat="server" Font-Size="9pt" Height="13px" MaxLength="10"
                                            Visible="False" Width="100px"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="celular"
                                            Display="Dynamic" ErrorMessage="El Celular no es correcto" Font-Size="8pt" ValidationExpression="\d{10}"
                                            ValidationGroup="nuevoContacto" Width="156px"></asp:RegularExpressionValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCorreo" runat="server" Text="Correo:" Visible="False"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="correo" runat="server" Font-Size="9pt" Height="15px" MaxLength="100"
                                            Visible="False" Width="100px"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correo"
                                            Display="Dynamic" ErrorMessage="El correo no es valido" Font-Size="8pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="nuevoContacto" Width="151px"></asp:RegularExpressionValidator></td>
                                </tr>
                            </table>
                                <asp:Button ID="btnNuevo" runat="server" Font-Size="7pt" OnClick="btnNuevo_Click"
                                    Text="Nuevo Contacto" ValidationGroup="nuevoContacto" BorderStyle="None" BorderWidth="1px" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="95%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="banderaContacto" HeaderText="banderaContacto" SortExpression="banderaContacto"
                            Visible="False" />
                    </Columns>
                    <EmptyDataTemplate><table style="width: 1px; height: 1px;">
                        <tr>
                            <td>
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" Visible="False"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="nombre" runat="server" Font-Size="9pt" Height="13px" MaxLength="80"
                                    Visible="False" Width="100px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPuesto" runat="server" Text="Puesto:" Visible="False"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="puesto" runat="server" DataSourceID="odsPuestoVisita" DataTextField="nombre"
                                    DataValueField="PuestoId" Font-Size="9pt" Visible="False" Width="120px">
                                </asp:DropDownList><asp:ObjectDataSource ID="odsPuestoVisita" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaPuestoVisitaTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="intUsuarioId" SessionField="usuarioId"
                                            Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDepartamento" runat="server" Text="Departamento:" Visible="False"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="lstDepartamento" runat="server" DataSourceID="odsDepartamento"
                                    DataTextField="nombre" DataValueField="departamentoVisitaId" Font-Size="9pt"
                                    Visible="False" Width="120px">
                                </asp:DropDownList><asp:ObjectDataSource ID="odsDepartamento" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaDepartamentoVisitaTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" Visible="False"></asp:Label></td>
                            <td>
                        <asp:TextBox ID="telefono" runat="server" Height="13px" MaxLength="10" Width="100px" Visible="False" Font-Size="9pt"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="telefono"
                                    Display="Dynamic" ErrorMessage="El Teléfono no es correcto" Font-Size="8pt" ValidationExpression="\d{10}"
                                    ValidationGroup="nuevoContacto" Width="158px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCelular" runat="server" Text="Celular:" Visible="False"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="celular" runat="server" Font-Size="9pt" Height="13px" MaxLength="10"
                                    Visible="False" Width="100px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="celular"
                                    Display="Dynamic" ErrorMessage="El Celular no es correcto" Font-Size="8pt" ValidationExpression="\d{10}"
                                    ValidationGroup="nuevoContacto" Width="156px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCorreo" runat="server" Text="Correo:" Visible="False"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="correo" runat="server" Font-Size="9pt" Height="13px" MaxLength="100"
                                    Visible="False" Width="100px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correo"
                                    Display="Dynamic" ErrorMessage="El correo no es valido" Font-Size="8pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="nuevoContacto" Width="151px"></asp:RegularExpressionValidator></td>
                        </tr>
                    </table>
                        <asp:Button ID="Button2" runat="server" CommandName="EmptyInsert" Font-Bold="True"
                            Font-Size="7pt" ForeColor="Green" OnClick="btnAgregar_Click" Text="Agregar (+)"
                            UseSubmitBehavior="False" Visible="False" ValidationGroup="nuevoContacto" BorderStyle="None" BorderWidth="1px" /><asp:Button ID="btnNuevo" runat="server" OnClick="btnNuevoVacio_Click" Text="Nuevo Contacto" Height="22px" BorderStyle="None" BorderWidth="1px" Font-Size="7pt" />
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsContactosVisitas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update departamentoVisita set activo = 0 &#13;&#10;where departamentoVisitaId = @departamentoVisitaId"
                    InsertCommand="insert into ContactoVisitado(clienteId,nombre,telefono,usuarioId,PuestoId,departamentoVisitaId,celular,correo) values(@clienteId,@nombre,@telefono,@usuarioId,@puesto,@departamentoId,@celular,@correo)&#13;&#10;"
                    SelectCommand="get_listaContactoVisitado" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstEmpresa" Name="intClienteId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:QueryStringParameter Name="intVisitaId" QueryStringField="visitaId" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="departamentoVisitaId" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="lstEmpresa" Name="clienteId" PropertyName="SelectedValue" />
                        <asp:Parameter Name="nombre" />
                        <asp:Parameter Name="telefono" />
                        <asp:SessionParameter Name="usuarioId" SessionField="usuarioId" />
                        <asp:Parameter Name="puesto" />
                        <asp:Parameter Name="departamentoId" />
                        <asp:Parameter Name="celular" />
                        <asp:Parameter Name="correo" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="txtContactoVisitado" runat="server" Font-Size="9pt" MaxLength="80"
                    Visible="False" Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 39px; text-align: center" align="left">
                <table style="width: 1px; height: 1px">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="lblTitulo2" runat="server" Font-Bold="True" Text="Tema de la Visita" Font-Size="10pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                <asp:Label  runat="server" ID="Label3" Font-Size="9pt" Text="Novedad presentada:" Width="161px"></asp:Label><br />
                <asp:DropDownList ID="lstNovedad" runat="server" Font-Size="9pt" DataSourceID="odsNovedad" DataTextField="nombre" DataValueField="novedadVisitaId" AppendDataBoundItems="True"  onchange="OnChangeNovedad(this,'ctl00_MainContent_txtOtroNovedad','ctl00_MainContent_lblOtroNovedad');" >
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lstNovedad"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" InitialValue="0"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator><asp:ObjectDataSource ID="odsNovedad" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaNovedadVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                            &nbsp;&nbsp;
                        </td>
                        <td align="left" style="width: 3px">
                <asp:Label ID="lblOtroNovedad" runat="server" Font-Bold="True" Font-Size="7pt" ForeColor="Gray"
                    Text="OTRO:"></asp:Label><br />
                <asp:TextBox ID="txtOtroNovedad" runat="server" Font-Size="9pt" MaxLength="30"
                    Width="250px" Enabled="False"></asp:TextBox><asp:RequiredFieldValidator ID="rfvOtroNovedad" runat="server" ControlToValidate="txtOtroNovedad"
                    Display="Dynamic" Enabled="False" ErrorMessage="Campo requerido" Font-Size="7pt"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left">
                <asp:Label ID="lblEtiqueta6" runat="server" Font-Size="9pt" Text="Tema presentado:"></asp:Label><asp:DropDownList ID="lstTema" runat="server" DataSourceID="odsTemaPresentado" DataTextField="nombre"
                    DataValueField="temaPresentadoId" AppendDataBoundItems="True" onchange="OnChangeNovedad(this,'ctl00_MainContent_txtOtroTemaPresent','ctl00_MainContent_lblOtroTemaPresent');">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lstTema"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" InitialValue="0"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator><asp:ObjectDataSource ID="odsTemaPresentado" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaTemaPresentadoTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="intActivo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                        </td>
                        <td align="left" style="width: 3px">
                <asp:Label ID="lblOtroTemaPresent" runat="server" Font-Bold="True" Font-Size="7pt"
                    ForeColor="Gray" Text="OTRO:"></asp:Label><br />
                            <asp:TextBox ID="txtOtroTemaPresent" runat="server" Font-Size="9pt" MaxLength="30" Width="250px" Enabled="False"></asp:TextBox><asp:RequiredFieldValidator ID="rfvOtroTemaPresent" runat="server" ControlToValidate="txtOtroTemaPresent"
                    Display="Dynamic" Enabled="False" ErrorMessage="Campo requerido" Font-Size="7pt"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left">
                <asp:Label ID="lblEtiqueta7" runat="server" Text="Objetivo de la visita:" Font-Size="9pt"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="lstObjVisita"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" InitialValue="0"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator><asp:ObjectDataSource ID="odsObjetivo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaObjetivoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:DropDownList ID="lstObjVisita" runat="server" Font-Size="9pt" DataSourceID="odsObjetivo" DataTextField="nombre" DataValueField="objetivoVisitaId" AppendDataBoundItems="True" onchange="OnChangeNovedad(this,'ctl00_MainContent_txtOtroObjVisita','ctl00_MainContent_lblOtroObjVisita');">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList></td>
                        <td align="left" style="width: 3px">
                <asp:Label ID="lblOtroObjVisita" runat="server" Font-Bold="True" Font-Size="7pt"
                    ForeColor="Gray" Text="OTRO:"></asp:Label><asp:RequiredFieldValidator ID="rfvOtroObjVisita" runat="server" ControlToValidate="txtOtroObjVisita"
                    Display="Dynamic" Enabled="False" ErrorMessage="Campo requerido" Font-Size="7pt"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator><asp:TextBox ID="txtOtroObjVisita" runat="server" Font-Size="9pt" MaxLength="30" Width="250px" Enabled="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Comentario:"></asp:Label><br />
                <asp:TextBox ID="txtComentarios" runat="server" Font-Size="9pt" Height="42px" MaxLength="800"
                    Rows="3" TextMode="MultiLine" Width="430px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtComentarios"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" SetFocusOnError="True"
                    ValidationGroup="procesar"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left">
                <asp:Label ID="lblEtiqueta8" runat="server" Text="Siguiente paso:" Font-Size="9pt"></asp:Label><asp:DropDownList ID="lstSigPaso" runat="server" Font-Size="9pt" DataSourceID="odsSiguientePaso" DataTextField="nombre" DataValueField="siguientePasoId" AppendDataBoundItems="True" onchange="OnChangeNovedad(this,'ctl00_MainContent_txtOtroSigPaso','ctl00_MainContent_lblOtroSigPaso');">
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lstSigPaso"
                    Display="Dynamic" ErrorMessage="Campo requerido" Font-Size="7pt" InitialValue="0"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator><asp:ObjectDataSource ID="odsSiguientePaso" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaSiguientePasoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                        </td>
                        <td align="left" style="width: 3px">
                <asp:Label ID="lblOtroSigPaso" runat="server" Font-Bold="True" Font-Size="7pt" ForeColor="Gray"
                    Text="OTRO:"></asp:Label><asp:TextBox ID="txtOtroSigPaso" runat="server" Font-Size="9pt" MaxLength="30"
                    Width="250px" Enabled="False"></asp:TextBox><asp:RequiredFieldValidator ID="rfvOtroSigPaso" runat="server" ControlToValidate="txtOtroSigPaso"
                    Display="Dynamic" Enabled="False" ErrorMessage="Campo requerido" Font-Size="7pt"
                    SetFocusOnError="True" ValidationGroup="procesar"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left">
                <asp:Label ID="lblEtiqueta9" runat="server" Text="Solicitud de apoyo:" Font-Size="9pt"></asp:Label>
                <asp:DropDownList ID="lstSolApoyo" runat="server" Font-Size="9pt" DataSourceID="odsSolicitudApoyo" DataTextField="nombre" DataValueField="solicitudApoyoId" AppendDataBoundItems="True" >
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="odsSolicitudApoyo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaSolicitudApoyoVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="UsuarioId" Type="Int32" />
                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                        </td>
                        <td align="left" style="width: 3px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                <asp:Label ID="lblEtiqueta10" runat="server" Text="Tema de apoyo:" Font-Size="9pt"></asp:Label><br />
                <asp:TextBox ID="txtTemaApoyo" runat="server" Font-Size="9pt" MaxLength="50" Width="430px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="width: 3px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; height: 42px;">
                <asp:Label ID="lblTitulo3" runat="server" Font-Bold="True" Font-Size="11pt" Visible="False">Seguimiento de la visita</asp:Label></td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <asp:Label ID="lblEtiqueta11" runat="server" Text="Estatus actual:" Font-Size="9pt" Visible="False" Width="127px"></asp:Label><br />
                <asp:DropDownList ID="lstEstatusActual2" runat="server" DataSourceID="odsEstatusVisita"
                    DataTextField="nombre" DataValueField="estatusActualId" Visible="False" AppendDataBoundItems="True" AutoPostBack="True" >
                    <asp:ListItem Value="0">-</asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="odsEstatusVisita" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaEstatusActualVisitaTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                        <asp:Parameter Name="intActivo" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <asp:Label ID="lblEtiqueta12" runat="server" Text="¿Se realizo la venta?" Font-Size="9pt" Visible="False"></asp:Label><br />
                <asp:RadioButtonList ID="rblBanderaVenta" runat="server" Font-Size="9pt" Visible="False" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">SI</asp:ListItem>
                    <asp:ListItem Value="2">NO</asp:ListItem>
                </asp:RadioButtonList></td>
            <td valign="top">
            </td>
            <td valign="top">
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <asp:Label ID="lblEtiqueta13" runat="server" Text="Observaciones:" Font-Size="9pt" Visible="False"></asp:Label><br />
                <asp:TextBox ID="txtObservaciones" runat="server" Font-Size="9pt" Height="42px" Rows="3" TextMode="MultiLine" Width="430px" MaxLength="800" Visible="False"></asp:TextBox></td>
            <td valign="top">
                </td>
            <td valign="top">
                </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 85px;">
            </td>
            <td style="height: 20px">
                <asp:Button ID="btnContinuar" runat="server" Font-Size="10pt" OnClick="btnContinuar_Click1"
                    Text="Continuar" ValidationGroup="procesar" BorderStyle="None" BorderWidth="1px" /><br />
            </td>
            <td style="height: 20px" colspan="2">
                <asp:Label ID="lblMensaje2" runat="server" Font-Size="10pt" ForeColor="#00CC00"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

