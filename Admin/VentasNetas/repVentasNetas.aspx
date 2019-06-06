<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="repVentasNetas.aspx.cs" Inherits="Admin_VentasNetas_repVentasNetas" Title="Ventas Netas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <script type="text/javascript">
    /* <![CDATA[ */
    $(function() {
    
    var arrayMes = new Object();
 
    arrayMes[1] = 'ENERO';
    arrayMes[2] = 'FEBRERO';
    arrayMes[3] = 'MARZO';
    arrayMes[4] = 'ABRIL';
    arrayMes[5] = 'MAYO';
    arrayMes[6] = 'JUNIO';
    arrayMes[7] = 'JULIO';
    arrayMes[8] = 'AGOSTO';
    arrayMes[9] = 'SEPTIEMBRE';
    arrayMes[10] = 'OCTUBRE';
    arrayMes[11] = 'NOVIEMBRE';
    arrayMes[12] = 'DICIEMBRE';
    
        /** This code runs when everything has been loaded on the page */
        /* Inline sparklines take their values from the contents of the tag */
        $('.inlinesparkline').sparkline('html',{type: 'line',width: '70', tooltipPrefix: 'Importe: ',spotRadius: 2.0 });
       
        $('.inlinesparkline').bind('sparklineClick', function(ev) {
            var sparkline = ev.sparklines[0],
                region = sparkline.getCurrentRegionFields();

            var nuevo_numero = new oNumero(region.y);

            jAlert(arrayMes[region.x]+ "\nImporte: " +nuevo_numero.formato(2, true), 'Ventas Netas');
       
        });

    });
    /* ]]> */
    </script>
    
    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Gray"
        Visible="False">9</asp:Label><br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True"
            Font-Size="9pt" ForeColor="Gray">Año:</asp:Label><asp:Label ID="lblAno" runat="server"
                Font-Bold="True" Font-Size="9pt" ForeColor="Gray">2012</asp:Label><br />
    <asp:Label ID="Label4"
                    runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Gray">Mes:</asp:Label><asp:DropDownList
                        ID="lstMes" runat="server" AutoPostBack="True" DataSourceID="odsMeses" DataTextField="Texto"
                        DataValueField="mesId" Font-Size="9pt" OnSelectedIndexChanged="lstMes_SelectedIndexChanged1">
                    </asp:DropDownList><asp:ObjectDataSource ID="odsMeses" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="catalogosTableAdapters.get_listaMesesTableAdapter">
    </asp:ObjectDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" Font-Size="9pt" ForeColor="#333333"
        GridLines="None" AutoGenerateColumns="False" DataSourceID="odsVentasNetas" DataKeyNames="idagente">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="unidad_negocio" HeaderText="Oficina" ReadOnly="True" SortExpression="unidad_negocio">
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="idagente" HeaderText="idagente" SortExpression="idagente" />
            <asp:BoundField DataField="agente" HeaderText="Agente" ReadOnly="True" SortExpression="agente">
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="ventasnetas" HeaderText="Ventas Netas" ReadOnly="True"
                SortExpression="ventasnetas" DataFormatString="{0:C2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="meta" HeaderText="Meta" ReadOnly="True" SortExpression="meta">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="logro" HeaderText="Logro" ReadOnly="True" SortExpression="logro">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Tendencia">
                <ItemTemplate>
                    <asp:Label ID="lblIdAgente" runat="server" Text='<%# Eval("idagente") %>' Visible="False"></asp:Label><br />
                        <asp:ObjectDataSource ID="odsVentasNetasTendencia" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_datosVentasNetasDetalleTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblAno" Name="a&#241;o" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="lblIdAgente" Name="idagente" PropertyName="Text"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        
                        <span class="inlinesparkline">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsVentasNetasTendencia">
                    	        <itemtemplate>,<%# DataBinder.Eval(Container.DataItem, "MES") %>:<%# DataBinder.Eval(Container.DataItem, "VENTASNETAS") %></itemtemplate>
                            </asp:Repeater>
                        </span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsVentasNetas" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AdministracionTableAdapters.get_datosVentasNetasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblAno" Name="a&#241;o" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="lstMes" Name="mes" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

