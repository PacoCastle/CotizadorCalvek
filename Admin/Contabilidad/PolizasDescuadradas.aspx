<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PolizasDescuadradas.aspx.cs" Inherits="Admin_Contabilidad_PolizasDescuadradas" Title="Polizas Descuadradas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>

    <table id="TABLE1" onclick="return TABLE1_onclick()">
        <tr>
            <td style="width: 660px" align="center">
                <asp:Label ID="Label1" runat="server" Text="Polizas Descuadradas"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 515px">
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 515px">
                <asp:RadioButtonList ID="txtrazonsocial" runat="server" BorderStyle="None"
                    CellSpacing="10" EnableTheming="True" Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black"
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="CSA">Calvek Sa</asp:ListItem>
                    <asp:ListItem Value="CCC">Calvek del Centro</asp:ListItem>
                    <asp:ListItem Value="CBJ">Calvek Bajio</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td style="width: 515px">
                <table cellpadding="0" cellspacing="0" style="width: 329px; height: 134px; text-align: left">
                    <tr>
                        <td align="left" style="width: 62px; height: 5px" valign="top">
                            <span style="font-size: 10pt">Año:</span></td>
                        <td align="left" style="width: 96px; height: 5px" valign="top">
                            <asp:TextBox ID="txtAno" runat="server" Font-Size="9pt" MaxLength="4" Width="51px">2013</asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAno" Display="Dynamic"
                                ErrorMessage="Obligatorio" Font-Size="7pt" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAno"
                                Display="Dynamic" ErrorMessage="Valor no valido" Font-Size="7pt" ValidationExpression="\d{4}"
                                ValidationGroup="validaCaptura"></asp:RegularExpressionValidator></td>
                        <td align="left" style="width: 65px; color: #666666; height: 5px" valign="top">
                            <span style="font-size: 10pt">Mes:</span></td>
                        <td align="left" style="width: 94px; height: 5px" valign="top">
                            <asp:DropDownList ID="lstMes" runat="server" DataSourceID="odsMeses"
                                DataTextField="Texto" DataValueField="mesId" Font-Size="9pt">
                            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="lstMes" Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt"
                                InitialValue="0" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="4" style="height: 2px; text-align: left; position: static;">
                            <asp:Button ID="btnBuscar" runat="server" BorderStyle="None" BorderWidth="1px" OnClick="btnBuscar_Click"
                                Text="Buscar" ValidationGroup="validaCaptura" Width="79px" />
                            <asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
                            </asp:ObjectDataSource><asp:Button ID="btnAjustar" runat="server" BorderStyle="None" BorderWidth="1px" OnClick="btnAjustar_Click"
                                Text="Ajustar" ValidationGroup="validaCaptura" Width="79px" />
                            <asp:Label ID="lblMensaje" runat="server" Font-Size="Small"></asp:Label><br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 515px">
                <asp:GridView ID="GridPolizas" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="BuscarPolizasDesc" Font-Size="8pt" ForeColor="#333333" GridLines="None"
                    Visible="False" Width="539px" AllowPaging="True" PageSize="15">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="poliza" HeaderText="Poliza">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tipo" HeaderText="Tipo">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cargo" HeaderText="Cargo">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="abono" HeaderText="Abono">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#5D7B9D" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="BuscarPolizasDesc" runat="server" ConnectionString="<%$ ConnectionStrings:TUDATOPER2009 %>"
                    ProviderName="<%$ ConnectionStrings:TUDATOPER2009.ProviderName %>" SelectCommand="get_polizas_descuadradas"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtAno" Name="intAno" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtrazonsocial" Name="razon" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 515px">
            </td>
        </tr>
    </table>
</asp:Content>

