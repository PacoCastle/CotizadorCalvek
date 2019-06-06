<%@ Page Language="C#" AutoEventWireup="true" CodeFile="caidaPolizas.aspx.cs" Inherits="Admin_Polizas_caidaPolizas" %>
<%@ PreviousPageType virtualPath="~/Admin/Polizas/busquedaPolizas.aspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sick - Polizas</title>
        <style type="text/css">
        .saltoPagina
        { 
           PAGE-BREAK-AFTER: always
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: tahoma">
        <asp:Label ID="lblSucursal" runat="server" Visible="False"></asp:Label><asp:Label
            ID="lblMes" runat="server" Visible="False"></asp:Label><asp:Label ID="lblCliente"
                runat="server" Visible="False"></asp:Label><asp:Label ID="lblFechaDe" runat="server"
                    Visible="False"></asp:Label><asp:Label ID="lblFechaA" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblTipoPoliza" runat="server" Visible="False"></asp:Label>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="odsPolizas" OnItemCreated = "DataList_ItemCreated">
            <ItemTemplate>
                <table style="width: 916px; height: 315px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="6" style="height: 14px">
                            <span style="font-size: 10pt">
                                <asp:Label ID="lblDirCalvek" runat="server" Font-Size="9pt" Text="Calvek, SA de CV, Carretera México Piedras Negras KM 426, Central de Maquinaria CP 78434, SLP,  CAL-980715-AA3"></asp:Label></span></td>
                        <td style="width: 65px; text-align: left; height: 14px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 14px">
                            <asp:Image ID="imgLogoCalvek" runat="server" Height="67px" ImageUrl="../../Imagenes/logoCalvek.jpg" /></td>
                        <td style="width: 245px; height: 14px;">
                        </td>
                        <td style="width: 5px; height: 14px;">
                        </td>
                        <td align="right" colspan="2" rowspan="1" valign="bottom">
                            <span style="font-size: 10pt">
                            </span>
                        </td>
                        <td rowspan="1" style="width: 65px" valign="bottom">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 16px">
                            <span style="font-size: 9pt">Cliente:</span></td>
                        <td colspan="3" style="height: 16px; text-align: left">
                            <asp:Label ID="id_clienteLabel" runat="server" Font-Size="9pt" Text='<%# Eval("id_cliente") %>'></asp:Label>&nbsp;
                            <asp:Label ID="clienteLabel" runat="server" Font-Size="9pt" Text='<%# Eval("cliente") %>'></asp:Label></td>
                        <td align="right" colspan="2" rowspan="2" valign="bottom">
                            <span style="font-size: 9pt">Tipo Poliza:<br />
                            <span>Numero Poliza:</span></span></td>
                        <td style="width: 65px;" align="left" rowspan="2" valign="bottom">
                            <asp:Label ID="tipoPolizaLabel" runat="server" Font-Size="9pt" Text='<%# Eval("tipoPoliza") %>'></asp:Label><br />
                            <asp:Label ID="polizaLabel" runat="server" Font-Size="9pt" Text='<%# Get_numeroPoliza(Eval("poliza").ToString()) %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 16px;">
                            <span style="font-size: 9pt">Fecha:</span></td>
                        <td style="width: 102px; text-align: left; height: 16px;">
                            <asp:Label ID="fechafLabel" runat="server" Font-Size="9pt" Text='<%# Eval("fechaf") %>'></asp:Label></td>
                        <td style="width: 245px; height: 16px;">
                        </td>
                        <td style="width: 5px; height: 16px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 16px;">
                            <span style="font-size: 9pt">Sucursal:</span></td>
                        <td style="width: 102px; text-align: left; height: 16px;">
                            <asp:Label ID="sucursalLabel" runat="server" Font-Size="9pt" Text='<%# Eval("sucursal") %>'></asp:Label></td>
                        <td style="width: 245px; height: 16px;">
                        </td>
                        <td style="width: 5px; height: 16px;">
                        </td>
                        <td style="width: 250px; height: 16px;">
                        </td>
                        <td style="width: 86px; height: 16px;">
                        </td>
                        <td style="width: 65px; height: 16px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 16px">
                            <span style="font-size: 9pt">Moneda:</span></td>
                        <td style="width: 102px; height: 16px; text-align: left">
                            <asp:Label ID="Label3" runat="server" Font-Size="9pt" Text='<%# Eval("moneda") %>'></asp:Label></td>
                        <td style="width: 245px; height: 16px; text-align: right">
                            <span style="font-size: 9pt">T.C.:</span></td>
                        <td style="width: 5px; height: 16px; text-align: left">
                            <asp:Label ID="Label4" runat="server" Font-Size="9pt" Text='<%# Eval("tc") %>'></asp:Label></td>
                        <td style="width: 250px; height: 16px">
                        </td>
                        <td style="width: 86px; height: 16px">
                        </td>
                        <td style="width: 65px; height: 16px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 9px">
                        </td>
                        <td colspan="5" style="height: 9px; text-align: center">
                            </td>
                        <td style="width: 65px; height: 9px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center; height: 19px;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="odsDetallePoliza"
                                Font-Size="8pt" GridLines="Horizontal" Height="147px" ShowFooter="True" Width="891px" Caption="POLIZA DE DIARIO" CaptionAlign="Top">
                                <RowStyle ForeColor="Black" />
                                <Columns>
                                    <asp:BoundField DataField="num_cta" HeaderText="Numero de Cuenta" SortExpression="num_cta">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cuenta" HeaderText="Nombre de la Cuenta" ReadOnly="True"
                                        SortExpression="cuenta">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="tipoFactura" HeaderText="Tipo Factura" ReadOnly="True"
                                        SortExpression="tipoFactura">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Factura" HeaderText="Factura" SortExpression="Factura">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Cargo" SortExpression="Cargo">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cargo") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblTotalCargo" runat="server" Font-Bold="True" Text="<%# Get_totalCargo() %>"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Get_CantidadCargo(Eval("Cargo").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Abono" SortExpression="Abono">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Abono") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblTotalAbono" runat="server" Font-Bold="True" Text="<%# Get_totalAbono() %>"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Get_CantidadAbono(Eval("Abono").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle ForeColor="#404040" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <HeaderStyle Font-Bold="True" ForeColor="DimGray" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="odsDetallePoliza" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_datosDetallePolizaTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="id_clienteLabel" Name="strIdCliente" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="sucursalLabel" Name="strSucursal" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="polizaLabel" Name="intPoliza" PropertyName="Text"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="fechafLabel" Name="strFecha" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="lblTipoPoliza" Name="strTipoPoliza" PropertyName="Text"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 19px;">
                        </td>
                        <td style="width: 102px; height: 19px;">
                        </td>
                        <td style="width: 245px; height: 19px;">
                        </td>
                        <td style="width: 5px; height: 19px;">
                        </td>
                        <td style="width: 250px; height: 19px;">
                        </td>
                        <td style="width: 86px; height: 19px;">
                        </td>
                        <td style="width: 65px; height: 19px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15px; height: 20px" rowspan="1">
                        </td>
                        <td style="width: 102px; height: 20px">
                            &nbsp;</td>
                        <td style="width: 245px; height: 20px">
                        </td>
                        <td style="width: 5px; height: 20px">
                            <asp:Label ID="lblctaxcobrar" runat="server" Font-Size="9pt" Text="CTAS X COBRAR"
                                Width="129px"></asp:Label><br />
                            <hr align="center" style="width: 127px; height: 1px" />
                            &nbsp;</td>
                        <td style="width: 250px; height: 20px">
                        </td>
                        <td style="width: 86px; height: 20px">
                            <asp:Label ID="lbletiContabilidad" runat="server" Font-Size="9pt" Text="CONTABILIDAD"></asp:Label><br />
                            <hr style="width: 127px; height: 1px" />
                            &nbsp;</td>
                        <td style="width: 65px; height: 20px">
                        </td>
                    </tr>
                </table>
                <br />
                <hr id="Hr1" />
                <asp:Label ID="lblSaltoPagina" runat="server"></asp:Label><asp:Panel ID="pnlSaltoLinea" runat="server" Height="19px" Width="127px">
                    <hr class="saltoPagina" style="width: 9px" />
                </asp:Panel>
            </ItemTemplate>
        </asp:DataList></div>
        <asp:ObjectDataSource ID="odsPolizas" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_listaPolizasBusquedaTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSucursal" DefaultValue="" Name="strSucursalId"
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblCliente" DefaultValue="" Name="strClienteId"
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblMes" DefaultValue="0" Name="intMes" PropertyName="Text"
                    Type="Int32" />
                <asp:ControlParameter ControlID="lblFechaDe" DefaultValue=" " Name="strFechaDe" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="lblFechaA" DefaultValue=" " Name="strFechaA" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="lblTipoPoliza" Name="strTipoPoliza" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
