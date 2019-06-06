<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" CodeFile="Nomina.aspx.cs" Inherits="Admin_Nomina_Nomina" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<style type="text/css">
  
.modalpopup
           {
               min-width:200px;
               min-height:150px;
               background:white;
               -webkit-border-radius: 5px;
               -moz-border-radius: 5px;
               border-radius: 5px;
               -webkit-box-shadow: 1px 1px 16px 0px rgba(255, 255, 255, 0.55);
               -moz-box-shadow:    1px 1px 16px 0px rgba(255, 255, 255, 0.55);        
           }

.modalBackground 
            {
                background-color: Black;
                filter: alpha(opacity=90);
                opacity: 0.8;
                z-index: 10001
                
            }

/* xp theme */
.CustomTabStyle .ajax__tab_header {font-family:verdana,tahoma,helvetica;font-size:13px;background:url('../../imagenes/Tabs/tab-line.gif') repeat-x bottom;}
.CustomTabStyle .ajax__tab_outer {padding-right:4px;background:url('../../imagenes/Tabs/tab-right.gif') no-repeat right;height:21px;}
.CustomTabStyle .ajax__tab_inner {padding-left:3px;background:url('../../imagenes/Tabs/tab-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_tab {height:13px;padding:4px;margin:0;background:url('../../imagenes/Tabs/tab.gif') repeat-x;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_outer {background:url('../../imagenes/Tabs/tab-hover-right.gif') no-repeat right;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_inner {background:url('../../imagenes/Tabs/tab-hover-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_hover .ajax__tab_tab {background:url('../../imagenes/Tabs/tab-hover.gif') repeat-x;}
.CustomTabStyle .ajax__tab_active .ajax__tab_outer {background:url('../../imagenes/Tabs/tab-active-right.gif') no-repeat right;}
.CustomTabStyle .ajax__tab_active .ajax__tab_inner {background:url('../../imagenes/Tabs/tab-active-left.gif') no-repeat;}
.CustomTabStyle .ajax__tab_active .ajax__tab_tab {background:url('../../imagenes/Tabs/tab-active.gif') repeat-x;}
.CustomTabStyle .ajax__tab_body {font-family:verdana,tahoma,helvetica;font-size:12px;border:1px solid #ffffff;border-top:0;padding:8px;background-color:#ffffff;}


    .style5
    {
        width: 68px;
    }


    .style7
    {
        width: 58px;
    }


    .style11
    {
        width: 117px;
        font-size: small;
    }


    .style13
    {
        width: 326px;
    }
    .style29
    {
        width: 128px;
    }
    

    .style96
    {
        width: 76px;
        font-size: small;
    }


    .style105
    {
        width: 110px;
    }
    .style106
    {
        width: 110px;
        font-size: small;
    }


    .style108
    {
        width: 490px;
    }


    .CustomTabStyle
    {}




    </style>
    <br />
    <br />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--<table style="vertical-align: top; width: auto; text-align: center;">--%>
        <asp:TabContainer ID="TabNomina" runat="server" ActiveTabIndex="0" 
        Height="1200px" Width="1041px" BorderStyle="None" CssClass="CustomTabStyle" 
        ScrollBars="Vertical">
        <asp:TabPanel runat="server" HeaderText="Póliza" ID="TPanel1">           
        <ContentTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%;">   
                        <tr>
                            <td class="style105" style="font-size: 12px"></td>
                            <td class="style7"></td>
                            <td class="style11"></td>
                            <td class="style96" style="text-align: right"></td>
                            <td class="style13"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style106" style="text-align: right">Razon:</td>
                            <td class="style5">
                                <asp:DropDownList ID="lstRazonP" runat="server" Font-Size="Small" 
                                    AutoPostBack="True" 
                                    onselectedindexchanged="lstRazonP_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="CSA">Calvek Sa</asp:ListItem>
                                    <asp:ListItem Value="CBJ">Calvek Componentea Bajío</asp:ListItem>
                                    <asp:ListItem Value="CCC">Calvek Componentes del Centro</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            <td class="style29"></td>
                            <td class="style96" style="text-align: right"></td>
                            <td class="style13"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style106" style="text-align: right">Año:</td>
                            <td class="style5">
                                <asp:DropDownList ID="lstAñoP" runat="server" DataSourceID="sdsAñoP" 
                                    DataTextField="año" DataValueField="año" Width="91px" Font-Size="Small" 
                                    AutoPostBack="True" onselectedindexchanged="lstAñoP_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="style29"></td>
                            <td class="style96" style="text-align: right"></td>
                            <td class="style13"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style106" style="text-align: right">Tipo Periodo:</td>
                            <td class="style5">
                                <asp:DropDownList ID="lstPeriodo" runat="server" Height="16px" Width="147px" 
                                    Font-Size="Small" AutoPostBack="True" 
                                    onselectedindexchanged="lstPeriodo_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="2">Semanal</asp:ListItem>
                                    <asp:ListItem Value="1">Extraordinario</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style29"></td>
                            <td class="style96" style="text-align: right"></td>
                            <td class="style13"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style106" style="text-align: right">Semana:</td>
                            <td class="style5">
                                <asp:DropDownList ID="lstSemanaP" runat="server" DataSourceID="sdsSeemanaP" 
                                    DataTextField="NUMEROPERIODO" DataValueField="NUMEROPERIODO" Font-Size="Small" 
                                    Height="19px" Width="54px" AutoPostBack="True" 
                                    onselectedindexchanged="lstSemanaP_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="style29"></td>
                            <td class="style96" style="text-align: right"></td>
                            <td class="style13"></td>
                            <td></td>
                        </tr>
                    </table>
                <table style="width: 100%;">
                        <tr>
                            <td style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">
                                &nbsp;</td>
                        </tr>
                    </table>
                <table style="width: 100%;">
                    <tr>
                        <td class="style108">
                            <asp:TextBox ID="txtDeptoPar" runat="server" Visible="False"></asp:TextBox>
                            <asp:TextBox ID="txtRegistroPPar" runat="server" Visible="False"></asp:TextBox>
                            <asp:TextBox ID="txtIdEmpleadoPar" runat="server" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                        <tr>
                            <td class="style108" style="text-align: center">
                                <asp:Label ID="lblresultado2" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style108" style="text-align: center">
                                <asp:Button ID="btnPolizaP" runat="server" Enabled="False" Font-Size="Small" 
                                    Height="20px" onclientclick="return confirm('Seguro de Generar Póliza?')" 
                                    Text="Genera Póliza" Width="170px" onclick="btnPolizaP_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style108">
                                &nbsp;</td>
                        </tr>
                    <tr>
                        <td class="style108">
                             <asp:GridView ID="dvgPanelDeptoP" runat="server" 
                                                AutoGenerateColumns="False" CellPadding="2" CellSpacing="2" 
                                                DataKeyNames="DEPARTAMENTO" DataSourceID="sdsPanelDeeptoP" 
                                                EnablePersistedSelection="True" HorizontalAlign="Center" 
                                 onrowdatabound="dvgPanelDeptoP_RowDataBound" ShowFooter="True" 
                                 onselectedindexchanged="dvgPanelDeptoP_SelectedIndexChanged" Width="723px">
                              <Columns>
                                    <asp:CommandField HeaderText="Departamento" SelectText="Sel" 
                                        ShowSelectButton="True">
                                    <ItemStyle Width="200px" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="Departamento" SortExpression="DEPARTAMENTO" 
                                        Visible="False">
                                               <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDepartamentoP" runat="server" 
                                                                Text='<%# Eval("DEPARTAMENTO") %>' 
                                                                CommandName='<%# Eval("DEPARTAMENTO") %>' 
                                                                oncommand="lnkDepartamentoP_Command" ForeColor="#3333FF" ></asp:LinkButton>
                                               </ItemTemplate>
                                    </asp:TemplateField>
                                                    

                                                    <asp:TemplateField HeaderText="Cargo" SortExpression="CARGO">
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblCargoP" runat="server" ForeColor="White"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" ForeColor="Black" 
                                                                Text='<%# Bind("CARGO", "{0:c}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Abono" SortExpression="ABONO">
                                        <FooterTemplate>
                                            <asp:Label ID="lblAbonoP" runat="server" ForeColor="White"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" ForeColor="Black" 
                                                Text='<%# Bind("ABONO", "{0:c}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dif" SortExpression="DIF">
                                        <FooterTemplate>
                                            <asp:Label ID="lblDifP" runat="server" ForeColor="White"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" ForeColor="Black" 
                                                Text='<%# Bind("DIF", "{0:c}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                    </asp:TemplateField>
                               </Columns>
                                     <FooterStyle BackColor="#003366" Font-Bold="True" 
                                     ForeColor="White" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#003366" ForeColor="White" Height="30px" />
                                    <SelectedRowStyle Font-Bold="True" Font-Size="12px" BackColor="Silver" />
                            </asp:GridView>
                        </td>
                    </tr>
                        <tr>
                            <td class="style108">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style108">
                                <asp:GridView ID="dvgPanelRPP" runat="server" DataSourceID="sdsPanelRegPP" 
                                    HorizontalAlign="Center" Width="951px" AutoGenerateColumns="False" 
                                    DataKeyNames="REGISTROPATRONAL" onrowdatabound="dvgPanelRPP_RowDataBound" 
                                    onselectedindexchanged="dvgPanelRPP_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField SelectText="Sel" ShowSelectButton="True" />
                                        <asp:TemplateField HeaderText="Registro P" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("REGISTROPATRONAL") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Departamento">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("DESC1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cargo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("CARGO", "{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Abono">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("ABONO", "{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("DIF", "{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#627A96" ForeColor="White" />
                                    <SelectedRowStyle BackColor="Silver" Font-Bold="True" Font-Size="12px" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style108">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style108">
                                <asp:GridView ID="dgvPanelEmpleadoP" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="sdsPanelEmpP" HorizontalAlign="Center" 
                                    onrowdatabound="dgvPanelEmpleadoP_RowDataBound" 
                                    onselectedindexchanged="dgvPanelEmpleadoP_SelectedIndexChanged" 
                                    Width="951px" DataKeyNames="idempleado">
                                    <Columns>
                                        <asp:CommandField SelectText="Sel" ShowSelectButton="True">
                                        <ItemStyle Width="30px" />
                                        </asp:CommandField>
                                        <asp:TemplateField HeaderText="Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("idempleado") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre">
                                            <ItemTemplate>
                                                <asp:Label ID="Label12" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="130px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="A Paterno">
                                            <ItemTemplate>
                                                <asp:Label ID="Label13" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("apellidopaterno") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="130px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="A Materno">
                                            <ItemTemplate>
                                                <asp:Label ID="Label14" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("apellidomaterno") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="130px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registro P" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("REGISTROPATRONAL") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Departamento">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("DESC1") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="200px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cargo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("CARGO", "{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Abono">
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("ABONO", "{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("DIF", "{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#627A96" ForeColor="White" />
                                    <SelectedRowStyle Font-Bold="True" BackColor="Silver" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style108">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style108">
                                
                                    <asp:GridView ID="dgvPanelEmpDetP" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="sdsDetalleEmpleado" HorizontalAlign="Center" Width="951px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label15" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("idempleado") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre">
                                            <ItemTemplate>
                                                <asp:Label ID="Label16" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="130px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="A Paterno">
                                            <ItemTemplate>
                                                <asp:Label ID="Label17" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("apellidopaterno") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="130px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Codigo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label27" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("codigoempleado") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="14px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Id">
                                            <ItemTemplate>
                                                <asp:Label ID="Label28" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("idconcepto") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Concepto">
                                            <ItemTemplate>
                                                <asp:Label ID="Label29" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("desc2") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="400px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Importe">
                                            <ItemTemplate>
                                                <asp:Label ID="Label30" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("importetotal","{0:c}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nat">
                                            <ItemTemplate>
                                                <asp:Label ID="Label31" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("NATURALEZA") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="15px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cuenta">
                                            <ItemTemplate>
                                                <asp:Label ID="Label32" runat="server" ForeColor="Black" 
                                                    Text='<%# Bind("CTA") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#627A96" ForeColor="White" />
                                    <SelectedRowStyle BackColor="Silver" Font-Bold="True" />
                                </asp:GridView>
                              
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="style108">
                                &nbsp;</td>
                        </tr>
                    <tr>
                        <td class="style108">
                            
                            <asp:SqlDataSource ID="sdsPanelDeeptoP" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:NOMINA %>" 
                                                SelectCommand="get_panel_departamento" SelectCommandType="StoredProcedure">
                                                

                                                <SelectParameters>
                                                    

                                                    <asp:ControlParameter ControlID="lstRazonP" Name="razon" 
                                                        PropertyName="SelectedValue" Type="String" />
                                                    

                                                    <asp:ControlParameter ControlID="lstAñoP" Name="año" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                    

                                                    <asp:ControlParameter ControlID="lstPeriodo" Name="tipo" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                    

                                                    <asp:ControlParameter ControlID="lstSemanaP" Name="semana" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                    

                                                </SelectParameters>
                                                

                                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsAñoP" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:NOMINA %>" 
                                                SelectCommand="get_obtiene_año" SelectCommandType="StoredProcedure">
                                                

                                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsSeemanaP" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:NOMINA %>" 
                                                SelectCommand="get_numero_semana" SelectCommandType="StoredProcedure">
                                                

                                                <SelectParameters>
                                                    

                                                    <asp:ControlParameter ControlID="lstAñoP" Name="año" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                    

                                                    <asp:ControlParameter ControlID="lstPeriodo" Name="tipo" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                    

                                                </SelectParameters>
                                                

                                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsPanelRegPP" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:NOMINA %>" 
                                SelectCommand="get_panel_RegistroP" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstRazonP" Name="razon" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstAñoP" Name="año" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstPeriodo" Name="tipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstSemanaP" Name="semana" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtDeptoPar" Name="depto" 
                                        PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsPanelEmpP" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:NOMINA %>" 
                                SelectCommand="get_panel_Empleado" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstRazonP" Name="razon" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstAñoP" Name="año" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstPeriodo" Name="tipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstSemanaP" Name="semana" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtDeptoPar" Name="depto" PropertyName="Text" 
                                        Type="String" />
                                    <asp:ControlParameter ControlID="txtRegistroPPar" Name="registrop" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsDetalleEmpleado" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:NOMINA %>" 
                                SelectCommand="get_panel_Detalle_Emp" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lstRazonP" Name="razon" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="lstAñoP" Name="año" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstPeriodo" Name="tipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="lstSemanaP" Name="semana" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtDeptoPar" Name="depto" PropertyName="Text" 
                                        Type="String" />
                                    <asp:ControlParameter ControlID="txtRegistroPPar" Name="registrop" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtIdEmpleadoPar" Name="idempleado" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                        </td>
                    </tr>
                                    

                     </table>
            </ContentTemplate>       
            </asp:UpdatePanel>                                       
        </ContentTemplate>
                  

        </asp:TabPanel>        
        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Catálogo">
        <HeaderTemplate>
             Catálogo
         </HeaderTemplate> 
         <ContentTemplate>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                 <ContentTemplate>
                            <table cellpadding="0" cellspacing="10" style="vertical-align: top; width: auto; text-align: center;">
                            <tr>
                                <td colspan="2" 
                                    style="height: 15px; text-align: center; background-color: #5d7b9d;">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="EMPLEADOS POR RAZON SOCIAL"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td  style="text-align: left">
                                    <asp:Label ID="Label5" runat="server" Font-Size="10pt" Text="Sucursal:"></asp:Label>
                                    <asp:DropDownList ID="lstRazonSocial" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsRazonSocial" DataTextField="NB_RAZONSOCIAL" 
                                        DataValueField="CD_RAZONSOCIAL" Font-Size="9pt">
                                    </asp:DropDownList>
                                </td>                                                          
                                <td  style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Label ID="Label1" runat="server" Font-Size="10pt" Text="Departamento:"></asp:Label>
                                    <asp:DropDownList ID="lstDepartamento" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsDepartamento" DataTextField="NB_DEPARTAMENTO" 
                                        DataValueField="CD_DEPARTAMENTO" Font-Size="9pt">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Label ID="Label9" runat="server" Font-Size="10pt" Text="Nombre:"></asp:Label>
                                    <asp:DropDownList ID="lstEmpleado" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsEmpleados" DataTextField="NB_EMPLEADO" 
                                        DataValueField="CD_EMPELADO" Font-Size="9pt">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsEstatus" 
                                            Height="21px" Width="192px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label33" runat="server" Font-Size="10pt" Text="Estatus:"></asp:Label>
                                            <asp:Label ID="lblEstatus" runat="server" text='<%#Eval("estadoempleado") %>' ForeColor="Black"> </asp:Label>
                                        </ItemTemplate>
                                        </asp:FormView>
                                    </td>
                                    <td style="text-align: left">
                                        &nbsp;</td>
                                </tr>
                            <tr style="text-align:center">
                                <td colspan="2">
                                    <asp:GridView ID="dgvCatalgo" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="2" DataSourceID="sdsCatalogo" 
                                        EmptyDataText="No se encontraron resultados para la busqueda" Font-Size="8pt" 
                                        ForeColor="#333333" GridLines="None" OnRowCommand="dgvCatalgo_RowCommand" 
                                        PageSize="25" OnSelectedIndexChanged="dgvCatalgo_SelectedIndexChanged" 
                                        DataKeyNames="CD_RAZONSOCIAL,CD_EMPLEADO,CD_CONCEPTO">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="NB_EMPLEADO" HeaderText="NOMBRE" ReadOnly="True" 
                                                SortExpression="NB_EMPLEADO" />
                                            <asp:BoundField DataField="CD_CONCEPTO" HeaderText="ID-CONC" ReadOnly="True" SortExpression="CD_CONCEPTO" />
                                            <asp:BoundField DataField="NB_CONCEPTO" HeaderText="DESCRIPCION" ReadOnly="True" SortExpression="NB_CONCEPTO" />
                                            <asp:TemplateField HeaderText="CTA" SortExpression="CD_CUENTA">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtCuenta" runat="server" AutoPostBack="True" Font-Size="10pt" Text='<%# Bind("CD_CUENTA") %>' ValidationGroup="Actualiza"></asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="rfvImporte3" runat="server" ControlToValidate="txtCuenta" Display="Dynamic" ErrorMessage="*Campo requerido" Font-Size="7pt" ValidationGroup="Actualiza"></asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCuenta" runat="server" Text='<%# Bind("CD_CUENTA") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="NAT" SortExpression="CD_NATURALEZA">
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblNaturaleza" runat="server" Text='<%# Eval("CD_NATURALEZA") %>' Visible="false"></asp:Label>
                                                    <asp:DropDownList ID="lstNaturaleza" runat="server" AutoPostBack="True" DataSourceID="sdsNaturaleza" DataTextField="CD_NATURALEZA" DataValueField="CD_NATURALEZA" Font-Size="9pt">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sdsNaturaleza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_NaturalezaCatalogoNomina" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblNaturaleza" Name="CD_NATURALEZA" PropertyName="Text" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CD_NATURALEZA") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:Button ID="Button7" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="True" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Update" Font-Size="8pt" Text="Actualizar" ValidationGroup="Actualizar" />
                                                    &nbsp;
                                                    <asp:Button ID="Button8" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" CommandName="Cancel" Font-Size="8pt" Text="Cancelar" />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button9" runat="server" BorderStyle="None" BorderWidth="0px" CausesValidation="False" CommandName="Edit" Font-Size="8pt" Text="Modificar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnDelete" Runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Delete" OnClientClick="return confirm('Esta seguro que desea eliminar el registro?');">Eliminar
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnNuevo" Runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Select" >Nuevo
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sdsCatalogo" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" DeleteCommand="set_deleteCatalogoNomina" SelectCommand="get_catalogoNomina" UpdateCommand="set_updateCatalogoNomina" DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter Name="CD_EMPLEADO" Type="Int32" />
                                            <asp:Parameter Name="CD_RAZONSOCIAL" Type="String" />
                                            <asp:Parameter Name="CD_CONCEPTO" Type="Int32" />
                                            <asp:Parameter DefaultValue="3" Name="CD_ACCION" Type="Int32" />
                                            <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lstRazonSocial" Name="CD_RAZONSOCIAL" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lstEmpleado" Name="CD_EMPLEADO" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lstDepartamento" Name="CD_DEPARTAMENTO" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="CD_EMPLEADO" />
                                            <asp:Parameter Name="CD_RAZONSOCIAL" />
                                            <asp:Parameter Name="CD_CONCEPTO" />
                                            <asp:Parameter Name="CD_CUENTA" />
                                            <asp:Parameter Name="CD_NATURALEZA" ConvertEmptyStringToNull="False" />
                                            <asp:Parameter DefaultValue="2" Name="CD_ACCION" Type="Int32" />
                                            <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sdsRazonSocial" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_razonSocialCatalogoNomina" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sdsEmpleados" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_empleadosCatalogoNomina" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lstRazonSocial" Name="CD_RAZONSOCIAL" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lstDepartamento" Name="CD_DEPARTAMENTO" 
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sdsDepartamento" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_departamentoEmpleadosCatalogoNomina" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lstRazonSocial" Name="CD_RAZONSOCIAL" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sdsEstatus" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                        SelectCommand="get_catalogoNomina_estatus" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lstRazonSocial" Name="CD_RAZONSOCIAL" 
                                                PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="lstEmpleado" Name="CD_EMPLEADO" 
                                                PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="lstDepartamento" Name="CD_DEPARTAMENTO" 
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        </ContentTemplate>
            </asp:UpdatePanel>
         </ContentTemplate>
      
        </asp:TabPanel>
    </asp:TabContainer>
    <%--<table style="vertical-align: top; width: auto; text-align: center;">--%>    <%--<table style="vertical-align: top; width: auto; text-align: center;">--%>



    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none"  />
    <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" DynamicServicePath="" Enabled="True" TargetControlID="btnInicial" BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
    </asp:ModalPopupExtender>
    <asp:Panel ID="PanelModal" runat="server">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <%--<table style="vertical-align: top; width: auto; text-align: center;">--%>
                <table style="background-color: #FFFFFF; border-style: inset; border-width: thin; vertical-align: top; text-align: center" cellpadding="0" cellspacing="10" >
                    <tr>
                        <td colspan="4" style="height: 15px; text-align: center; background-color: #5d7b9d;">
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="White" Height="17px" Text="ALTA CONCEPTO"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: left">                            
                            <asp:Label ID="Label11" runat="server" Font-Size="10pt" Text="Id Empleado:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtIdEmpleado" runat="server" Font-Size="9pt" Enabled="False"></asp:TextBox>
                        </td>
                          <td class="auto-style1" style="text-align: left">
                            <asp:Label ID="Label2" runat="server" Font-Size="10pt" Text="Nombre:"></asp:Label>
                              <br />
                            <asp:TextBox ID="txtEmpleado" runat="server" Font-Size="9pt" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                        </td>
                       <td class="auto-style1" style="text-align: left">
                            <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text="Razón Social:"></asp:Label>
                              <br />
                            <asp:TextBox ID="txtRazonSocial" runat="server" Font-Size="9pt" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: left">
                            <asp:Label ID="Label6" runat="server" Font-Size="10pt" Text="Id Depto:"></asp:Label>
                              <br />
                            <asp:TextBox ID="txtIdDepto" runat="server" Font-Size="9pt" Enabled="False"></asp:TextBox>
                        </td>
                        <td class="auto-style1" style="text-align: left" colspan="2">
                            <asp:Label ID="Label7" runat="server" Font-Size="10pt" Text="Departamento:"></asp:Label>
                              <br />
                            <asp:TextBox ID="txtDepto" runat="server" Font-Size="9pt" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: center" colspan="3">
                            <asp:Label ID="Label8" runat="server" Font-Size="10pt" Text="Descripción:"></asp:Label>
                              <br />
                            <asp:DropDownList ID="lstConceptos" runat="server" AutoPostBack="True" DataSourceID="sdsConceptos" DataTextField="NB_CONCEPTO" DataValueField="CD_CONCEPTO" Font-Size="9pt">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: center" colspan="3" >
                            <asp:Label ID="Label13" runat="server" Font-Size="10pt" Text="Cuenta:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtCuenta" runat="server" Font-Size="9pt" ValidationGroup="Inserta"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvImporte4" runat="server" ControlToValidate="txtCuenta" Display="Dynamic" ErrorMessage="*Campo requerido" Font-Size="7pt" ValidationGroup="Inserta"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: center" colspan="3" >
                            <asp:Label ID="Label14" runat="server" Font-Size="10pt" Text="Naturaleza:"></asp:Label>
                              <br />
                            <asp:Label ID="lblnat" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="lstNaturaleza" runat="server" AutoPostBack="True" DataSourceID="sdsNaturaleza" DataTextField="CD_NATURALEZA" DataValueField="CD_NATURALEZA" Font-Size="9pt">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: center" colspan="3">
                            <asp:ImageButton ID="btnInsertar" runat="server" ImageUrl="~/Imagenes/Ok (Custom).png" OnClick="btnInsertar_Click" Width="32px" ValidationGroup="Inserta" />
                            <asp:ImageButton ID="btnCerrarPopUp" runat="server" ImageUrl="~/Imagenes/Stop(Custom).png" OnClick="btnCerrarPopUp_Click" Width="32px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="text-align: center" colspan="3">
                           
                            <asp:SqlDataSource ID="sdsConceptos" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ConceptoCatalogoNomina" InsertCommand="set_insertaConceptoCatalogoNomina" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Name="CD_EMPLEADO" />
                                    <asp:Parameter Name="CD_RAZONSOCIAL" />
                                    <asp:Parameter Name="CD_CUENTA" />
                                    <asp:Parameter Name="CD_CONSOLIDAR" ConvertEmptyStringToNull="False" />
                                    <asp:Parameter Name="CD_CONCEPTO" />
                                    <asp:Parameter Name="NB_CONCEPTO" />
                                    <asp:Parameter Name="CD_NATURALEZA" ConvertEmptyStringToNull="False" />
                                    <asp:Parameter Name="CD_TIPO" ConvertEmptyStringToNull="False" />
                                    <asp:Parameter DefaultValue="1" Name="CD_ACCION" Type="Int32" />
                                    <asp:Parameter Name="CD_USUARIO" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtIdEmpleado" Name="CD_EMPLEADO" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtRazonSocial" Name="CD_RAZONSOCIAL" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsNaturaleza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_NaturalezaCatalogoNomina" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblnat" ConvertEmptyStringToNull="False" 
                                        DefaultValue=" " Name="CD_NATURALEZA" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <%--<asp:SqlDataSource ID="sdsNaturaleza" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_NaturalezaCatalogoNomina" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>--%>
                           
                            <%--<asp:SqlDataSource ID="sdsTipo" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_tipoConceptoCatalogoNomina" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtRazonSocial" Name="CD_RAZONSOCIAL" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="lstConceptos" Name="CD_CONCEPTO" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtIdEmpleado" Name="CD_EMPLEADO" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>--%>
                           
                        </td>
                    </tr>
                </table>
                
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

