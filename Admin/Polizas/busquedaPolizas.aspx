<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="busquedaPolizas.aspx.cs" Inherits="Admin_Polizas_busquedaPolizas" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 755px; height: 210px;">
        <tr>
            <td style="width: 108px">
            </td>
            <td style="width: 309px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="BUSQUEDA"></asp:Label></td>
            <td style="width: 2px">
            </td>
        </tr>
        <tr>
            <td style="width: 108px">
            </td>
            <td style="width: 309px">
            </td>
            <td style="width: 2px">
            </td>
        </tr>
        <tr>
            <td style="width: 108px">
                <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Sucursal:"></asp:Label></td>
            <td style="width: 309px">
                <asp:DropDownList ID="lstSucursal" runat="server" DataSourceID="odsOficina" DataTextField="texto"
                    DataValueField="valor" Font-Size="9pt">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsOficina" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="width: 2px">
            </td>
        </tr>
        <tr>
            <td style="width: 108px">
                <asp:Label ID="Label3" runat="server" Font-Size="9pt" Text="Mes:"></asp:Label></td>
            <td style="width: 309px">
                <asp:DropDownList ID="lstMes" runat="server" DataSourceID="odsMeses" DataTextField="Texto"
                    DataValueField="mesId" Font-Size="9pt">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td style="width: 2px" rowspan="7">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="125px"
                    NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False"
                    Width="231px">
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#333399" />
                </asp:Calendar>
                <asp:Label ID="lblTurnoCampo" runat="server" Text="0" Font-Size="Large" ForeColor="White"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 108px">
                <asp:Label ID="Label4" runat="server" Font-Size="9pt" Text="Cliente:"></asp:Label></td>
            <td style="width: 309px">
                <asp:DropDownList ID="lstCliente" runat="server" DataSourceID="odsClientes" DataTextField="razonSocial"
                    DataValueField="idClienteAdmin" Font-Size="9pt" Width="399px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsClientes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 108px">
                <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="Tipo Poliza:"></asp:Label></td>
            <td style="width: 309px">
                <asp:DropDownList ID="lstTipoPoliza" runat="server" Font-Size="9pt">
                    <asp:ListItem Value="V">VENTA</asp:ListItem>
                    <asp:ListItem Value="I">INGRESO</asp:ListItem>
                    <asp:ListItem Value="D">DIARIO</asp:ListItem>
                    <asp:ListItem Value="E">EGRESOS</asp:ListItem>
                    <asp:ListItem Value="">TODOS</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 108px">
                <asp:Label ID="Label5" runat="server" Font-Size="9pt" Text="Rango de Fecha:"></asp:Label></td>
            <td style="width: 309px">
            </td>
        </tr>
        <tr>
            <td style="width: 108px">
            </td>
            <td style="width: 309px">
                <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="de:"></asp:Label>
                <asp:TextBox ID="txtFechaDe" runat="server" Font-Size="9pt" MaxLength="10" OnTextChanged="txtFechaDe_TextChanged" Width="93px"></asp:TextBox><asp:ImageButton
                    ID="imgCalendario" runat="server" Height="21px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="imgCalendario_Click" ValidationGroup="nada" Width="23px" />
                <asp:Label ID="Label8" runat="server" Font-Size="9pt" Text="a:"></asp:Label>
                <asp:TextBox ID="txtFechaA" runat="server" Font-Size="9pt" MaxLength="10" Width="92px"></asp:TextBox>
                <asp:ImageButton ID="imgCalendario2" runat="server" Height="21px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="imgCalendario2_Click" ValidationGroup="nada" Width="23px" /></td>
        </tr>
        <tr>
            <td style="width: 108px">
            </td>
            <td style="width: 309px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFechaDe"
                    Display="Dynamic" ErrorMessage='fecha "DE" invalida: dd/mm/aaaa' Font-Size="8pt"
                    ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFechaA"
                    Display="Dynamic" ErrorMessage='fecha "A" invalida: dd/mm/aaaa' Font-Size="8pt"
                    ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"
                    ValidationGroup="prueba"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 108px">
            </td>
            <td style="width: 309px">
                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" PostBackUrl="~/Admin/Polizas/caidaPolizas.aspx"
                    Text="Buscar" /></td>
        </tr>
        <tr>
            <td style="width: 108px">
            </td>
            <td style="width: 309px">
            </td>
            <td style="width: 2px">
            </td>
        </tr>
    </table>
</asp:Content>

