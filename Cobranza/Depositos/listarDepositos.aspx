<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listarDepositos.aspx.cs" Inherits="Cobranza_AltaDeposito" Title="Sick - Depósitos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Mensaje01" runat="server" Text=""></asp:Label><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Cobranza/Depositos/formularioDepositos.aspx">Alta de Depositos</asp:HyperLink><br />
    <br />
    <table border="0" style="width: 792px; color: #000000; height: 253px">
        <tr>
            <td align="center" colspan="5" valign="middle">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Listado de Depositos"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2" style="width: 110px; height: 10px">
                <span style="font-size: 10pt">
                Cliente:</span></td>
            <td style="height: 10px;">
                <asp:DropDownList ID="lstCliente" runat="server" DataSourceID="ObjectDataSource4"
                    DataTextField="razonSocial" DataValueField="codigo" Font-Size="9pt" Width="401px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td colspan="2" rowspan="5" style="width: 212px; text-align: left" valign="top">
                <asp:Calendar ID="Calendar1" runat="server" Font-Size="7pt" Height="104px" OnSelectionChanged="Calendar1_SelectionChanged"
                    Visible="False" Width="206px"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 110px; height: 26px">
                <span style="font-size: 10pt">Fecha Deposito:</span></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtFecha" runat="server" Width="89px" Font-Size="9pt"></asp:TextBox>
                <asp:ImageButton ID="imgCalendario" runat="server" Height="22px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="ImageButton1_Click" Width="20px" />
                <asp:Label ID="lblbndFecha1" runat="server" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 110px; height: 13px" colspan="2">
                <span style="font-size: 10pt">
                Oficina:</span></td>
            <td style="height: 13px">
                <asp:DropDownList ID="lstOficina" runat="server" DataSourceID="ObjectDataSource2"
                    DataTextField="texto" DataValueField="valor" Font-Size="9pt">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_comboOficinasTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 110px; height: 10px;" colspan="2">
                <span style="font-size: 10pt">
                Banco:</span></td>
            <td style="height: 10px;">
                <asp:DropDownList ID="lstCuenta" runat="server" DataSourceID="ObjectDataSource1"
                    DataTextField="cuentaDeposito_Nombre" DataValueField="cuentaDepositoId" Font-Size="9pt">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaCuentasTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 20px" colspan="3">
                <span style="font-size: 10pt">Fecha alta o Modificación:</span>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 110px; height: 10px; text-align: right;" colspan="2">
                <span style="font-size: 10pt">De:</span></td>
            <td style="height: 10px;" colspan="3">
                <asp:TextBox ID="txtFechaActualizaDe" runat="server" Font-Size="9pt" Width="100px"></asp:TextBox>
                <asp:ImageButton ID="imgCalendario2" runat="server" Height="22px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="ImageButton2_Click" Width="20px" /><asp:Label ID="lblbndFecha2" runat="server" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 110px; height: 10px; text-align: right;" colspan="2">
                <span style="font-size: 10pt">Hasta:</span></td>
            <td colspan="3" rowspan="1" style="height: 10px; text-align: left" valign="top">
                <asp:TextBox ID="txtFechaActualizaHasta" runat="server" Font-Size="9pt" Width="100px"></asp:TextBox>
                <asp:ImageButton ID="imgCalendario3" runat="server" Height="22px" ImageUrl="~/Imagenes/10129.ico"
                    OnClick="ImageButton3_Click" Width="20px" /><asp:Label ID="lblbndFecha3" runat="server" Visible="False"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /></td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="depositoId" DataSourceID="ObjectDataSource3" Font-Size="9pt" ForeColor="#333333" GridLines="None" Width="795px" Visible="False" >
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="depositoId" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="cliente_razonSocial" HeaderText="Cliente" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="depositoId" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="fecha_deposito" HeaderText="Fecha" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="depositoId" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="oficina_nombre" HeaderText="Oficina" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="depositoId" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="cuentaDeposito_Nombre" HeaderText="Cuenta" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="depositoId" DataNavigateUrlFormatString="~/Cobranza/Depositos/formularioDepositos.aspx?depositoId={0}"
                DataTextField="estatusCobranza_nombre" HeaderText="Estatus" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaDepositosTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lstCliente" DefaultValue=" " Name="strCliente" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtFecha" DefaultValue=" " Name="strFecha" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="lstOficina" DefaultValue="0" Name="intOficina" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="lstCuenta" DefaultValue="0" Name="intCuentaDepositoId"
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtFechaActualizaDe" DefaultValue="" Name="strFechaCreadoIni"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtFechaActualizaHasta" Name="strFechaCreadoFin"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>

