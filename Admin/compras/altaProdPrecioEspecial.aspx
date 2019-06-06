<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="altaProdPrecioEspecial.aspx.cs" Inherits="Admin_compras_altaProdPrecioEspecial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <style type="text/css">
        .divCss {
                position: absolute;
                left: 50%;
               
                
                margin-left: -150px;
 
                overflow: auto;
                border:2px solid black;
        }
        </style>
     <h2 style="text-align:center">
        INSERTAR PRODUCTOS PRECIO ESPECIAL - NIVELACION
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
       
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
        <ContentTemplate>
            <div id="divBusqueda" runat="server" class="divCss">
                <asp:Label ID="lblBusca" runat="server" Text="Id Producto: "></asp:Label>
                <br />
                <asp:TextBox ID="txtCD_Producto" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />
                &nbsp; 
            </div>
             <div id="divParametros" runat="server" visible="false" class="divCss" >
                 <Table ID="tblInserta" runat="server">
                     <tr>
                         <td>
                             <asp:Label ID="Label1" runat="server" Text="Producto: " Font-Bold="True" style="font-size: small"></asp:Label><br>
                             <asp:Label ID="lblCD_Producto" runat="server" style="font-size: small"></asp:Label><br>
                             <asp:Label ID="lblNB_Producto" runat="server" style="font-size: small"></asp:Label>
                             <br>
                             <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Marca: " style="font-size: small"></asp:Label>
                             <br>
                             <asp:Label ID="lblCD_Marca" runat="server" style="font-size: small"></asp:Label>
                             <br>
                             <asp:Label ID="lblNB_Marca" runat="server" style="font-size: small"></asp:Label>                            
                         </td>
                     </tr>
                     <tr>
                        <td style="vertical-align: top">
                             <asp:Label ID="Label9" runat="server" Text="Sucursal:" Font-Bold="True"></asp:Label>
                             <br>
                             <asp:DropDownList ID="lstPlazas" runat="server">
                                 <asp:ListItem Value="002">San Luis</asp:ListItem>
                                 <asp:ListItem Value="004">Celaya</asp:ListItem>
                                 <asp:ListItem Value="009">Irapuato</asp:ListItem>
                                 <asp:ListItem Value="003">Queretaro</asp:ListItem>
                             </asp:DropDownList>
                             <br />
                             <asp:Label ID="Label8" runat="server" Text="St Seguridad:" Font-Bold="True"></asp:Label>
                             <br />
                             <asp:DropDownList ID="lstStSeguridad" runat="server" Font-Size="8pt" SelectedValue='<%# Eval("NU_stockSeg") %>'>
                                 <asp:ListItem Value="1">Si</asp:ListItem>
                                 <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td style="vertical-align: top">
                             <asp:Label ID="Label10" runat="server" Text="Max Compra:" Font-Bold="True"></asp:Label>
                             <br />
                             <asp:TextBox ID="txtNU_MaxCompra" runat="server" ValidationGroup="Aceptar"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMaxCompra" runat="server" ControlToValidate="txtNU_MaxCompra" Display="Dynamic" ErrorMessage="campo requerido" Font-Size="7pt" ValidationGroup="Aceptar"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMaxCompra" runat="server" ControlToValidate="txtNU_MaxCompra" Display="Dynamic" ErrorMessage="Valor numerico" Font-Size="7pt" ValidationExpression="([1-9]+)" ValidationGroup="Aceptar"></asp:RegularExpressionValidator>
                             <br />
                             <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Comentarios:"></asp:Label>
                             <br />
                             <asp:TextBox ID="txtMotivo" runat="server" Font-Size="12px" TextMode="MultiLine"></asp:TextBox>
                             <br />
                             <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" ValidationGroup="Aceptar" />
                             <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                         </td>
                     </tr>
                     <tr>
                          <td>
                              <asp:SqlDataSource ID="sdsProductosSA" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>" SelectCommand="get_ProductosKSA_CD_Producto" SelectCommandType="StoredProcedure" InsertCommand="set_insertaProductosPrecioEspecialNivelacion" InsertCommandType="StoredProcedure" OnInserted="sdsProductosSA_Inserted">
                                  <InsertParameters>
                                      <asp:Parameter Name="CD_Almacen" Type="String" />
                                      <asp:Parameter Name="CD_Suc" Type="String" />
                                      <asp:Parameter Name="CD_Prod" Type="String" />
                                      <asp:Parameter Name="NB_Prod" Type="String" />
                                      <asp:Parameter Name="CD_Marca" Type="String" />
                                      <asp:Parameter Name="NB_Marca" Type="String" />
                                      <asp:Parameter Name="NU_MaxCompra" Type="Int32" />
                                      <asp:Parameter Name="NB_Motivo" Type="String" />
                                      <asp:Parameter Name="NU_StockSeg" Type="Int32" />
                                      <asp:Parameter Name="CD_Usuario" Type="Int32" />
                                      <asp:Parameter Direction="InputOutput" Name="msgResultado" Type="String" Size="100" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="txtCD_Producto" Name="CD_Producto" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                         </td>
                     </tr>
                 </Table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

