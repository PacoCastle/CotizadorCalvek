<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeguimientoAltaProductoKepler.aspx.cs" Inherits="Catalogos_Productos_SeguimientoAltaProductoKepler" Title="Alta Producto En Kepler" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <style type="text/css">
           .modalBackground 
            {
                background-color: Black;
                filter: alpha(opacity=90);
                opacity: 0.8;
                z-index: 10000;
            }
    </style>
    <h2>
        SEGUIMIENTO ALTA DE PRODUCTO EN KEPLER
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>         
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="Clave" DataSourceID="sdsProductosPendientes" Font-Size="9pt"
            ForeColor="#333333" GridLines="None"
            Width="850px" OnRowCommand="GridView1_RowCommand" >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" />
                <asp:BoundField DataField="Clave" HeaderText="Clave" ReadOnly="True" SortExpression="Clave" />
                <asp:TemplateField HeaderText="Descripci&#243;n" SortExpression="Descripcion">
                    <EditItemTemplate>
                        <asp:TextBox ID="Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorb" runat="server" ControlToValidate="Descripcion"
                            Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt" InitialValue="0.0"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PrecioVenta" DataFormatString="{0:N}" HeaderText="Precio Venta"
                    ReadOnly="True" SortExpression="PrecioVenta">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Marca" SortExpression="Marca">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ClaveMarca" runat="server" DataSourceID="odsMarcaProductoKepler"
                            DataTextField="marca" DataValueField="claveMarca" SelectedValue='<%# Eval("ClaveMarca") %>'>
                            <asp:ListItem Selected="True" Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ClaveMarca"
                            Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt" InitialValue="0"></asp:RequiredFieldValidator><asp:ObjectDataSource
                                ID="odsMarcaProductoKepler" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboMarcaProductoKeplerTableAdapter">
                            </asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Marca") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unidad Medida" SortExpression="UnidadMedida">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ClaveUnidadMedida" runat="server" AppendDataBoundItems="True"
                            DataSourceID="odsUnidadMedidaKepler" DataTextField="claveUnidadMedida" DataValueField="claveUnidadMedida" SelectedValue='<%# Eval("ClaveUnidadMedida") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="ClaveUnidadMedida" Display="Dynamic" ErrorMessage="Requerido"
                            Font-Size="7pt" InitialValue="0"></asp:RequiredFieldValidator><asp:ObjectDataSource
                                ID="odsUnidadMedidaKepler" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboUnidadMedidaKeplerTableAdapter">
                            </asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnidadMedida") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Moneda Compra" SortExpression="Moneda">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Moneda" runat="server" 
                            SelectedValue='<%# Eval("Moneda") %>'>
                            <%--<asp:ListItem Value="0">--</asp:ListItem>--%>
                            <asp:ListItem Value="DLLS">DLLS</asp:ListItem>
                            <asp:ListItem>PESOS</asp:ListItem>
                        </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="Moneda" Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt"
                            InitialValue="0"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Moneda") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio Compra">
                    <EditItemTemplate>
                        <asp:TextBox ID="PrecioListaProveedor" runat="server" MaxLength="15" Width="60px" Text='<%# Eval("PrecioListaProveedor") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PrecioListaProveedor"
                            Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidatora" runat="server" ControlToValidate="PrecioListaProveedor"
                            Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt" InitialValue="0.0"></asp:RequiredFieldValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator51" runat="server" ControlToValidate="PrecioListaProveedor"
                                Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Importaci&#243;n" SortExpression="banderaImportacion">
                    <EditItemTemplate>
                        <asp:CheckBox ID="banderaImportacion" runat="server" Checked='<%# Eval("banderaImportacion") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="banderaImportacion" runat="server" Checked='<%# Bind("banderaImportacion") %>'
                            Enabled="False" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
                <asp:CommandField ButtonType="Button" CancelText="Cancelar" EditText="Editar" ShowEditButton="True"
                    UpdateText="Actualizar" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtn" ImageUrl="~/Imagenes/Delete.png" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />                        
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
         <asp:SqlDataSource ID="sdsProductosPendientes" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
            SelectCommand="get_listaProductosKeplerPendientes" SelectCommandType="StoredProcedure"
            UpdateCommand="set_updateProductosKepler" UpdateCommandType="StoredProcedure" DeleteCommand="set_eliminaProductosKeplerPendientes" DeleteCommandType="StoredProcedure" OnDeleted="sdsProductosPendientes_Deleted">
            <DeleteParameters>
                <asp:Parameter Name="Clave" Type="String" />
                <asp:Parameter Name="NB_MotivoBaja" Type="String" />
                <asp:Parameter Name="intUsuarioId" Type="Int32" />
                <asp:Parameter Name="resultado" Type="Int32" Direction="InputOutput" />
                <asp:Parameter Name="msgDelete" Type="String" Direction="InputOutput" Size="150" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="usuarioId" SessionField="usuarioId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Clave" Type="String" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="ClaveMarca" Type="String" />
                <asp:Parameter Name="ClaveUnidadMedida" Type="String" />
                <asp:Parameter Name="Moneda" Type="String" />
                <asp:Parameter Name="PrecioListaProveedor" Type="Double" />
                <asp:Parameter Name="banderaImportacion" Type="Boolean" />
                <asp:Parameter Name="intUsuarioId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />

            <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="btnInicial" 
                BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
            </asp:ModalPopupExtender>

            <asp:Panel ID="PanelModal" runat="server" style=" background:white; width:auto; height:auto">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table id="Table1" runat="server">
                            <tr>
                                <td>
                                    <h3 id="H1">Eliminar:
                                        <asp:Label ID="lblProductoId" runat="server"></asp:Label>
                                    </h3>
                                </td>
                            </tr>
                             <tr>
                               <td>
                                   Motivo:<br />
                                <asp:TextBox ID="txtMotivoBaja" runat="server" TextMode="MultiLine" Font-Size="12px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnCancelar" runat="server" aria-hidden="true" class="btn" data-dismiss="modal" onclick="btnCancelar_Click" Text="Cancelar" />
                                    <asp:Button ID="btnAceptar" runat="server" aria-hidden="true" class="btn" data-dismiss="modal" Text="Aceptar" OnClick="btnAceptar_Click" />
                                    
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                
            </asp:Panel>
            
    </asp:Content>
