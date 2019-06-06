<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistroPacientes.aspx.cs" Inherits="Catalogos_Pacientes_RegistroPacientes" Title="Pacientes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
     <link type="text/css" href="<%=Page.ResolveUrl("~/scriptsJS/ExamenesCss/table.css")%>" rel="stylesheet" />
<script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
      <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
          }
      
      </script>
      
     <style type="text/css">
           .GridHeader{
	            color: white;
	            position: relative;
	            top: expression(this.offsetParent.scrollTop - 2);
	            background-color: teal;
	            font-weight: bold;
	            font-size: 12px;
                text-align:center;
            }
        </style>
     <asp:sqldatasource
        id="SqlDataSource1"
        runat="server"
        connectionstring="<%$ ConnectionStrings:KEPLER %>"
        selectcommand="SELECT ID_CTE, NOMBRE FROM TU_CG_CLIENTES order by NOMBRE;">
      </asp:sqldatasource>

 <div class="container">

     <h1>REGISTRO PACIENTES</h1>
     <div class="form-group">
         <div class="row">

             <div class="col-sm-3">
                 <asp:TextBox ID="txtrfcbuscar" Style="text-transform: uppercase" class="form-control" runat="server" type="text" placeholder="RFC" ValidationGroup="buscar"></asp:TextBox>
             </div>
             <div class="col-sm-3">
                 <asp:TextBox ID="txtpapeleta" class="form-control" runat="server" type="Numbers" placeholder="No. de Papeleta" validationgroup="buscar"></asp:TextBox>
             </div>
              <div class="col-sm-3">
                   <asp:DropDownList ID="listempresa" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="NOMBRE"  AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                    </asp:DropDownList>
              </div>
             <div class="col-sm-3">
                    <div id="imgFecha">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" placeholder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>
                            </div>
             </div>
         </div><br><br>
          <div class="row">
               <div class="col-sm-3"></div>
               <div class="col-sm-3">
                  <asp:Button ID="BtnBuscar" runat="server" validationgroup="buscar" style="background-color:teal" class="form-control" ForeColor="black" Text="BUSCAR" OnClick="BBuscar"/>
               </div>
              <div class="col-sm-3">
                  <asp:Button ID="BtnLimpiar" runat="server" validationgroup="buscar" style="background-color:teal" class="form-control" ForeColor="black" Text="LIMPIAR" OnClick="ACT"/>
               </div>
              <div class="col-sm-3"></div>
          </div>
     </div>
    
     <asp:GridView ID="GridView1" runat="server"  Width="100%" HeaderStyle-CssClass="GridHeader" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand" CaptionAlign="Bottom" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound">
              <AlternatingRowStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
              <Columns>
                  <asp:ButtonField AccessibleHeaderText="VER" ButtonType="Button" CommandName="VER" Text="VER" HeaderText="VER PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
                   <asp:ButtonField AccessibleHeaderText="EDITAR PAPELETA" ButtonType="Button" CommandName="EDITAR" Text="EDITAR" HeaderText="EDITAR PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
              </Columns>
              <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None">
              </HeaderStyle>
               
              <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
     
      
     <asp:GridView ID="GridView2" runat="server"  Width="100%" HeaderStyle-CssClass="GridHeader" HorizontalAlign="Center" OnRowCommand="GridView2_RowCommand" CaptionAlign="Bottom" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="10">
              <AlternatingRowStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
              <Columns>
                  <asp:ButtonField AccessibleHeaderText="VER" ButtonType="Button" CommandName="VER" Text="VER" HeaderText="PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
                   <asp:ButtonField AccessibleHeaderText="EDITAR PAPELETA" ButtonType="Button" CommandName="EDITAR" Text="EDITAR" HeaderText="EDITAR PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
              </Columns>
              <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None">
              </HeaderStyle>
               
              <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
     
     <asp:GridView ID="GridView3" runat="server"  Width="100%" HeaderStyle-CssClass="GridHeader" HorizontalAlign="Center" OnRowCommand="GridView3_RowCommand" CaptionAlign="Bottom" AllowPaging="True" OnPageIndexChanging="GridView3_PageIndexChanging">
              <AlternatingRowStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
              <Columns>
                  <asp:ButtonField AccessibleHeaderText="VER" ButtonType="Button" CommandName="VER" Text="VER" HeaderText="PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
                   <asp:ButtonField AccessibleHeaderText="EDITAR PAPELETA" ButtonType="Button" CommandName="EDITAR" Text="EDITAR" HeaderText="EDITAR PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
              </Columns>
              <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None">
              </HeaderStyle>
               
              <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
     
     <asp:GridView ID="GridView4" runat="server"  Width="100%" HeaderStyle-CssClass="GridHeader" HorizontalAlign="Center" OnRowCommand="GridView4_RowCommand" CaptionAlign="Bottom" AllowPaging="True" OnPageIndexChanging="GridView4_PageIndexChanging">
              <AlternatingRowStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
              <Columns>
                  <asp:ButtonField AccessibleHeaderText="VER" ButtonType="Button" CommandName="VER" Text="VER" HeaderText="PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
                   <asp:ButtonField AccessibleHeaderText="EDITAR PAPELETA" ButtonType="Button" CommandName="EDITAR" Text="EDITAR" HeaderText="EDITAR PAPELETA">
                  <ControlStyle BackColor="#3399FF" BorderColor="#0066FF" Font-Bold="True" />
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:ButtonField>
              </Columns>
              <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None">
              </HeaderStyle>
               
              <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
      
      <asp:Label ID="label_rfc" runat="server" Text="Label" Visible="False"></asp:Label><br>
      <asp:LinkButton ID="LINK_AGREGAR" Text="" runat="server" OnClick="AGREGAR_PERFIL" validationgroup="x"/>


     <div runat="server" id="div_agregar">
         <div class="row">
              <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Fecha de Alta: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                <asp:TextBox ID="fecha_alta" runat="server" class="form-control" validationgroup="alta" type="text" placeholder="DD/MM/YYYY" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator7" validationgroup="alta" controltovalidate="fecha_alta" errormessage="SELECCIONA TU FECHA DE NACIMIENTO" SetFocusOnError="True" />
                </div>
         </div>

         <div class="row">
             <div class="col-sm-2">
                 <h5 class="align-middle pull-right">RFC: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
             </div>
             <div class="col-sm-10">
                 <asp:TextBox ID="txtrfc" class="form-control" runat="server" type="text" ValidationGroup="alta" placeholder="RFC" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ValidationGroup="alta" ControlToValidate="txtrfc" ErrorMessage="ESCRIBE EL RFC" SetFocusOnError="True" />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                     ControlToValidate="txtrfc"
                     ErrorMessage="INGRESA RFC CORRECTO"
                     SetFocusOnError="True"
                     ValidationExpression="^[a-zA-Z]{3,4}(\d{6})((\D|\d){3})?$">
                 </asp:RegularExpressionValidator>
             </div>
         </div>

          <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">EMPRESA: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:DropDownList ID="empresa" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Empresaseleccionada" SetFocusOnError="True" Font-Bold="False" Font-Italic="False"></asp:DropDownList>
                    <asp:RequiredFieldValidator id="reqCliente" Text="SELECCIONA UNA EMPRESA" validationgroup="alta" InitialValue="0" ControlToValidate="empresa" Runat="server" SetFocusOnError="True" />
                </div>
              </div>


             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">PERFIL: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:DropDownList ID="perfil" class="form-control" runat="server" AutoPostBack="True" SetFocusOnError="True" Font-Bold="False" Font-Italic="False"></asp:DropDownList>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator6" validationgroup="alta" Text="SELECCIONA UN PERFIL" InitialValue="0" ControlToValidate="perfil" Runat="server" SetFocusOnError="True" />
                </div>
              </div>

              <div class="row" >
                <div class="col-md-4"></div>
                <div class="col-sm-4" >
                       <asp:Button ID="btnguardar" runat="server" validationgroup="alta" style="background-color:teal;" class="form-control" ForeColor="black" Text="GUARDAR" OnClick="BtnGuardar"/>
                    </div>
                <div class="col-md-4" ></div>
            </div>
     </div>
      
               
</div>



    <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Launch demo modalaunch demo modal</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
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