<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Revisiones.aspx.cs" Inherits="Cotizador_OrderCapture" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" style="width: 512px; height: 256px">
        <tr>
            <td align="center" colspan="4" valign="middle">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Busqueda Cotizaciones"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px">
            </td>
            <td style="width: 191px">
                Cotizacion:</td>
            <td style="width: 177px">
                <asp:TextBox ID="txtCotizacion" runat="server"></asp:TextBox></td>
            <td style="width: 73px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 40px">
            </td>
            <td style="width: 191px; height: 40px">
                Agente:</td>
            <td style="width: 177px; height: 40px">
                <asp:DropDownList ID="lslAgente" runat="server" DataSourceID="ObjectDataSource1" DataTextField="NombreAgente" DataValueField="usuarioId">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_listaUsuariosActivosTableAdapter" >
                </asp:ObjectDataSource>
            </td>
            <td style="width: 73px; height: 40px">
                </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 66px;">
            </td>
            <td style="width: 191px; height: 66px;">
                Cliente:</td>
            <td style="width: 177px; height: 66px;">
                <asp:DropDownList ID="lslCliente" runat="server" DataSourceID="odsListaClientes" DataTextField="razonSocial" DataValueField="codigo">
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>&nbsp;
                <asp:ObjectDataSource ID="odsListaClientes" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaClientesActivosTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td style="width: 73px; height: 66px;">
                </td>
        </tr> 
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 26px;">
            </td>
            <td style="width: 191px; height: 26px;">
                Fecha:</td>
            <td colspan="2" style="height: 26px">
                <asp:TextBox ID="txtFecha" runat="server" Width="103px"></asp:TextBox>
                dd/mm/aaaa</td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 26px">
            </td>
            <td style="width: 191px; height: 26px">
                Documento:</td>
            <td colspan="2" style="height: 26px">
                <asp:TextBox ID="txtDocumento" runat="server" Width="170px"></asp:TextBox></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 38px; height: 28px">
            </td>
            <td style="width: 191px; height: 28px">
            </td>
            <td style="width: 177px; height: 28px">
                <asp:Button ID="Button1" runat="server" Text="continuar" OnClick="Button1_Click" /></td>
            <td style="width: 73px; height: 28px">
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="cotizadorTableAdapters.get_BusquedaCotizacionTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCotizacion" Name="vCotizacionId" PropertyName="Text"
                Type="Int32" DefaultValue="0" />
            <asp:ControlParameter ControlID="lslAgente" Name="vUsuarioId" PropertyName="SelectedValue"
                Type="Int32" DefaultValue="0" />
            <asp:ControlParameter ControlID="lslCliente" Name="vCodigoCliente" PropertyName="SelectedValue"
                Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="txtFecha" Name="vFecha" PropertyName="Text" Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="txtDocumento" Name="vDocumento" PropertyName="Text"
                Type="String" DefaultValue=" " />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="cotizacionId" DataSourceID="ObjectDataSource3" ForeColor="#333333"
        GridLines="None" Width="730px" AllowPaging="True" AllowSorting="True">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/RevisionDetalle.aspx?cotizacionId={0}"
                DataTextField="cotizacionId" HeaderText="cotizacion" />
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/RevisionDetalle.aspx?cotizacionId={0}"
                DataTextField="fechaCotizacion" HeaderText="Fecha" />
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/RevisionDetalle.aspx?cotizacionId={0}"
                DataTextField="nombreAgente" HeaderText="Agente" />
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/RevisionDetalle.aspx?cotizacionId={0}"
                DataTextField="estatusCotizacion" HeaderText="Estatus" />
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/RevisionDetalle.aspx?cotizacionId={0}"
                DataTextField="codigoCliente" HeaderText="Cliente" />
            <asp:HyperLinkField DataNavigateUrlFields="cotizacionId" DataNavigateUrlFormatString="~/Cotizador/RevisionDetalle.aspx?cotizacionId={0}"
                DataTextField="Documento" HeaderText="Documento" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
    </asp:GridView>
    &nbsp;
</asp:Content>

