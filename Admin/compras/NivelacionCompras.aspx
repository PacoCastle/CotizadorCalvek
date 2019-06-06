<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NivelacionCompras.aspx.cs" Inherits="OrdenesCompra_NivelacionCompras" Title="Nivelacion Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<style type="text/css"> 
.verticaltext
{
-webkit-writing-mode: bt-lr;
filter:flipV() flipH();

}
</style>
<table width="50%">
    <tr>
        <td style="vertical-align: top">                    
            <asp:Label ID="Label10" runat="server" Text="Almacen:"></asp:Label>
            <br />
            <asp:DropDownList ID="lstAlmacen" runat="server" AutoPostBack="True" 
                onselectedindexchanged="lstMarcas_SelectedIndexChanged" DataTextField="MARCA" DataValueField="id_marca">
                <asp:ListItem Value="1" Selected="True">General</asp:ListItem>
                <asp:ListItem Value="89">Precio Especial</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Plaza:"></asp:Label>
            <br />
            <asp:DropDownList ID="lstPlazas" runat="server" AutoPostBack="True" 
                onselectedindexchanged="lstPlazas_SelectedIndexChanged">
                <asp:ListItem Value="0">-Elegir Plaza</asp:ListItem>
                <asp:ListItem Value="002">San Luis</asp:ListItem>
                <asp:ListItem Value="004">Celaya</asp:ListItem>
                <asp:ListItem Value="009">Irapuato</asp:ListItem>
                <asp:ListItem Value="003">Queretaro</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Marca:"></asp:Label>
            <br />
            <asp:DropDownList ID="lstMarcas" runat="server" AutoPostBack="True" 
                onselectedindexchanged="lstMarcas_SelectedIndexChanged" 
                DataSourceID="sdsMarcas" DataTextField="MARCA" DataValueField="id_marca">
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsMarcas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                SelectCommand="get_listaMarcasModeloComprasNivelacion" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lstPlazas" DefaultValue="002" Name="strSuc" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </td>
        <td width="80%" style="vertical-align: top">
            
            <asp:Label ID="Label8" runat="server" Text="A comprar:"></asp:Label>
            <br />
            <asp:DropDownList ID="lstaCompra" runat="server" AutoPostBack="True">
                <asp:ListItem>S/N</asp:ListItem>
                <asp:ListItem Value="N">Si</asp:ListItem>
                <asp:ListItem Value="S">No</asp:ListItem>
            </asp:DropDownList>
             <br />
            <asp:Label ID="Label9" runat="server" Text="Producto:"></asp:Label>
            <br />
            <asp:TextBox ID="txtProductoBus" runat="server" Font-Size="9pt" 
                AutoPostBack="True"></asp:TextBox>
                            <asp:Button ID="btnBuscar" runat="server" Font-Size="9pt" 
                Text="Buscar" BorderStyle="None" BorderWidth="1px" 
                onclick="btnBuscar_Click" />
        </td>
        <td>
            <asp:Button ID="btnRunJob" runat="server" Font-Size="9pt" 
                Text="Actualizar" BorderStyle="None" BorderWidth="1px" 
                onclick="btnRunJob_Click"/>
            <br />
            <asp:Label ID="lblEstatusJob" runat="server" ForeColor="Red"></asp:Label>
        </td>        
    </tr>
</table>



<asp:Panel ID="pnlSLP" runat="server" Visible="false">    
<table width="100%">
    <tr>
        <td style="background-color: #333333; text-align: center;">
            <asp:Label ID="Label1" runat="server" Text="PLAZA SAN LUIS" Font-Size="Medium" 
                ForeColor="#99FFCC"></asp:Label>
        </td>
    </tr>   
    <tr>
        <td>
             <asp:GridView ID="dgvMCNivelacionSLP" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" 
                 DataSourceID="sdsMCNivelacionSLP" ForeColor="#333333"
                    GridLines="None" Width="100%" Font-Size="8pt" Height="68px" 
                 onrowcommand="dgvMCNivelacionSLP_RowCommand" 
                 DataKeyNames="CD_Almacen,CD_Suc,CD_Prod,NU_COMPRA_Ant" AllowPaging="True">
                    <HeaderStyle CssClass ="verticaltext" HorizontalAlign ="Left" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <%--<asp:BoundField DataField="MARCA" HeaderText="MARCA" SortExpression="MARCA" ReadOnly = "true"/>--%>
                        <%--  <asp:BoundField DataField="Compra_Mod" HeaderText="Compra_Mod" ReadOnly="True" 
                            SortExpression="Compra_Mod" />
