<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="busquedaFacturasCarteras.aspx.cs" Inherits="Admin_ControlCartera_busquedaFacturasCarteras" Title="CUENTAS X COBRAR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="800">
        <tr>
            <td align="center" colspan="2" style="height: 18px">
                <strong>CONTROL DE FACTURACION Y CARTERA</strong></td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                &nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="#FF3333"
                    Text="*Cifras en Miles de Pesos MN."></asp:Label></td>
        </tr>
        <tr>
            <td width="315" style="height: 14px">
                <strong><span style="font-size: 10pt">B�squeda</span></strong></td>
            <td rowspan="5" valign="top" width="479">
                <table width="479">
                    <tr>
                        <td align="left" valign="top" width="233">
                            <asp:Label ID="Label7" runat="server" Font-Size="8pt" Text="_"></asp:Label><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                          DataSourceID="ObjectDataSource4" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                          Width="220px">
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <Columns>
                              <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
                              <asp:TemplateField HeaderText="#Folio" SortExpression="countFolios">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("countFolios") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:#,##0}", Eval("countFolios")) %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Monto" SortExpression="total">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("total")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                          </Columns>
                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                          <EditRowStyle BackColor="#999999" />
                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      </asp:GridView>
                      <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoRevisadosTableAdapter"></asp:ObjectDataSource>
                        </td>
                        <td align="left" valign="top" width="234">
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="9pt" Text="Pendientes"></asp:Label><asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                          DataSourceID="ObjectDataSource5" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                          Width="250px">
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <Columns>
                              <asp:BoundField DataField="concepto" HeaderText="Estatus" SortExpression="concepto" />
                              <asp:HyperLinkField DataNavigateUrlFields="cidconce01" DataNavigateUrlFormatString="~/Admin/ControlCartera/formularioDetalleCartera.aspx?concepto={0}"
                                  DataTextField="countFolios" HeaderText="#Folios" NavigateUrl="~/Admin/ControlCartera/formularioDetalleCartera.aspx"
                                  SortExpression="countFolios" />
                              <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Monto") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Monto")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                          </Columns>
                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                          <EditRowStyle BackColor="#999999" />
                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      </asp:GridView>
                  <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesTableAdapter"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" valign="top">
                      <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                          DataSourceID="ObjectDataSource6" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                          Width="479px">
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <Columns>
                              <asp:BoundField DataField="concepto" HeaderText="Estatus" ReadOnly="True" SortExpression="concepto" />
                              <asp:TemplateField HeaderText="Cel" SortExpression="Cly">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cly") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Cly")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Qro" SortExpression="Qro">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("Qro") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Qro")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Slp" SortExpression="Slp">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("Slp") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Slp")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Auto" SortExpression="Auto">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# Eval("Auto") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Auto")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="- - -" SortExpression="Ning">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("Ning") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Ning")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                                  <HeaderStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemStyle BackColor="#F7F6F3" HorizontalAlign="Right" />
                                  <ItemTemplate>
                                      <asp:Label ID="Label6" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Total")) %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                          </Columns>
                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                          <EditRowStyle BackColor="#999999" />
                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      </asp:GridView>
                      <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}"
                          SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesDetalleTableAdapter">
                      </asp:ObjectDataSource><asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4"
                          DataSourceID="ObjectDataSource8" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                          Width="479px">
                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                          <Columns>
                              <asp:BoundField DataField="concepto" HeaderText="Moroso" ReadOnly="True" SortExpression="concepto" />
                              <asp:TemplateField HeaderText="Cel" SortExpression="Cly">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cly") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Cly")) %>'></asp:Label>
                                      <asp:Label ID="Label9" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Cly_cto").ToString())) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Qro" SortExpression="Qro">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("Qro") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Qro")) %>'></asp:Label>
                                      <asp:Label ID="Label10" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Qro_cto").ToString())) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Slp" SortExpression="Slp">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("Slp") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Slp")) %>'></asp:Label>
                                      <asp:Label ID="Label11" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Slp_cto").ToString())) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Auto" SortExpression="Auto">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# Eval("Auto") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Auto")) %>'></asp:Label>
                                      <asp:Label ID="Label12" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Auto_cto").ToString())) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="- - -" SortExpression="Ning">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("Ning") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Ning")) %>'></asp:Label>
                                      <asp:Label ID="Label13" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Ning_cto").ToString())) %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle HorizontalAlign="Center" />
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label6" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Total")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle BackColor="#F7F6F3" HorizontalAlign="Right" />
                              </asp:TemplateField>
                          </Columns>
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <EditRowStyle BackColor="#999999" />
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}"
                          SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesDetalleMorosoTableAdapter">
                            </asp:ObjectDataSource>
                            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" CellPadding="4"
                          DataSourceID="ObjectDataSource9" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                          Width="479px">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="concepto" HeaderText="Moroso P" ReadOnly="True" SortExpression="concepto" />
                                    <asp:TemplateField HeaderText="Cel" SortExpression="Cly">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cly") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Cly")) %>'></asp:Label>
                                            <asp:Label ID="Label9" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Cly_cto").ToString())) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qro" SortExpression="Qro">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Qro") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Qro")) %>'></asp:Label>
                                            <asp:Label ID="Label10" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Qro_cto").ToString())) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Slp" SortExpression="Slp">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Slp") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Slp")) %>'></asp:Label>
                                            <asp:Label ID="Label11" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Slp_cto").ToString())) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Auto" SortExpression="Auto">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Auto") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Auto")) %>'></asp:Label>
                                            <asp:Label ID="Label12" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Auto_cto").ToString())) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="- - -" SortExpression="Ning">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Ning") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Ning")) %>'></asp:Label>
                                            <asp:Label ID="Label13" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Ning_cto").ToString())) %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Total")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle BackColor="#F7F6F3" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}"
                          SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesDetalleMorosoParcialTableAdapter">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="134" valign="top">
                <table border="0" cellspacing="0" cellpadding="0" style="width: 426px; height: 112px">
      <tr>
        <td width="17" style="height: 18px">&nbsp;</td>
        <td style="width: 112px; height: 18px">
            <span style="font-size: 7pt">FOLIO FACTURA:</span></td>
        <td width="252" style="height: 18px">
            <asp:TextBox ID="txtFolioFactura" runat="server" Font-Size="7pt" Width="88px"></asp:TextBox></td>
        </tr>
      <tr>
        <td style="height: 18px">&nbsp;</td>
        <td style="width: 112px; height: 18px">
            <span style="font-size: 7pt">CLIENTE:</span></td>
        <td style="height: 18px">
            <asp:DropDownList ID="lstCliente" runat="server" DataSourceID="ObjectDataSource1"
                DataTextField="razonSocial" DataValueField="idClienteAdmin" Font-Size="7pt" Width="220px">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
            </asp:ObjectDataSource>
        </td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="width: 112px">
            <span style="font-size: 7pt">AGENTE:</span></td>
        <td>
            <asp:DropDownList ID="lstAgentes" runat="server" DataSourceID="ObjectDataSource2"
                DataTextField="usuarioNombreCompleto_cotizacion" DataValueField="usuarioId_cotizacion" Font-Size="7pt" Width="220px">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaAgentesVentaTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="intUsuarioId" SessionField="usuarioID"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="width: 112px">
            <span style="font-size: 7pt">ESTATUS:</span></td>
        <td>
            <asp:DropDownList ID="lstEstatusCobranza" runat="server" DataSourceID="odsBdOperacion"
                DataTextField="estatusCobranza" DataValueField="idEstatusCobranza" Font-Size="7pt">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="odsBdOperacion" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.get_listaEstatusCobranzaTableAdapter">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="intEstadoCobranza" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="width: 112px">
            <span style="font-size: 7pt">RANGO D�AS:</span></td>
        <td>
            <asp:TextBox ID="txtRangoDias" runat="server" Font-Size="7pt" Width="67px"></asp:TextBox></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="width: 112px">&nbsp;</td>
        <td>
            <asp:Button ID="btnContinuar" runat="server" Text="Continuar" Font-Size="9pt" OnClick="btnContinuar_Click" /></td>
      </tr>
    </table>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" style="height: 45px">
                <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesClienteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstCliente" DefaultValue="0" Name="intCliente" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ObjectDataSource7" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                    Width="221px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
                        <asp:TemplateField HeaderText="total" SortExpression="total">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("total")) %>'></asp:Label>
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="ObjectDataSource3" Font-Size="7pt" ForeColor="#333333" GridLines="None"
            Width="473px" AllowPaging="True" Visible="False" PageSize="5">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="Folio" HeaderText="Folio" ReadOnly="True" SortExpression="Folio" />
                <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Monto") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Monto")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Abono" SortExpression="Abono">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Abono") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Abono")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UnidadNegocio" HeaderText="UnidadNegocio" SortExpression="UnidadNegocio" ReadOnly="True" />
                <asp:BoundField DataField="Comision" HeaderText="Comision" ReadOnly="True" SortExpression="Comision" />
                <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                    <EditItemTemplate>
                        <asp:DropDownList ID="lstEstatusCobranza" runat="server" DataSourceID="odsBdOperacion2"
                DataTextField="estatusCobranza" DataValueField="idEstatusCobranza" Font-Size="7pt">
                        </asp:DropDownList><asp:ObjectDataSource ID="odsBdOperacion2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.get_listaEstatusCobranzaTableAdapter">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="intEstadoCobranza" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                            Font-Size="7pt" Text="Update" />&nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False"
                                CommandName="Cancel" Font-Size="7pt" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                            Font-Size="7pt" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.get_resumenCarteraTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtFolioFactura" DefaultValue="0" Name="intFolio"
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="lstCliente" DefaultValue="0" Name="intCliente" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="lstAgentes" DefaultValue="0" Name="intAgente" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="lstEstatusCobranza" DefaultValue="-1" Name="intEstatusCob"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtRangoDias" DefaultValue="0" Name="intRangoDias"
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top">
            </td>
        </tr>
    </table>
</asp:Content>

