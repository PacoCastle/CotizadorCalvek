<%@ Page Language="C#" AutoEventWireup="true" CodeFile="caidaEdoCuenta.aspx.cs" Inherits="Catalogos_Clientes_caidaEdoCuenta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SICK-EDO CUENTA</title>
</head>
<body style="background: url(Imagenes/fondoCaida.jpg) left bottom;">
    <form id="form1" runat="server">
        <div style="width: 800px; height: 250px">
            <table border="0" cellpadding="0" cellspacing="0" rules="none" style="width: 770px;
                height: 227px">
                <tr>
                    <td style="width: 605px; height: 16px">
                        </td>
                    <td colspan="2" style="height: 16px; text-align: right">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/LOGOCALVEK.gif" Width="266px" Height="54px" />&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 16px; text-align: center">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" Text="ESTADO DE CUENTA" Font-Names="Arial"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 16px; text-align: center">
                        <hr size="5" style="border-right: #000 1px solid; border-top: #000 1px solid; border-left: #000 1px solid; border-bottom: #000 1px solid;" />
                    </td>
                </tr>
                <tr style="font-weight: bold; font-size: 12pt">
                    <td colspan="3" style="height: 60px; text-align: left">
                        <table border="0" style="border-left-color: black; border-bottom-color: black; width: 802px; border-top-color: black; height: 47px; border-right-color: black;">
                            <tr>
                                <td rowspan="3" style="width: 379px; height: 35px;">
                                    <span>
                                    <asp:Label ID="lblRazonSocial" runat="server" Font-Bold="True" Font-Size="14pt" Width="351px" Font-Names="Arial"></asp:Label>&nbsp;<br />
                                        <asp:Label ID="lblDireccionCliente" runat="server" Font-Bold="False" Font-Size="10pt" Font-Names="Arial"></asp:Label><br />
                                        <asp:Label ID="lblDireccionCliente2" runat="server" Font-Bold="False" Font-Size="10pt" Font-Names="Arial"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblDireccionCliente3" runat="server" Font-Bold="False" Font-Size="10pt" Font-Names="Arial"></asp:Label></span></td>
                                <td colspan="2" rowspan="3" style="height: 35px;" align="right">
                                    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesClienteTableAdapter">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="0" Name="intCliente" QueryStringField="clienteAdminId"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="ObjectDataSource7" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                                        Width="221px" Font-Names="Arial">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
                                            <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                    <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="8pt" Text="Cifras en Pesos Mexicanos"
                                        Width="130px"></asp:Label></td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                        <hr size="5" style="border-right: #000 1px solid; border-top: #000 1px solid; border-left: #000 1px solid; border-bottom: #000 1px solid;" />
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="3">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataSourceID="ObjectDataSource3" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                            ShowFooter="True" Width="801px" Font-Names="Arial">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="fechaFactura" HeaderText="Fecha" ReadOnly="True" SortExpression="fechaFactura">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="serie" HeaderText="Serie" SortExpression="serie">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio">
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Saldo M.N." SortExpression="Saldo M_N_">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("[Saldo M_N_]") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Get_TSaldoMN() %>'></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# getTotalSaldoMN(Eval("[Saldo M_N_]").ToString()) %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Saldo USD" SortExpression="Saldo USD">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("[Saldo USD]") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="Label21" runat="server" Text='<%# Get_TSaldoUS() %>'></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# getTotalSaldoUS(Eval("[Saldo USD]").ToString()) %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="nb_estatuscob" HeaderText="Estatus" SortExpression="nb_estatuscob">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_getEstadoCuentaClienteTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="intClienteId" QueryStringField="clienteAdminId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