--%><%-- <asp:BoundField DataField="sobreinv" HeaderText="sobreinv" 
                            SortExpression="sobreinv" ReadOnly = "true"/>
                        <asp:BoundField DataField="sobreinvmonto" HeaderText="sobreinvmonto" 
                            SortExpression="sobreinvmonto" ReadOnly = "true"/>--%>
                        <asp:BoundField DataField="CD_Almacen" HeaderText="ALM" 
                            SortExpression="CD_Almacen" ReadOnly = "true" />
                        <asp:BoundField DataField="CD_Prod" HeaderText="ID_PROD" 
                            SortExpression="CD_Prod" ReadOnly = "true" />
                        <asp:BoundField DataField="NB_PRODUCTO" HeaderText="PRODUCTO" 
                            SortExpression="NB_PRODUCTO" ReadOnly = "true"/>
                        <asp:BoundField DataField="MAXSLP" HeaderText="MAXSLP" 
                            SortExpression="MAXSLP" ReadOnly = "true">
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TMES10" HeaderText="TMES10" ReadOnly="True" 
                            SortExpression="TMES10" />
                        <asp:BoundField DataField="TMES7" HeaderText="TMES7" 
                            SortExpression="TMES7" ReadOnly = "true"/>
                        <asp:BoundField DataField="TMES3" HeaderText="TMES3" SortExpression="TMES3" ReadOnly = "true"/>
                        <asp:BoundField DataField="M10U" HeaderText="M10U" SortExpression="M10U" ReadOnly = "true" />
                        <asp:BoundField DataField="M3U" HeaderText="M3U" SortExpression="M3U" ReadOnly = "true"/>
                        <asp:BoundField DataField="EXISTSLP" HeaderText="EXISTSLP" 
                            SortExpression="EXISTSLP" ReadOnly = "true">
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROM10MESES" HeaderText="PROM10MESES" 
                            SortExpression="PROM10MESES" ReadOnly = "true"/>
                        <asp:BoundField DataField="PROM3MESES" HeaderText="PROM3MESES" 
                            SortExpression="PROM3MESES" ReadOnly = "true"/>
                        <asp:BoundField DataField="TPROM" HeaderText="TPROM" SortExpression="TPROM" ReadOnly = "true"/>
                        <asp:BoundField DataField="NU_COMPRA_Ant" HeaderText="COMPRA" 
                            SortExpression="NU_COMPRA_Ant" ReadOnly = "true">

                         <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>

                         <asp:TemplateField HeaderText="COMPRA Mod" SortExpression="Compra_Mod">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompra_Mod" runat="server" Font-Size="8pt" 
                                    Text='<%# Eval("NU_COMPRA") %>' Height="18px" Width="20px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompra_Mod" runat="server" Text='<%# Bind("NU_COMPRA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="St Seguridad" SortExpression="St Seguridad">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStSeguridad" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_stockSeg") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStSeguridad" runat="server" Text='<%# Bind("NB_stockSeg") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Motivo Niv" SortExpression="Motivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMotivo" runat="server" Font-Size="8pt" Text='<%# Eval("NB_Motivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMotivo" runat="server" Text='<%# Bind("NB_Motivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="#COMP90D" HeaderText="#COMP90D" 
                            SortExpression="#COMP90D" ReadOnly = "true" />
                        <asp:BoundField DataField="COMPSLP" HeaderText="COMPSLP" 
                            SortExpression="COMPSLP" ReadOnly = "true"/>
                        <asp:BoundField DataField="PEDSLP" HeaderText="PEDSLP" 
                            SortExpression="PEDSLP" ReadOnly = "true"/>
                                                    
                        <asp:BoundField DataField="acomprar" HeaderText="A comprar" 
                            SortExpression="acomprar" ReadOnly = "true"/>

                        <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" 
                            SortExpression="fecha" />

                        <asp:TemplateField HeaderText="Vigencia" SortExpression="Vigencia">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlVigencia" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_Vigencia") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NB_Vigencia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Motivo Vig" SortExpression="Motivo_Vig">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMotivo_Vig" runat="server" Font-Size="8pt" Text='<%# Eval("NB_Motivo_Vig") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMotivo_Vig" runat="server" Text='<%# Bind("NB_Motivo_Vig") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
                                CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;
                            <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" Font-Size="8pt" Text="Modificar" 
                             CommandName = "Edit"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            
                            <asp:SqlDataSource ID="sdsMCNivelacionSLP" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommand="get_productosModeloComprasNivelacion" 
                                SelectCommandType="StoredProcedure" 
                                UpdateCommand="set_insertActualiza_ModeloComprasNivelacion" 
                                UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstAlmacen" DefaultValue="" Name="CD_Almacen" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstPlazas" DefaultValue="-1" Name="CD_Suc" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstMarcas" Name="CD_Marca" 
                                        PropertyName="SelectedValue" DefaultValue="" />
                                    <asp:ControlParameter ControlID="txtProductoBus" DefaultValue="" Name="CD_Prod" 
                                        PropertyName="Text" ConvertEmptyStringToNull="False" />
                                    <asp:ControlParameter ControlID="lstaCompra" DefaultValue="S" 
                                        Name="CD_aComprar" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CD_Almacen" Type="String" />
                                    <asp:Parameter Name="CD_Suc" Type="String" />
                                    <asp:Parameter Name="CD_Prod" Type="String" />
                                    <asp:Parameter Name="NU_Compra_Ant" Type="Int32" />
                                    <asp:Parameter Name="NU_Compra" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo" Type="String" />
                                    <asp:Parameter Name="NU_Vigencia" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo_Vig" Type="String" />
                                    <asp:Parameter Name="NU_StockSeg" Type="Int32" />
                                    <asp:Parameter Name="CD_Usuario" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>            
        </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnlQRO" runat="server" Visible="false">    
