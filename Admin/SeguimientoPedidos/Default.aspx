<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_SeguimientoPedidos_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
        SelectCommand="get_datosPartidaPedidoPendiente" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="strSerie" QueryStringField="serie" Type="String" />
            <asp:QueryStringParameter Name="intFolio" QueryStringField="folio" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" onrowcreated="GridView1_RowCreated" Font-Size="8pt">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="seriePedido" HeaderText="seriePedido" SortExpression="seriePedido" />
            <asp:BoundField DataField="folioPedido" HeaderText="folioPedido" SortExpression="folioPedido" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True"
                SortExpression="Descripcion" />
            <asp:BoundField DataField="pendientes" HeaderText="pendientes" SortExpression="pendientes" />
            <asp:BoundField DataField="acciones" HeaderText="acciones" SortExpression="acciones" />
            <asp:BoundField DataField="estatusPedidoPendienteId" HeaderText="estatusPedidoPendienteId"
                SortExpression="estatusPedidoPendienteId" />
            <asp:BoundField DataField="serieDocumento" HeaderText="serieDocumento" ReadOnly="True"
                SortExpression="serieDocumento" />
            <asp:BoundField DataField="folioDocumento" HeaderText="folioDocumento" SortExpression="folioDocumento" />
            <asp:BoundField DataField="fechaEntrega" HeaderText="fechaEntrega" ReadOnly="True"
                SortExpression="fechaEntrega" />
            <asp:BoundField DataField="comentario" HeaderText="comentario" ReadOnly="True" SortExpression="comentario" />
            <asp:BoundField DataField="QRO" HeaderText="QRO" ReadOnly="True" SortExpression="QRO" />
            <asp:BoundField DataField="SLP" HeaderText="SLP" ReadOnly="True" SortExpression="SLP" />
            <asp:BoundField DataField="CLY" HeaderText="CLY" ReadOnly="True" SortExpression="CLY" />
            <asp:TemplateField HeaderText="Instruccion" SortExpression="Instruccion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Instruccion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Instruccion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="banderaPedido" HeaderText="banderaPedido" SortExpression="banderaPedido" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
</asp:Content>

