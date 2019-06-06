<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reporteRemisiones.aspx.cs" Inherits="Cobranza_reporteRemisiones" Title="Reporte Remisiones" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <style type="text/css"> 
.TestCssStyle
    {
        text-align:left;
        font-weight:bold;
        font-size:x-large;
        padding: 2px; 
        background-color:silver; 
        border-collapse: separate;       

    }
        </style>
    
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        var limit = 299;
        function endReq(sender, args) {
            $('textarea[id$=txtComentarios]').keyup(function () {
                var len = $(this).val().length;
                if (len > limit) {
                    this.value = this.value.substring(0, limit);
                }
                $('#charLeft').text(limit - len + " characters left");
            });
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="pnlVistas" runat="server">
        <ContentTemplate>
            <TABLE border="0" cellpadding="0" cellspacing="10"> 
                <TR>
                    <TD  width="25%">
                        <span>
                            <strong>
                            VISTA:<br />
                        <asp:RadioButtonList ID="rblVista" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblVista_SelectedIndexChanged" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">General</asp:ListItem>
                            <asp:ListItem Value="2">Detalles</asp:ListItem>
                        </asp:RadioButtonList>
                        </strong></span>
                    </TD> 
                     
                     <TD width="10%">
                        
                         
                        
                    </TD> 
                    <TD width="30%">
                        <span>
                            <strong>
                            BUSQUEDA:<br />
                        Cliente:<asp:TextBox ID="txtParametro" runat="server"></asp:TextBox>&nbsp;
                            <asp:RadioButtonList ID="rblTipoBusqCliente" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="1">Cliente</asp:ListItem>
                                <asp:ListItem Value="2">Descripcion</asp:ListItem>
                        </asp:RadioButtonList>
                        Folio:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtFolio" runat="server"></asp:TextBox>
                            </strong></span>
                    </TD>
                    <TD >
                        
                         <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/Imagenes/Search (3).ico" OnClick="btnBuscar_Click" />
                        
                    </TD> 
                </TR> 
            </TABLE> 
            
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
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
        <Columns>
            <asp:BoundField DataField="negociacion" ItemStyle-HorizontalAlign="Center" HeaderText="Negociacion" SortExpression="negociacion" HeaderStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="RANGO"  HeaderText="Rango" ItemStyle-HorizontalAlign="Center" SortExpression="RANGO" HeaderStyle-HorizontalAlign="Right"/>
            <asp:BoundField DataField="SLP" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="SLP" ReadOnly="True" SortExpression="SLP_SA" HeaderStyle-HorizontalAlign="Right"/>
            <%--<asp:BoundField DataField="SLP_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="SLP SA" ReadOnly="True" SortExpression="SLP_SA" />
            <asp:BoundField DataField="SLP_CC" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="SLP CC" ReadOnly="True" SortExpression="SLP_CC" />--%>
            <asp:BoundField DataField="QRO" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="QRO" ReadOnly="True" SortExpression="QRO_SA" HeaderStyle-HorizontalAlign="Right"/>
            <%--<asp:BoundField DataField="QRO_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="QRO SA" ReadOnly="True" SortExpression="QRO_SA" />
            <asp:BoundField DataField="QRO_BJ" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="QRO BJ" ReadOnly="True" SortExpression="QRO_BJ" />--%>
            <asp:BoundField DataField="CEL" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="CEL" ReadOnly="True" SortExpression="CEL_SA" HeaderStyle-HorizontalAlign="Right"/>
            <%--<asp:BoundField DataField="CEL_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="CEL SA" ReadOnly="True" SortExpression="CEL_SA" />
            <asp:BoundField DataField="CEL_BJ" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="CEL BJ" ReadOnly="True" SortExpression="CEL_BJ" />--%>
            <asp:BoundField DataField="IRA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="IRA" ReadOnly="True" SortExpression="IRA_SA" HeaderStyle-HorizontalAlign="Right"/>
            <%--<asp:BoundField DataField="IRA_SA" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="IRA SA" ReadOnly="True" SortExpression="IRA_SA" />
            <asp:BoundField DataField="IRA_BJ" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="IRA BJ" ReadOnly="True" SortExpression="IRA_BJ" />--%>
            <asp:BoundField DataField="TOTAL" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="TOTAL" ReadOnly="True" SortExpression="TOTAL" HeaderStyle-HorizontalAlign="Right"/>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsReporteRemisionesRango" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesRango" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
             <asp:GridView ID="gvReporteRemisionesDetalle" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;PLAZA&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsPlazas" Font-Size="8pt" ForeColor="#333333" GridLines="None" ShowFooter="True" Visible="False" OnRowDataBound="gvReporteRemisionesDetalle_RowDataBound" style="margin-bottom: 0px" >
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="Red" HorizontalAlign="Right" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <Columns>
                     <asp:TemplateField HeaderText="" SortExpression="oficina">
                         <EditItemTemplate>
                             <table style="width: 100%">
                                 <tr>
                                     <td style="width: 27%; height: 18px">
                                         <asp:Label ID="lblPlaza" runat="server" Text='<%# Eval("oficina") %>'></asp:Label>
                                         <asp:Label ID="lblPlazaId" runat="server" Text='<%# Eval("oficinaId") %>' Visible="false"></asp:Label>
                                         <br />
                                         <asp:LinkButton ID="lnkCerrar0" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                                         <asp:GridView ID="gvReporteRemisionesAsesor0" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;ASESOR&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesXPlaza" Font-Size="8pt" ForeColor="#333333" GridLines="None" ShowFooter="True" OnRowDataBound="gvReporteRemisionesAsesor0_RowDataBound">
                                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                             <Columns>
                                                 <asp:TemplateField HeaderText="AGENTE" SortExpression="AGENTE">
                                                     <EditItemTemplate>
                                                         <table style="width: 100%">
                                                             <tr>
                                                                 <td style="width: 27%; height: 18px">
                                                                     <asp:Label ID="lblAgente" runat="server" Text='<%# Eval("AGENTE") %>'></asp:Label>
                                                                     <br />
                                                                     <asp:LinkButton ID="lnkCerrar1" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         <asp:GridView ID="gvReporteRemisionesAsesor" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;CLIENTE&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesXAsesor" Font-Size="8pt" ForeColor="#333333" GridLines="None" ShowFooter="True" OnRowDataBound="gvReporteRemisionesAsesor_RowDataBound" >
                                                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                             <Columns>
                                                                 <asp:TemplateField HeaderText="CLIENTE" SortExpression="CLIENTE">
                                                                     <EditItemTemplate>
                                                                         <table style="width: 100%">
                                                                             <tr>
                                                                                 <td style="width: 27%; height: 18px">
                                                                                     <asp:Label ID="lblCliente" runat="server" Text='<%# Eval("NB_CLIENTE") %>'></asp:Label>
                                                                                     <asp:Label ID="lblClienteId" runat="server" Text='<%# Eval("CD_CLIENTE") %>' Visible="False"></asp:Label>
                                                                                 </td>
                                                                             </tr>
                                                                         </table>
                                                                         &nbsp;<asp:LinkButton ID="lnkCerrar2" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                                                                         <br />
                                                                         <asp:SqlDataSource ID="sdsReporteRemisionesCliente" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesCliente" SelectCommandType="StoredProcedure" UpdateCommand="print ''">
                                                                             <SelectParameters>
                                                                                 <asp:ControlParameter ControlID="lblClienteId" Name="CD_CLIENTE" PropertyName="Text" Type="String" />
                                                                                 <asp:ControlParameter ControlID="lblAgente" Name="AGENTE" PropertyName="Text" Type="String" />
                                                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                                                             </SelectParameters>
                                                                         </asp:SqlDataSource>
                                                                         <asp:GridView ID="gvReporteRemisionesCliente" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sdsReporteRemisionesCliente" 
                                                                             ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gvReporteRemisionesCliente_SelectedIndexChanged" OnRowDataBound="gvReporteRemisionesCliente_RowDataBound" OnRowCommand="gvReporteRemisionesCliente_RowCommand" 
                                                                             DataKeyNames="CD_SUCURSAL,CD_FOLIO,CD_PRODUCTO,NU_PARTIDA,CD_AGENTE,NB_AGENTE" ShowFooter="True">
                                                                             <RowStyle BackColor="#F7F7DE" />
                                                                             <FooterStyle BackColor="#5D7B9D" HorizontalAlign="Right" />
                                                                             <Columns>
                                                                                 <asp:BoundField DataField="CD_SUCURSAL" HeaderText="Suc" SortExpression="CD_SUCURSAL" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="CD_FOLIO" HeaderText="Folio" SortExpression="CD_FOLIO" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="FH_FECHA" HeaderText="Fecha" ReadOnly="True" SortExpression="FH_FECHA" />
                                                                                 <asp:BoundField DataField="CD_PRODUCTO" HeaderText="Producto" SortExpression="CD_PRODUCTO" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="NB_PRODUCTO" HeaderText="Descripcion" SortExpression="NB_PRODUCTO" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="NU_UNIDADES" HeaderText="Unidades" SortExpression="NU_UNIDADES" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="NU_PENDIENTES" HeaderText="Pendientes" SortExpression="NU_PENDIENTES" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="CD_FOLIO_ANT" HeaderText="Folio Ped" SortExpression="CD_FOLIO_ANT" ReadOnly="true"/>
                                                                                 <asp:BoundField DataField="NB_MOVIMIENTO" HeaderText="MOV" SortExpression="NB_MOVIMIENTO" ReadOnly="true"/>
                                                                                 <%--<asp:BoundField DataField="NU_PARTIDA" HeaderText="Partida" SortExpression="NU_PARTIDA" ReadOnly="true" Visible="false"/>--%>
                                                                                 <asp:TemplateField HeaderText="TOTAL"  HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                                                                     <ItemTemplate>
                                                                                         <asp:Label ID="lblTOTAL_CLIENTE" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_CLIENTE"))  %>' ></asp:Label>
                                                                                     </ItemTemplate>
                                                                                     <FooterTemplate >
                                                                                         <asp:Label ID="lblTOTAL_CLIENTE" runat="server" ></asp:Label>
                                                                                     </FooterTemplate>
                                                                                     <FooterStyle HorizontalAlign="Right" />
                                                                                     <HeaderStyle HorizontalAlign="Right" />
                                                                                     <ItemStyle HorizontalAlign="Right" />
                                                                                 </asp:TemplateField>
                                                                                 <asp:BoundField DataField="CD_MONEDA" HeaderText="Moneda" SortExpression="CD_MONEDA" ReadOnly="true"/>
                                                                                 <asp:TemplateField HeaderText="Estatus" >
                                                                                        <ItemTemplate>
                                                                                            <%--<asp:Button ID="btnModalComentarios" runat="server" CausesValidation="False" CommandName="Select"
                                                                                             Text="√" Font-Size="9pt" Height="21px" Width="27px" />--%>
                                                                                            <asp:LinkButton ID="lnkEstatus" runat="server" CausesValidation="False" CommandName="Select"  Text='<%# Eval("NB_ESTATUS") %>'></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                        <EditItemTemplate>
                                                                                            Accion<br />
                                                                                            <asp:DropDownList ID="lstEstatus" runat="server" DataSourceID="sdsEstatus" DataTextField="NB_ESTATUS" DataValueField="CD_ESTATUS" Font-Size="Small" OnSelectedIndexChanged="lstEstatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                                            <br />
                                                                                            <asp:SqlDataSource ID="sdsEstatus" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_RemisionesEstatus" SelectCommandType="StoredProcedure">
                                                                                                <SelectParameters>
                                                                                                    <asp:SessionParameter Name="CD_USUARIO" SessionField="usuarioID" Type="Int32" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                            <br />
                                                                                            <%--Instruccion Auditor<br />
                                                                                            <asp:DropDownList ID="lstAccionAuditor" runat="server" DataSourceID="sdsAccionAuditor" DataTextField="NB_ACCION_AUDITOR" DataValueField="CD_ACCION_AUDITOR" Font-Size="Medium"></asp:DropDownList>
                                                                                            <br />
                                                                                            <asp:SqlDataSource ID="sdsAccionAuditor" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_CatAccionesAuditor" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                                            <br />--%>
                                                                                            Fecha limite<br />&nbsp;<asp:TextBox ID="txtFecha" runat="server" Text='<%# Eval("FH_PLAZO") %>' AutoPostBack="True" CssClass="date-pick" Font-Size="10pt" ToolTip="Día/Mes/Año" ValidationGroup="Actualiza" Width="85px" Enabled="false">

                                                                                                                    </asp:TextBox>
                                                                                            <asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" OnServerValidate="txtFechaValidation" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                                                                                            
                                                                                            <br />
                                                                                            &nbsp;Comentarios<br />
                                                                                            <asp:TextBox ID="txtComentarios" runat="server" MaxLength="299" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                                                                                        </EditItemTemplate>
                                                                                 </asp:TemplateField>
                                                                                 <asp:TemplateField ShowHeader="False">
                                                                                        <EditItemTemplate>
                                                                                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True" ValidationGroup="Actualizar"
                                                                                                CommandName="Update" Font-Size="8pt" Text="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />&nbsp;
                                                                                            <asp:Button ID="Button2" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                                                                                CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                                                                                        </EditItemTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:Button ID="Button1" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                                                                                CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                                                                                        </ItemTemplate>
                                                                                 </asp:TemplateField>
                                                                             </Columns>
                                                                             <FooterStyle BackColor="#CCCC99"/>
                                                                             <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                                             <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                                             <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                                             <AlternatingRowStyle BackColor="White" />
                                                                         </asp:GridView>
                                                                     </EditItemTemplate>
                                                                     <ItemTemplate>
                                                                         <asp:LinkButton ID="lnkCliente" runat="server" CausesValidation="False" CommandName="Edit" Text='<%# Eval("CD_CLIENTE") %>'></asp:LinkButton>
                                                                     </ItemTemplate>
                                                                     <HeaderStyle Width="5%" />
                                                                     <ItemStyle Width="5%" />
                                                                 </asp:TemplateField>
                                                                 <asp:BoundField DataField="NB_CLIENTE" HeaderText="DESCRIPCION" SortExpression="NB_CLIENTE" ItemStyle-HorizontalAlign="Center" ReadOnly="true">
                                                                 <ItemStyle HorizontalAlign="Center" />
                                                                 </asp:BoundField>
                                                                 <asp:BoundField DataField="REMISIONES" DataFormatString="$ {0:#,##0.00}" HeaderText="REMISIONES" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="REMISIONES">
                                                                 <HeaderStyle HorizontalAlign="Right" />
                                                                 <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:BoundField>
                                                                 <asp:BoundField DataField="REMISIONES_INTERNAS" DataFormatString="$ {0:#,##0.00}" HeaderText="REM INT"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="REMISIONES_INTERNAS">
                                                                 <HeaderStyle HorizontalAlign="Right" />
                                                                 <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:BoundField>
                                                                 <asp:BoundField DataField="VALE_A_VISTA" DataFormatString="$ {0:#,##0.00}" HeaderText="V.VISTA"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="VALE_A_VISTA">
                                                                 <HeaderStyle HorizontalAlign="Right" />
                                                                 <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:BoundField>
                                                                 <%--<asp:BoundField DataField="TOTAL_ASESOR" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="TOTAL ASESOR" ReadOnly="True" SortExpression="TOTAL_ASESOR" HeaderStyle-HorizontalAlign="Right">
                                                                 <HeaderStyle HorizontalAlign="Right" />
                                                                 <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:BoundField>--%>
                                                                 <asp:TemplateField HeaderText="TOTAL"  HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                                                     <ItemTemplate>
                                                                         <asp:Label ID="lblTOTAL_ASESOR" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_ASESOR"))  %>' ></asp:Label>
                                                                     </ItemTemplate>
                                                                     <FooterTemplate >
                                                                         <asp:Label ID="lblTOTAL_ASESOR" runat="server" ></asp:Label>
                                                                     </FooterTemplate>
                                                                     <FooterStyle HorizontalAlign="Right" />
                                                                     <HeaderStyle HorizontalAlign="Right" />
                                                                     <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:TemplateField>
                                                                
                                                             </Columns>
                                                             <EditRowStyle BackColor="#999999" />
                                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                         </asp:GridView>
                                                         <asp:SqlDataSource ID="sdsReporteRemisionesXAsesor" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesAsesor" SelectCommandType="StoredProcedure">
                                                             <SelectParameters>
                                                                 <asp:ControlParameter ControlID="lblAgente" Name="AGENTE" PropertyName="Text" Type="String" />
                                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                                             </SelectParameters>
                                                         </asp:SqlDataSource>
                                                         <br />
                                                         <br />
                                                         &nbsp;
                                                     </EditItemTemplate>
                                                     <ItemTemplate>
                                                         <%-- <asp:LinkButton ID="lnkDetails" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='+'></asp:LinkButton><asp:Label ID="lblAgente" runat="server" Text='<%# Bind("AGENTE") %>'></asp:Label>--%>
                                                         <asp:LinkButton ID="lnkAgente" runat="server" CausesValidation="False" CommandName="Edit" Text='<%# Eval("AGENTE") %>' ></asp:LinkButton>
                                                     </ItemTemplate>
                                                     <HeaderStyle Width="5%" />
                                                     <ItemStyle Width="5%" />
                                                 </asp:TemplateField>

                                                 <%--<asp:BoundField DataField="moneda" HeaderText="moneda" SortExpression="moneda" DataFormatString="{0:#,##0.00}" ItemStyle-HorizontalAlign="Center"/>--%>
                                                 <asp:BoundField DataField="REMISIONES" DataFormatString="$ {0:#,##0.00}" HeaderText="REMISIONES" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="REMISIONES">
                                                 <HeaderStyle HorizontalAlign="Right" />
                                                 <ItemStyle HorizontalAlign="Right" />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="REMISIONES_INTERNAS" DataFormatString="$ {0:#,##0.00}" HeaderText="REM INT"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="REMISIONES_INTERNAS">
                                                 <HeaderStyle HorizontalAlign="Right" />
                                                 <ItemStyle HorizontalAlign="Right" />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="VALE_A_VISTA" DataFormatString="$ {0:#,##0.00}" HeaderText="V.VISTA"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="VALE_A_VISTA">
                                                 <HeaderStyle HorizontalAlign="Right" />
                                                 <ItemStyle HorizontalAlign="Right" />
                                                 </asp:BoundField>
                                                 <asp:TemplateField HeaderText="TOTAL"  HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                                     <ItemTemplate>
                                                         <asp:Label ID="lblTOTAL_PLAZA" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_PLAZA"))  %>' ></asp:Label>
                                                     </ItemTemplate>
                                                     <FooterTemplate >
                                                         <asp:Label ID="lblTOTAL_PLAZA" runat="server" ></asp:Label>
                                                     </FooterTemplate>
                                                     <FooterStyle HorizontalAlign="Right" />
                                                     <HeaderStyle HorizontalAlign="Right" />
                                                     <ItemStyle HorizontalAlign="Right" />
                                                 </asp:TemplateField>
                                               <%--  <asp:BoundField DataField="TOTAL" DataFormatString="$ {0:#,##0.00}" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="TOTAL">
                                                 <ItemStyle HorizontalAlign="Center" />
                                                 </asp:BoundField>--%>
                                             </Columns>
                                             <EditRowStyle BackColor="#999999" />
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                         </asp:GridView>
                                         <asp:SqlDataSource ID="sdsReporteRemisionesXPlaza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesXPlaza" SelectCommandType="StoredProcedure">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </td>
                                 </tr>
                             </table>
                             &nbsp;
                         </EditItemTemplate>
                         <ItemTemplate>
                             <%-- <asp:LinkButton ID="lnkDetails" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='+'></asp:LinkButton><asp:Label ID="lblAgente" runat="server" Text='<%# Bind("AGENTE") %>'></asp:Label>--%>
                             <asp:LinkButton ID="lnkOficina" runat="server" CausesValidation="False" CommandName="Edit" Text='<%# Eval("oficina") %>' CommandArgument=""></asp:LinkButton>
                         </ItemTemplate> 
                         <HeaderStyle Width="5%" />
                         <ItemStyle Width="5%" />
                     </asp:TemplateField>
                     <asp:BoundField DataField="REMISIONES" DataFormatString="$ {0:#,##0.00}" HeaderText="REMISIONES" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="REMISIONES">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="REMISIONES_INTERNAS" DataFormatString="$ {0:#,##0.00}" HeaderText="REM INT"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="REMISIONES_INTERNAS">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="VALE_A_VISTA" DataFormatString="$ {0:#,##0.00}" HeaderText="V.VISTA"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="VALE_A_VISTA">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="TOTAL"  HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="lblTOTALDetalles" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_DETALLES"))  %>' ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate >
                            <asp:Label ID="lblTOTALDetalles" runat="server" BackColor="White"></asp:Label>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                 </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
             <asp:SqlDataSource ID="sdsPlazas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_datosRemisionesDetalles" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
            <div style="width:60%">
                <asp:GridView ID="gvReporteRemisionesBusqueda" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    Caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;BUSQUEDA&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" 
                    CellPadding="4" DataKeyNames="CD_SUCURSAL,CD_FOLIO,CD_PRODUCTO,NU_PARTIDA,CD_AGENTE,NB_AGENTE" DataSourceID="sdsReporteRemisionesBusqueda" EmptyDataText="&quot;No se encontraron registros para los parametros de busqueda&quot;" 
                    Font-Size="8pt" ForeColor="Black" GridLines="Vertical" OnRowCommand="gvReporteRemisionesCliente_RowCommand" OnRowDataBound="gvReporteRemisionesBusqueda_RowDataBound" OnSelectedIndexChanged="gvReporteRemisionesCliente_SelectedIndexChanged" ShowFooter="True" Visible="False" Width="60%">
                    <RowStyle BackColor="#F7F7DE" />
                    <FooterStyle BackColor="#5D7B9D" HorizontalAlign="Right" />
                    <Columns>
                        <asp:BoundField DataField="CD_SUCURSAL" HeaderText="Suc" ReadOnly="true" SortExpression="CD_SUCURSAL" />
                        <asp:BoundField DataField="NB_AGENTE" HeaderText="Agente" ReadOnly="true" SortExpression="NB_AGENTE" />
                        <asp:BoundField DataField="CD_FOLIO" HeaderText="Folio" ReadOnly="true" SortExpression="CD_FOLIO" />
                        <asp:BoundField DataField="CD_CLIENTE" HeaderText="Cliente" ReadOnly="true" SortExpression="CD_CLIENTE" />
                        <asp:BoundField DataField="NB_CLIENTE" HeaderText="Descripcion" ReadOnly="true" SortExpression="NB_CLIENTE" />
                        <asp:BoundField DataField="FH_FECHA" HeaderText="Fecha" ReadOnly="True" SortExpression="FH_FECHA" />
                        <asp:BoundField DataField="CD_PRODUCTO" HeaderText="Producto" ReadOnly="true" SortExpression="CD_PRODUCTO" />
                        <asp:BoundField DataField="NB_PRODUCTO" HeaderText="Descripcion" ReadOnly="true" SortExpression="NB_PRODUCTO" />
                        <asp:BoundField DataField="NU_UNIDADES" HeaderText="Unidades" ReadOnly="true" SortExpression="NU_UNIDADES" />
                        <asp:BoundField DataField="NU_PENDIENTES" HeaderText="Pendientes" ReadOnly="true" SortExpression="NU_PENDIENTES" />
                        <asp:BoundField DataField="CD_FOLIO_ANT" HeaderText="Folio Ped" SortExpression="CD_FOLIO_ANT" ReadOnly="true"/>
                        <asp:BoundField DataField="NB_MOVIMIENTO" HeaderText="MOV" SortExpression="NB_MOVIMIENTO" ReadOnly="true"/>
                        <%--<asp:BoundField DataField="NU_PARTIDA" HeaderText="Partida" ReadOnly="true" SortExpression="NU_PARTIDA" Visible="false" />--%>
                        
                        <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label ID="lblTOTAL_CLIENTE" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_CLIENTE"))  %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblTOTAL_CLIENTE" runat="server"></asp:Label>
                            </FooterTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CD_MONEDA" HeaderText="Moneda" ReadOnly="true" SortExpression="CD_MONEDA" />
                        <asp:TemplateField HeaderText="Estatus">
                            <ItemTemplate>
                                <%--<asp:Button ID="btnModalComentarios" runat="server" CausesValidation="False" CommandName="Select" Font-Size="9pt" Height="21px" Text="√" Width="27px" />--%>
                                <asp:LinkButton ID="lnkEstatus" runat="server" CausesValidation="False" CommandName="Select"  Text='<%# Eval("NB_ESTATUS") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                               Accion<br />
                                <asp:DropDownList ID="lstEstatus" runat="server" DataSourceID="sdsEstatus" DataTextField="NB_ESTATUS" DataValueField="CD_ESTATUS" Font-Size="Small"></asp:DropDownList>
                                <br />
                                <asp:SqlDataSource ID="sdsEstatus" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_RemisionesEstatus" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CD_USUARIO" SessionField="usuarioID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <%--Instruccion Auditor<br />
                                <asp:DropDownList ID="lstAccionAuditor" runat="server" DataSourceID="sdsAccionAuditor" DataTextField="NB_ACCION_AUDITOR" DataValueField="CD_ACCION_AUDITOR" Font-Size="Medium"></asp:DropDownList>
                                <br />
                                <asp:SqlDataSource ID="sdsAccionAuditor" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_CatAccionesAuditor" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                <br />--%>
                                Fecha limite<br />&nbsp;<asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True" CssClass="date-pick" Font-Size="10pt" ToolTip="Día/Mes/Año" ValidationGroup="Actualiza" Width="85px" Enabled="false"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" OnServerValidate="txtFechaValidation" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                                <br />
                                &nbsp;Comentarios<br />
                                <asp:TextBox ID="txtComentarios" runat="server" Font-Size="Medium" MaxLength="299" TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button4" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Update" Font-Size="8pt" Text="Actualizar" ValidationGroup="Actualizar" />
                                &nbsp;
                                <asp:Button ID="Button5" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsReporteRemisionesBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesBusqueda" SelectCommandType="StoredProcedure" UpdateCommand="print ''">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtParametro" DefaultValue=" " Name="PARAMETRO" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="rblTipoBusqCliente" DefaultValue="1" Name="TIPO" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txtFolio" DefaultValue=" " Name="CD_FOLIO" PropertyName="Text" Type="String" />
                </SelectParameters>
                </asp:SqlDataSource>
            </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />
    <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
        DynamicServicePath="" Enabled="True" TargetControlID="btnInicial" 
        BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
    </asp:ModalPopupExtender>
    <asp:Panel ID="PanelModal" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table style="background-color: #CCCCCC; border-style: inset; border-width: thin; vertical-align: top; text-align: center" >
                    <tr>
                        <td style="text-align:left">
                            <asp:GridView ID="gvHistorialRemisiones" runat="server" EmptyDataText="No se encontraron registros"
                                 AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;HISTORIAL&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsHistorialRemisiones" Font-Size="8pt" ForeColor="#333333">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <Columns>
                                    <asp:BoundField DataField="CD_FOLIO" HeaderText="CD_FOLIO" SortExpression="CD_FOLIO" />
                                    <asp:BoundField DataField="CD_SUCURSAL" HeaderText="CD_SUCURSAL" SortExpression="CD_SUCURSAL" />
                                    <asp:BoundField DataField="CD_PRODUCTO" HeaderText="CD_PRODUCTO" SortExpression="CD_PRODUCTO" />
                                    <asp:BoundField DataField="NU_PARTIDA" HeaderText="NU_PARTIDA" SortExpression="NU_PARTIDA" />
                                    <asp:BoundField DataField="FH_PLAZO" HeaderText="FH_PLAZO" ReadOnly="True" SortExpression="FH_PLAZO" />
                                    <asp:BoundField DataField="NB_COMENTARIOS" HeaderText="NB_COMENTARIOS" SortExpression="NB_COMENTARIOS" />
                                    <asp:BoundField DataField="FH_MODIFICACION" HeaderText="FH_MODIFICACION" ReadOnly="True" SortExpression="FH_MODIFICACION" />
                                    <asp:BoundField DataField="NB_ESTATUS" HeaderText="NB_ESTATUS" SortExpression="NB_ESTATUS" />
                                    <%--<asp:BoundField DataField="NB_ACCION_AUDITOR" HeaderText="NB_ACCION_AUDITOR" SortExpression="NB_ACCION_AUDITOR" />--%>
                                    <asp:BoundField DataField="usuario_login" HeaderText="usuario_login" SortExpression="usuario_login" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <br />
                            <asp:SqlDataSource ID="sdsHistorialRemisiones" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_historialRemisionesRevision" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="CD_FOLIO" Type="String" />
                                    <asp:Parameter Name="CD_SUCURSAL" Type="String" />
                                    <asp:Parameter Name="CD_PRODUCTO" Type="String" />
                                    <asp:Parameter Name="NU_PARTIDA" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnCerrarPopUp" runat="server" ImageUrl="~/Imagenes/cancel.png" OnClick="btnCerrarPopUp_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

