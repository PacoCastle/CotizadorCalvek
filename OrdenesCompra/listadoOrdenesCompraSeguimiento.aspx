<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoOrdenesCompraSeguimiento.aspx.cs" Inherits="OrdenesCompra_formularioCredito" Title="Seguimiento - OC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 912px; height: 74px" cellpadding="0" cellspacing="0">
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
                                <asp:TextBox ID="txtOrdenCompra" runat="server" Font-Size="9pt" Width="60px"></asp:TextBox>
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
                                <asp:DropDownList ID="lstJobs" runat="server" AppendDataBoundItems="True" DataSourceID="odsListaJob"
                                    DataTextField="Nombre" DataValueField="Nombre">
                                    <asp:ListItem Value=" ">--</asp:ListItem>
                                </asp:DropDownList><asp:ObjectDataSource ID="odsListaJob" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="OrdenCompraTableAdapters.get_listadoOC_jobsTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td align="right">
                                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" /></td>
                        </tr>
                        <tr>
                            <td style="width: 131px">
                            </td>
                            <td style="text-align: center">
                                </td>
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
            <td align="center" colspan="2">
                <asp:GridView ID="gvListadoOrdenesCompra" runat="server" AutoGenerateColumns="False" CellPadding="2"
                    DataKeyNames="Id" DataSourceID="sdsOrdenesCompra" Font-Size="9pt" ForeColor="#333333"
                    GridLines="Horizontal" AllowPaging="True" Width="100%" AllowSorting="True" EmptyDataText="NO SE TIENEN ORDENES DE COMPRA" BorderStyle="None" HorizontalAlign="Center">
                    <FooterStyle Font-Bold="True" ForeColor="#5D7B9D" HorizontalAlign="Left" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Id" HeaderText="ID" >
                            <HeaderStyle HorizontalAlign="Center" Font-Size="8pt" Width="5%" />
                            <ItemStyle Font-Size="8pt" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Consecutivo" HeaderText="OC">
                            <HeaderStyle HorizontalAlign="Left" Font-Size="10pt" Width="10%" />
                            <ItemStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="proveedor" HeaderText="PROVEEDOR" >
                            <HeaderStyle HorizontalAlign="Left" Width="30%" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="usuario" HeaderText="USUARIO" >
                            <HeaderStyle HorizontalAlign="Left" Width="20%" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="Estatus" HeaderText="ESTATUS" >
                            <HeaderStyle HorizontalAlign="Left" Width="15%" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="fecha" HeaderText="FECHA" >
                            <HeaderStyle HorizontalAlign="Center" Width="10%" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/OrdenesCompra/seguimientoOrdenCompra.aspx?ordenCompraId={0}"
                            DataTextField="pendientes" HeaderText="PENDIENTES">
                            <HeaderStyle HorizontalAlign="Center" Width="10%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle ForeColor="#5D7B9D" HorizontalAlign="Left" />
                    <HeaderStyle Font-Bold="True" ForeColor="Navy" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsOrdenesCompra" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update ordenesCompra set activo= 0,fechaModificacion=getdate(),UsuarioIdActualizo=@intUsuarioId&#13;&#10;where ordenCompraId = @Id"
                    SelectCommand="get_listaSeguimientoOrdenesCompraConPendientes" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" />
                        <asp:Parameter Name="Id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsOrdenesCompraBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    DeleteCommand="update ordenesCompra &#13;&#10;set activo = 0,fechaModificacion=getdate(),UsuarioIdActualizo=@intUsuarioId&#13;&#10;where ordenCompraId = @Id"
                    SelectCommand="get_listaSeguimientoOrdenesCompraBusqueda" SelectCommandType="StoredProcedure">
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
                        <asp:ControlParameter ControlID="lstJobs" DefaultValue=" " Name="strNombreJob" PropertyName="SelectedValue"
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
    </table>
</asp:Content>

