<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditarPapeleta.aspx.cs" Inherits="Catalogos_Pacientes_EditarPapeleta" Title="Editar Papeleta" %>


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


     <div class="container">
     <h1>EDITAR PAPELETA</h1>
          <div class="form-group">
              <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">FOLIO: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtfolio" class="form-control" runat="server" type="text" placeholder="Folio" validationgroup="alta" Style="text-transform: uppercase" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqfolio" controltovalidate="txtfolio" validationgroup="editar" errormessage="ESCRIBE NO. DE FOLIO" SetFocusOnError="True" />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">FECHA: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtfecha" class="form-control" runat="server" type="text" placeholder="Fecha" validationgroup="editar" Style="text-transform: uppercase" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqfecha" controltovalidate="txtfecha" validationgroup="editar" errormessage="ESCRIBE FECHA" SetFocusOnError="True" />
                </div>
            </div>

           <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">VENDEDOR: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtvendedor" class="form-control" runat="server" type="text" placeholder="Vendedor" validationgroup="editar" Style="text-transform: uppercase" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtvendedor" validationgroup="editar" errormessage="ESCRIBE NOMBRE VENDEDOR" SetFocusOnError="True" />
                </div>
            </div>
               <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Nombre: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtnombre" class="form-control" runat="server" type="text" placeholder="NOMBRE" validationgroup="alta" Style="text-transform: uppercase" ></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqnombre" controltovalidate="txtnombre" validationgroup="editar" errormessage="ESCRIBE UN NOMBRE" SetFocusOnError="True" />
                </div>
            </div>

              <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Apellido Paterno: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtapaterno" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="APELLIDO PATERNO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqapaterno" validationgroup="editar" controltovalidate="txtapaterno" errormessage="ESCRIBE EL APELLIDO PATERNO" SetFocusOnError="True" />
                </div>
              </div>

             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Apellido Materno: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtmaterno" class="form-control" runat="server" validationgroup="alta" type="text" placeholder="APELLIDO MATERNO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqamaterno" controltovalidate="txtmaterno" validationgroup="editar" errormessage="ESCRIBE EL APELLIDO MATERNO" SetFocusOnError="True" />
                </div>
              </div>

              <div class="row">
                  <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Genero: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                 </div>
                 <div class="col-sm-4">
                      <asp:DropDownList ID="listgenero" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                       <asp:ListItem Value="1">FEMENINO</asp:ListItem>
                      <asp:ListItem Value="2">MASCULINO</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="reqsexo" validationgroup="editar" Text="Selecciona el Genero" InitialValue="0" ControlToValidate="listgenero" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                 </div>
                </div>

                 <div class="row">
                   <div class="col-sm-2">
                       <h5 class="align-middle pull-right">Fecha de Nacimiento: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                   </div>
                   <div class="col-sm-4">
                       <div id="imgFecha">
                                <asp:TextBox ID="fnac" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" placeholder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>
                                 <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="fnac" validationgroup="editar" errormessage="ESCRIBE LA FECHA DE NACIMIENTO" SetFocusOnError="True" />
                       </div>
                   </div>
                 </div></br>

               <div class="row">
                 <div class="col-sm-2">
                    <h5 class="align-middle pull-right">RFC: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtrfc" class="form-control" runat="server" type="text" placeholder="RFC" validationgroup="editar" Style="text-transform: uppercase" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqrfc" controltovalidate="txtrfc" validationgroup="editar" errormessage="ESCRIBE RFC" SetFocusOnError="True" />
                </div>
                <div class="col-sm-2" >
                       <asp:Button ID="BtnRFC" runat="server" validationgroup="alta1" style="background-color:Teal;" class="form-control" ForeColor="White" Text="Generar..." OnClick="RFC" Font-Bold="True" />
                </div>
               </div>


               <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">TELEFONO: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txttelefono" class="form-control" runat="server" type="Numbers" FilterType="Numbers" placeholder="TELEFONO" validationgroup="alta"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqtelefono" controltovalidate="txtTelefono" validationgroup="editar" errormessage="Escribe un Numero Telefonico" SetFocusOnError="True" />
                </div>
              </div>


                <div class="row">
                 <div class="col-sm-2">
                    <h5 class="align-middle pull-right">EMPRESA: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="empresa" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Empresaseleccionada" SetFocusOnError="True" Font-Bold="False" Font-Italic="False"></asp:DropDownList>
                    <asp:RequiredFieldValidator id="reqCliente" Text="SELECCIONA UNA EMPRESA" validationgroup="editar" InitialValue="0" ControlToValidate="empresa" Runat="server" SetFocusOnError="True" />
                </div>
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">PERFIL: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="perfil" class="form-control" runat="server" AutoPostBack="True" SetFocusOnError="True" Font-Bold="False" Font-Italic="False"></asp:DropDownList>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator6" validationgroup="editar" Text="SELECCIONA UN PERFIL" InitialValue="0" ControlToValidate="perfil" Runat="server" SetFocusOnError="True" />
                </div>
                </div>

                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">ESTATUS: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="ListEstatus" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="ACTIVO">ACTIVO</asp:ListItem>
                      <asp:ListItem Value="DUPLICADA">DUPLICADA</asp:ListItem>
                      <asp:ListItem Value="CORTESIA">CORTESIA</asp:ListItem>
                      <asp:ListItem Value="CONSIDERAR">NO CONSIDERAR</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator3" validationgroup="editar" Text="Selecciona el Estatus" InitialValue="0" ControlToValidate="ListEstatus" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
                </div>


                <br><br>
                <div class="row" >
                    <div class="col-md-4"></div>
                    <div class="col-sm-4" >
                           <asp:Button ID="btnguardar" runat="server" validationgroup="editar" style="background-color:Teal;" class="form-control" ForeColor="White" Text="GUARDAR" OnClick="BtnEditar" Font-Bold="True" />
                    </div>
                    <div class="col-md-4" ></div>
                </div>

          </div>
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