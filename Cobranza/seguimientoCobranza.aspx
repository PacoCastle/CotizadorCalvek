<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="seguimientoCobranza.aspx.cs" Inherits="Cobranza_seguimientoCobranza" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 807px">
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odsRangosCobranza" Font-Size="8pt" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="unidadNegocio" HeaderText="Unidad Negocio" ReadOnly="True"
                            SortExpression="unidadNegocio" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=1-30 DIAS"
                            DataTextField="1-30 DIAS" HeaderText="1-30 DIAS" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=31-45 DIAS"
                            DataTextField="31-45 DIAS" HeaderText="31-45 DIAS" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=46-60 DIAS"
                            DataTextField="46-60 DIAS" HeaderText="46-60 DIAS" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=61-90 DIAS"
                            DataTextField="61-90 DIAS" HeaderText="61-90 DIAS" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=91-120 DIAS"
                            DataTextField="91-120 DIAS" HeaderText="91-120 DIAS" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=121-150 DIAS"
                            DataTextField="121-150 DIAS" HeaderText="121-150 DIAS" />
                        <asp:HyperLinkField DataNavigateUrlFields="unidadNegocio" DataNavigateUrlFormatString="~/Cobranza/seguimientoCobranza.aspx?unidadNegocio={0}&amp;rango=&gt;150 DIAS"
                            DataTextField="&gt;150 DIAS" HeaderText="&gt;150 DIAS" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsRangosCobranza" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_tablaCobranzaRangosTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td>
                <span style="font-size: 8pt"></span>
                <table style="width: 131px">
                    <tr>
                        <td>
                            <span style="font-size: 8pt">Sucursal:</span></td>
                        <td>
                            <asp:DropDownList ID="lstSucursal" runat="server">
                                <asp:ListItem>--</asp:ListItem>
                                <asp:ListItem>Automatizacion</asp:ListItem>
                                <asp:ListItem>Celaya</asp:ListItem>
                                <asp:ListItem>Queretaro</asp:ListItem>
                                <asp:ListItem>San Luis</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <span style="font-size: 8pt">Agente:</span></td>
                        <td>
                            <asp:DropDownList ID="lstAgente" runat="server" AppendDataBoundItems="True" DataSourceID="odsListaAgentesCobranza"
                                DataTextField="Agente" DataValueField="Agente">
                                <asp:ListItem>--</asp:ListItem>
                            </asp:DropDownList><asp:ObjectDataSource ID="odsListaAgentesCobranza" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="cobranzaTableAdapters.get_listaAgentesCobranzaSeguimientoTableAdapter">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="sdslistadoCobranzaRangos" Font-Size="8pt" ForeColor="#333333" GridLines="None" onrowcommand="gvCobranza_rowCommand" DataKeyNames="sucursal,claveCliente,Folio">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="Folio" SortExpression="Folio">
                            <EditItemTemplate>
                                &nbsp;<asp:Label ID="Label15" runat="server" Text='<%# Bind("Folio") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Folio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente" ReadOnly="True" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" ReadOnly="True" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                        <asp:BoundField DataField="rangoDias" HeaderText="rangoDias" ReadOnly="True" SortExpression="rangoDias" />
                        <asp:TemplateField HeaderText="Recepci&#243;n">
                            <EditItemTemplate>
                                <asp:CheckBox ID="Recepcion" runat="server" Checked='<%# Bind("bndRecepcion") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Recepcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Revisi&#243;n">
                            <EditItemTemplate>
                                <asp:CheckBox ID="Revision" runat="server" Checked='<%# Bind("bndRevision") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Revision") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Completo">
                            <EditItemTemplate>
                                <asp:CheckBox ID="Completo" runat="server" Checked='<%# Bind("bndCompleto") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("Completo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" CausesValidation="True"
                                    CommandName="Actualizar" Font-Size="7pt" Text="Actualizar" />&nbsp;<asp:Button ID="Button2"
                                        runat="server" BorderStyle="None" CausesValidation="False" CommandName="Cancel"
                                        Font-Size="7pt" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" BorderStyle="None" CausesValidation="False"
                                    CommandName="Edit" Font-Size="7pt" Text="Editar" />
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
                <asp:SqlDataSource ID="sdslistadoCobranzaRangos" runat="server" ConnectionString="<%$ ConnectionStrings:BDOPERACION2009 %>"
                    SelectCommand="get_listadoCobranzaRangos" SelectCommandType="StoredProcedure" UpdateCommand="set_insertaCobrazaSeguimiento" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="strRango" QueryStringField="rango" Type="String" />
                        <asp:QueryStringParameter Name="strUnidadNegocio" QueryStringField="unidadNegocio"
                            Type="String" />
                        <asp:Parameter DefaultValue=" " Name="strAgente" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="strUnidadNegocio" Type="String" />
                        <asp:Parameter Name="strIdCte" Type="String" />
                        <asp:Parameter Name="strFolio" Type="String" />
                        <asp:Parameter Name="bitRecepcion" Type="Boolean" />
                        <asp:Parameter Name="bitRevision" Type="Boolean" />
                        <asp:Parameter Name="bitCompleto" Type="Boolean" />
                        <asp:Parameter Name="intUsuarioId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
    </table>
</asp:Content>