<table width="100%">   
    <tr>
        <td style="background-color: #333333; text-align: center;">
            <asp:Label ID="Label5" runat="server" Text="PLAZA QUERETARO" Font-Size="Medium" 
                ForeColor="#99FFCC"></asp:Label>
        </td>
    </tr>  
    <tr>
        <td>
             <asp:GridView ID="dgvMCNivelacionQRO" runat="server" 
                 AutoGenerateColumns="False" CellPadding="4" 
                 DataKeyNames="CD_Almacen,CD_Suc,CD_Prod,NU_COMPRA_Ant" DataSourceID="sdsMCNivelacionQRO" 
                 Font-Size="8pt" ForeColor="#333333" GridLines="None" Height="68px" 
                 onrowcommand="dgvMCNivelacionQRO_RowCommand" Width="100%" 
                 AllowPaging="True">
                 <HeaderStyle CssClass="verticaltext" HorizontalAlign="Left" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <Columns>


                   <asp:BoundField DataField="CD_Almacen" HeaderText="ALM" 
                            SortExpression="CD_Almacen" ReadOnly = "true" />
                     <asp:BoundField DataField="CD_Prod" HeaderText="ID_PROD" ReadOnly="true" 
                         SortExpression="CD_Prod" />
                     <asp:BoundField DataField="NB_PRODUCTO" HeaderText="PRODUCTO" ReadOnly="true" 
                         SortExpression="NB_PRODUCTO" />
                     <asp:BoundField DataField="MAXQRO" HeaderText="MAXQRO" ReadOnly="true" 
                         SortExpression="MAXQRO" >
                     <ItemStyle BackColor="#A7D8D6" />
                     </asp:BoundField>
                     <asp:BoundField DataField="TMES10" HeaderText="TMES10" ReadOnly="True" 
                         SortExpression="TMES10" />
                     <asp:BoundField DataField="TMES7" HeaderText="TMES7" ReadOnly="true" 
                         SortExpression="TMES7" />
                     <asp:BoundField DataField="TMES3" HeaderText="TMES3" ReadOnly="true" 
                         SortExpression="TMES3" />
                     <asp:BoundField DataField="M10U" HeaderText="M10U" ReadOnly="true" 
                         SortExpression="M10U" />
                     <asp:BoundField DataField="M3U" HeaderText="M3U" ReadOnly="true" 
                         SortExpression="M3U" />
                     <asp:BoundField DataField="EXISTQRO" HeaderText="EXISTQRO" ReadOnly="true" 
                         SortExpression="EXISTQRO" >
                     <ItemStyle BackColor="#A7D8D6" />
                     </asp:BoundField>
                     <asp:BoundField DataField="PROM10MESES" HeaderText="PROM10MESES" 
                         ReadOnly="true" SortExpression="PROM10MESES" />
                     <asp:BoundField DataField="PROM3MESES" HeaderText="PROM3MESES" ReadOnly="true" 
                         SortExpression="PROM3MESES" />
                     <asp:BoundField DataField="TPROM" HeaderText="TPROM" ReadOnly="true" 
                         SortExpression="TPROM" />
                     <asp:BoundField DataField="NU_COMPRA_Ant" HeaderText="COMPRAQRO" ReadOnly="true" 
                         SortExpression="NU_COMPRA_Ant" >
                     <ItemStyle BackColor="#A7D8D6" />
                     </asp:BoundField>
                     <asp:TemplateField HeaderText="COMPRA Mod" SortExpression="Compra_Mod">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtCompra_Mod" runat="server" Font-Size="8pt" Height="18px" 
                                 Text='<%# Eval("NU_COMPRA") %>' Width="20px"></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblCompra_Mod0" runat="server" Text='<%# Bind("NU_COMPRA") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="St Seguridad" SortExpression="St Seguridad">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStSeguridad" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_stockSeg") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStSeguridad" runat="server" Text='<%# Bind("NB_stockSeg") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                     <asp:TemplateField HeaderText="Motivo" SortExpression="Motivo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotivo" runat="server" Font-Size="8pt" 
                                Text='<%# Eval("NB_Motivo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMotivo0" runat="server" Text='<%# Bind("NB_Motivo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="#COMP90D" HeaderText="#COMP90D" ReadOnly="true" 
                         SortExpression="#COMP90D" />
                     <asp:BoundField DataField="COMPQRO" HeaderText="COMPQRO" ReadOnly="true" 
                         SortExpression="COMPQRO" />
                     <asp:BoundField DataField="PEDQRO" HeaderText="PEDQRO" ReadOnly="true" 
                         SortExpression="PEDQRO" />
                    <asp:BoundField DataField="acomprar" HeaderText="A comprar" 
                            SortExpression="acomprar" ReadOnly = "true"/>
                    <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" 
                         SortExpression="fecha" />
                    <asp:TemplateField HeaderText="Vigencia" SortExpression="Vigencia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlVigencia" runat="server" Font-Size="8pt" 
                            SelectedValue='<%# Eval("NU_Vigencia") %>'>
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>                                    
                            </asp:DropDownList>                                
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NB_Vigencia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Motivo Vig" SortExpression="Motivo_Vig">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotivo_Vig" runat="server" Font-Size="8pt" Text='<%# Eval("NB_Motivo_Vig") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMotivo_Vig" runat="server" Text='<%# Bind("NB_Motivo_Vig") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:Button ID="Button3" runat="server" BorderStyle="None" BorderWidth="0px" 
                                 CausesValidation="True" 
                                 CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                 CommandName="Update" Font-Size="8pt" Text="Actualizar" />
                             &nbsp;
                             <asp:Button ID="Button4" runat="server" BorderStyle="None" BorderWidth="0px" 
                                 CausesValidation="False" CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Button ID="Button5" runat="server" BorderStyle="None" BorderWidth="0px" 
                                 CausesValidation="False" CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             </asp:GridView>
            
                            <asp:SqlDataSource ID="sdsMCNivelacionQRO" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommand="get_productosModeloComprasNivelacion" 
                                SelectCommandType="StoredProcedure" 
                                UpdateCommand="set_insertActualiza_ModeloComprasNivelacion" 
                                UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstAlmacen" DefaultValue="" Name="CD_Almacen" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstPlazas" DefaultValue="" Name="CD_Suc" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstMarcas" Name="CD_Marca" 
                                        PropertyName="SelectedValue" DefaultValue="1" />
                                    <asp:ControlParameter ControlID="txtProductoBus" DefaultValue="" Name="CD_Prod" 
                                        PropertyName="Text" ConvertEmptyStringToNull="False" />
                                    <asp:ControlParameter ControlID="lstaCompra" DefaultValue="S" 
                                        Name="CD_aComprar" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CD_Almacen" Type="String" />
                                    <asp:Parameter Name="CD_Suc" Type="String" />
                                    <asp:Parameter Name="CD_Prod" Type="String" />
                                    <asp:Parameter Name="NU_Compra_Ant" Type="Int32" />
                                    <asp:Parameter Name="NU_Compra" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo" Type="String" />
                                    <asp:Parameter Name="NU_Vigencia" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo_Vig" Type="String" />
                                    <asp:Parameter Name="NU_StockSeg" Type="Int32" />
                                    <asp:Parameter Name="CD_Usuario" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>            
        </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnlCEL" runat="server" Visible ="false">    
