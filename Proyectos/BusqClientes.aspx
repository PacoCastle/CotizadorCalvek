<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusqClientes.aspx.cs" Inherits="Proyectos_BusqClientes" Title="Busqueda de Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BC</title>
    
    <script type="text/javascript">
        function SendParent(parClienteId,parNombre,parCalle, parColonia,parEstado) {
            retVal = { ClienteId: parClienteId, Nombre: parNombre, Calle: parCalle, Colonia: parColonia, Estado: parEstado };
            window.returnValue = retVal;
            window.close();
        }
    </script>
</head>
<%--<body onload="GetValues();">--%>
    <body>
    <form id="form1" runat="server">
   <div >
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <table style="background-color: #CCCCCC; border-style: inset; border-width: thin; vertical-align: top; text-align: center; height:100%;width:100%" >
                <tr>
                    <td colspan="2" style="text-align:left">
                        Buscar: 
                <asp:TextBox ID="txtParameter" runat="server"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                   <td style="text-align:left">
                     Buscar por:
                        <asp:RadioButtonList ID="rblTipoBusqueda" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                         <asp:ListItem Value="1" Selected="True">Id Cliente</asp:ListItem>
                         <asp:ListItem Value="2">Descripcion</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td style="text-align:right">
                        <asp:Button ID="btnBusca" runat="server" Text="Buscar" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:left">
                     
                        <asp:GridView ID="dgvClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id_Cte,NB_Cte,Suc" DataSourceID="sdsClientes" Font-Size="8pt" ForeColor="#333333" GridLines="None" onrowdatabound="dgvClientes_RowDataBound" onselectedindexchanged="dgvClientes_SelectedIndexChanged" PageSize="5">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnSelect" runat="server" CausesValidation="False" CommandName="Select" Font-Size="9pt" Text="√" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_Cte" HeaderText="Id Cliente" ReadOnly="True" SortExpression="id_Cte" >
                                <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NB_Cte" HeaderText="Cliente" ReadOnly="True" SortExpression="NB_Cte" >
                                 <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NB_Calle" ReadOnly="True" SortExpression="NB_Calle" HeaderText="Calle" >
                                 <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NB_Col"  ReadOnly="True" SortExpression="NB_Col" HeaderText="Colonia" >
                                 <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NB_Estado" ReadOnly="True" SortExpression="NB_Estado" HeaderText="Estado">
                                 <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="Suc" HeaderText="Sucursal" ReadOnly="True" SortExpression="Suc" >
                                 <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:Label ID="lblAux_Suc" runat="server" Visible="False"></asp:Label>
                        <br />
                        <asp:SqlDataSource ID="sdsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_buscaClienteRazonSocial_X_Parametro" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtParameter" Name="strParameter" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="rblTipoBusqueda" Name="tipoBusqueda" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="lblAux_Suc" Name="valSucursal" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                     
                    </td>
                </tr>
            </table>
              <br />
             

            <br />
        </ContentTemplate>

    </asp:UpdatePanel>
   </div>
   

        <%--<div>
        
     <table style="width: 100%">
        <tr>
            <td style="vertical-align: top; width: 99px;" >

                <asp:CheckBox ID="cbxClienteId" runat="server" Text="    Id Cliente" 
                    oncheckedchanged="cbxIdCliente_CheckedChanged" AutoPostBack="True" />
                <br />
                            
                <asp:CheckBox ID="cbxClienteDesc" runat="server" Text="    Cliente" 
                    oncheckedchanged="cbxClienteDesc_CheckedChanged" AutoPostBack="True" />
                            
                <br />

                <asp:Label ID="lblControl10" runat="server" ForeColor="Black" Font-Size=Small >Sucursal:</asp:Label>
                            
                                        
            </td>

            <td style="width: 5%; vertical-align: top;">

                <asp:TextBox ID="txtClienteId" runat="server" Enabled="False"></asp:TextBox>
                <br />
                            
                <asp:TextBox ID="txtClienteDesc" runat="server" Enabled="False"></asp:TextBox>
                            
                <br />
                            
                <asp:DropDownList ID="lstSucBusqueda" runat="server" DataSourceID="sdsSucBusqueda" DataTextField="texto"
                    DataValueField="sucursal">
                </asp:DropDownList>
                <br />
                            
                                        
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                    ValidationGroup="Inserta" onclick="btnBuscar_Click" />

                                        
            </td>
            <td style="width: 25%">

                <asp:GridView ID="dgvClientes" runat="server" CellPadding="4" Font-Size="8pt" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                                DataSourceID="sdsClientes" DataKeyNames="id_Cte, NB_Cte, Suc" 
                                onselectedindexchanged="dgvClientes_SelectedIndexChanged" 
                                AllowPaging="True" PageSize="3" 
                    onrowdatabound="dgvClientes_RowDataBound">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select"
                                        Text="√" Font-Size="9pt" />
                            </ItemTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="id_Cte" HeaderText="Id Cliente" ReadOnly="True" 
                            SortExpression="id_Cte" />
                        <asp:BoundField DataField="NB_Cte" HeaderText="Cliente" ReadOnly="True" 
                            SortExpression="NB_Cte" />
                        <asp:BoundField DataField="Suc" HeaderText="Sucursal" ReadOnly="True" 
                            SortExpression="Suc" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:DropDownList ID="lstSucAsigna" runat="server" DataSourceID="sdsSucAsigna" 
                                    DataTextField="texto" DataValueField="valor" Font-Size="8pt"  >                                   
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="sdsSucAsigna" runat="server" 
                                SelectCommand="get_comboOficinas_X_RazonSocial" 
                                ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblSuc_Aux" Name="strRazonSocial" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                                 </asp:SqlDataSource> 
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                            
                <asp:Label ID="lblSuc_Aux" runat="server" Visible="False"></asp:Label>
                            
                <asp:SqlDataSource ID="sdsClientes" runat="server" 
                    SelectCommand="get_buscaCliente_PagoFacturas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtClienteId" DefaultValue=" " 
                            Name="strClienteId" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtClienteDesc" DefaultValue="''" 
                            Name="strClienteDesc" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lstSucBusqueda" DefaultValue="000" 
                            Name="strSucursal" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsSucBusqueda" runat="server" 
                    SelectCommand="get_comboOficinas" 
                    ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>                            
                                        
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="lblResultado" runat="server" ForeColor="Red" Visible="False">Resultado</asp:Label>
            </td>
         </tr>
     </table>
                 
    </div>--%>
    </form>
</body>
</html>
