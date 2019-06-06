<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reporteDiot.aspx.cs" Inherits="Admin_DIOT_reporteDiot" Title="ReporteDiot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 449px">
        <tr>
            <td colspan="3" style="text-align: center; height: 18px;">
                <asp:Label ID="Label1" runat="server" Text="REPORTE DIOT" Font-Bold="True" Font-Size="10pt"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:RadioButtonList ID="txtrazonsocial" runat="server" BorderStyle="None" CellSpacing="10"
                    EnableTheming="True" Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" OnSelectedIndexChanged="txtrazonsocial_SelectedIndexChanged"
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="CSA">Calvek Sa</asp:ListItem>
                    <asp:ListItem Value="CCC">Calvek del Centro</asp:ListItem>
                    <asp:ListItem Value="CBJ">Calvek Bajio</asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="9pt" Text="Considerar periodo de Acreditamiento." /></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 20px">
                <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Año:"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="9pt"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="TextBox1" ErrorMessage="Numérico (aaaa)" Font-Size="7pt" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="fuera de rango" Font-Size="7pt" MaximumValue="2020" MinimumValue="2008"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 26px">
                <asp:Label ID="Label3" runat="server" Font-Size="9pt" Text="Mes:"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="9pt"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="Numérico (mm)" Font-Size="7pt" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="fuera de rango" Font-Size="7pt" MaximumValue="12" MinimumValue="01"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Procesar Consulta" BorderStyle="None" Font-Size="9pt" />
                <asp:Button ID="Button1" runat="server" Text="Extraer Consulta" OnClick="Button1_Click" Visible="False" BorderStyle="None" Font-Size="9pt" />
                <asp:HyperLink ID="HyperLink1" runat="server" Visible="False">Archivo</asp:HyperLink></td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                    Font-Size="8pt" Visible="False" Width="596px" CellPadding="4" ForeColor="#333333" GridLines="None" Caption="REPORTE DIOT">
                    <Columns>
                        <asp:BoundField DataField="tipo_tercero" HeaderText="Tipo tercero" SortExpression="tipo_tercero" />
                        <asp:BoundField DataField="tipo_operacion" HeaderText="Tipo operacion" SortExpression="tipo_operacion" />
                        <asp:BoundField DataField="rfc" HeaderText="RFC" SortExpression="rfc" />
                        <asp:BoundField DataField="id_fiscal" HeaderText="No. id fiscal" SortExpression="id_fiscal" />
                        <asp:BoundField DataField="nombre_extranjero" HeaderText="Nombre extranjero" SortExpression="nombre_extranjero" />
                        <asp:BoundField DataField="pais_residencia" HeaderText="Pa&#237;s residencia" SortExpression="pais_residencia" />
                        <asp:BoundField DataField="nacionalidad" HeaderText="Nacionalidad" SortExpression="nacionalidad" />
                        <asp:BoundField DataField="act_pag_15_u_16" HeaderText="Actos pagados 15% u 16%" SortExpression="act_pag_15_u_16" />
                        <asp:BoundField DataField="act_pag_15" HeaderText="Actos pagados 15%" SortExpression="act_pag_15" />
                        <asp:BoundField DataField="acred_pag_15_u_16" HeaderText="IVA no acreditable pagado al 15% u 16%" SortExpression="acred_pag_15_u_16" />
                        <asp:BoundField DataField="act_pag_10_u_11" HeaderText="Actos pagados 10% u 11%" SortExpression="act_pag_10_u_11" />
                        <asp:BoundField DataField="act_pag_10" HeaderText="Actos pagados 10%" SortExpression="act_pag_10" />
                        <asp:BoundField DataField="acred_pag_10_u_11" HeaderText="IVA no acreditable  pagado 10% u 11%" SortExpression="acred_pag_10_u_11" />
                        <asp:BoundField DataField="act_imp_15_o_16" HeaderText="Actos importaci&#243;n 15% o 16%" SortExpression="act_imp_15_o_16" />
                        <asp:BoundField DataField="IVA_no_acred_pag_imp_15_o_16" HeaderText="IVA no acreditable pagado importaci&#243;n 15% o 16%"
                            SortExpression="IVA_no_acred_pag_imp_15_o_16" />
                        <asp:BoundField DataField="act_imp_10_u_11" HeaderText="Actos importaci&#243;n 10% u 11%" SortExpression="act_imp_10_u_11" />
                        <asp:BoundField DataField="IVA_no_acred_pag_imp_10_u_11" HeaderText="IVA no acreditable pagado importaci&#243;n 10% u 11%"
                            SortExpression="IVA_no_acred_pag_imp_10_u_11" />
                        <asp:BoundField DataField="act_imp_0" HeaderText="Actos importaci&#243;n exento" SortExpression="act_imp_0" />
                        <asp:BoundField DataField="act_pag_nac_0" HeaderText="Actos pagados nacional 0%" SortExpression="act_pag_nac_0" />
                        <asp:BoundField DataField="act_pag_nac_exento" HeaderText="Actos pagados nacional exento" SortExpression="act_pag_nac_exento" />
                        <asp:BoundField DataField="iva_retenido" HeaderText="IVA retenido" SortExpression="iva_retenido" />
                        <asp:BoundField DataField="dev_desc_bonif" HeaderText="Devoluciones Descuentos y Bonificaciones" SortExpression="dev_desc_bonif" />
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DIOTTableAdapters.get_datosReporteDatosDiotTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CheckBox1" Name="intBanderaPerAcr" PropertyName="Checked"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="TextBox2" Name="strMes" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TextBox1" Name="strA&#241;o" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="txtrazonsocial" Name="razon" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

