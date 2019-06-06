<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="busquedaFacturasCarteras.aspx.cs" Inherits="Admin_ControlCartera_busquedaFacturasCarteras" Title="CUENTAS X COBRAR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" width="800">
        <tr>
            <td align="center" colspan="2" style="height: 87px">
                <strong>CONTROL DE FACTURACION Y CARTERA</strong></td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <asp:Label ID="lblReloj" runat="server" Font-Size="8pt"></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="#FF3333"
                    Text="*Cifras en Miles de Pesos MN."></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 14px; width: 394px;">
                <strong><span style="font-size: 10pt">Búsqueda</span></strong></td>
            <td rowspan="5" valign="top" style="width: 479px">
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
                          Width="250px" >
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <Columns>
                              <asp:BoundField DataField="concepto" HeaderText="Estatus" SortExpression="concepto" />
                              <asp:HyperLinkField DataNavigateUrlFields="cidconce01,concepto" DataNavigateUrlFormatString="~/Admin/ControlCartera/formularioDetalleCartera.aspx?concepto={0}&amp;conceptoText={1}"
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
                              <asp:TemplateField HeaderText="Ira" SortExpression="Ira">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("Ira") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Ira")) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                                  <HeaderStyle HorizontalAlign="Left" />
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
                          Width="479px" onRowDataBound="GridView6_RowDataBound">
                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                          <Columns>
                              <asp:BoundField DataField="concepto" HeaderText="Moroso" ReadOnly="True" SortExpression="concepto" />
                              <asp:TemplateField HeaderText="Cel" SortExpression="Cly">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cly") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Cly")) %>'></asp:Label>
                                      <asp:HyperLink ID="lnkCtoCly" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Cly_cto").ToString())) %>'></asp:HyperLink>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Qro" SortExpression="Qro">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("Qro") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Qro")) %>'></asp:Label>
                                      <asp:HyperLink ID="lnkCtoQro" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Qro_cto").ToString())) %>'></asp:HyperLink>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Slp" SortExpression="Slp">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("Slp") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Slp")) %>'></asp:Label>
                                      <asp:HyperLink ID="lnkCtoSlp" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Slp_cto").ToString())) %>'></asp:HyperLink>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Ira" SortExpression="Ira">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# Eval("Ira") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Ira")) %>'></asp:Label>
                                      <asp:HyperLink ID="lnkCtoIra" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Ira_cto").ToString())) %>'></asp:HyperLink>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Right" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Auto" SortExpression="Auto">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("Auto") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# String.Format("${0:#,##0}", Eval("Auto")) %>'></asp:Label>
                                      <asp:HyperLink ID="lnkCtoAuto" runat="server" Font-Size="7pt" ForeColor="Gray" Text='<%# get_formatoCantidad(Int32.Parse(Eval("Auto_cto").ToString())) %>'></asp:HyperLink>
                                  </ItemTemplate>
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
                              <asp:BoundField DataField="rangoId" HeaderText="rangoId" SortExpression="rangoId"
                                  Visible="False" />
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
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" style="height: 134px; width: 394px;">
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
                DataTextField="nombreAgente" DataValueField="nombreAgente" Font-Size="7pt" Width="220px">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_agenteEstadoCobranzaTableAdapter">
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
            <span style="font-size: 7pt">RANGO DÍAS:</span></td>
        <td><asp:DropDownList ID="listRangoDias" runat="server" DataSourceID="ObjectDataSource10"
                DataTextField="descripcion" DataValueField="rangoId" Font-Size="7pt">
        </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.get_listaRangosCobranzaTableAdapter">
        </asp:ObjectDataSource>
        </td>
      </tr>
      <tr>
        <td style="height: 22px">&nbsp;</td>
        <td style="width: 112px; height: 22px;">
            <asp:Button ID="btnEdoCuenta" runat="server" Font-Size="9pt" Height="19px" OnClick="btnEdoCuenta_Click"
                Text="ESTADO DE CUENTA" Visible="False" Width="128px" /></td>
        <td style="height: 22px">
            <asp:Button ID="btnContinuar" runat="server" Text="Continuar" Font-Size="9pt" OnClick="btnContinuar_Click" /></td>
      </tr>
    </table>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" style="height: 128px; width: 394px;">
                <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.sp_ListadoPendientesClienteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstCliente" Name="strCliente" PropertyName="SelectedValue"
                            Type="String" Size="20" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ObjectDataSource7" Font-Size="7pt" ForeColor="#333333" GridLines="None"
                    Width="221px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
                        <asp:BoundField DataField="Total" HeaderText="Total" />
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
            <td valign="top" style="width: 394px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="ObjectDataSource3" Font-Size="7pt" ForeColor="#333333" GridLines="None"
            Width="473px" Visible="False" PageSize="7" onrowupdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Folio" SortExpression="Folio">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Folio") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Folio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Monto") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Monto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Abono" SortExpression="Abono">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Abono") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Abono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnidadNegocio" SortExpression="UnidadNegocio">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("UnidadNegocio") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("UnidadNegocio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comision" SortExpression="Comision">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Comision") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Comision") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="D&#237;as" SortExpression="D&#237;as">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Días") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Días") %>'></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    SelectCommand="select --rtrim(ltrim(ccc.sucursal)) as Serie,&#13;&#10; --left(id_kepler,5) as Serie,&#13;&#10;convert(varchar(9),ccc.tp_folio) as Folio,&#13;&#10;round(sum(ccc.importe_pm),2) as Monto,&#13;&#10;isnull(round(sum(ccc.abono_pm_consol),2),0) as Abono,&#13;&#10;--ccc.cd_estatus as idEstatus,&#13;&#10;--replace(replace(replace(replace(replace(ccc.tp_unidadnegocio,'CELAYA','CEL'),'(Ninguna)','---'),'San Luis','SLP'),'Automatizacion','AUT'),'QUERETARO','QRO') as UnidadNegocio,&#13;&#10;ccc.tp_unidadnegocio as UnidadNegocio,&#13;&#10;'+++' AS Comision,&#13;&#10;tec.NB_ESTATUSCOB as Estatus,&#13;&#10;--id_kepler as id_kepler,&#13;&#10;r.descripcion as 'Días'&#13;&#10;from BD_OPERACION2009.DBO.th_facturas2010 ccc,&#13;&#10;BD_OPERACION2009.DBO.TD_estatusCobranza tec,&#13;&#10;BD_OPERACION2009.dbo.TC_RANGOS r&#13;&#10;where ISNUMERIC(ccc.tc_rango)=1&#13;&#10;and (@intFolio = '' or ccc.tp_folio = @intFolio)&#13;&#10;and (@intCliente = '' or ccc.id_cte = @intCliente)&#13;&#10;and (@intAgente = '' or ccc.cve_agente = @intAgente)&#13;&#10;and (@intEstatusCob = -1 or ccc.cd_estatus = @intEstatusCob)&#13;&#10;and (@intRangoDias=0 or ccc.tc_rango = @intRangoDias)&#13;&#10;and ccc.cd_estatus = tec.CD_ESTATUSCOB&#13;&#10;and ccc.tc_rango = r.rangoId&#13;&#10;and (substring(ccc.ID_KEPLER,1,4) like 'UD20%' or substring(ccc.ID_KEPLER,1,4) like 'UD5%' or&#13;&#10;&#9;&#9;substring(ccc.ID_KEPLER,1,4) like 'UD6%' or substring(ccc.ID_KEPLER,1,4) like 'UD7%') &#13;&#10;&#9;and ccc.id_cte not in ('9995','9996','9997','0526')&#13;&#10;&#9;and ccc.estatus_doc not in ('C')&#13;&#10;group by ccc.tp_folio,&#13;&#10;      ccc.sucursal,&#13;&#10;      ccc.cd_estatus,&#13;&#10;      ccc.tp_unidadnegocio,&#13;&#10;      tec.NB_ESTATUSCOB,&#13;&#10;      ccc.id_kepler,&#13;&#10;      r.descripcion&#13;&#10;"
                    UpdateCommand="update TH_ABONOS2009 set cd_estatus=@idEstatus&#13;&#10;where ltrim(rtrim(tp_serie)) = ltrim(rtrim(@Serie))&#13;&#10;and tp_folio = @Folio&#13;&#10;or id_admin=@id_admin&#13;&#10;&#13;&#10;" EnableViewState="False" OnSelecting="SqlDataSource1_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioFactura" DefaultValue="0" Name="intFolio" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lstCliente" DefaultValue="0" Name="intCliente" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="lstAgentes" Name="intAgente" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="lstEstatusCobranza" DefaultValue="-1" Name="intEstatusCob" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="listRangoDias" DefaultValue="0" Name="intRangoDias" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idEstatus" />
                        <asp:Parameter Name="Serie" DefaultValue=" " />
                        <asp:Parameter Name="Folio" />
                        <asp:Parameter Name="id_admin" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="BDOPERACION2009TableAdapters.get_resumenCarteraTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioFactura" DefaultValue="0" Name="intFolio"
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="lstCliente" Name="intCliente" PropertyName="SelectedValue"
                            Type="String" Size="20" DefaultValue="" />
                        <asp:ControlParameter ControlID="lstAgentes" Name="intAgente" PropertyName="SelectedValue"
                            Type="String" Size="20" />
                        <asp:ControlParameter ControlID="lstEstatusCobranza" DefaultValue="-1" Name="intEstatusCob"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="listRangoDias" DefaultValue="0" Name="intRangoDias"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top" style="width: 394px">
            </td>
        </tr>
    </table>
</asp:Content>

