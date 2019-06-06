<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pagosEfectivo.aspx.cs" Inherits="Cobranza_pagosEfectivo" Title="Registro Pagos en efectivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <script type="text/javascript" language="javascript">// <![CDATA[

         $(document).ready(function () {

             $(".date-pick").datePicker({ startDate: '01/01/2011' });

         })
    // ]]>
    </script> 
    <SCRIPT language="javascript">
        function openwindow()
        {
            window.open("http://localhost:24572/Migracion2010/Help/Help.aspx", "mywindow", "menubar=1,resizable=1");
        }
    </SCRIPT>
     <%--<script language="javascript">
        function Ayuda(tema) {
            var AWin;
            AWin = window.open(tema, "helpwin", "left=600,height=300,width=200");
            AWin.focus();
        }
    </script>--%>
     <table style="width: 100%">
        <tr>
            <td style="vertical-align: top; width: 99px;" >

                <asp:CheckBox ID="cbxClienteId" runat="server" Text="    Id Cliente" 
                    oncheckedchanged="cbxIdCliente_CheckedChanged" AutoPostBack="True" />
                <br />
                            
                <asp:CheckBox ID="cbxClienteDesc" runat="server" Text="    Cliente" 
                    oncheckedchanged="cbxClienteDesc_CheckedChanged" AutoPostBack="True" />
                            
                <br />

                <asp:Label ID="lblControl10" runat="server" ForeColor="Black" Font-Size=Small >Sucursal:</asp:Label>
                            
                                        
            </td>

            <td style="width: 5%; vertical-align: top;">

                <asp:TextBox ID="txtClienteId" runat="server" Enabled="False"></asp:TextBox>
                <br />
                            
                <asp:TextBox ID="txtClienteDesc" runat="server" Enabled="False"></asp:TextBox>
                            
                <br />
                            
                <asp:DropDownList ID="lstSucBusqueda" runat="server" DataSourceID="sdsSucBusqueda" DataTextField="texto"
                    DataValueField="sucursal">
                </asp:DropDownList>
                <br />
                            
                                        
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                    ValidationGroup="Inserta" onclick="btnBuscar_Click" />

                                        
            </td>
            <td style="width: 25%">

                <asp:GridView ID="dgvClientes" runat="server" CellPadding="4" Font-Size="8pt" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                                DataSourceID="sdsClientes" DataKeyNames="id_Cte, NB_Cte, Suc" 
                                onselectedindexchanged="dgvClientes_SelectedIndexChanged" 
                                AllowPaging="True" PageSize="3" 
                    onrowdatabound="dgvClientes_RowDataBound">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select"
                                        Text="√" Font-Size="9pt" />
                            </ItemTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="id_Cte" HeaderText="Id Cliente" ReadOnly="True" 
                            SortExpression="id_Cte" />
                        <asp:BoundField DataField="NB_Cte" HeaderText="Cliente" ReadOnly="True" 
                            SortExpression="NB_Cte" />
                        <asp:BoundField DataField="Suc" HeaderText="Sucursal" ReadOnly="True" 
                            SortExpression="Suc" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:DropDownList ID="lstSucAsigna" runat="server" DataSourceID="sdsSucAsigna" 
                                    DataTextField="texto" DataValueField="valor" Font-Size="8pt"  >                                   
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="sdsSucAsigna" runat="server" 
                                SelectCommand="get_comboOficinas_X_RazonSocial" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblSuc_Aux" Name="strRazonSocial" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                                 </asp:SqlDataSource> 
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                            
                <asp:Label ID="lblSuc_Aux" runat="server" Visible="False"></asp:Label>
                            
                <asp:SqlDataSource ID="sdsClientes" runat="server" 
                    SelectCommand="get_buscaCliente_PagoFacturas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtClienteId" DefaultValue=" " 
                            Name="strClienteId" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtClienteDesc" DefaultValue="''" 
                            Name="strClienteDesc" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lstSucBusqueda" DefaultValue="000" 
                            Name="strSucursal" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsSucBusqueda" runat="server" 
                    SelectCommand="get_comboOficinas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>                            
                                        
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="lblResultado" runat="server" ForeColor="Red" Visible="False">Resultado</asp:Label>
            </td>
         </tr>
     </table>
                 
    <asp:Panel ID="pnlControles" runat="server" Visible ="false">                     
    <table>
         <tr >
            <td colspan="3" style="background-color: #009999" >
                <asp:Label ID="lblControl9" runat="server" ForeColor="White" Font-Size="10pt">Id Cliente:    </asp:Label>
                            
                <asp:Label ID="lblIdCte" runat="server" ForeColor="White" Font-Size="10pt"></asp:Label>
                            
                   &nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" ForeColor="White" Font-Size="10pt">Cliente:    </asp:Label>
                    <asp:Label ID="lblCte" runat="server" ForeColor="White" Font-Size="10pt"></asp:Label>
                    &nbsp;&nbsp
                    <asp:Label ID="Label2" runat="server" ForeColor="White" Font-Size="10pt">Sucursal:    </asp:Label>
                            
                <asp:Label ID="lblSuc" runat="server" ForeColor="White" Font-Size="10pt"></asp:Label>
                   &nbsp;&nbsp;
                <asp:Label ID="lblTC0" runat="server" ForeColor="White" Visible="False" Font-Size="10pt">T. Cambio:</asp:Label>
                <asp:Label ID="lblTC" runat="server" ForeColor="White" Visible="False" Font-Size="10pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan = "2" style="vertical-align: top;" >
                            
                <asp:CheckBox ID="cbxFacturaNG" runat="server" 
                    Text="          Factura No Generada" AutoPostBack="True" 
                    oncheckedchanged="cbxFacturaNG_CheckedChanged" />
                <br />
            </td>
            <td style="vertical-align: top;" >
              
                <asp:CheckBox ID="cbxFoliosMixtos" runat="server" AutoPostBack="True" 
                    oncheckedchanged="cbxFoliosMixtos_CheckedChanged" 
                    Text="Moneda Origen MN/DLLS" />
              
            </td>
        </tr>
        <tr>
             <td style="vertical-align: top; width: 116px;" >
                <asp:Label ID="lblControl11" runat="server">Fecha   :    </asp:Label>
                 <br />
                 <%--<asp:CustomValidator ID="cvFecha" runat="server" 
                     ControlToValidate="txtFecha" 
                     OnServerValidate="txtFechaValidation" ClientValidationFunction="true">
                 </asp:CustomValidator>--%>
                 <br />
                <asp:Label ID="lblControl8" runat="server">Importe   :    </asp:Label>
                 <br />
                                        
                                        
                 <br />
                 <br />

                                        
                <asp:Label ID="lblControl4" runat="server">T/Cambio: </asp:Label>
                 <br />
                                        
                                        
                 <br />

                                        
                <asp:Label ID="lblControl6" runat="server">Moneda Pago:     </asp:Label>
                            
                                        
                 <br />
                            
                                        
                <asp:Label ID="lblControl0" runat="server">Pago   :    </asp:Label>
                            
                                        
                <br />
                            
                                        
                <asp:Label ID="lblControl1" runat="server">Banco:    </asp:Label>
                            
                                        
                 <br />
                            
                                        
                <asp:Label ID="lblControl2" runat="server">Referencia:   </asp:Label>
                            
                                        
                 <br />
                 <br />
                 <asp:Label ID="lblControl12" runat="server">Comentarios:   </asp:Label>
                            
                                        
                <br />
                            
            </td>
             <td style="vertical-align: top; width: 217px;" >
                <asp:TextBox ID="txtFecha" runat="server" CssClass="date-pick" 
                    Font-Size="10pt" Text='<%# Bind("FechaPago") %>' ToolTip="Día/Mes/Año" 
                    Width="85px" ValidationGroup="Inserta" 
                     ontextchanged="txtFecha_TextChanged" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFecha" runat="server" 
                    ControlToValidate="txtFecha" ErrorMessage="*Introduzca fecha valida" 
                    Font-Size="7pt"></asp:RequiredFieldValidator>
                 <br />
                <asp:RegularExpressionValidator ID="revFecha" runat="server" OnServerValidate="txtFechaValidation" 
                    ControlToValidate="txtFecha" Display="Dynamic" 
                    ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" 
                     
                     ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>

                                        
                    <br />
                            
                                        
                <asp:TextBox ID="txtImporte" runat="server" ValidationGroup="Inserta" 
                        Font-Size="10pt"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvImporte" runat="server" ControlToValidate="txtImporte"
                ErrorMessage="campo requerido" Display="Dynamic" Font-Size="7pt"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator
                    ID="revImporte" runat="server" ControlToValidate="txtImporte"
                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" 
                ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>                            
                                        
                                        
                    <br />
                <asp:TextBox ID="txtTC" runat="server" ValidationGroup="Inserta" 
                        Font-Size="10pt" Enabled="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTC" runat="server" 
                     ControlToValidate="txtTC" Display="Dynamic" ErrorMessage="campo requerido" 
                     Font-Size="7pt"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator
                    ID="revTC" runat="server" ControlToValidate="txtTC"
                    Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" 
                ValidationExpression="^\d+(\.\d{1,10})?$"></asp:RegularExpressionValidator>                            
                                        
                                        
                    <br />
                            
                                        
                <asp:DropDownList ID="lstMoneda" runat="server" DataSourceID="sdsMoneda" DataTextField="descripcion"
                    DataValueField="monedaId" AutoPostBack="True" >
                </asp:DropDownList>
                            
                                        
                    <br />
                            
                                        
                <asp:DropDownList ID="lstFormasPago" runat="server" 
                    DataSourceID="sdsFormasPago" DataTextField="NB_FORMAPAGO"
                    DataValueField="CD_FORMAPAGO" AutoPostBack="True" 
                     onselectedindexchanged="lstFormasPago_SelectedIndexChanged">
                </asp:DropDownList>
                    &nbsp;&nbsp;
                    <br />
                            
                                        
                <asp:DropDownList ID="lstBancos" runat="server" DataSourceID="sdsBancos" DataTextField="NB_Banco"
                    DataValueField="CD_Banco" AutoPostBack="True" Enabled="False">
                </asp:DropDownList>
                    <br />
                            
                <asp:TextBox ID="txtReferencia" runat="server" 
                    Font-Size="10pt" Text='<%# Bind("FechaPago") %>' ToolTip="Numero de referencia emitido" 
                    Width="85px" ValidationGroup="Inserta" Enabled="False"></asp:TextBox>
                                        
                                        
                    <br />
                 <asp:TextBox ID="txtComentarios" runat="server" Font-Size="10pt" Height="54px" 
                     Text='<%# Bind("FechaPago") %>' TextMode="MultiLine" 
                     ToolTip="Comentariod del pago" ValidationGroup="Inserta" Width="208px"></asp:TextBox>
                                        
                                        
                    <br />
                            
                                        
                    <asp:Button ID="btnInsertar" runat="server" Text="Guardar" 
                        onclick="btnInsertar_Click" />
                            
                                        
                <asp:SqlDataSource ID="sdsMoneda" runat="server" 
                    SelectCommand="get_listaMoneda_Parametro" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="valParametro" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                            
                                        
                <asp:SqlDataSource ID="sdsFormasPago" runat="server" 
                    SelectCommand="get_formaPago_PagoFacturas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                            
                                        
                <asp:SqlDataSource ID="sdsBancos" runat="server" 
                    SelectCommand="get_bancos_PagoFacturas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                                        
            </td>
                <td style="vertical-align: top" >
                            
                                        
                <asp:GridView ID="dgvClientes0" runat="server" CellPadding="4" Font-Size="8pt" 
                                ForeColor="#333333" GridLines="None" 
                                DataSourceID="sdsFolios"
                                onselectedindexchanged="dgvClientes_SelectedIndexChanged" 
                                AutoGenerateColumns="False" PageSize="8" >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelection" runat="server" />
                                </ItemTemplate>                             
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="TP_FOLIO" HeaderText="Folio" ReadOnly="True" 
                            SortExpression="TP_FOLIO" />     

                        <asp:BoundField DataField="NB_MONTO" HeaderText="Monto" ReadOnly="True" 
                            SortExpression="NB_MONTO" /> 
                                                                   
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                            
                                        
                <asp:SqlDataSource ID="sdsFolios" runat="server" 
                    SelectCommand="get_Folios_PagoFacturas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblIdCte" Name="strClienteId" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lblCte" Name="strClienteDesc" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lblSuc" Name="strSucursal" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblFolios" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
  </asp:Panel>
</asp:Content>

