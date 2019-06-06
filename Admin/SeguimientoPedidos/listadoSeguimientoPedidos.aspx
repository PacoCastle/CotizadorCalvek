<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listadoSeguimientoPedidos.aspx.cs" Inherits="Admin_SeguimientoPedidos_listadoSeguimientoPedidos" Title="Seguimiento a Pedido Cotizador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <table width="100%">
        <tr>
            <td style="width: 13px">
                <asp:Label ID="lblCodigoAdmin" runat="server" Visible="False"></asp:Label></td>
            <td style="width: 3px">
                <span style="font-size: 10pt"><strong>Pedidos Pendientes</strong></span></td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td colspan="3" title="SEGUIMIENTO PEDIDOS">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odsPedidosPendientes" Font-Size="9pt" ForeColor="Black" GridLines="None"
                    Width="100%" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="Serie" HeaderText="Serie" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="Folio" HeaderText="Folio" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="Referencia" HeaderText="Referencia" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="Cliente" HeaderText="Cliente" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="Fecha" HeaderText="Fecha" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="Estatus" HeaderText="Estatus" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="TIPO" HeaderText="Tipo" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="oficina" HeaderText="Oficina" />
                        <asp:HyperLinkField DataNavigateUrlFields="serie,folio,oficinaId" DataNavigateUrlFormatString="formuSegPedidos.aspx?serie={0}&amp;folio={1}&amp;oficinaId={2}"
                            DataTextField="agente" HeaderText="Agente" />
                        <asp:BoundField DataField="TIPO_DOC" HeaderText="TIPO_DOC" SortExpression="TIPO_DOC" >
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                       <%-- <asp:BoundField DataField="surtido" HeaderText="surtido" SortExpression="surtido" >
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="compra" HeaderText="compra" SortExpression="compra" >
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="traspaso" HeaderText="traspaso" SortExpression="traspaso" >
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="surtir" HeaderText="surtir" SortExpression="surtir" >
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="partidas" HeaderText="partidas" SortExpression="partidas" >
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" Visible="False" />--%>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsPedidosPendientes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_listaSeguimientoPedidosTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblCodigoAdmin" Name="strCodigoAgente" PropertyName="Text"
                            Type="String" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsPedidosPendientesBusqueda" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_listaSeguimientoPedidosBusquedaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblCodigoAdmin" DefaultValue=" " Name="strCodigoAgente"
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPedido" Name="intPedido" PropertyName="Text"
                            Type="Int32" DefaultValue="0" />
                        <asp:ControlParameter ControlID="lstCliente" Name="intCliente" PropertyName="SelectedValue"
                            Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="txtFechaDe" DefaultValue=" " Name="strFechade" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="txtFechaHasta" Name="strFechaHasta" PropertyName="Text"
                            Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="lstOpciones" DefaultValue="0" Name="intOpciones"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lstAgentes" DefaultValue=" " Name="strAgente" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtReferencia" DefaultValue=" " 
                            Name="strReferencia" PropertyName="Text" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
                <strong><span style="font-size: 10pt"></span></strong>
            </td>
            <td style="width: 3px">
                <strong><span style="font-size: 10pt">Busqueda</span></strong></td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
            </td>
            <td style="width: 3px">
            </td>
            <td style="width: 3px">
            </td>
        </tr>
         <tr>
            <td style="width: 13px">
                <span style="font-size: 9pt">Referencia:</span></td>
            <td style="width: 3px">
                <asp:TextBox ID="txtReferencia" runat="server" Width="94px"></asp:TextBox></td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
                <span style="font-size: 9pt">Pedido:</span></td>
            <td style="width: 3px">
                <asp:TextBox ID="txtPedido" runat="server" Width="94px"></asp:TextBox></td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
                <span style="font-size: 9pt">Cliente:</span></td>
            <td style="width: 3px">
                <asp:DropDownList ID="lstCliente" runat="server" Font-Size="9pt" DataSourceID="odsListaClientes" DataTextField="razonSocial" DataValueField="codigo">
                </asp:DropDownList><asp:ObjectDataSource ID="odsListaClientes" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter"></asp:ObjectDataSource>
            </td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td style="width: 13px; height: 76px;">
                <span style="font-size: 9pt">Fecha Alta:</span></td>
            <td style="width: 3px; height: 76px;">
                <table id="TABLE1" style="width: 400px" >
                    <tr>
                        <td>
                            <span style="font-size: 9pt">De:</span></td>
                        <td>
                            <asp:TextBox ID="txtFechaDe" runat="server" Font-Size="9pt"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFechaDe"
                                ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="9pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"
                                Width="201px"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <span style="font-size: 9pt">Hasta:</span></td>
                        <td>
                            <asp:TextBox ID="txtFechaHasta" runat="server" Font-Size="9pt"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFechaHasta"
                                ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="9pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"
                                Width="201px"></asp:RegularExpressionValidator></td>
                    </tr>
                </table>
            </td>
            <td style="width: 3px; height: 76px;">
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
                <span style="font-size: 9pt">Agente:</span></td>
            <td style="width: 3px">
     <asp:DropDownList ID="lstAgentes" runat="server" DataSourceID="ObjectDataSource2" DataTextField="usuarioNombreCompleto_cotizacion"
         DataValueField="usuario_login" AutoPostBack="True" >
     </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
         SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaAgentesVentaTableAdapter">
         <SelectParameters>
             <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioID" Type="Int32" />
         </SelectParameters>
     </asp:ObjectDataSource>
  
            </td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
            </td>
            <td style="width: 3px">
                <asp:DropDownList ID="lstOpciones" runat="server">
                    <asp:ListItem Value="0"> --</asp:ListItem>
                    <asp:ListItem Value="1">Sin documento</asp:ListItem>
                    <asp:ListItem Value="2">Sin Fecha Entrega</asp:ListItem>
                    <asp:ListItem Value="3">Sin Documento y Sin Fecha Entrega</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 3px">
            </td>
        </tr>
        <tr>
            <td style="width: 13px">
            </td>
            <td style="width: 3px">
                <asp:Button ID="btnContinuar" runat="server" Font-Size="9pt" Height="20px" Text="Continuar" OnClick="btnContinuar_Click" />
            </td>
            <td style="width: 3px">
            </td>
        </tr>
    </table>
</asp:Content>

