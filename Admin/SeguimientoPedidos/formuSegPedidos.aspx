<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formuSegPedidos.aspx.cs" Inherits="Admin_SeguimientoPedidos_formularioSeguimientoPedidos" Title="SEGUIMIENTO PEDIDOS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 137px; height: 12px">
            </td>
            <td style="width: 569px; height: 12px; text-align: center">
                <span style="font-size: 10pt"><strong>PEDIDO</strong></span></td>
            <td colspan="2" rowspan="2">
                <table style="width: 164px">
                    <tr>
                        <td style="height: 10px">
                            <span style="font-size: 7pt"><strong>Serie</strong></span></td>
                        <td style="height: 10px">
                        </td>
                        <td style="height: 10px">
                            <span style="font-size: 7pt"><strong>Folio</strong></span></td>
                    </tr>
                    <tr>
                        <td style="height: 10px">
                            <span style="font-size: 7pt">
                                <asp:Label ID="lblSerie" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></span></td>
                        <td style="height: 10px">
                        </td>
                        <td style="height: 10px">
                            <span style="font-size: 7pt">
                                <asp:Label ID="lblFolio" runat="server" Font-Bold="True" Font-Size="8pt"></asp:Label></span></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 137px; height: 14px;">
                <span style="font-size: 9pt"></span>
            </td>
            <td style="width: 569px; height: 14px;">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 181px">
                &nbsp;<asp:FormView ID="FormView1" runat="server" DataSourceID="odsDetallePedido"
                    Width="74%">
                    <EditItemTemplate>
                        fecha:
                        <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>'>
                        </asp:TextBox><br />
                        codigoCliente:
                        <asp:TextBox ID="codigoClienteTextBox" runat="server" Text='<%# Bind("codigoCliente") %>'>
                        </asp:TextBox><br />
                        rasonSocial:
                        <asp:TextBox ID="rasonSocialTextBox" runat="server" Text='<%# Bind("rasonSocial") %>'>
                        </asp:TextBox><br />
                        fechaVencimiento:
                        <asp:TextBox ID="fechaVencimientoTextBox" runat="server" Text='<%# Bind("fechaVencimiento") %>'>
                        </asp:TextBox><br />
                        fechaEntrega:
                        <asp:TextBox ID="fechaEntregaTextBox" runat="server" Text='<%# Bind("fechaEntrega") %>'>
                        </asp:TextBox><br />
                        direccion:
                        <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Actualizar">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        fecha:
                        <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>'>
                        </asp:TextBox><br />
                        codigoCliente:
                        <asp:TextBox ID="codigoClienteTextBox" runat="server" Text='<%# Bind("codigoCliente") %>'>
                        </asp:TextBox><br />
                        rasonSocial:
                        <asp:TextBox ID="rasonSocialTextBox" runat="server" Text='<%# Bind("rasonSocial") %>'>
                        </asp:TextBox><br />
                        fechaVencimiento:
                        <asp:TextBox ID="fechaVencimientoTextBox" runat="server" Text='<%# Bind("fechaVencimiento") %>'>
                        </asp:TextBox><br />
                        fechaEntrega:
                        <asp:TextBox ID="fechaEntregaTextBox" runat="server" Text='<%# Bind("fechaEntrega") %>'>
                        </asp:TextBox><br />
                        direccion:
                        <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insertar">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <table style="width: 80%">
                            <tr>
                                <td style="width: 65px">
                                    <span style="font-size: 9pt">Fecha:</span></td>
                                <td style="width: 245px">
                                    <asp:Label ID="fechaLabel" runat="server" Font-Size="8pt" Text='<%# Bind("fecha") %>' Font-Bold="True"></asp:Label></td>
                                <td style="width: 107px">
                                    <span style="font-size: 9pt">Vencimiento:</span></td>
                                <td style="width: 42px">
                                    <asp:Label ID="fechaVencimientoLabel" runat="server" Font-Size="8pt" Text='<%# Bind("fechaVencimiento") %>' Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 65px">
                                    <span style="font-size: 9pt">Código:</span></td>
                                <td style="width: 245px">
                                    <asp:Label ID="codigoClienteLabel" runat="server" Font-Size="8pt" Text='<%# Bind("codigoCliente") %>' Font-Bold="True"></asp:Label></td>
                                <td style="width: 107px">
                                    <span style="font-size: 9pt">Fecha Entrega:</span></td>
                                <td style="width: 42px">
                                    <asp:Label ID="fechaEntregaLabel" runat="server" Font-Size="8pt" Text='<%# Bind("fechaEntrega") %>' Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 65px">
                                    <span style="font-size: 9pt">Nombre:</span></td>
                                <td style="width: 245px">
                                    <asp:Label ID="rasonSocialLabel" runat="server" Font-Size="8pt" Text='<%# Bind("rasonSocial") %>' Font-Bold="True"></asp:Label></td>
                                <td style="width: 107px">
                                    <span style="font-size: 9pt">Oficina:</span></td>
                                <td style="width: 42px">
                                    <asp:Label ID="lblOficina" runat="server" Font-Bold="True" Font-Size="8pt" Text='<%# Bind("Oficina") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 65px">
                                    <span style="font-size: 9pt">Domicilio:</span></td>
                                <td colspan="3">
                                    <asp:Label ID="direccionLabel" runat="server" Font-Size="8pt" Text='<%# Bind("direccion") %>' Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 65px; height: 20px;">
                                </td>
                                <td colspan="3" style="height: 20px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 65px">
                                    <span style="font-size: 9pt">Estatus:</span></td>
                                <td style="width: 245px">
                                    <asp:Label ID="Estatus" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Crimson"
                                        Text='<%# Eval("Estatus") %>'></asp:Label></td>
                                <td style="width: 107px">
                                    <span style="font-size: 9pt">Almacen:</span></td>
                                <td style="width: 42px">
                                    <asp:DropDownList ID="ddlEstatusAlmacen" runat="server" DataSourceID="odsEstatusPedidoAlmacen"
                                        DataTextField="descripcion" DataValueField="estatusPedidoAlmacenId" Font-Size="9pt" Enabled="False" SelectedValue='<%# Bind("estatusPedidoAlmacenId") %>'>
                                    </asp:DropDownList><asp:ObjectDataSource ID="odsEstatusPedidoAlmacen" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="catalogosTableAdapters.get_comboEstatusPedidoAlmacenTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 65px">
                                    <span style="font-size: 10pt">
                                        <asp:Label ID="lblEstatusPendiente" runat="server" Text="EstatusPendiente:" Visible="False"></asp:Label></span></td>
                                <td style="width: 245px">
                                    <asp:DropDownList ID="lstEstatusPendiente" runat="server" DataSourceID="ObjectDataSource2"
                                        DataTextField="Estatus" DataValueField="estatusPendienteId" Font-Size="9pt" SelectedValue='<%# Bind("EstatusPendienteId") %>' Visible="False" Enabled="False">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_comboEstatusPendienteSeguimientoPedidosTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                                <td style="width: 107px">
                                </td>
                                <td style="width: 42px">
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblCorreo" runat="server" Font-Size="8pt" Text='<%# Eval("correo") %>'
                            Visible="False"></asp:Label>
                                    <asp:Label ID="lblEstatusSurtir" runat="server" Font-Size="7pt" Text='<%# Eval("BdnSurtirCompleto") %>' Visible="False"></asp:Label>
                        <asp:Label ID="lblMensajeF" runat="server" Font-Size="9pt" Text='<%# Eval("Mensaje") %>'
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="odsDetallePedido" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_datosPedidoPendienteTableAdapter" OnSelecting="odsDetallePedido_Selecting">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strSerie" QueryStringField="serie" Type="String" />
                        <asp:QueryStringParameter Name="intFolio" QueryStringField="folio" Type="String" />
                        <asp:QueryStringParameter Name="intOficinaId" QueryStringField="oficinaId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>   
        </tr>
        <tr>
            <td colspan="4" style="height: 48px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Codigo,seriePedido,folioPedido,Instruccion,IdMovimiento,oficinaId" DataSourceID="SqlDataSource1" Font-Size="8pt" ForeColor="#333333"
                    GridLines="None" onrowupdating="GridView1_RowUpdating" onrowcreated="GridView1_RowCreated" OnRowEditing="GridView1_RowEditing" onRowDataBound="GridView1_RowDataBound">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True"
                            SortExpression="Descripcion" />
                        <asp:BoundField DataField="pendientes" HeaderText="Pend" SortExpression="pendientes" ReadOnly="True" />
                        <asp:BoundField DataField="SLP" HeaderText="SLP" ReadOnly="True" SortExpression="SLP" />
                        <asp:BoundField DataField="QRO" HeaderText="QRO" ReadOnly="True" SortExpression="QRO" />
                        <asp:BoundField DataField="CLY" HeaderText="CLY" ReadOnly="True" ShowHeader="False"
                            SortExpression="CLY" />
                        <asp:TemplateField HeaderText="ESTATUS" SortExpression="Instruccion">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Instruccion") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Instruccion") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Instruccion2" HeaderText="Instruccion2" ReadOnly="True" ShowHeader="False" SortExpression="Instruccion2" />
                        <asp:TemplateField HeaderText="Documento" SortExpression="folioDocumento">
                            <EditItemTemplate>
                                Serie:
                                <asp:TextBox ID="serieDocumento" runat="server" Font-Size="8pt" Text='<%# Bind("serieDocumento") %>'
                                    Width="30px" Height="13px"></asp:TextBox><br />
                                Folio:<asp:TextBox ID="folioDocumento" runat="server" Font-Size="8pt" Height="13px" Text='<%# Bind("folioDocumento") %>'
                                    Width="38px"></asp:TextBox>&nbsp;
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("serieDocumento") %>'></asp:Label>
                                <asp:Label ID="Label4" runat="server" Font-Size="9pt" Text='<%# Eval("folioDocumento") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                         <asp:BoundField DataField="Referencia" HeaderText="Referencia" ReadOnly="True" ShowHeader="False" SortExpression="Referencia" />
                        <asp:TemplateField HeaderText="FechaPrevista" SortExpression="fechaEntrega">
                            <EditItemTemplate>
                                <span style="font-size: 7pt">
                                </span><asp:TextBox ID="fechaEntrega" runat="server" Font-Size="8pt" Text='<%# Bind("fechaEntrega") %>'
                                    Width="92px" Height="13px"></asp:TextBox><span style="font-size: 7pt"><span style="font-size: 6px">DD/MM/AAAA</span><span></span></span><asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    runat="server" ControlToValidate="fechaEntrega" ErrorMessage="fecha invalida: dd/mm/aaaa"
                                    Font-Size="7pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("fechaEntrega") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FechaConfirmada" SortExpression="fechaConfirmada">
                            <EditItemTemplate>
                                <span><span style="font-size: 7pt"></span>
                                    <asp:TextBox ID="fechaConfirmada" runat="server" Font-Size="8pt" Height="13px" Text='<%# Bind("fechaConfirmada") %>'
                                        Width="92px"></asp:TextBox><span style="font-size: 6px">DD/MM/AAAA</span><br />
                                </span><span></span>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server"
                                    ControlToValidate="fechaConfirmada" ErrorMessage="fecha invalida: dd/mm/aaaa"
                                    Font-Size="7pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fechaConfirmada") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comentario" SortExpression="comentario">
                            <EditItemTemplate>
                                <asp:TextBox ID="comentario" runat="server" Text='<%# Bind("comentario") %>' Width="206px" Height="13px" Font-Size="8pt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("comentario") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones" SortExpression="acciones">
                            <EditItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("Instruccion") %>' Visible="False"></asp:Label><asp:DropDownList ID="acciones" runat="server" DataSourceID="odsEstatusPend" DataTextField="Descripcion" DataValueField="estatusPedidoPendienteId" Font-Size="8pt"  >
                                </asp:DropDownList><asp:ObjectDataSource ID="odsEstatusPend" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_comboEstatusPedidoPendienteTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label17" Name="strInstruccion" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("acciones") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" BorderStyle="None" Font-Size="8pt" /><asp:Button ID="Button2" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" BorderStyle="None" Font-Size="8pt" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Editar" BorderStyle="None" Font-Size="8pt" />
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_datosPartidaPedidoPendiente"
                    UpdateCommand="Insert into  TU_DAT_OPER2009.dbo.log_seguimientoPedidos(serieDocumento,folioDocumento,cod_Prod,cidmovim,fechaEntrega,estatusPedidoPendienteId,fechaModificacion,comentario,fechaConfirmada,usuarioId)&#13;&#10;select serieDocumento,folioDocumento,cod_Prod,cidmovim01,fechaEntrega,estatusPedidoPendienteId,getdate(),comentario,fechaConfirmada,1&#13;&#10;from TU_DAT_OPER2009.dbo.TU_CG_PEDIDOS_DETALLE&#13;&#10;where cseriedo01=@seriePedido &#13;&#10;&#9;and cfolio=@folioPedido &#13;&#10;&#9;and cod_Prod = @Codigo&#13;&#10;&#9;and cidmovim01 = @IdMovimiento&#13;&#10;&#9;and oficinaId = @oficinaId;&#13;&#10;Update TU_DAT_OPER2009.dbo.TU_CG_PEDIDOS_DETALLE set &#13;&#10;&#9;serieDocumento=@serieDocumento,&#13;&#10;&#9;folioDocumento=@folioDocumento,&#13;&#10;&#9;fechaEntrega=@fechaEntrega, &#13;&#10;&#9;estatusPedidoPendienteId = @acciones, &#13;&#10;&#9;fechaModificacion=getdate(),&#13;&#10;&#9;comentario=@comentario,&#13;&#10;&#9;fechaConfirmada=@fechaConfirmada&#13;&#10;where cseriedo01=@seriePedido and cfolio=@folioPedido &#13;&#10;and cod_Prod = @Codigo&#13;&#10;and cidmovim01  = @IdMovimiento&#13;&#10;and oficinaId = @oficinaId&#13;&#10;" SelectCommandType="StoredProcedure">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="lblSerie" Name="seriePedido" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lblFolio" Name="folioPedido" PropertyName="Text" />
                        <asp:Parameter Name="Codigo" />
                        <asp:Parameter Name="IdMovimiento" Type="Int32" />
                        <asp:Parameter Name="oficinaId" />
                        <asp:Parameter Name="serieDocumento" />
                        <asp:Parameter Name="folioDocumento" />
                        <asp:Parameter Name="fechaEntrega" />
                        <asp:Parameter Name="acciones" />
                        <asp:Parameter Name="comentario" />
                        <asp:Parameter Name="fechaConfirmada" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strSerie" QueryStringField="serie" Type="String" />
                        <asp:QueryStringParameter Name="intFolio" QueryStringField="folio" Type="Int32" />
                        <asp:QueryStringParameter Name="intOficinaId" QueryStringField="oficinaId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td style="width: 137px; height: 3px;">
                <span style="font-size: 9pt">Mensaje:</span></td>
            <td style="width: 569px; height: 3px;">
                <asp:Label ID="lblMensaje" runat="server" Font-Size="9pt"></asp:Label></td>
            <td style="width: 108px; height: 3px;">
            </td>
            <td style="height: 3px; width: 41px;">
            </td>
        </tr>
        <tr>
            <td style="width: 137px; height: 5px">
            </td>
            <td style="width: 569px; height: 5px">
                <asp:TextBox ID="txtMensaje" runat="server" Font-Size="9pt" Height="46px" TextMode="MultiLine"
                    Width="514px"></asp:TextBox></td>
            <td style="width: 108px; height: 5px">
                <asp:Button ID="btnContinuar" runat="server" Font-Size="10pt" OnClick="btnContinuar_Click"
                    Text="Continuar" /></td>
            <td style="width: 41px; height: 5px">
                </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 5px">
                <asp:Button ID="btnDestino" runat="server" Font-Size="9pt" OnClick="btnDestino_Click"
                    Text="Destino" />
                <asp:ObjectDataSource ID="odsDocumentoDestino" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_datosDestinoKeplerTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strSerie" QueryStringField="serie" Type="String" />
                        <asp:QueryStringParameter Name="strFolio" QueryStringField="folio" Type="String" />
                        <asp:QueryStringParameter Name="intOficinaId" QueryStringField="oficinaId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
               
                <div style="overflow: auto; width: 1062px; height: 350px" >
                     <br />
                    <asp:GridView ID="gwDocumentosDestino" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="odsDocumentoDestino" Font-Size="8pt" ForeColor="#333333"
                    GridLines="None" Visible="False" Width="1062px" onRowDataBound="gvDocDestino_RowDataBound" >
                        
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>

                        <asp:TemplateField HeaderText="Partida" SortExpression="cidmovim01">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("cidmovim01") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="12px" />
                        </asp:TemplateField>


<%--                        <asp:BoundField DataField="cidmovim01" HeaderText="#" ReadOnly="True" SortExpression="cidmovim01" >
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="cod_prod" HeaderText="C&#243;digo" ReadOnly="True" SortExpression="cod_prod">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ReadOnly="True"
                            SortExpression="cantidad">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pendientes" HeaderText="Pendientes" ReadOnly="True"
                            SortExpression="pendientes">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c31" HeaderText="Destino" ReadOnly="True"
                            SortExpression="c31">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c63" HeaderText="Serie" ReadOnly="True"
                            SortExpression="c63">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c6" HeaderText="Folio" ReadOnly="True"
                            SortExpression="c6">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CantidadDestino" HeaderText="Cantidad" ReadOnly="True"
                            SortExpression="CantidadDestino">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True"
                            SortExpression="Fecha">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hora" HeaderText="Hora" ReadOnly="True"
                            SortExpression="Hora">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>

                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

