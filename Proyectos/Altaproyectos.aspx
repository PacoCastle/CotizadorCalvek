<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Altaproyectos.aspx.cs" Inherits="Proyectos_Altaproyectos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script type="text/javascript">
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
            var limit = 34;
            function endReq(sender, args) {
                $('textarea[id$=txtRenglon1]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=txtRenglon2]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=txtRenglon3]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=txtRenglon4]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=txtRenglon5]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=TXTREG1]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=TXTREG2]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=TXTREG3]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=TXTREG4]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                $('textarea[id$=TXTREG5]').keyup(function () {
                    var len = $(this).val().length;
                    if (len > limit) {
                        this.value = this.value.substring(0, limit);
                    }
                    $('#charLeft').text(limit - len + " characters left");
                });
                
            }
    </script>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <table style="width:100%;">
            <tr>
               <td colspan="3" style="font-family: Arial, Helvetica, sans-serif; font-size: small"><strong>
                   <br style="color: #999999" />
                   <span style="color: #999999"><span style="font-size: medium">Consulta de Proyectos</span><br />
                   <span style="font-size: xx-small">Introduce la clave del proyecto a Modificar</span><br />
                   </span></strong></td>
            </tr>
          
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-size: 10px; width: 57px;"><span style="font-size: small">Proyecto</span>:</td>
                <td>
                            
                    <asp:TextBox ID="txtidproyecto" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Buscar" />
                </td>
                  <td style="width: 57px">
                    <asp:Label ID="lbsuc" runat="server"></asp:Label>
                </td>
              
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="52px" ImageUrl="~/Imagenes/ayuda.PNG" OnClick="ImageButton1_Click" Width="49px" />
&nbsp;<br />
                    <span style="color: #999999; font-size: x-small">consulta</span> </td>
            </tr>
        </table>
    </div>
    &nbsp;<div>
       
                            <asp:GridView ID="Gridproyunico" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="ID_PROYECTO,SUC" DataSourceID="Sqlbusquedaproy" ForeColor="#333333"
                                GridLines="None" Width="100%" Font-Size="8pt" Height="68px" OnSelectedIndexChanged="Gridproyunico_SelectedIndexChanged" HorizontalAlign="Center" AllowPaging="True">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Select"
                                             Text="√" Font-Size="9pt" Height="21px" Width="27px" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="5%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID_PROYECTO" HeaderText="PROYECTO" SortExpression="ID_PROYECTO" />
                                    <asp:BoundField DataField="NOMB_PROYECT" HeaderText="DESCRIPCION PROYECTO" SortExpression="NOMB_PROYECT" />
                                    <asp:BoundField DataField="SUC" HeaderText="SUC" SortExpression="SUC" />
                                    <asp:BoundField DataField="ID_CTE" HeaderText="ID_CTE" SortExpression="ID_CTE" />
                                    <asp:BoundField DataField="NB_CLIENTE" HeaderText="CLIENTE" SortExpression="NB_CLIENTE" />
                                </Columns>
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <EditRowStyle BackColor="#999999" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <br />
            <asp:SqlDataSource ID="Sqlbusquedaproy" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_buscadistproyecto" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtidproyecto" Name="idproy" PropertyName="Text" Type="String" />
                </SelectParameters>
                            </asp:SqlDataSource>
       
     </div>                       
                                        
    <div>
                <asp:SqlDataSource ID="Sdsproyectosdetalles" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_buscaproyecto" SelectCommandType="StoredProcedure"
                    UpdateCommand="set_buscaproyecto" UpdateCommandType="StoredProcedure" DeleteCommand="set_eliminapartproyecto" DeleteCommandType="StoredProcedure" InsertCommand="set_insertapartproy" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_PROYECTO" Type="String" />
                        <asp:Parameter Name="idpart" Type="Int32" />
                        <asp:Parameter Name="suc" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID_PROYECTO" Type="String" />
                        <asp:Parameter Name="tipo" Type="String" />
                        <asp:Parameter Name="suc" Type="String" />
                        <asp:Parameter Name="renglon1" Type="String" />
                        <asp:Parameter Name="renglon2" Type="String" />
                        <asp:Parameter Name="renglon3" Type="String" />
                        <asp:Parameter Name="renglon4" Type="String" />
                        <asp:Parameter Name="renglon5" Type="String" />
                        <asp:Parameter Name="subtotal" Type="Double" />
                        <asp:Parameter Name="iva" Type="Double" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Name="idproy" Type="String" />
                        <asp:Parameter Name="suc" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID_PROYECTO" Type="String" />
                        <asp:Parameter Name="idpart" Type="Int32" /> 
                        <asp:Parameter Name="suc" Type="String" />
                        <asp:Parameter Name="renglon1" Type="String" />
                        <asp:Parameter Name="renglon2" Type="String" />
                        <asp:Parameter Name="renglon3" Type="String" />
                        <asp:Parameter Name="renglon4" Type="String" />
                        <asp:Parameter Name="renglon5" Type="String" />
                        <asp:Parameter Name="subtotal" Type="Double" />
                        <asp:Parameter Name="iva" Type="Double" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridDetalleProy" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Sdsproyectosdetalles" ForeColor="#333333"
                    GridLines="None" Font-Size="8pt" align="center" Width="95%"  AllowPaging="True" DataKeyNames="ID_PROYECTO,IDPART"  OnRowCommand="GridView2_RowCommand" OnRowDeleting="GridView2_RowDeleting" Visible="False">
                    
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID_PROYECTO" HeaderText="Proyecto" SortExpression="ID_PROYECTO" ReadOnly="true" >
                        <FooterStyle Font-Size="X-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IDPART" HeaderText="#Part" SortExpression="IDPART" ReadOnly="true" />
                        <asp:BoundField DataField="TIPO" HeaderText="Tipo" SortExpression="TIPO" ReadOnly="true"/>
                        <asp:BoundField DataField="FECHA" HeaderText="Fecha" SortExpression="FECHA" ReadOnly="true"/>
                        <asp:TemplateField HeaderText="Renglon1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TXTREG1" runat="server" Text='<%# Eval("renglon1") %>' Height="42px" MaxLength="35" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("renglon1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Renglon2" SortExpression="renglon2">
                            <EditItemTemplate>
                                <asp:TextBox ID="TXTREG2" runat="server" Text='<%# Eval("renglon2") %>' Height="42px" MaxLength="35" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("renglon2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Renglon3" SortExpression="renglon3">
                            <EditItemTemplate>
                                <asp:TextBox ID="TXTREG3" runat="server" Text='<%# Eval("renglon3") %>' Height="42px" MaxLength="35" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("renglon3") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Renglon4" SortExpression="renglon4">
                            <EditItemTemplate>
                                <asp:TextBox ID="TXTREG4" runat="server" Text='<%# Eval("renglon4") %>' Height="42px" MaxLength="35" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("renglon4") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Renglon5" SortExpression="renglon5">
                            <EditItemTemplate>
                                <asp:TextBox ID="TXTREG5" runat="server" Text='<%# Eval("renglon5") %>' Height="42px" MaxLength="35" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("renglon5") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subtotal" SortExpression="SUBTOTAL">
                            <EditItemTemplate>
                                <asp:TextBox ID="Txtsubtotal" runat="server" Font-Size="10pt" Text='<%# Eval("SUBTOTAL") %>' ValidationGroup="Actualizar"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvsubotal" runat="server" ControlToValidate="Txtsubtotal" Display="Dynamic" ErrorMessage="campo requerido" Font-Size="7pt" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revsubtotal" runat="server" ControlToValidate="Txtsubtotal" Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"
                                    
                                     Text='<%# Bind("SUBTOTAL", "{0:#,##0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IVA" SortExpression="IVA">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Dwiva" runat="server">
                                    <asp:ListItem Value="16">16%</asp:ListItem>
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("IVA","{0}%") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IMPIVA" SortExpression="IMPIVA">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("IMPIVA") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("IMPIVA", "{0:#,##0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IMPORTE" SortExpression="IMPORTE">
                            <EditItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("IMPORTE") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("IMPORTE","{0:#,##0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True" ValidationGroup="Actualizar"
                                    CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;
                                <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                            </ItemTemplate>
                       </asp:TemplateField>
                        <%--<asp:CommandField DeleteText="Eliminar" ShowDeleteButton="True" />--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" Runat="server" CommandName="Delete" OnClientClick="return confirm('Esta seguro que desea eliminar el registro?');">Eliminar
                                </asp:LinkButton>         
                               <%-- <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                                    Text="Delete" OnClientClick="return confirm('Esta seguro que desea eliminar el registro?');" OnClick="ImageButton1_Click1" /> --%> 
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </div>
                            
                                        
    <br />
    <asp:Panel ID="pnlagrega" runat="server" Visible="False">
        <div>
            &nbsp;<br />
            <table style="width: 85%" align="center">
                <tr><td style="font-size: x-small; width: 1251px"><strong>Sección para agregar partidas</strong></td></tr>
                <tr>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; width: 1251px; background-color: #336699; color: #FFFFFF;"><b>Tipo Partida</b></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>Comentarios 1</b></span></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>Comentarios 2</b></span></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>Comentarios 3</b></span></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>Comentarios 4</b></span></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>Comentarios 5</b></span></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>Subtotal</b></span></td>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; text-align: center; background-color: #336699;"><span style="color: #FFFFFF"><b>IVA</b></span></td>
                </tr>
                <tr>
                    <td style="width: 1251px">
                        <asp:DropDownList ID="lsttipopartida" runat="server">
                            <asp:ListItem Value="01">01 Proyecto</asp:ListItem>
                            <asp:ListItem Value="02">02 Nva Partida</asp:ListItem>
                            <asp:ListItem Value="03">03 Adicion Partidas</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRenglon1" runat="server" MaxLength="35" Height="42px" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRenglon2" runat="server" MaxLength="35" Height="42px" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRenglon3" runat="server" MaxLength="35" Height="42px" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRenglon4" runat="server" MaxLength="35" Height="42px" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                    </td>
                    <td style="width: 126px">
                        <asp:TextBox ID="txtRenglon5" runat="server" MaxLength="35" Height="42px" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtsubtotal0" runat="server" Font-Size="10pt" ValidationGroup="Inserta" Width="96px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvsubotal0" runat="server" ControlToValidate="Txtsubtotal0" Display="Dynamic" ErrorMessage="campo requerido" Font-Size="7pt" ValidationGroup="Inserta"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revsubtotal0" runat="server" ControlToValidate="Txtsubtotal0" Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="Dwiva" runat="server">
                            <asp:ListItem Value="16">16%</asp:ListItem>
                            <asp:ListItem Value="0">0%</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 1251px">
                        <asp:Button ID="btninserta" runat="server" OnClick="Button4_Click" Text="Agregar" ValidationGroup="Inserta" />
                    </td>
                </tr>
            </table>
            
        </div>
    </asp:Panel>
                            
        </ContentTemplate>
   </asp:UpdatePanel>                                    
    <br />

</asp:Content>

