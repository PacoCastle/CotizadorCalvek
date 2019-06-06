<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AplicacionDepositos.aspx.cs" Inherits="Cobranza_Depositos_AplicacionDepositos" Title="SICK - Aplicación Depósitos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="11pt" Text="Depósitos Pendientes"></asp:Label><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="deposito" DataSourceID="ObjectDataSource1" Font-Size="10pt" ForeColor="#333333"
        GridLines="None" AllowPaging="True" AllowSorting="True">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="deposito" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="deposito" HeaderText="Id" />
            <asp:HyperLinkField DataNavigateUrlFields="deposito" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="cliente" HeaderText="Cliente" />
            <asp:HyperLinkField DataNavigateUrlFields="deposito" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="fecha" HeaderText="Fecha" />
            <asp:HyperLinkField DataNavigateUrlFields="deposito" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="oficina" HeaderText="Oficina" />
            <asp:HyperLinkField DataNavigateUrlFields="deposito" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="monto" DataTextFormatString="{0:#,##0.00}" HeaderText="Monto">
                <ItemStyle HorizontalAlign="Right" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="deposito" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="comentario" HeaderText="Comentario" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <PagerSettings Mode="NumericFirstLast" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaDepositosPendientesTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaDepositosPendientesTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lstCliente" DefaultValue=" " Name="strCliente" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtFecha" DefaultValue=" " Name="strFecha" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="lstOficina" DefaultValue="0" Name="intOficina" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <table border="0" style="width: 663px; color: #000000; height: 253px">
        <tr>
            <td align="center" colspan="5" valign="middle">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Busqueda"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 216px">
            </td>
            <td style="width: 74px">
                <span style="font-size: 10pt">
                Cliente:</span></td>
            <td style="width: 2px">
                <asp:DropDownList ID="lstCliente" runat="server" DataSourceID="ObjectDataSource4"
                    DataTextField="razonSocial" DataValueField="codigo" Font-Size="10pt">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td colspan="2" rowspan="3" style="width: 212px; text-align: left" valign="top">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="157px"
                    NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False"
                    Width="254px">
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                        Font-Size="12pt" ForeColor="#333399" />
                </asp:Calendar>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 216px">
            </td>
            <td style="width: 74px">
                <span style="font-size: 10pt">
                Fecha:</span></td>
            <td style="width: 2px">
                <asp:TextBox ID="txtFecha" runat="server" Width="100px" Font-Size="10pt"></asp:TextBox>
                <asp:ImageButton ID="imgCalendario" runat="server" Height="22px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="ImageButton1_Click" Width="21px" /></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 216px">
            </td>
            <td style="width: 74px">
                <span style="font-size: 10pt">
                Oficina:</span></td>
            <td style="width: 2px">
                <asp:DropDownList ID="lstOficina" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="texto" DataValueField="valor" Font-Size="10pt">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 216px;">
            </td>
            <td style="width: 74px;">
            </td>
            <td style="width: 2px;">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" /></td>
            <td colspan="2" style="width: 212px;">
            </td>
        </tr>
    </table>
</asp:Content>

