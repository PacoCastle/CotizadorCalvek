<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  CodeFile="reporteRemisiones.aspx.cs" Inherits="Operacion_reporteRemisiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<style type="text/css">
  
 
    /* xp theme */
.CustomTabStyle .ajax__tab_header {font-family:verdana,tahoma,helvetica;font-size:13px;background:url('../imagenes/Tabs/tab-line.gif') repeat-x bottom;}
.CustomTabStyle .ajax__tab_outer {padding-right:4px;background:url('../imagenes/Tabs/tab-right.gif') no-repeat right;height:21px;}
.CustomTabStyle .ajax__tab_inner {padding-left:3px;background:url('../imagenes/Tabs/tab-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_tab {height:13px;padding:4px;margin:0;background:url('../imagenes/Tabs/tab.gif') repeat-x;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_outer {background:url('../imagenes/Tabs/tab-hover-right.gif') no-repeat right;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_inner {background:url('../imagenes/Tabs/tab-hover-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_tab {background:url('../imagenes/Tabs/tab-hover.gif') repeat-x;}
.CustomTabStyle .ajax__tab_active .ajax__tab_outer {background:url('../imagenes/Tabs/tab-active-right.gif') no-repeat right;}
.CustomTabStyle .ajax__tab_active .ajax__tab_inner {background:url('../imagenes/Tabs/tab-active-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_active .ajax__tab_tab {background:url('../imagenes/Tabs/tab-active.gif') repeat-x;}
.CustomTabStyle .ajax__tab_body {font-family:verdana,tahoma,helvetica;font-size:10pt;border:1px solid #ffffff;border-top:0;padding:8px;background-color:#ffffff;}

 .TestCssStyle
    {
        text-align:left;
        font-weight:bold;
        font-size:x-large;
        padding: 2px; 
        background-color:silver; 
        border-collapse: separate;       

    }
.modalBackground 
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
        z-index: 10000;
    }
    .auto-style1 {
        height: 32px;
    }
 </style>
    <script type="text/javascript">
        function Ayuda(tema) {
            var AWin;
            //AWin = window.open(tema, "helpwin", "left=600,height=300,width=200");
            AWin = window.open(tema, 'Popup', 'toolbar=no, location=yes,status=no,menubar=no,scrollbars=yes,resizable=no, width=700,height=700,left=350,top=23', true);
            AWin.focus();
        }
        </script>
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
             $('textarea[id$=txtComentarioAutoriza]').keyup(function () {
                 var len = $(this).val().length;
                 if (len > limit) {
                     this.value = this.value.substring(0, limit);
                 }
                 $('#charLeft').text(limit - len + " characters left");
             });
         }
    </script>
   <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="pnlVistas" runat="server">
        <ContentTemplate>
            <div style="text-align: right">
                <%--<asp:ImageButton ID="ImageButton1" runat="server" Height="52px" ImageUrl="~/Imagenes/ayuda.PNG" OnClick="ImageButton1_Click" Width="49px" />--%>
                <asp:ImageButton ID="btnEdit" runat="server" Height="52px" Width="49px"  CausesValidation="false" ImageUrl="~/Imagenes/ayuda.PNG" />
            </div>
             <asp:TabContainer ID="TabRemisiones" runat="server" ActiveTabIndex="0" BorderStyle="None" CssClass="CustomTabStyle" Height="100%" Width="100%" OnActiveTabChanged="TabRemisiones_ActiveTabChanged" AutoPostBack="True">
                 <asp:TabPanel ID="TPanel1" runat="server" HeaderText="General">
                     <HeaderTemplate>
                         General
                     </HeaderTemplate>
                     <ContentTemplate>
                         <asp:GridView ID="gvReporteRemisiones" runat="server" AutoGenerateColumns="False" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;REMISIONES - RANGO&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesRango" Font-Size="8pt" ForeColor="#333333" GridLines="None" onRowDataBound="gvReporteRemisiones_RowDataBound" ShowFooter="True" Width="100%">
                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                             <Columns>
                                 <asp:BoundField DataField="negociacion" HeaderText="Negociacion" SortExpression="negociacion" >
                                 <HeaderStyle HorizontalAlign="Center" />
                                 <ItemStyle HorizontalAlign="Center" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="RANGO" HeaderText="Rango" SortExpression="RANGO" >
                                 <HeaderStyle HorizontalAlign="Right" />
                                 <ItemStyle HorizontalAlign="Center" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="SLP" DataFormatString="$ {0:#,##0.00}" HeaderText="SLP" ReadOnly="True" SortExpression="SLP_SA" >
                                 <HeaderStyle HorizontalAlign="Right" />
                                 <ItemStyle HorizontalAlign="Right" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="QRO" DataFormatString="$ {0:#,##0.00}" HeaderText="QRO" ReadOnly="True" SortExpression="QRO_SA" >
                                 <HeaderStyle HorizontalAlign="Right" />
                                 <ItemStyle HorizontalAlign="Right" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="CEL" DataFormatString="$ {0:#,##0.00}" HeaderText="CEL" ReadOnly="True" SortExpression="CEL_SA" >
                                 <HeaderStyle HorizontalAlign="Right" />
                                 <ItemStyle HorizontalAlign="Right" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="IRA" DataFormatString="$ {0:#,##0.00}" HeaderText="IRA" ReadOnly="True" SortExpression="IRA_SA" >
                                 <HeaderStyle HorizontalAlign="Right" />
                                 <ItemStyle HorizontalAlign="Right" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="TOTAL" DataFormatString="$ {0:#,##0.00}" HeaderText="TOTAL" ReadOnly="True" SortExpression="TOTAL" >
                                 <HeaderStyle HorizontalAlign="Right" />
                                 <ItemStyle HorizontalAlign="Right" />
                                 </asp:BoundField>
                             </Columns>
                             <EditRowStyle BackColor="#999999" />
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         </asp:GridView>
                         <asp:SqlDataSource ID="sdsReporteRemisionesRango" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesRango" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                     </ContentTemplate>
                 </asp:TabPanel>
                 <asp:TabPanel ID="TPanel2" runat="server" HeaderText="Detalles">
                     <HeaderTemplate>
                         Detalles
                     </HeaderTemplate>
                     <ContentTemplate>
                          <TABLE border="0" cellpadding="0" cellspacing="10" style="vertical-align: top"> 
                            <TR style="border-color: #FF0000">
        <TD width="30%" style="border-left-style: dotted; border-left-width: medium; border-left-color: #C0C0C0; padding-left: 10px;"><span><strong>Cliente:<asp:TextBox ID="txtParametro" runat="server"></asp:TextBox>










            <asp:RadioButtonList ID="rblTipoBusqCliente" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"><asp:ListItem Selected="True" Value="1">Cliente</asp:ListItem>
<asp:ListItem Value="2">Descripcion</asp:ListItem>
</asp:RadioButtonList>










            </strong></span></TD>
        <TD width="30%" style="vertical-align: top; border-left-style: dotted; border-left-width: medium; border-left-color: #C0C0C0; padding-left: 10px;"><span><strong style="vertical-align: top">Folio:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFolio" runat="server"></asp:TextBox>










            </strong></span></TD>
        <TD style="border-left-style: dotted; border-left-width: medium; border-left-color: #C0C0C0; padding-left: 10px;">
            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/Imagenes/Search (3).ico" OnClick="btnBuscar_Click"></asp:ImageButton>










        </TD>
    </TR> 
                        </TABLE> 


                          <hr border-color: white; height: 1px; />


                          <br />
                          <span><strong>Negociacion:<asp:RadioButtonList ID="rblTipoNegociacion" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="todas">Todas</asp:ListItem>
                              <asp:ListItem Value="normal">Normal</asp:ListItem>
                              <asp:ListItem Value="consigna">Consignadas</asp:ListItem>
                          </asp:RadioButtonList>
                          </strong></span>


                          <asp:SqlDataSource ID="sdsPlazas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_datosRemisionesDetalles" SelectCommandType="StoredProcedure">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="rblTipoNegociacion" DefaultValue=" " Name="CD_TIPONEGOCIACION" PropertyName="SelectedValue" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                        <asp:GridView ID="gvReporteRemisionesDetalle" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;PLAZA&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsPlazas" Font-Size="8pt" ForeColor="#333333" GridLines="None" ShowFooter="True" Visible="False" OnRowDataBound="gvReporteRemisionesDetalle_RowDataBound" style="margin-bottom: 0px" >
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="Red" HorizontalAlign="Right" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <Columns>
                     <asp:TemplateField SortExpression="oficina">
                         <EditItemTemplate>
                             <table style="width: 100%">
                                 <tr>
                                     <td style="width: 27%; height: 18px">
                                         <asp:Label ID="lblPlaza" runat="server" Text='<%# Eval("oficina") %>'></asp:Label>
                                         <asp:Label ID="lblPlazaId" runat="server" Text='<%# Eval("oficinaId") %>' Visible="false"></asp:Label>
                                         <br />
                                         <asp:LinkButton ID="lnkCerrar0" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                                         <br />
                                         <asp:GridView ID="gvReporteRemisionesDocumento" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;DOCUMENTO&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesDocumento" Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowDataBound="gvReporteRemisionesDocumento_RowDataBound" ShowFooter="True">
                                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                             <Columns>
                                                 <%--<asp:BoundField DataField="TOTAL_ASESOR" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="TOTAL ASESOR" ReadOnly="True" SortExpression="TOTAL_ASESOR" HeaderStyle-HorizontalAlign="Right">
                                                                 <HeaderStyle HorizontalAlign="Right" />
                                                                 <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:BoundField>--%>
                                                 <asp:TemplateField HeaderText="DOCUMENTO" SortExpression="DOCUMENTO">
                                                     <EditItemTemplate>
                                                         <table style="width: 100%">
                                                             <tr>
                                                                 <td style="width: 27%; height: 18px">
                                                                     <asp:Label ID="lblDocumento" runat="server" Text='<%# Eval("DOCUMENTO") %>'></asp:Label>
                                                                     <asp:Label ID="lblRango" runat="server" Text=''></asp:Label>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         &nbsp;<asp:LinkButton ID="lnkCerrar2" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                                                         <br />
                                                         <br />
                                                         <asp:GridView ID="gvReporteRemisionesAsesor" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;ASESOR&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesAsesor" Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowDataBound="gvReporteRemisionesAsesor_RowDataBound" ShowFooter="True" OnRowCommand="gvReporteRemisionesAsesor_RowCommand">
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
                                                                         <asp:GridView ID="gvReporteRemisionesAsesorDocumento" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;CLIENTE&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesAsesorDocumento" Font-Size="8pt" ForeColor="#333333" GridLines="None" OnRowDataBound="gvReporteRemisionesAsesorDocumento_RowDataBound" ShowFooter="True">
                                                                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                             <Columns>
                                                                                 <%--<asp:BoundField DataField="TOTAL_ASESOR" DataFormatString="$ {0:#,##0.00}" ItemStyle-HorizontalAlign="Right" HeaderText="TOTAL ASESOR" ReadOnly="True" SortExpression="TOTAL_ASESOR" HeaderStyle-HorizontalAlign="Right">
                                                                 <HeaderStyle HorizontalAlign="Right" />
                                                                 <ItemStyle HorizontalAlign="Right" />
                                                                 </asp:BoundField>--%>
                                                                                 <asp:TemplateField HeaderText="CLIENTE" SortExpression="CLIENTE">
                                                                                     <EditItemTemplate>
                                                                                         <table style="width: 100%">
                                                                                             <tr>
                                                                                                 <td style="width: 27%; height: 18px">
                                                                                                     <asp:Label ID="lblCliente" runat="server" Text='<%# Eval("NB_CLIENTE") %>'></asp:Label>
                                                                                                     <asp:Label ID="lblClienteId" runat="server" Text='<%# Eval("CD_CLIENTE") %>' Visible="true"></asp:Label>
                                                                                                 </td>
                                                                                             </tr>
                                                                                         </table>
                                                                                         &nbsp;<asp:LinkButton ID="lnkCerrar3" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="White" Text="Cerrar"></asp:LinkButton>
                                                                                         <br />
                                                                                         <asp:SqlDataSource ID="sdsReporteRemisionesCliente" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesCliente" SelectCommandType="StoredProcedure" UpdateCommand="print ''">
                                                                                             <SelectParameters>
                                                                                                 <asp:ControlParameter ControlID="lblClienteId" Name="CD_CLIENTE" PropertyName="Text" Type="String" />
                                                                                                 <asp:ControlParameter ControlID="lblAgente" Name="AGENTE" PropertyName="Text" Type="String" />
                                                                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                                                                                 <asp:ControlParameter ControlID="lblDocumento" Name="NB_DOCUMENTO" PropertyName="Text" Type="String" />
                                                                                                 <asp:SessionParameter Name="NB_RANGO" SessionField="rangoRemisiones" Type="String" />
                                                                                                 <asp:ControlParameter ControlID="rblTipoNegociacion" Name="CD_TIPONEGOCIACION" PropertyName="SelectedValue" Type="String" />
                                                                                             </SelectParameters>
                                                                                         </asp:SqlDataSource>
                                                                                         <asp:UpdatePanel ID="pnlClientes" runat="server">
                                                                                             <ContentTemplate>                                                                                             
                                                                                                 <asp:GridView ID="gvReporteRemisionesCliente" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CD_SUCURSAL,CD_FOLIO,CD_AGENTE,NB_AGENTE,NB_DOCUMENTO,NB_RANGO,CD_TIPONEGOCIACION,CD_CLIENTE" DataSourceID="sdsReporteRemisionesCliente" ForeColor="Black" GridLines="Vertical" OnRowCommand="gvReporteRemisionesCliente_RowCommand" OnRowDataBound="gvReporteRemisionesCliente_RowDataBound" OnSelectedIndexChanged="gvReporteRemisionesCliente_SelectedIndexChanged" ShowFooter="True">
                                                                                                     <RowStyle BackColor="#F7F7DE" />
                                                                                                     <FooterStyle BackColor="#5D7B9D" HorizontalAlign="Right" />
                                                                                                     <Columns>
                                                                                                         <asp:BoundField DataField="CD_SUCURSAL" HeaderText="Suc" ReadOnly="true" SortExpression="CD_SUCURSAL" />
                                                                                                         <asp:BoundField DataField="CD_FOLIO" HeaderText="Folio" ReadOnly="true" SortExpression="CD_FOLIO" />
                                                                                                         <asp:BoundField DataField="FH_FECHA" HeaderText="Fecha" ReadOnly="True" SortExpression="FH_FECHA" />
                                                                                                        <%-- <asp:BoundField DataField="CD_PRODUCTO" HeaderText="Producto" ReadOnly="true" SortExpression="CD_PRODUCTO" />
                                                                                                         <asp:BoundField DataField="NB_PRODUCTO" HeaderText="Descripcion" ReadOnly="true" SortExpression="NB_PRODUCTO" />--%>
                                                                                                         <%--<asp:BoundField DataField="CD_MONEDA" HeaderText="Moneda" ReadOnly="true" SortExpression="CD_MONEDA" />--%>
                                                                                                        <%-- <asp:BoundField DataField="NU_UNIDADES" HeaderText="#Sol" ItemStyle-HorizontalAlign="Center" ReadOnly="true" SortExpression="NU_UNIDADES" >
                                                                                                         <ItemStyle HorizontalAlign="Center" />
                                                                                                         </asp:BoundField>--%>
                                                                                                        <%-- <asp:BoundField DataField="NU_PENDIENTES" HeaderText="#Pdte" ItemStyle-HorizontalAlign="Center" ReadOnly="true" SortExpression="NU_PENDIENTES" >
                                                                                                         <ItemStyle HorizontalAlign="Center" />
                                                                                                         </asp:BoundField>--%>
                                                                                                         <asp:BoundField DataField="CD_FOLIO_ANT" HeaderText="Pedido" ReadOnly="true" SortExpression="CD_FOLIO_ANT" />
                                                                                                        <%-- <asp:BoundField DataField="NB_MOVIMIENTO" HeaderText="MOV" ReadOnly="true" SortExpression="NB_MOVIMIENTO" />--%>
                                                                                                         <%--<asp:BoundField DataField="NU_PARTIDA" HeaderText="Partida" SortExpression="NU_PARTIDA" ReadOnly="true" Visible="false"/>--%>
                                                                                                         <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderText="TOTAL MX" ItemStyle-HorizontalAlign="Right">
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
                                                                                                         <asp:TemplateField HeaderText="Estatus">
                                                                                                             <ItemTemplate>
                                                                                                                 <%--<asp:LinkButton ID="lnkEstatus" runat="server" CausesValidation="False" CommandName="Select"  Text='<%# Eval("NB_ESTATUS") %>'></asp:LinkButton>--%>
                                                                                                                 <asp:Label ID="lblEstatusCliente" runat="server" CausesValidation="False" Text='<%# Eval("NB_ESTATUS") %>'></asp:Label>
                                                                                                             </ItemTemplate>
                                                                                                             <EditItemTemplate>
                                                                                                                 Estatus<br />
                                                                                                                 <asp:DropDownList ID="lstEstatus" runat="server" AutoPostBack="True" DataSourceID="sdsEstatus" DataTextField="NB_ESTATUS" DataValueField="CD_ESTATUS" Font-Size="Small" OnSelectedIndexChanged="lstEstatus_SelectedIndexChanged">
                                                                                                                 </asp:DropDownList>
                                                                                                                 <br />
                                                                                                                 <asp:SqlDataSource ID="sdsEstatus" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_RemisionesEstatus" SelectCommandType="StoredProcedure">
                                                                                                                     <SelectParameters>
                                                                                                                         <asp:SessionParameter Name="CD_USUARIO" SessionField="usuarioID" Type="Int32" />
                                                                                                                         <asp:Parameter Name="CD_SUCURSAL" Type="String" />
                                                                                                                         <asp:Parameter Name="CD_FOLIO" Type="String" />
                                                                                                                         <%--<asp:Parameter Name="CD_PRODUCTO" Type="String" />
                                                                                                                         <asp:Parameter Name="NU_PARTIDA" Type="Int32" />--%>
                                                                                                                     </SelectParameters>
                                                                                                                 </asp:SqlDataSource>
                                                                                                                 <br />
                                                                                                                 Fecha limite<br />&nbsp;
                                                                                                                 <asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True" CssClass="date-pick" Enabled="false" Font-Size="10pt" Text='<%# Eval("FH_PLAZO") %>' ToolTip="Día/Mes/Año" ValidationGroup="Actualiza" Width="85px">
                                                                                                                 </asp:TextBox>
                                                                                                                 <asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" OnServerValidate="txtFechaValidation" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                                                                                                                 <br />
                                                                                                                 &nbsp;Comentarios<br />
                                                                                                                 <asp:TextBox ID="txtComentarios" runat="server" Font-Size="Medium" MaxLength="299" TextMode="MultiLine"></asp:TextBox>
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
                                                                                                                    <asp:Button ID="Button6" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                                                                                                        CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                                                                                                                </ItemTemplate>
                                                                                                         </asp:TemplateField>
                                                                                                         <asp:TemplateField ShowHeader="False">
                                                                                                               <ItemTemplate>
                                                                                                                    <%--<asp:Button ID="btnModalComentarios" runat="server" CausesValidation="False" CommandName="Select" Text="√" Font-Size="9pt" Height="21px" Width="27px" />--%>
                                                                                                                   <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagenes/comments.png" />
                                                                                                                 </ItemTemplate>
                                                                                                         </asp:TemplateField>
                                                                                                     </Columns>
                                                                                                     <FooterStyle BackColor="#CCCC99" />
                                                                                                     <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                                                                     <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                                                                     <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                                                                     <AlternatingRowStyle BackColor="White" />
                                                                                                 </asp:GridView>
                                                                                        </ContentTemplate>
                                                                                     </asp:UpdatePanel>
                                                                                     </EditItemTemplate>
                                                                                     <ItemTemplate>
                                                                                         <asp:LinkButton ID="lnkCliente" runat="server" CausesValidation="False" CommandName="Edit" Text='<%# Eval("CD_CLIENTE") %>'></asp:LinkButton>
                                                                                     </ItemTemplate>
                                                                                     <HeaderStyle Width="5%" />
                                                                                     <ItemStyle Width="5%" />
                                                                                 </asp:TemplateField>
                                                                                 <asp:BoundField DataField="NB_CLIENTE" HeaderText="DESCRIPCION" ItemStyle-HorizontalAlign="Center" ReadOnly="true" SortExpression="NB_CLIENTE">
                                                                                 <ItemStyle HorizontalAlign="Center" />
                                                                                 </asp:BoundField>
                                                                                 <asp:BoundField DataField="R_MAS_400" DataFormatString="{0:#,##0.00}" HeaderText=">400"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_MAS_400">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_301_400" DataFormatString="{0:#,##0.00}" HeaderText="301-400"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_301_400">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_201_300" DataFormatString="{0:#,##0.00}" HeaderText="201-300"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_201_300">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_151_200" DataFormatString="{0:#,##0.00}" HeaderText="151-200"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_151_200">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_121_150" DataFormatString="{0:#,##0.00}" HeaderText="121-150"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_121_150">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_91_120" DataFormatString="{0:#,##0.00}" HeaderText="91-120"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_91_120">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_61_90" DataFormatString="{0:#,##0.00}" HeaderText="61-90"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_61_90">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_45_60" DataFormatString="{0:#,##0.00}" HeaderText="46-60"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_45_60">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_31_45" DataFormatString="{0:#,##0.00}" HeaderText="31-45"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_31_45">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="R_0_30" DataFormatString="{0:#,##0.00}" HeaderText="0-30" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_0_30">
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField> 
                                                                                 <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Right">
                                                                                     <ItemTemplate>
                                                                                         <asp:Label ID="lblTOTAL_ASESOR_DOCUMENTO" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_ASESOR_DOCUMENTO"))  %>'></asp:Label>
                                                                                     </ItemTemplate>
                                                                                     <FooterTemplate>
                                                                                         <asp:Label ID="lblTOTAL_ASESOR_DOCUMENTO" runat="server"></asp:Label>
                                                                                     </FooterTemplate>
                                                                                     <FooterStyle HorizontalAlign="Right" />
                                                                                     <HeaderStyle HorizontalAlign="Right" />
                                                                                     <ItemStyle HorizontalAlign="Right" />
                                                                                 </asp:TemplateField>
                                                                             </Columns>
                                                                             <EditRowStyle BackColor="#999999" />
                                                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                         </asp:GridView>
                                                                         <asp:SqlDataSource ID="sdsReporteRemisionesAsesorDocumento" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesAsesorDocumento" SelectCommandType="StoredProcedure">
                                                                             <SelectParameters>
                                                                                 <asp:ControlParameter ControlID="lblAgente" Name="AGENTE" PropertyName="Text" Type="String" />
                                                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                                                                 <asp:ControlParameter ControlID="lblDocumento" Name="NB_DOCUMENTO" PropertyName="Text" Type="String" />
                                                                                 <asp:SessionParameter Name="NB_RANGO" SessionField="rangoRemisiones" Type="String" />
                                                                                 <asp:ControlParameter ControlID="rblTipoNegociacion" Name="CD_TIPONEGOCIACION" PropertyName="SelectedValue" Type="String" />
                                                                             </SelectParameters>
                                                                         </asp:SqlDataSource>
                                                                         <br />
                                                                         <br />
                                                                         &nbsp;
                                                                     </EditItemTemplate>
                                                                     <ItemTemplate>
                                                                         <%-- <asp:LinkButton ID="lnkDetails" runat="server" CausesValidation="False" CommandName="Edit"
                        Text='+'></asp:LinkButton><asp:Label ID="lblAgente" runat="server" Text='<%# Bind("AGENTE") %>'></asp:Label>--%>
                                                                         <asp:LinkButton ID="lnkAgente" runat="server" CausesValidation="False" CommandArgument="Todos" CommandName="Edit" Text='<%# Eval("AGENTE") %>'></asp:LinkButton>
                                                                     </ItemTemplate>
                                                                     <HeaderStyle Width="5%" />
                                                                     <ItemStyle Width="5%" />
                                                                 </asp:TemplateField>
                                                                 <asp:TemplateField HeaderText="&gt;400" SortExpression="R_MAS_400">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_MAS_400" CommandName="Edit" CommandArgument=">400 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_MAS_400")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="301-400" SortExpression="R_301_400">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_301_400" CommandName="Edit" CommandArgument="301 A 400 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_301_400")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="201-300" SortExpression="R_201_300">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_201_300" CommandName="Edit" CommandArgument="201 A 300 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_201_300")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="151-200" SortExpression="R_151_200">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_151_200" CommandName="Edit" CommandArgument="151 A 200 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_151_200")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="121-150" SortExpression="R_121_150">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_121_150" CommandName="Edit" CommandArgument="121 A 150 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_121_150")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="91-120" SortExpression="R_91_120">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_91_120" CommandName="Edit" CommandArgument="91 A 120 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_91_120")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="61-90" SortExpression="R_61_90">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_61_90" CommandName="Edit" CommandArgument="61 A 90 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_61_90")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="46-60" SortExpression="R_45_60">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_45_60" CommandName="Edit" CommandArgument="45 A 60 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_45_60")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="31-45" SortExpression="R_31_45">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_31_45" CommandName="Edit" CommandArgument="31 A 45 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_31_45")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="0-30" SortExpression="R_0_30">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkR_0_30" CommandName="Edit" CommandArgument="0 A 30 DIAS" Text='<%#String.Format("{0:#,##0.00}", Eval("R_0_30")) %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                 <%--<asp:BoundField DataField="moneda" HeaderText="moneda" SortExpression="moneda" DataFormatString="{0:#,##0.00}" ItemStyle-HorizontalAlign="Center"/>--%>
                                                                 
                                                                 <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Right">
                                                                     <ItemTemplate>
                                                                         <asp:Label ID="lblTOTAL_ASESOR" runat="server" Text='<%#String.Format("$ {0:#,##0.00}", Eval("TOTAL_ASESOR"))  %>'></asp:Label>
                                                                     </ItemTemplate>
                                                                     <FooterTemplate>
                                                                         <asp:Label ID="lblTOTAL_ASESOR" runat="server"></asp:Label>
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
                                                         <asp:SqlDataSource ID="sdsReporteRemisionesAsesor" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesAsesor" SelectCommandType="StoredProcedure">
                                                             <SelectParameters>
                                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                                                 <asp:ControlParameter ControlID="lblDocumento" Name="NB_DOCUMENTO" PropertyName="Text" Type="String" />
                                                                 <asp:ControlParameter ControlID="rblTipoNegociacion" Name="CD_TIPONEGOCIACION" PropertyName="SelectedValue" Type="String" />
                                                             </SelectParameters>
                                                         </asp:SqlDataSource>
                                                     </EditItemTemplate>
                                                     <ItemTemplate>
                                                         <asp:LinkButton ID="lnkDocumento" runat="server" CausesValidation="False" CommandName="Edit" Text='<%# Eval("DOCUMENTO") %>'></asp:LinkButton>
                                                     </ItemTemplate>
                                                     <HeaderStyle Width="15%" />
                                                     <ItemStyle Width="15%" />
                                                 </asp:TemplateField>
                                                <asp:BoundField DataField="R_MAS_400" DataFormatString="{0:#,##0.00}" HeaderText=">400"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_MAS_400">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_301_400" DataFormatString="{0:#,##0.00}" HeaderText="301-400"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_301_400">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_201_300" DataFormatString="{0:#,##0.00}" HeaderText="201-300"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_201_300">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_151_200" DataFormatString="{0:#,##0.00}" HeaderText="151-200"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_151_200">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_121_150" DataFormatString="{0:#,##0.00}" HeaderText="121-150"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_121_150">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_91_120" DataFormatString="{0:#,##0.00}" HeaderText="91-120"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_91_120">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_61_90" DataFormatString="{0:#,##0.00}" HeaderText="61-90"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_61_90">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_45_60" DataFormatString="{0:#,##0.00}" HeaderText="46-60"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_45_60">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_31_45" DataFormatString="{0:#,##0.00}" HeaderText="31-45"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_31_45">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="R_0_30" DataFormatString="{0:#,##0.00}" HeaderText="0-30" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" ReadOnly="True" SortExpression="R_0_30">
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                 <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Right">
                                                     <ItemTemplate>
                                                         <asp:Label ID="lblTOTAL_DOCUMENTO" runat="server" Text='<%#String.Format("{0:#,##0.00}", Eval("TOTAL_DOCUMENTO"))  %>'></asp:Label>
                                                     </ItemTemplate>
                                                     <FooterTemplate>
                                                         <asp:Label ID="lblTOTAL_DOCUMENTO" runat="server"></asp:Label>
                                                     </FooterTemplate>
                                                     <FooterStyle HorizontalAlign="Right" />
                                                     <HeaderStyle HorizontalAlign="Right" />
                                                     <ItemStyle HorizontalAlign="Right" />
                                                 </asp:TemplateField>
                                             </Columns>
                                             <EditRowStyle BackColor="#999999" />
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                         </asp:GridView>
                                         <asp:SqlDataSource ID="sdsReporteRemisionesDocumento" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesDocumento" SelectCommandType="StoredProcedure">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="lblPlazaId" Name="CD_SUCURSAL" PropertyName="Text" Type="Int32" />
                                                 <asp:ControlParameter ControlID="rblTipoNegociacion" Name="CD_TIPONEGOCIACION" PropertyName="SelectedValue" Type="String" />
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
                     <asp:BoundField DataField="REMISIONES" DataFormatString="$ {0:#,##0.00}" HeaderText="REMISIONES" ReadOnly="True" SortExpression="REMISIONES">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="REMISIONES_INTERNAS" DataFormatString="$ {0:#,##0.00}" HeaderText="REM INT" ReadOnly="True" SortExpression="REMISIONES_INTERNAS">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="VALE_A_VISTA" DataFormatString="$ {0:#,##0.00}" HeaderText="V.VISTA" ReadOnly="True" SortExpression="VALE_A_VISTA">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="TOTAL">
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
            <div style="width:60%">
                <asp:GridView ID="gvReporteRemisionesBusqueda" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    Caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;BUSQUEDA&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" 
                    CellPadding="4" DataKeyNames="CD_SUCURSAL,CD_FOLIO,CD_AGENTE,NB_AGENTE,NB_DOCUMENTO,NB_RANGO,CD_TIPONEGOCIACION,CD_CLIENTE" DataSourceID="sdsReporteRemisionesBusqueda" EmptyDataText="&quot;No se encontraron registros para los parametros de busqueda&quot;" 
                    Font-Size="8pt" ForeColor="Black" GridLines="Vertical" OnRowCommand="gvReporteRemisionesCliente_RowCommand" OnRowDataBound="gvReporteRemisionesBusqueda_RowDataBound" OnSelectedIndexChanged="gvReporteRemisionesCliente_SelectedIndexChanged" ShowFooter="True" Visible="False" Width="60%">
                    <RowStyle BackColor="#F7F7DE" />
                    <FooterStyle BackColor="#CCCC99" HorizontalAlign="Right" />
                    <Columns>
                        <asp:BoundField DataField="CD_SUCURSAL" HeaderText="Suc" ReadOnly="True" SortExpression="CD_SUCURSAL" />
                        <asp:BoundField DataField="NB_AGENTE" HeaderText="Agente" ReadOnly="True" SortExpression="NB_AGENTE" />
                        <asp:BoundField DataField="CD_FOLIO" HeaderText="Folio" ReadOnly="True" SortExpression="CD_FOLIO" />
                        <asp:BoundField DataField="FH_FECHA" HeaderText="Fecha" ReadOnly="True" SortExpression="FH_FECHA" />
                        <asp:BoundField DataField="CD_FOLIO_ANT" HeaderText="Pedido" ReadOnly="True" SortExpression="CD_FOLIO_ANT" />
                        <asp:TemplateField HeaderText="TOTAL MX">
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
                        <asp:TemplateField HeaderText="Estatus">
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="lnkEstatus" runat="server" CausesValidation="False" CommandName="Select"  Text='<%# Eval("NB_ESTATUS") %>'></asp:LinkButton>--%>
                                <asp:Label ID="lblEstatusCliente" runat="server" CausesValidation="False" Text='<%# Eval("NB_ESTATUS") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                Estatus<br />
                                <asp:DropDownList ID="lstEstatus" runat="server" AutoPostBack="True" DataSourceID="sdsEstatus" DataTextField="NB_ESTATUS" DataValueField="CD_ESTATUS" Font-Size="Small" OnSelectedIndexChanged="lstEstatus_SelectedIndexChanged">
                                </asp:DropDownList>
                                <br />
                                <asp:SqlDataSource ID="sdsEstatus" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_RemisionesEstatus" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CD_USUARIO" SessionField="usuarioID" Type="Int32" />
                                        <asp:Parameter Name="CD_SUCURSAL" Type="String" />
                                        <asp:Parameter Name="CD_FOLIO" Type="String" />
                                        <%--<asp:Parameter Name="CD_PRODUCTO" Type="String" />
                                        <asp:Parameter Name="NU_PARTIDA" Type="Int32" />--%>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                Fecha limite<br />&nbsp;
                                <asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True" CssClass="date-pick" Enabled="false" Font-Size="10pt" Text='<%# Eval("FH_PLAZO") %>' ToolTip="Día/Mes/Año" ValidationGroup="Actualiza" Width="85px">
                                </asp:TextBox>
                                <asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="fecha invalida: dd/mm/aaaa" Font-Size="7pt" OnServerValidate="txtFechaValidation" ValidationExpression="^((([0][1-9]|[12][\d])|[3][01])[-\/]([0][13578]|[1][02])[-\/][1-9]\d\d\d)|((([0][1-9]|[12][\d])|[3][0])[-\/]([0][13456789]|[1][012])[-\/][1-9]\d\d\d)|(([0][1-9]|[12][\d])[-\/][0][2][-\/][1-9]\d([02468][048]|[13579][26]))|(([0][1-9]|[12][0-8])[-\/][0][2][-\/][1-9]\d\d\d)$"></asp:RegularExpressionValidator>
                                <br />
                                &nbsp;Comentarios<br />
                                <asp:TextBox ID="txtComentarios" runat="server" Font-Size="Medium" MaxLength="299" TextMode="MultiLine"></asp:TextBox>
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
                                <asp:Button ID="Button6" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False"
                                    CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <%--<asp:Button ID="btnModalComentarios" runat="server" CausesValidation="False" CommandName="Select" Text="√" Font-Size="9pt" Height="21px" Width="27px" />--%>
                                <asp:ImageButton ID="btnModalComentarios" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagenes/comments.png" />
                                </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
                 </asp:TabPanel>
                 <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                     <HeaderTemplate>
                         Sol Autorización
                         <br />
                     </HeaderTemplate>
                     <ContentTemplate>
                         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                             <ContentTemplate>
                                 <table border="0" cellpadding="0" cellspacing="10" style="vertical-align: top; width: auto; text-align: center;">
                                     <tr style="border-color: #FF0000">
                                         <td style="border-top: medium dotted #C0C0C0; padding-top: 10px; background-color: #5D7B9D; font-family: 'AR CENA'; font-size: larger; color: #FFFFFF; text-align: center;" class="auto-style1">SOLICITUD AUTORIZAR REMISIONES </td>
                                     </tr>
                                     <tr style="border-color: #FF0000 ">
                                         <td style="border-top-width: medium; border-top-color: #C0C0C0; padding-left: 10px; border-top-style: dotted;">
                                             <span style="font-size: small">Razon Social:</span><asp:RadioButtonList ID="rblRazonSocial" runat="server" AutoPostBack="True" Font-Size="Large" RepeatDirection="Horizontal">
                                             <asp:ListItem Selected="True">CSA</asp:ListItem>
                                             <asp:ListItem>CBJ</asp:ListItem>
                                             <asp:ListItem>CCC</asp:ListItem>
                                             </asp:RadioButtonList>
                                             <br />
                                         </td>
                                    <tr style="border-color: #FF0000 ">
                                         <td style="border-top-style: dotted; border-top-width: medium; border-top-color: #C0C0C0; padding-top: 10px;">
                                             <span style="font-size: small">Asesor:<br />
                                             <asp:DropDownList ID="lstAsesores" runat="server" AutoPostBack="True" DataSourceID="sdsAsesores" DataTextField="NB_ASESOR" DataValueField="CD_ASESOR" Font-Size="Large" OnSelectedIndexChanged="lstAsesores_SelectedIndexChanged">
                                             </asp:DropDownList>
                                             <asp:SqlDataSource ID="sdsAsesores" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_AsesoresKDUV_X_RazonSocial" SelectCommandType="StoredProcedure">
                                                 <SelectParameters>
                                                     <asp:ControlParameter ControlID="rblRazonSocial" DefaultValue="CSA" Name="strRazonSocial" PropertyName="SelectedValue" Type="String" />
                                                 </SelectParameters>
                                             </asp:SqlDataSource>
                                             </span>
                                         </td>
                                    </tr>
                                     <tr style="border-color: #FF0000 ">
                                         <td style="border-top-style: dotted; border-top-width: medium; border-top-color: #C0C0C0; padding-top: 10px;">
                                             <span style="font-size: small">Estatus:<br /> 
                                             <asp:DropDownList ID="lstAsesoresAutoriza" runat="server" AutoPostBack="True" DataSourceID="sdsAsesoresAutoriza" DataTextField="NB_AUTORIZA" DataValueField="NB_AUTORIZA" Font-Size="Large" OnSelectedIndexChanged="lstAsesores_SelectedIndexChanged" Enabled="False">
                                             </asp:DropDownList>
                                             <asp:SqlDataSource ID="sdsAsesoresAutoriza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_AutorizaRemisionAsesor_X_RazonSocial" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                                                 <SelectParameters>
                                                     <asp:ControlParameter ControlID="rblRazonSocial" Name="strRazonSocial" PropertyName="SelectedValue" Type="String" />
                                                     <asp:ControlParameter ControlID="lstAsesores" Name="CD_ASESOR" PropertyName="SelectedValue" Type="String" />
                                                 </SelectParameters>
                                             </asp:SqlDataSource>
                                             </span>
                                         </td>
                                        </tr>
                                         <tr style="border-color: #FF0000 ">
                                         <td style="border-top-style: dotted; border-top-width: medium; border-top-color: #C0C0C0; padding-top: 10px;">
                                             <span style="font-size: small">Comentario:<br /></span>
                                             <asp:TextBox ID="txtComentarioAutoriza" runat="server" TextMode="MultiLine" Font-Size="Medium" MaxLength="249" ></asp:TextBox>
                                         </td>
                                        </tr>
                                        <tr style="border-color: #FF0000 ">
                                          <td style="border-top-style: dotted; border-top-width: medium; border-top-color: #C0C0C0; padding-top: 10px;">
                                              <span style="font-size: small">Solicitar:<br /> </span>
                                             <asp:ImageButton ID="ibtnSolicitar" runat="server" ImageUrl="~/Imagenes/bell_go.png" OnClick="ibtnSolicitar_Click" />
                                         </td>
                                     </tr>
                                 </table>
                             </ContentTemplate>
                         </asp:UpdatePanel>
                     </ContentTemplate>
                 </asp:TabPanel>
             </asp:TabContainer>
    <br />
    <br />
           
            
    <hr border-color: white; height: 1px; />
            <br />
             
            
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
                            <asp:GridView ID="gvReporteRemisionesClientePartidas" runat="server" AutoGenerateColumns="False" BorderColor="#000099" caption="&lt;table width=&quot;100%&quot; class=&quot;TestCssStyle&quot;&gt;&lt;tr&gt;&lt;td class=&quot;text_Title&quot;&gt;PRODUCTOS&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" DataSourceID="sdsReporteRemisionesClientePartidas" EmptyDataText="No se encontraron registros" Font-Size="8pt" ForeColor="#333333">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <Columns>
                                    <asp:BoundField DataField="CD_SUCURSAL" HeaderText="CD_SUCURSAL" SortExpression="CD_SUCURSAL" />
                                    <asp:BoundField DataField="CD_FOLIO" HeaderText="CD_FOLIO" SortExpression="CD_FOLIO" />
                                    <asp:BoundField DataField="FH_FECHA" HeaderText="FH_FECHA" ReadOnly="True" SortExpression="FH_FECHA" />
                                    <asp:BoundField DataField="CD_PRODUCTO" HeaderText="CD_PRODUCTO" SortExpression="CD_PRODUCTO" />
                                    <asp:BoundField DataField="NB_PRODUCTO" HeaderText="NB_PRODUCTO" SortExpression="NB_PRODUCTO" />
                                    <asp:BoundField DataField="NU_UNIDADES" HeaderText="NU_UNIDADES" SortExpression="NU_UNIDADES" />
                                    <asp:BoundField DataField="NU_PENDIENTES" HeaderText="NU_PENDIENTES" SortExpression="NU_PENDIENTES" />
                                    <asp:BoundField DataField="NU_PARTIDA" HeaderText="NU_PARTIDA" SortExpression="NU_PARTIDA" />
                                    <asp:BoundField DataField="NU_MONTO" HeaderText="NU_MONTO" SortExpression="NU_MONTO" DataFormatString="$ {0:#,##0.00}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsReporteRemisionesClientePartidas" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ReporteRemisionesClientePartidas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="CD_CLIENTE" Type="String" />
                                    <asp:Parameter Name="AGENTE" Type="String" />
                                    <asp:Parameter Name="CD_SUCURSAL" Type="Int32" />
                                    <asp:Parameter Name="NB_DOCUMENTO" Type="String" />
                                    <asp:Parameter Name="NB_RANGO" Type="String" />
                                    <asp:Parameter Name="CD_TIPONEGOCIACION" Type="String" />
                                    <asp:Parameter Name="CD_FOLIO" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
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
                                   <%-- <asp:BoundField DataField="CD_PRODUCTO" HeaderText="CD_PRODUCTO" SortExpression="CD_PRODUCTO" />
                                    <asp:BoundField DataField="NU_PARTIDA" HeaderText="NU_PARTIDA" SortExpression="NU_PARTIDA" />--%>
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
                           <asp:SqlDataSource ID="sdsHistorialRemisiones" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_historialRemisionesRevision" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="CD_FOLIO" Type="String" />
                                    <asp:Parameter Name="CD_SUCURSAL" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                            <br />
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

