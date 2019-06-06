<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArchivoProductos.aspx.cs" Inherits="Catalogos_Productos_ArchivoProductos" Title="SICK - Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" style="width: 855px; height: 197px" frame="hsides">
        <tr>
            <td align="center" colspan="2" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Archivo Productos"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="1" style="height: 24px">
                <span style="font-size: 10pt">&nbsp; </span>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="1" style="text-align: center">
                &nbsp;&nbsp;
                <table border="1" frame="hsides" style="width: 758px">
                    <tr>
                        <td style="text-align: center">
                <table style="width: 653px; text-align: left;">
                    <tr>
                        <td colspan="3" style="text-align: left">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="10pt" Text="Actualizar Productos"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px; text-align: left">
                            <br />
                            <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Size="10pt" Text="Para actualizar productos. En una Hola de calculo (Excel o similar) coloque los campos necesarios con la información, sin títulos o encabezados. Guardar el archivo como: <br><b>CSV (delimitado por comas) (*.csv)</b>"></asp:Label><br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: left">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10pt" Text="Selecciona los campos a actualizar"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="width: 163px; text-align: left;">
                            <asp:CheckBoxList ID="cblCampos" runat="server" AutoPostBack="True" Font-Size="10pt"
                                OnSelectedIndexChanged="cblCampos_SelectedIndexChanged">
                                <asp:ListItem Value="1">DESCRIPCI&#211;N</asp:ListItem>
                                <asp:ListItem Value="2">PRECIO</asp:ListItem>
                                <asp:ListItem Value="3">MONEDA</asp:ListItem>
                                <asp:ListItem Value="4">TIEMPO ENTREGA</asp:ListItem>
                            </asp:CheckBoxList></td>
                        <td colspan="2" rowspan="2" style="text-align: left">
                            &nbsp;<asp:TextBox ID="txtMensaje" runat="server" BorderStyle="None" Font-Bold="True" Font-Size="10pt"
                                Height="93px" ReadOnly="True" Rows="4" TextMode="MultiLine" Width="453px"></asp:TextBox></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td rowspan="1" style="width: 163px; text-align: left">
                            Marca:</td>
                        <td colspan="2" rowspan="1" style="text-align: left">
                            <asp:DropDownList ID="lstMarcas" runat="server" DataSourceID="ObjectDataSource2"
                                DataTextField="marcaNombre" DataValueField="marcaId">
                            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaMarcasProductosTableAdapter">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <span style="font-size: 10pt">
                            </span>
                            <table style="width: 593px">
                                <tr>
                                    <td style="text-align: left">
                                        <asp:Label ID="lblEtiquetaSelecciona" runat="server" Font-Bold="True" Font-Size="10pt" Text="Selecciona el archivo con extensión txt o csv"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <asp:Label ID="lblArchivo" runat="server" Font-Size="10pt" Text="Archivo:"></asp:Label>
                                        <asp:FileUpload ID="fulArchivoProductos" runat="server" Width="366px" /><asp:Button ID="btnAgregaArchivo"
                                            runat="server" Font-Size="10pt" Height="21px" OnClick="btnAgregaArchivo_Click"
                                            Text="Agregar Archivo" Width="111px" /><br />
                                        <asp:Label ID="lblNombreArchivo" runat="server" Font-Size="10pt"></asp:Label>
                                        <asp:Label ID="lblMensajeArchivo" runat="server" Font-Size="10pt" Visible="False"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; height: 20px;">
                            <asp:Label ID="lblMensajeConfirmacion" runat="server" Font-Size="10pt"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="1">
                &nbsp;</td>
        </tr>
        <tr style="font-size: 12pt">
            <td colspan="2" rowspan="3">
                &nbsp;&nbsp;
                <asp:Button ID="btnContinuar" runat="server" Text="Continuar" Font-Size="10pt" OnClick="btnContinuar_Click" Visible="False" />
                <asp:Label ID="lblMensajeValidacion" runat="server" Font-Size="10pt" ForeColor="#CC0033"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
        </tr>
    </table>
    &nbsp;
    <table style="width: 786px">
        <tr>
            <td style="height: 33px">
            </td>
            <td style="height: 33px">
            </td>
            <td style="height: 33px">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;<asp:TextBox ID="txtRuta" runat="server" Width="50px" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtBanderaPrecio" runat="server" Width="13px" Visible="False">0</asp:TextBox>
                <asp:TextBox ID="txtBanderaDescripcion" runat="server" Width="13px" Visible="False">0</asp:TextBox>
                <asp:TextBox ID="txtBanderaMoneda" runat="server" Width="13px" Visible="False">0</asp:TextBox>
                <asp:TextBox ID="txtBanderaTE" runat="server" Width="13px" Visible="False">0</asp:TextBox><asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" Font-Size="10pt" ForeColor="#333333" GridLines="None" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                        <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                        <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                        <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                        <asp:BoundField DataField="moneda" HeaderText="moneda" SortExpression="moneda" />
                        <asp:BoundField DataField="TE" HeaderText="TE" SortExpression="TE" />
                        <asp:TemplateField HeaderText="Modelo_Archivo" SortExpression="Modelo_Archivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Modelo_Archivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Modelo_Archivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion_Archivo" SortExpression="Descripcion_Archivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Descripcion_Archivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Descripcion_Archivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio_Archivo" SortExpression="Precio_Archivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Precio_Archivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Precio_Archivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Moneda_Archivo" SortExpression="Moneda_Archivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Moneda_Archivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Moneda_Archivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TE_Archivo" SortExpression="TE_Archivo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TE_Archivo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TE_Archivo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_buscaproductosArchivoTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtRuta" Name="strRutaArchivo" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="lstMarcas" Name="intMarcaId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtBanderaDescripcion" Name="intCampDescripcion"
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtBanderaPrecio" Name="intCampPrecio" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtBanderaMoneda" Name="intCampMoneda" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtBanderaTE" Name="intCampTE" PropertyName="Text"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" Visible="False" /></td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

