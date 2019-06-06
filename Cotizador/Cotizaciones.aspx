<%@ Page Language="C#" MasterPageFile="~/Cotizador/Cotizador.master" AutoEventWireup="true" CodeFile="Cotizaciones.aspx.cs" Inherits="Cotizador_Cotizaciones_Cotizaciones" Title="SIM - COTIZACIONES" %>


<asp:Content ID="Content1" ContentPlaceHolderID="CONTENT" runat="Server">

    <link href="../Estilos/Grid_AMI.css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" charset="je">
        function new_window(url) {
            //alert(url);
            newwindow = window.open(url, 'Nueva_Cotizacion', 'top=50,left=150,height=450px,width=650px,scrollbars=yes');
            newwindow.focus();
            location.reload(true);
        }

    </script>

    <asp:Label ID="lblUsuarioId" runat="server" Visible="False"></asp:Label><br />
    <table style="width: 202px">
        <tr>
            <td></td>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10pt" Text="Busqueda" ForeColor="#341C5E"></asp:Label></td>
            <td style="width: 3px"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Size="10pt" Text="Cliente:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtCliente" runat="server" Font-Size="9pt" MaxLength="100" Width="278px" Height="20px"></asp:TextBox></td>
            <td style="width: 3px"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text="Cotización:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtCotizacion" runat="server" Font-Size="9pt" Width="55px" Height="20px"></asp:TextBox></td>
            <td style="width: 3px">
                <asp:Button ID="btnBuscar" runat="server" Font-Size="9pt" Height="20px" OnClick="btnBuscar_Click"
                    Text="Buscar" Width="65px" />
            </td>
        </tr>
    </table>
    <br />
    <asp:HiddenField ClientIDMode="Static" runat="server" ID="hdnCotizadorDate" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" ClientIDMode="Static"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cotizacionid" DataSourceID="ObjectDataSource1"
        ForeColor="#333333" GridLines="None" Width="1000px"
        OnRowCreated="cotizadorGrid_RowCreated" Font-Names="Verdana" Font-Overline="False">
        <FooterStyle Font-Bold="True" ForeColor="White" CssClass="footerStyle" />
        <RowStyle ForeColor="#333333" CssClass="itemStyle" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1"
                        OnCommand="cancelaCotizacion_Click"
                        CommandName='<%# Eval("cotizacionId") %>'
                        runat="server" Font-Size="10pt" ForeColor="Red" ToolTip="CANCELAR COTIZACION">X</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/ShopCart.aspx?cotizacionid={0}"
                DataTextField="cotizacionid" HeaderText="Cotizacion" SortExpression="cotizacionid">
                <ControlStyle ForeColor="Black" />
                <HeaderStyle Font-Size="10pt" />
                <ItemStyle Font-Size="9pt" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/ShopCart.aspx?cotizacionid={0}"
                DataTextField="fecha" HeaderText="Fecha" SortExpression="fecha">
                <ControlStyle ForeColor="Black" />
                <HeaderStyle Font-Size="10pt" />
                <ItemStyle Font-Size="9pt" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/ShopCart.aspx?cotizacionid={0}"
                DataTextField="Estatus" HeaderText="Estatus" SortExpression="Estatus">
                <ControlStyle ForeColor="Black" />
                <HeaderStyle Font-Size="10pt" />
                <ItemStyle Font-Size="9pt" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/ShopCart.aspx?cotizacionid={0}"
                DataTextField="cliente" HeaderText="Cliente" SortExpression="cliente">
                <ControlStyle ForeColor="Black" />
                <HeaderStyle Font-Size="10pt" />
                <ItemStyle Font-Size="9pt" />
            </asp:HyperLinkField>
            <asp:TemplateField SortExpression="banderaDescuento">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("banderaDescuento") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkAceptaDescuento"
                        OnCommand="lnkAceptaDescuento_Click"
                        CommandName='<%# Eval("cotizacionId") %>'
                        CommandArgument='<%# Eval("cotizacionId") %>'
                        runat="server" Font-Size="9pt" Text='<%# Eval("banderaDescuento") %>' ForeColor="Black"></asp:LinkButton>&nbsp;<br />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField SortExpression="banderaIncPrecio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("banderaIncPrecio") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkAceptaIncPrecio"
                        OnCommand="lnkAceptaIncPrecio_Click"
                        CommandName='<%# Eval("cotizacionId") %>'
                        CommandArgument='<%# Eval("cotizacionId") %>' 
                        runat="server" Font-Size="9pt" Text='<%# Eval("banderaIncPrecio") %>' ForeColor="Black" ></asp:LinkButton>&nbsp;<br />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnDuplicar" runat="server" Height="16px"
                        ImageUrl="~/Imagenes/copiar3.jpg" Width="20px"
                        CommandName='<%# Eval("cotizacionId") %>'
                        ToolTip="DUPLICA COTIZACION" OnCommand="btnDuplicar_Command"
                        Style="margin-left: 0px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" CssClass="headerStyle" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="headerStyle" Font-Names="Verdana" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle ForeColor="#284775" CssClass="alternateItemStyle" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaCotizacionesTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblUsuarioId" Name="userId" PropertyName="Text"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsListaCotizacionBusqueda" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaCotizacionesBusquedaTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblUsuarioId" Name="userId" PropertyName="Text"
                Type="Int32" />
            <asp:ControlParameter ControlID="txtCliente" DefaultValue=" " Name="strCliente" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtCotizacion" DefaultValue="0" Name="intCotizacion"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Nueva Cotización" Font-Size="9pt" Height="20px" />
    <asp:Label ID="lblFecha" runat="server"></asp:Label>
</asp:Content>

