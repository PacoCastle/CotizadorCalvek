<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reporteRemisionesDesarrollo.aspx.cs" Inherits="Cobranza_reporteRemisiones" Title="Reporte Remisiones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style type="text/css"> 
.TestCssStyle
    {
        /*color: #1f5ca9;
        background-color: #c5d4e6;
        table-layout: auto;
        border-collapse: separate;
        border-right: gray thin solid;
        border-top: gray thin solid;
        border-left: gray thin solid;
        border-bottom: gray thin solid;
        width:auto;*/

        text-align:left;
        font-weight:bold;
        font-size:x-large;
        padding: 2px; 
        background-color:silver; 
        border-collapse: separate;
        

    }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:UpdatePanel ID="pnlVistas" runat="server">
        <ContentTemplate>
            <span><strong>VISTA:</strong></span>
    <asp:RadioButtonList ID="rblVista" runat="server" OnSelectedIndexChanged="rblVista_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
        <asp:ListItem Selected="True" Value="1">General</asp:ListItem>
        <asp:ListItem Value="2">Detalles</asp:ListItem>
    </asp:RadioButtonList>
    <hr border-color: white; height: 1px; />
            <br />
    
    <asp:GridView ID="gvReporteRemisiones" runat="server" AutoGenerateColumns="False" Width="100%"
        DataSourceID="sdsReporteRemisionesRango" Font-Size="8pt" ForeColor="#333333" GridLines="None" 
        ShowFooter="True" onRowDataBound="gvReporteRemisiones_RowDataBound"
        caption='<table width="100%" class="TestCssStyle"><tr><td class="text_Title">REMISIONES - RANGO</td></tr></table>'>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="negociacion" ItemStyle-HorizontalAlign="Center" HeaderText="Negociacion" SortExpression="negociacion" />
            <asp:BoundField DataField="RANGO"  HeaderText="Rango" ItemStyle-HorizontalAlign="Center" SortExpression="RANGO" />
            <asp:BoundField DataField="SLP" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Left" HeaderText="SLP" ReadOnly="True" SortExpression="SLP_SA" />
            <%--<asp:BoundField DataField="SLP_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="SLP SA" ReadOnly="True" SortExpression="SLP_SA" />
            <asp:BoundField DataField="SLP_CC" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="SLP CC" ReadOnly="True" SortExpression="SLP_CC" />--%>
            <asp:BoundField DataField="QRO" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Left" HeaderText="QRO" ReadOnly="True" SortExpression="QRO_SA" />
            <%--<asp:BoundField DataField="QRO_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="QRO SA" ReadOnly="True" SortExpression="QRO_SA" />
            <asp:BoundField DataField="QRO_BJ" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="QRO BJ" ReadOnly="True" SortExpression="QRO_BJ" />--%>
            <asp:BoundField DataField="CEL" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Left" HeaderText="CEL" ReadOnly="True" SortExpression="CEL_SA" />
            <%--<asp:BoundField DataField="CEL_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="CEL SA" ReadOnly="True" SortExpression="CEL_SA" />
            <asp:BoundField DataField="CEL_BJ" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="CEL BJ" ReadOnly="True" SortExpression="CEL_BJ" />--%>
            <asp:BoundField DataField="IRA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Left" HeaderText="IRA" ReadOnly="True" SortExpression="IRA_SA" />
            <%--<asp:BoundField DataField="IRA_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="IRA SA" ReadOnly="True" SortExpression="IRA_SA" />
            <asp:BoundField DataField="IRA_BJ" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="IRA BJ" ReadOnly="True" SortExpression="IRA_BJ" />--%>
            <asp:BoundField DataField="TOTAL" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Left" HeaderText="TOTAL" ReadOnly="True" SortExpression="TOTAL" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    
             <asp:GridView ID="gvReporteRemisionesDetalle" runat="server" AutoGenerateColumns="False" BorderColor="#000099" 
                  DataSourceID="sdsPlazas"
                  Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowDataBound="gvReporteRemisionesAsesor_RowDataBound" 
                 ShowFooter="True" Visible="False"
                  caption='<table width="100%" class="TestCssStyle"><tr><td class="text_Title">REMISIONES - ASESOR / PRODUCTO</td></tr></table>'>
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <Columns>
                     <asp:TemplateField HeaderText="" SortExpression="oficina">
                         <EditItemTemplate>
                             <table style="width: 100%">
                                 <tr>
                                     <td style="width: 27%; height: 18px">
                                         <asp:Label ID="lblAgente0" runat="server" Text='<%# Eval("oficina") %>'></asp:Label>
                                     </td>
                                 </tr>
                             </table>
                             <asp:SqlDataSource ID="sdsRemisionesAsesorCliente0" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_datosRemisiones3" SelectCommandType="StoredProcedure">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="lblAgente" Name="AGENTE" PropertyName="Text" Type="String" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                             &nbsp;<asp:LinkButton ID="lnkCerrar0" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sdsRemisionesAsesorCliente0" ForeColor="Black" GridLines="Vertical">
                                 <RowStyle BackColor="#F7F7DE" />
                                 <Columns>
                                     <asp:BoundField DataField="folio" HeaderText="Folio" ItemStyle-HorizontalAlign="Center" SortExpression="folio" />
                                     <asp:BoundField DataField="cliente" HeaderText="Cliente" ItemStyle-HorizontalAlign="Center" SortExpression="cliente" />
                                     <asp:BoundField DataField="i_prod" HeaderText="Id Prod" ItemStyle-HorizontalAlign="Center" SortExpression="i_prod" />
                                     <asp:BoundField DataField="unidades" HeaderText="Unidades" ItemStyle-HorizontalAlign="Center" SortExpression="unidades" />
                                     <asp:BoundField DataField="REM_0_IVA" DataFormatString="$ {0:#,##0.00}" HeaderText="REM 0%" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="REM_0_IVA" />
                                     <asp:BoundField DataField="REM_16_IVA" DataFormatString="$ {0:#,##0.00}" HeaderText="REM 16%" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="REM_16_IVA" />
                                     <asp:BoundField DataField="VALE_VISTA_16_IVA" DataFormatString="$ {0:#,##0.00}" HeaderText="V.VISTA 16%" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="VALE_VISTA_16_IVA" />
                                     <asp:BoundField DataField="TOTAL" DataFormatString="$ {0:#,##0.00}" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="TOTAL" />
                                 </Columns>
                                 <FooterStyle BackColor="#CCCC99" />
                                 <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                 <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                 <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                 <AlternatingRowStyle BackColor="White" />
                             </asp:GridView>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <%-- <asp:LinkButton ID="lnkDetails" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='+'></asp:LinkButton><asp:Label ID="lblAgente" runat="server" Text='<%# Bind("AGENTE") %>'></asp:Label>--%>
                             <asp:LinkButton ID="lnkOficina" runat="server" CausesValidation="False" CommandName="Edit" Text='<%# Eval("oficina") %>'></asp:LinkButton>
                         </ItemTemplate>
                         <HeaderStyle Width="5%" />
                         <ItemStyle Width="5%" />
                     </asp:TemplateField>
                 </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             </asp:GridView>
             <asp:SqlDataSource ID="sdsPlazas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="select 
case oficina_nombre
	when 'Irapuato SA' then 'Irapuato'
	else oficina_nombre
End	as oficina
from oficinas
where oficinaId in (1,3,2,9)"></asp:SqlDataSource>
    
    </asp:Content>