<table width="100%">   
    <tr>
        <td style="background-color: #333333; text-align: center;">
            <asp:Label ID="Label6" runat="server" Text="PLAZA CELAYA" Font-Size="Medium" 
                ForeColor="#99FFCC"></asp:Label>
        </td>
    </tr>  
    <tr>
        <td>
             <asp:GridView ID="dgvMCNivelacionCEL" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" 
                 DataSourceID="sdsMCNivelacionCEL" ForeColor="#333333"
                    GridLines="None" Width="100%" Font-Size="8pt" Height="68px" 
                 onrowcommand="dgvMCNivelacionCEL_RowCommand" 
                 DataKeyNames="CD_Almacen,CD_Suc,CD_Prod,NU_COMPRA_Ant" AllowPaging="True">
                    <HeaderStyle CssClass ="verticaltext" HorizontalAlign ="Left" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        
                        <asp:BoundField DataField="CD_Almacen" HeaderText="ALM" 
                            SortExpression="CD_Almacen" ReadOnly = "true" />
                        <asp:BoundField DataField="CD_Prod" HeaderText="ID PROD" 
                            SortExpression="CD_Prod" ReadOnly = "true" />
                        <asp:BoundField DataField="NB_PRODUCTO" HeaderText="PRODUCTO" 
                            SortExpression="NB_PRODUCTO" ReadOnly = "true" />
                        <asp:BoundField DataField="MAXCEL" HeaderText="MAXCEL" 
                            SortExpression="MAXCEL" ReadOnly = "true" >
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TMES10" HeaderText="TMES10" ReadOnly="True" 
                            SortExpression="TMES10" />
                        <asp:BoundField DataField="TMES7" HeaderText="TMES7" SortExpression="TMES7" ReadOnly = "true" />
                        <asp:BoundField DataField="TMES3" HeaderText="TMES3" SortExpression="TMES3" ReadOnly = "true" />
                        <asp:BoundField DataField="M10U" HeaderText="M10U" SortExpression="M10U" ReadOnly = "true" />
                        <asp:BoundField DataField="M3U" HeaderText="M3U" SortExpression="M3U" ReadOnly = "true" />
                        <asp:BoundField DataField="EXISTCEL" HeaderText="EXISTCEL" 
                            SortExpression="EXISTCEL" ReadOnly = "true" >
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROM10MESES" HeaderText="PROM10MESES" 
                            SortExpression="PROM10MESES" ReadOnly = "true" />
                        <asp:BoundField DataField="PROM3MESES" HeaderText="PROM3MESES" 
                            SortExpression="PROM3MESES" ReadOnly = "true" />
                        <asp:BoundField DataField="TPROM" HeaderText="TPROM" SortExpression="TPROM" ReadOnly = "true" />                       
                        <asp:BoundField DataField="NU_COMPRA_Ant" HeaderText="COMPRA" 
                            SortExpression="NU_COMPRA_Ant" ReadOnly = "true" >
                       
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                       
                       <asp:TemplateField HeaderText="COMPRA Mod" SortExpression="Compra_Mod">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompra_Mod" runat="server" Font-Size="8pt" 
                                    Text='<%# Eval("NU_COMPRA") %>' Height="18px" Width="20px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompra_Mod" runat="server" Text='<%# Bind("NU_COMPRA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="St Seguridad" SortExpression="St Seguridad">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStSeguridad" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_stockSeg") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStSeguridad" runat="server" Text='<%# Bind("NB_stockSeg") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Motivo" SortExpression="Motivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMotivo" runat="server" Font-Size="8pt" 
                                    Text='<%# Eval("NB_Motivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMotivo0" runat="server" Text='<%# Bind("NB_Motivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="#COMP90D" HeaderText="#COMP90D" 
                            SortExpression="#COMP90D" ReadOnly = "true" />
                        <asp:BoundField DataField="COMPCEL" HeaderText="COMPCEL" 
                            SortExpression="COMPCEL" ReadOnly = "true" />
                        <asp:BoundField DataField="PEDCEL" HeaderText="PEDCEL" 
                            SortExpression="PEDCEL" ReadOnly = "true"  /> 
                        <asp:BoundField DataField="acomprar" HeaderText="A comprar" 
                            SortExpression="acomprar" ReadOnly = "true"/>                                            
                        <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" 
                            SortExpression="fecha" />
                         <asp:TemplateField HeaderText="Vigencia" SortExpression="Vigencia">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlVigencia" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_Vigencia") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NB_Vigencia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Motivo Vig" SortExpression="Motivo_Vig">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMotivo_Vig" runat="server" Font-Size="8pt" Text='<%# Eval("NB_Motivo_Vig") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMotivo_Vig" runat="server" Text='<%# Bind("NB_Motivo_Vig") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
                                CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;
                            <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" Font-Size="8pt" Text="Modificar" 
                             CommandName = "Edit"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            
                            <asp:SqlDataSource ID="sdsMCNivelacionCEL" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommand="get_productosModeloComprasNivelacion" 
                                SelectCommandType="StoredProcedure" 
                                UpdateCommand="set_insertActualiza_ModeloComprasNivelacion" 
                                UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstAlmacen" Name="CD_Almacen" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstPlazas" DefaultValue="" Name="CD_Suc" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstMarcas" Name="CD_Marca" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtProductoBus" DefaultValue="" Name="CD_Prod" 
                                        PropertyName="Text" ConvertEmptyStringToNull="False" />
                                    <asp:ControlParameter ControlID="lstaCompra" DefaultValue="S" 
                                        Name="CD_aComprar" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CD_Almacen" Type="String" />
                                    <asp:Parameter Name="CD_Suc" Type="String" />
                                    <asp:Parameter Name="CD_Prod" Type="String" />
                                    <asp:Parameter Name="NU_Compra_Ant" Type="Int32" />
                                    <asp:Parameter Name="NU_Compra" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo" Type="String" />
                                    <asp:Parameter Name="NU_Vigencia" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo_Vig" Type="String" />
                                    <asp:Parameter Name="NU_StockSeg" Type="Int32" />
                                    <asp:Parameter Name="CD_Usuario" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
            
        </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnlIRA" runat="server" Visible ="false">    
