<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoOrdenesCompra.aspx.cs" Inherits="OrdenesCompra_formularioCredito" Title="Sick - OC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 812px; height: 74px" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 45px">
                </td>
            <td>
                <asp:HyperLink ID="hlkAltaOrdenCompra" runat="server" Font-Size="9pt" NavigateUrl="~/OrdenesCompra/formularioOrdenCompra.aspx">NUEVA OC</asp:HyperLink></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 45px">
            </td>
            <td style="text-align: left">
                    <table style="width: 530px; height: 69px">
                        <tr>
                            <td style="width: 131px">
                            </td>
                            <td style="text-align: center">
                                <strong><span style="font-size: 9pt">
                                    <asp:Label ID="lblEtiBusqueda" runat="server" Text="BUSQUEDA"></asp:Label></span></strong></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblUsuario" runat="server" Font-Size="9pt" Text="Usuario:"></asp:Label></span></td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="lstUsuario" runat="server" DataSourceID="ObjectDataSource2"
                                    DataTextField="nombreUsuario" DataValueField="usuarioId" Font-Size="9pt">
                                </asp:DropDownList></td>
                            <td>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaAgentesXPerfilTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="8" Name="intperfilId" Type="Int32" />
                                        <asp:SessionParameter DefaultValue="0" Name="intUsuarioId" SessionField="usuarioId"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <span style="font-size: 9pt"></span>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblFactura" runat="server" Font-Size="9pt" Text="Factura:"></asp:Label></span></td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtFactura" runat="server" Font-Size="9pt"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblOrigen" runat="server" Font-Size="9pt" Text="Origen:"></asp:Label></span></td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="lstOrigen" runat="server" DataSourceID="ObjectDataSource1"
                                    DataTextField="descripcion" DataValueField="origenId" Font-Size="9pt">
                                </asp:DropDownList></td>
                            <td>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_comboOrigenTableAdapter">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left; height: 25px;">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblOrdenCompra" runat="server" Font-Size="9pt" Text="Orden Compra:"></asp:Label></span></td>
                            <td style="text-align: left; height: 25px;">
                                <asp:TextBox ID="txtOrdenCompra" runat="server" Font-Size="9pt" Width="44px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtOrdenCompra"
                                    Display="Dynamic" ErrorMessage="Numérico" Font-Size="9pt" ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
                            <td style="height: 25px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblProveedor" runat="server" Font-Size="9pt" Text="Proveedor:"></asp:Label></span></td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="lstProveedor" runat="server" DataSourceID="ObjectDataSource3"
                                    DataTextField="Nombre" DataValueField="proveedorId" Font-Size="9pt">
                                </asp:DropDownList></td>
                            <td>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaProveedoresTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="intOrdenCompraId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; height: 20px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblProyecto" runat="server" Font-Size="9pt" Text="Proyecto:"></asp:Label></span></td>
                            <td style="height: 20px; text-align: left">
                                <asp:TextBox ID="txtProyecto" runat="server" Font-Size="9pt"></asp:TextBox></td>
                            <td style="height: 20px">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; text-align: left">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="lblJob" runat="server" Font-Size="9pt" Text="Job:"></asp:Label></span></td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtJob" runat="server" Font-Size="9pt" Width="75px"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px">
                            </td>
                            <td style="text-align: center">
                                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" /></td>
                            <td style="text-align: left">
                                </td>
                        </tr>
                    </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 3px;" colspan="3">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="width: 45px">
            </td>
            <td>
                <asp:GridView ID="gvListadoOrdenesCompra" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Id" DataSourceID="sdsOrdenesCompra" Font-Size="9pt" ForeColor="#333333"
                    GridLines="None" AllowPaging="True" Width="100%" AllowSorting="True" EmptyDataText="NO SE TIENEN ORDENES DE COMPRA">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                    Font-Bold="True" Font-Size="8pt" ForeColor="#CC0033" Text="X"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Id" HeaderText="id" >
                            <HeaderStyle HorizontalAlign="Left" Font-Size="8pt" />
                            <ItemStyle Font-Size="8pt" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Consecutivo" HeaderText="OC">
                            <HeaderStyle HorizontalAlign="Left" Font-Size="10pt" />
                            <ItemStyle Font-Size="10pt" Font-Bold="True" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="proveedor" HeaderText="Proveedor" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="usuario" HeaderText="Usuario" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Estatus" HeaderText="Estatus" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/formularioOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="fecha" HeaderText="Fecha" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDuplicar" runat="server" BorderStyle="Solid" BorderWidth="0px"
                                    Font-Size="8pt" OnCommand="btnDuplicar_Click" Text="Duplicar" CommandArgument='<%# Eval("Id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsOrdenesCompra" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update ordenesCompra set activo= 0,fechaModificacion=getdate(),UsuarioIdActualizo=@intUsuarioId&#13;&#10;where ordenCompraId = @Id"
                    SelectCommand="get_listaOrdenesCompra" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Id" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsOrdenesCompraBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update ordenesCompra &#13;&#10;set activo = 0,fechaModificacion=getdate(),UsuarioIdActualizo=@intUsuarioId&#13;&#10;where ordenCompraId = @Id"
                    SelectCommand="get_listaOrdenesCompraBusqueda" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstUsuario" DefaultValue="0" Name="intUsuarioId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFactura" DefaultValue=" " Name="strFactura" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="txtOrdenCompra" DefaultValue="0" Name="intOrdenCompraId"
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="lstProveedor" DefaultValue="0" Name="intproveedorId"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtProyecto" DefaultValue=" " Name="strNombreproyecto"
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtJob" DefaultValue=" " Name="strNombreJob" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="lstOrigen" DefaultValue="0" Name="intOrigenId" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" />
                        <asp:Parameter Name="Id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 45px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

