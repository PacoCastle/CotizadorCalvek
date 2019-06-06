<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="facturasCobranzaFechaPago.aspx.cs" Inherits="Cobranza_facturasCobranzaFechaPago" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <script type="text/javascript" language="javascript">// <![CDATA[
             
//                    $(document).ready(function () {
//            
//            $(".date-pick").datePicker({startDate:'01/01/2011'});

         //        })

         $(function () {
             pickerfunction();
             Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pickerfunction);
         });

         function pickerfunction() {
             $(document).ready(
             $(function () {
                 $(".date-pick").datePicker({ startDate:'01/01/2011'});
                })
            )
         }
// ]]></script>
    
    <table style="width: 741px">
        <tr>
            <td style="width: 5px">
    <asp:ObjectDataSource ID="odsOficinas" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
    </asp:ObjectDataSource>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
    <asp:TextBox ID="txtMes" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="txtAno" runat="server" Visible="False"></asp:TextBox></td>
            <td>
                <asp:SqlDataSource ID="sdsEstatusFechaCobranza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_estatusFacturasCobranzaFechaPago" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtAno" Name="intAno" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtMes" Name="intMes" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="lstOficina" Name="intSucursal" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEstatusFechaCobranzaBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                    SelectCommand="get_estatusFacturasCobranzaFechaPago" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstAno" DefaultValue="2012" Name="intAno" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" DefaultValue="8" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstOficina" DefaultValue="0" Name="intSucursal"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                <asp:Label ID="lblSucursal" runat="server" Enabled="False" Font-Size="9pt" Text="Sucursal:"></asp:Label></td>
            <td>
    <asp:DropDownList ID="lstOficina" runat="server" DataSourceID="odsOficinas" DataTextField="texto"
        DataValueField="valor" Enabled="False">
    </asp:DropDownList></td>
            <td rowspan="4" align="right">

             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>
                <asp:GridView ID="gvEstatusechaCobranza" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="sdsEstatusFechaCobranza" Font-Size="8pt" ForeColor="#333333"
                    GridLines="None" HorizontalAlign="Right">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Pendientes" HeaderText="Pendientes" ReadOnly="True" SortExpression="Pendientes" />
                        <asp:BoundField DataField="Actualizados" HeaderText="Actualizados" ReadOnly="True"
                            SortExpression="Actualizados" />
                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="White" Font-Bold="True" Font-Size="10pt" Font-Strikeout="False"
                        ForeColor="#5D7B9D" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                &nbsp;
            </ContentTemplate>
            </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="width: 5px; height: 24px">
                <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Año:"></asp:Label></td>
            <td style="height: 24px">
    <asp:DropDownList ID="lstAno" runat="server">
        <asp:ListItem>--</asp:ListItem>
        <asp:ListItem>2015</asp:ListItem>
    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lstAno"
                    Display="Dynamic" ErrorMessage="Requerido" Font-Size="7pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 5px">
    <asp:Label ID="Label1" runat="server" Font-Size="9pt" Text="Mes:"></asp:Label></td>
            <td>
    <asp:DropDownList ID="lstMes" runat="server" DataSourceID="odsMeses" DataTextField="Texto"
        DataValueField="mesId">
    </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 5px">
    <asp:Label ID="Label3" runat="server" Font-Size="9pt" Text="Folio:"></asp:Label></td>
            <td>
    <asp:TextBox ID="txtFolio" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" /></td>
            <td>
                &nbsp;<asp:Label ID="lblMensaje" runat="server" BackColor="White" Font-Size="7pt"
                    ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>   
    <asp:GridView ID="gvFacturasFechaPago" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="sucursal,tp_folio,id_cte,id_kepler,FechaFactura" DataSourceID="sdsFacturasCobranza" Font-Size="10pt"
        ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="20" 
        onrowcommand="gvFacturasFechaPago_rowCommand" Width="800px" 
        >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"  />
        <Columns>
            <asp:BoundField DataField="Estatus" HeaderText="Estatus" 
                SortExpression="Estatus" ReadOnly="True" >
                <ItemStyle Font-Size="8pt" />
            </asp:BoundField>
            <asp:BoundField DataField="UnidadNegocio" HeaderText="Unidad Negocio" 
                SortExpression="UnidadNegocio" ReadOnly="True" />
            <asp:BoundField DataField="Cliente" HeaderText="Cliente" 
                SortExpression="Cliente" ReadOnly="True" />
            <%--<asp:TemplateField HeaderText="Cliente" SortExpression="Cliente">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cliente") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("id_cte") %>'></asp:Label>-<asp:Label
                        ID="Label11" runat="server" Text='<%# Bind("Cliente") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Font-Size="8pt" />
            </asp:TemplateField>--%>
            <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente" 
                ReadOnly="True" >
                <ItemStyle Font-Size="8pt" />
            </asp:BoundField>
            <asp:BoundField DataField="tp_folio" HeaderText="Folio" 
                SortExpression="tp_folio" ReadOnly="True">
                <ItemStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="FechaFactura" HeaderText="Fecha Factura" ReadOnly="True"
                SortExpression="FechaFactura" />
            <asp:TemplateField HeaderText="Fecha Modificada" SortExpression="FechaPago">
                <EditItemTemplate>
                     <asp:TextBox ID="txtFechaPago" runat="server" Font-Size="10pt" Text='<%# Bind("FechaPago") %>'
                        Width="85px" ToolTip="Día/Mes/Año" CssClass="date-pick"></asp:TextBox>
                     <br />
                    <span style="font-size: 4pt">DD/MM/AAAA </span>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFechaPago"
                        ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$" Display="Dynamic"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("FechaPago") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Recibe" SortExpression="Recibe">
                <EditItemTemplate>
                    <asp:TextBox ID="txtRecibe" runat="server" Font-Size="10pt" Text='<%# Bind("recibe") %>'
                        Width="120px" Height="35px" ></asp:TextBox><br /> 
                    <asp:RequiredFieldValidator ID="rfvTxtRecibe" runat="server" ErrorMessage="Product Quantity" Font-Size="Smaller"
                    ControlToValidate="txtRecibe" Display="Dynamic" SetFocusOnError="true" Text="*Obligatorio" ValidationGroup="Actualiza"></asp:RequiredFieldValidator> 
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblrecibe" runat="server" Text='<%# Eval("recibe") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Comentarios" SortExpression="Comentarios">
                <EditItemTemplate>
                    <asp:TextBox ID="txtComentarios" runat="server" Font-Size="10pt" Text='<%# Bind("Comentarios") %>'
                        Width="120px" Height="35px" ></asp:TextBox><br />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblComentarios" runat="server" Text='<%# Eval("Comentarios") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>       


             <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                <%-- <asp:Button ID="btnFechaOK" runat="server" Font-Size="9pt" Text="OK" CommandName="Insert" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />--%>
                    <asp:Button ID="Button1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                        CommandName="Insert" Text="Update" Font-Size="Small" 
                        ValidationGroup="Actualiza" onclick="Button1_Click"/>&nbsp;<asp:Button ID="Button2" runat="server"
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" Font-Size="Small" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit" Font-Size="Small" />
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
    </ContentTemplate>        
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="sdsFacturasCobranza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
        SelectCommand="get_listaFacturasCobranza" SelectCommandType="StoredProcedure" InsertCommand="set_insertaFacturasCobranzaFechaPago" InsertCommandType="StoredProcedure" OnSelecting="sdsFacturasCobranza_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtAno" Name="intAno" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="txtMes" Name="intMes" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="lstOficina" Name="intSucursal" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="txtFolio" DefaultValue=" " Name="strFolio" PropertyName="Text"
                Type="String" />
            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="strSucursal" Type="String" />
            <asp:Parameter Name="strfolio" Type="String" />
            <asp:Parameter Name="strCte" Type="String" />
            <asp:Parameter Name="strFechaPago" Type="String" />
            <asp:Parameter Name="strIdkepler" Type="String" />
            <asp:Parameter Name="strRecibe" />
            <asp:Parameter Name="strComentario" />
            <asp:Parameter Name="intUsuarioId" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource><asp:SqlDataSource ID="sdsFacturasCobranzaBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
        SelectCommand="get_listaFacturasCobranza" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lstAno" Name="intAno" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lstMes" Name="intMes" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lstOficina" Name="intSucursal" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="txtFolio" DefaultValue=" " Name="strFolio" PropertyName="Text"
                Type="String" />
            <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                </td>
        </tr>
    </table>
</asp:Content>

