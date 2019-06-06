<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CapturaRegistro.aspx.cs" Inherits="Catalogos_Pacientes_CapturaRegistro" Title="Pacientes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
      <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
          }
          

      </script>
    <style type="text/css">
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            z-index: 1000 !important;
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
            z-index: 2000 !important;
        }
        .ajax__calendar
        {
            z-index: 3000 !important;
        }
       
        .GridHeader{
	        color: white;
	        position: relative;
	        top: expression(this.offsetParent.scrollTop - 2);
	        background-color: teal;
	        font-weight: bold;
	        font-size: 12px;
            text-align:center;
        }

            .rptr table
            {
             background: #eee;
             font: 9px arial;
             border-collapse: collapse;
             width: 18%;
             margin: 5px;
             float: left;
            }
            .rptr table th
            {
             background: Teal;
             color: #fff;
             padding: 8px 10px;
             text-align: center;
            }
            .rptr table td
            {
             padding: 5px 10px;
             text-align: center;
            }
    </style>
    <link type="text/css" href="<%=Page.ResolveUrl("~/scriptsJS/ExamenesCss/table.css")%>" rel="stylesheet" />
 <div class="container">

     <h1>CAPTURA REGISTROS</h1>
     <div class="form-group">
         <div class="row"> 
             <div class="col-sm-2">
                        <h5 class="align-middle pull-right">PAPELETA: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
             </div>
             <asp:ScriptManager ID="ScriptManager1" runat="server">
                     </asp:ScriptManager>
             <div class="col-sm-4">
                            <asp:TextBox ID="txtpapeleta" class="form-control" runat="server" type="Numbers" placeholder="#" validationgroup="papeleta"></asp:TextBox>
                             <cc1:FilteredTextBoxExtender ID="ftbeNoPedimento" runat="server" FilterType="Numbers" TargetControlID="txtpapeleta"></cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator5" validationgroup="papeleta" controltovalidate="txtpapeleta" errormessage="NO. DE PAPELETA" SetFocusOnError="True" />
                            
             </div>
             <div class="col-sm-2" >
                           <asp:Button ID="BtnPaoeleta" runat="server" validationgroup="papeleta" style="background-color:DodgerBlue" class="form-control" ForeColor="black" Text="BUSCAR" OnClick="BtnBuscar"/>
            </div>


         </div>
     </div>


     <div runat="server" id="div_agregar">
      <div class="row">
               <h1><asp:Label ID="hedaer_ex" runat="server" Text=""></asp:Label></h1>
                   <asp:Label ID="textfol" runat="server" Text=""></asp:Label>
                   <asp:Label ID="folio" runat="server" Text=""></asp:Label>
                   
               <div class="form-group">
                   <div class="col-sm-12">
                          <asp:Repeater ID="Repeater1" runat="server">
                              <ItemTemplate>
                                  <div class="rptr">
                                  <table>
                                  <tr><th><%#Eval("ID_EXAMEN") %></th></tr>
                                  <tr><td><%#Eval("NOMBRE_EXAMEN") %></td></tr>
                                  <tr><td><asp:checkbox ID="chkbx" runat="server" value='<%#Eval("ID_EXAMEN") %>' /></td></tr>
                                  </table>           
                                  </div>
                              </ItemTemplate>
                         </asp:Repeater>
                   </div>
               </div>
     </div>


           <br>
               <div class="row">
                <div class="col-sm-3">
                     <h5 class="align-middle pull-center">Descripcion: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-3">
                     <h5 class="align-middle pull-center">Cantidad: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-3">
                     <h5 class="align-middle pull-center">Costo: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
               <div class="col-sm-3">
                </div>
            </div>
           
            <div class="row">
                <div class="col-sm-3">
                    <asp:TextBox ID="descripcion" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="Descripcion" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqdesc" controltovalidate="descripcion" validationgroup="alta" errormessage="Ingresa Descripcion" SetFocusOnError="True" />
                </div>
                <div class="col-sm-3">
                       <asp:TextBox ID="cantidad" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="Cantidad" Style="text-transform: uppercase"></asp:TextBox>
                      <asp:RequiredFieldValidator runat="server" id="reqcantidad" controltovalidate="cantidad" validationgroup="alta" errormessage="Ingresa Cantidad" SetFocusOnError="True" />
                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="cantidad"></cc1:FilteredTextBoxExtender>
                </div>
                <div class="col-sm-3">
                     <asp:TextBox ID="costo" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="Costo" Style="text-transform: uppercase"></asp:TextBox>
                     <asp:RequiredFieldValidator runat="server" id="reqcosto" controltovalidate="costo" validationgroup="alta" errormessage="Ingresa Costo" SetFocusOnError="True" />
                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers, Custom" ValidChars="."  TargetControlID="costo"></cc1:FilteredTextBoxExtender>
                </div>
                 <div class="col-sm-3">
               <asp:Button ID="agregar" runat="server" validationgroup="alta" style="background-color:teal;" class="form-control" ForeColor="White" Text="Agregar" OnClick="Btnagregar" Font-Bold="True" />
                 </div>
               </div>

            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#006666" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-ForeColor="White" HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" BorderColor="Black" BorderStyle="Solid">
                        <Columns>

                        <asp:TemplateField HeaderText="ELIMINAR SERVICIO" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                     
                            <ItemTemplate>
                                <asp:LinkButton ID="lkbver" Text="ELIMINAR" runat="server" onclick="Eliminar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                          </asp:TemplateField>
                        </Columns> 
                    </asp:GridView>
                </div>
            </div>

            <br>
            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-2">
                     <asp:Label ID="Label1" runat="server" Text="" ForeColor="Black" Font-Bold="True" Font-Size="Larger"></asp:Label>
                     <asp:Label ID="Label2" runat="server" Text="" ForeColor="Black" Font-Size="Larger" Font-Bold="True"></asp:Label>
                </div>
                <div class="col-sm-2"></div>
            </div>
           <br>
           <div class="row">
                <div class="col-sm-3"> </div>
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Estatus: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="DropDownListEstatus" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="1">COMPLETO</asp:ListItem>
                      <asp:ListItem Value="2">INCOMPLETO</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="reqStatus" Text="Selecciona el Estatus" InitialValue="0" validationgroup="x" ControlToValidate="DropDownListEstatus" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
               <div class="col-sm-3"> </div>
          </div>
         <br>


         <div class="row" >
                <div class="col-md-4"></div>
                <div class="col-sm-4" >
                       <asp:Button ID="btnguardar" runat="server" validationgroup="x" style="background-color:teal;" class="form-control" ForeColor="black" Text="GUARDAR" OnClick="BtnGUARDAR" Font-Bold="True" /></div>
                <div class="col-md-4" ></div>
            </div>

</div> <!-- Fin de Div Agregar -->
      </div>
     
       <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Launch demo modalaunch demo modal</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                </div>
            </div>

        </div>
     </div>

</asp:Content>