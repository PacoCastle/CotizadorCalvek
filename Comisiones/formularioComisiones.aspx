<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formularioComisiones.aspx.cs" Inherits="Comisiones_formularioComisiones" Title="Comisiones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Gray" Visible="False">9</asp:Label><br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Gray">Año:</asp:Label>
    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Gray">2012</asp:Label><br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Gray">Mes:</asp:Label><br />
    <asp:DropDownList ID="lstMes" runat="server" AutoPostBack="True" DataSourceID="odsMeses"
        DataTextField="Texto" DataValueField="mesId" Font-Size="9pt" OnSelectedIndexChanged="lstMes_SelectedIndexChanged1">
    </asp:DropDownList><asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
    </asp:ObjectDataSource>
    <table style="width: 855px">
        <tr>
            <td style="width: 458px; text-align: center;">
                <span style="color: #000099; font-family: Arial;"></span></td>
        </tr>
        <tr>
            <td style="width: 458px">
                <asp:ObjectDataSource ID="odsComisionesVentas" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ComisionesTableAdapters.get_ComisionesVentasTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblAno" DefaultValue="" Name="intAno" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" DefaultValue="" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataSourceID="odsComisionesVentas" Font-Size="9pt" GridLines="Horizontal"
                    Width="100%" Caption="VENTAS" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" ShowFooter="True">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="unidad_negocio" HeaderText="Unidad Negocio" SortExpression="unidad_negocio">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Agente" SortExpression="Agente">
                            <FooterTemplate>
                                <asp:Label ID="LabelTotal" runat="server" Text="TOTAL"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Agente") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Importe" SortExpression="importe">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:C2}",Get_montoImporteVentas( Double.Parse(Eval("importe").ToString() ) )) %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# String.Format("{0:C2}", Get_Monto_Total_ImporteVentas()) %>'></asp:Label>
                            </FooterTemplate>

                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Abono" SortExpression="abono">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:C2}",Get_montoAbonoVentas(Double.Parse(Eval("abono").ToString() ))) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterTemplate>
                                <asp:Label ID="Label22" runat="server" Text='<%# String.Format("{0:C2}", Get_Monto_Total_AbonoVentas()) %>'></asp:Label>
                            </FooterTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comision" SortExpression="Comision">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# String.Format("{0:C2}",Get_montoComisionVentas(Double.Parse(Eval("Comision").ToString() ))) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterTemplate>
                                <asp:Label ID="Label32" runat="server" Text='<%# String.Format("{0:C2}", Get_Monto_Total_ComisionVentas()) %>'></asp:Label>
                            </FooterTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comision Garantia" SortExpression="ComisionGarantia">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# String.Format("{0:C2}",Get_montoComisionGarantiaVentas(Double.Parse(Eval("ComisionGarantia").ToString() ))) %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label42" runat="server" Text='<%# String.Format("{0:C2}", Get_Monto_Total_ComisionGarantiaVentas()) %>'></asp:Label>
                            </FooterTemplate>
                            
                            <FooterStyle HorizontalAlign="Right" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="White" Font-Bold="True" HorizontalAlign="Right" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 458px; text-align: center">
                <span style="color: #000099; font-family: Arial;"><strong></strong></span></td>
        </tr>
        <tr>
            <td style="width: 458px">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataSourceID="odsComisionesSupervisores" Font-Size="9pt"
                    GridLines="Horizontal" Width="100%" Caption="SUPERVISORES" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" >
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="unidad_negocio" HeaderText="Unidad Negocio" SortExpression="unidad_negocio">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="abono" DataFormatString="{0:C2}" HeaderText="Abono Cobrable" ReadOnly="True"
                            SortExpression="abono">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Comision" DataFormatString="{0:C2}" HeaderText="Comision"
                            ReadOnly="True" SortExpression="Comision">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsComisionesSupervisores" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ComisionesTableAdapters.get_ComisionesSupervisoresTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblAno" DefaultValue="" Name="intAno" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" DefaultValue="" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 458px; text-align: center">
                <span style="color: #000099; font-family: Arial;"><strong></strong></span></td>
        </tr>
        <tr>
            <td style="width: 458px">
                <asp:ObjectDataSource ID="odsComisionesJefeSoporte" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ComisionesTableAdapters.get_ComisionesJefeSoporteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblAno" DefaultValue="" Name="intAno" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" DefaultValue="" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataSourceID="odsComisionesJefeSoporte" Font-Size="9pt"
                    GridLines="Horizontal" Width="100%" Caption="SOPORTE" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="importe" DataFormatString="{0:C2}" HeaderText="Importe"
                            ReadOnly="True" SortExpression="importe">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Comision" DataFormatString="{0:C2}" HeaderText="Comision"
                            ReadOnly="True" SortExpression="Comision">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 458px">
                <asp:ObjectDataSource ID="odsComisionesVentasInternas" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ComisionesTableAdapters.get_ComisionesVentasInternasTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblAno" DefaultValue="" Name="intAno" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lstMes" DefaultValue="" Name="intMes" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:SessionParameter Name="intUsuarioId" SessionField="usuarioId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataSourceID="odsComisionesVentasInternas" Font-Size="9pt"
                    GridLines="Horizontal" Width="100%" Caption="VENTAS INTERNAS" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="unidad_negocio" HeaderText="Sucursal" ReadOnly="True"
                            SortExpression="unidad_negocio" />
                        <asp:BoundField DataField="Agente" HeaderText="Agente" ReadOnly="True" SortExpression="Agente" />
                        <asp:BoundField DataField="Importe" DataFormatString="{0:C2}" HeaderText="Importe"
                            ReadOnly="True" SortExpression="Importe">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bonoVentasInternas" DataFormatString="{0:C2}" HeaderText="Bono Ventas"
                            ReadOnly="True" SortExpression="bonoVentasInternas">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="logro Oficina" SortExpression="logro">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("logro") %>'></asp:Label>
                                %
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="BonoOficina" DataFormatString="{0:C2}" HeaderText="Bono Oficina"
                            ReadOnly="True" SortExpression="BonoOficina">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Bono" DataFormatString="{0:C2}" HeaderText="Bono" ReadOnly="True"
                            SortExpression="Bono">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