<table width="100%">   
    <tr>
        <td style="background-color: #333333; text-align: center;">
            <asp:Label ID="Label7" runat="server" Text="PLAZA IRAPUATO" Font-Size="Medium" 
                ForeColor="#99FFCC"></asp:Label>
        </td>
    </tr>  
    <tr>
        <td>
             <asp:GridView ID="dgvMCNivelacionIRA" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" 
                 DataSourceID="sdsMCNivelacionIRA" ForeColor="#333333"
                    GridLines="None" Width="100%" Font-Size="8pt" Height="68px" 
                 onrowcommand="dgvMCNivelacionIRA_RowCommand" 
                 DataKeyNames="CD_Almacen,CD_Suc,CD_Prod,NU_COMPRA_Ant" AllowPaging="True">
                    <HeaderStyle CssClass ="verticaltext" HorizontalAlign ="Left" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>                        
                      
                       <asp:BoundField DataField="CD_Almacen" HeaderText="ALM" 
                            SortExpression="CD_Almacen" ReadOnly = "true" />
                        <asp:BoundField DataField="CD_Prod" HeaderText="ID PROD" 
                            SortExpression="CD_Prod" ReadOnly = "true" />
                        <asp:BoundField DataField="NB_PRODUCTO" HeaderText="PRODUCTO" 
                            SortExpression="NB_PRODUCTO" ReadOnly = "true" />
                        <asp:BoundField DataField="MAXira" HeaderText="MAXIRA" 
                            SortExpression="MAXira" ReadOnly = "true" >
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TMES10" HeaderText="TMES10" 
                            SortExpression="TMES10" ReadOnly="True"/>
                        <asp:BoundField DataField="TMES7" HeaderText="TMES7" SortExpression="TMES7" ReadOnly = "true" />
                        <asp:BoundField DataField="TMES3" HeaderText="TMES3" SortExpression="TMES3" ReadOnly = "true" />
                        <asp:BoundField DataField="M10U" HeaderText="M10U" SortExpression="M10U" ReadOnly = "true" />
                         <asp:BoundField DataField="EXISTIRA" HeaderText="EXISTIRA" 
                            SortExpression="EXISTIRA" ReadOnly = "true" >
                        <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="M3U" HeaderText="M3U" 
                            SortExpression="M3U" ReadOnly = "true" />                       
                        <asp:BoundField DataField="PROM10MESES" HeaderText="PROM10MESES" 
                            SortExpression="PROM10MESES" ReadOnly = "true" />
                        <asp:BoundField DataField="PROM3MESES" HeaderText="PROM3MESES" 
                            SortExpression="PROM3MESES" ReadOnly = "true" />
                        <asp:BoundField DataField="TPROM" HeaderText="TPROM" 
                            SortExpression="TPROM" ReadOnly = "true" />                          
                        <asp:BoundField DataField="NU_COMPRA_Ant" HeaderText="COMPRA" 
                            SortExpression="NU_COMPRA_Ant" ReadOnly = "true" >

                         <ItemStyle BackColor="#A7D8D6" />
                        </asp:BoundField>

                         <asp:TemplateField HeaderText="COMPRA Mod" SortExpression="Compra_Mod">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompra_Mod" runat="server" Font-Size="8pt" 
                                    Text='<%# Eval("NU_COMPRA") %>' Height="18px" Width="20px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompra_Mod" runat="server" Text='<%# Bind("NU_COMPRA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="St Seguridad" SortExpression="St Seguridad">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStSeguridad" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_stockSeg") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStSeguridad" runat="server" Text='<%# Bind("NB_stockSeg") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Motivo" SortExpression="Motivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMotivo" runat="server" Font-Size="8pt" 
                                    Text='<%# Eval("NB_Motivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMotivo0" runat="server" Text='<%# Bind("NB_Motivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="#COMP90D" HeaderText="#COMP90D" 
                            SortExpression="#COMP90D" ReadOnly = "true" />
                        <asp:BoundField DataField="PEDIRA" HeaderText="PEDIRA" 
                            SortExpression="PEDIRA" ReadOnly = "true" />   
                        <asp:BoundField DataField="acomprar" HeaderText="A comprar" 
                            SortExpression="acomprar" ReadOnly = "true"/>                                   
                        <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" 
                            SortExpression="fecha"/>
                        <asp:TemplateField HeaderText="Vigencia" SortExpression="Vigencia">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlVigencia" runat="server" Font-Size="8pt" 
                                SelectedValue='<%# Eval("NU_Vigencia") %>'>
                                    <asp:ListItem Value="1">Si</asp:ListItem>
                                    <asp:ListItem Value="0">No</asp:ListItem>                                    
                                </asp:DropDownList>                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NB_Vigencia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Motivo Vig" SortExpression="Motivo_Vig">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMotivo_Vig" runat="server" Font-Size="8pt" Text='<%# Eval("NB_Motivo_Vig") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMotivo_Vig" runat="server" Text='<%# Bind("NB_Motivo_Vig") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                      

                        <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True"
                                CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;
                            <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" Font-Size="8pt" Text="Modificar" 
                             CommandName = "Edit"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            
                            <asp:SqlDataSource ID="sdsMCNivelacionIRA" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommand="get_productosModeloComprasNivelacion" 
                                SelectCommandType="StoredProcedure" 
                                UpdateCommand="set_insertActualiza_ModeloComprasNivelacion" 
                                UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstAlmacen" Name="CD_Almacen" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstPlazas" DefaultValue="" Name="CD_Suc" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstMarcas" Name="CD_Marca" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtProductoBus" DefaultValue="" Name="CD_Prod" 
                                        PropertyName="Text" ConvertEmptyStringToNull="False" />
                                    <asp:ControlParameter ControlID="lstaCompra" DefaultValue="S" 
                                        Name="CD_aComprar" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CD_Almacen" Type="String" />
                                    <asp:Parameter Name="CD_Suc" Type="String" />
                                    <asp:Parameter Name="CD_Prod" Type="String" />
                                    <asp:Parameter Name="NU_Compra_Ant" Type="Int32" />
                                    <asp:Parameter Name="NU_Compra" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo" Type="String" />
                                    <asp:Parameter Name="NU_Vigencia" Type="Int32" />
                                    <asp:Parameter Name="NB_Motivo_Vig" Type="String" />
                                    <asp:Parameter Name="NU_StockSeg" Type="Int32" />
                                    <asp:Parameter Name="CD_Usuario" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
            
        </td>
    </tr>
</table>
</asp:Panel>
</asp:Content>

