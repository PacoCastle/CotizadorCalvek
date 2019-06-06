<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioUsuario.aspx.cs" Inherits="Seguridad_FormularioUsuario" Title="SICK-USUARIOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript" language="javascript">
        function new_window(url) {
            newwindow = window.open(url, 'Cambio_de_Password', 'top=50,left=200,width=550px,height=350px,scrollbars=yes');
            newwindow.focus();
        }
    </script>
    <div class="container">
        <h1>Alta Usuarios</h1>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="" Style="color: #008080;"></asp:Label>
            <%--<strong><span style="color: #008080;">Datos</span></strong>--%>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label ID="Mensaje01" runat="server" Text=""></asp:Label>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_listaVendedoresKeplerTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Nombre de usuario: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtUsuarioId" class="form-control" runat="server" required="required" type="text" MaxLength="18"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Nombre completo: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNombre" class="form-control" runat="server" required="required" type="text"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Password: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                    
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="Button2" runat="server" Text="Cambiar" Visible="False" />
                    <asp:TextBox ID="txtPassword" class="form-control" runat="server" ToolTip="Teclea tu Password" required="required" type="password"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label ID="Label2" runat="server" Text="Confirma Password: *"></asp:Label>
                    <%--<h5 class="align-middle pull-right">Confirma Password: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>--%>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtConformaPaswword" class="form-control" runat="server" ToolTip="Confirma tu Password" required="required" type="password"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Perfil:: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="listPerfil" class="form-control" runat="server" required="required" DataSourceID="ObjectDataSource3" DataTextField="texto" DataValueField="valor" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboPerfilesTableAdapter">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Estatus: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="listEstatus" class="form-control" runat="server" required="required" DataSourceID="ObjectDataSource1" DataTextField="texto" DataValueField="valor" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboEstatusTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Email: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCorreo" class="form-control" runat="server" required="required" type="email"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Telefono: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtRadio" class="form-control" runat="server" required="required" type="text"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <asp:Button ID="Button1" runat="server" class="form-control" Text="Guardar" OnClick="Button1_Click" />
                </div>
            </div>
            <div class="row" runat="server" id="OtrosUsuario">
                <div class="col-sm-4">
                    <asp:Label ID="Label6" runat="server" Text="Oficina:" AssociatedControlID="listOficina" AccessKey="O"></asp:Label>
                <asp:DropDownList ID="listOficina" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="texto" DataValueField="valor">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                    
                    <asp:Label ID="Label9" runat="server" Text="Vendedor ERP:" AssociatedControlID="listUsuarioAdmin" AccessKey="S"></asp:Label>
                    <asp:DropDownList ID="listUsuarioAdmin" runat="server" DataSourceID="ObjectDataSource4"
                        DataTextField="NOMBRE" DataValueField="CODIGO" AppendDataBoundItems="True">
                    </asp:DropDownList>
                    <asp:Label ID="Label12" runat="server" Text="Jefe o Supervisor:" AssociatedControlID="lstJefe" AccessKey="J"></asp:Label>
                    <asp:DropDownList ID="lstJefe" runat="server" DataSourceID="ObjectDataSource5" DataTextField="NombreAgente"
                        DataValueField="usuarioId">
                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUsuariosActivosTableAdapter"></asp:ObjectDataSource>
                    <asp:Label ID="Label14" runat="server" Text="Administrativo:" AssociatedControlID="lstAdministrativo" AccessKey="A"></asp:Label>
                    <asp:DropDownList ID="lstAdministrativo" runat="server" DataSourceID="ObjectDataSource7" DataTextField="NombreAgente"
                        DataValueField="usuarioId">
                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUsuariosActivosTableAdapter"></asp:ObjectDataSource>
                    <asp:Label ID="Label15" runat="server" Text="Ventas internas:" AssociatedControlID="lstVentasInternas" AccessKey="V"></asp:Label>
                    <asp:DropDownList ID="lstVentasInternas" runat="server" DataSourceID="ObjectDataSource8" DataTextField="NombreAgente"
                        DataValueField="usuarioId">
                    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUsuariosActivosTableAdapter"></asp:ObjectDataSource>
                    <asp:Label ID="Label13" runat="server" AccessKey="J" AssociatedControlID="lstComision"
                        Text="Tipo Comisión:"></asp:Label><asp:DropDownList ID="lstComision" runat="server" DataSourceID="ObjectDataSource6" DataTextField="descripcion"
                            DataValueField="comisionesId" AppendDataBoundItems="True">
                            <asp:ListItem Value="0"></asp:ListItem>
                        </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaCatComisionesTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    <asp:CheckBox ID="ckCorreoOC" runat="server" Text="Correo OC" />
                    <asp:CheckBox ID="ckCorreoTraspaso" runat="server" Text="Correo Traspasos" />

                </div>
            </div>
        </div>
    </div>

</asp:Content>

