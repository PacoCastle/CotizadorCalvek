<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CuentasIncorrectas.aspx.cs" Inherits="Admin_Contabilidad_CuentasIncorrectas" Title="Cuentas Incorrectas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table id="TABLE1">
        <tr>
            <td align="center" style="width: 660px">
                <asp:Label ID="Label1" runat="server" Text="Cuentas Incorrectas"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 515px">
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 515px; height: 49px;">
                <asp:RadioButtonList ID="txtrazonsocial" runat="server" BorderStyle="None" CellSpacing="10"
                    EnableTheming="True" Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" RepeatDirection="Horizontal">
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
                            <span style="font-size: 10pt">Año:<br />
                                <br />
                                <br />
                            </span></td>
                        <td align="left" style="width: 96px; height: 5px" valign="top">
                            <asp:TextBox ID="txtAno" runat="server" Font-Size="9pt" MaxLength="4" Width="51px">2013</asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAno" Display="Dynamic"
                                ErrorMessage="Obligatorio" Font-Size="7pt" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAno"
                                Display="Dynamic" ErrorMessage="Valor no valido" Font-Size="7pt" ValidationExpression="\d{4}"
                                ValidationGroup="validaCaptura"></asp:RegularExpressionValidator><br />
                        </td>
                        <td align="left" style="width: 65px; color: #666666; height: 5px" valign="top">
                            <span style="font-size: 10pt">Mes:</span></td>
                        <td align="left" style="width: 94px; height: 5px" valign="top">
                            <asp:DropDownList ID="lstMes" runat="server" DataSourceID="odsMeses" DataTextField="Texto"
                                DataValueField="mesId" Font-Size="9pt">
                            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="lstMes" Display="Dynamic" ErrorMessage="Obligatorio" Font-Size="7pt"
                                InitialValue="0" ValidationGroup="validaCaptura">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="4" style="position: static; height: 2px; text-align: left">
                            <asp:Button ID="btnBuscar" runat="server" BorderStyle="None" BorderWidth="1px" OnClick="btnBuscar_Click"
                                Text="Buscar" ValidationGroup="validaCaptura" Width="79px" />
                            <br />
                            <asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 515px">
                <asp:GridView ID="GridCuentas" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="CuentasInc" Font-Size="8pt" ForeColor="#333333"
                    GridLines="None" PageSize="15" Visible="False" Width="539px" 
                    EnableModelValidation="True" AllowSorting="True">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="poliza" HeaderText="Poliza">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" SortExpression="Cuenta" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tipo" HeaderText="Tipo">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Documento" HeaderText="Documento">
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
                <asp:SqlDataSource ID="CuentasInc" runat="server" ConnectionString="<%$ ConnectionStrings:TUDATOPER2009 %>"
                    ProviderName="<%$ ConnectionStrings:TUDATOPER2009.ProviderName %>" SelectCommand="get_cuentas_incorrectas"
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

