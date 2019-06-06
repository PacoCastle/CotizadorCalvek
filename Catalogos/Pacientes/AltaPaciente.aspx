<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaPaciente.aspx.cs" Inherits="Catalogos_Pacientes_AltaPaciente" Title="Alta Pacientes" %>
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

         .estilo_div {
             background: #ffffff;
             border: solid 3px teal;
             border-radius: 15px;
             box-shadow: 8px 8px 10px 0px #818181;
             height: 100%;
             width: 100%;

             display: flex;
             justify-content: center;
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
 <div class="container">

     <h1>ALTA PACIENTES</h1>
      <div class="form-group">

               

            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Nombre: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtnombre" class="form-control" runat="server" type="text" placeholder="NOMBRE" validationgroup="alta" Style="text-transform: uppercase" ></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqnombre" controltovalidate="txtnombre" validationgroup="alta" errormessage="ESCRIBE UN NOMBRE" SetFocusOnError="True" />
                </div>
            </div>

              <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Apellido Paterno: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtapaterno" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="APELLIDO PATERNO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" validationgroup="alta" controltovalidate="txtapaterno" errormessage="ESCRIBE EL APELLIDO PATERNO" SetFocusOnError="True" />
                </div>
              </div>

             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Apellido Materno: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtmaterno" class="form-control" runat="server" validationgroup="alta" type="text" placeholder="APELLIDO MATERNO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtmaterno" validationgroup="alta" errormessage="ESCRIBE EL APELLIDO MATERNO" SetFocusOnError="True" />
                </div>
              </div>

         

                <div class="row">
                   <div class="col-sm-2">
                       <h5 class="align-middle pull-right">Fecha de Nacimiento: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                   </div>
                   <div class="col-sm-4">
                       <div id="imgFecha">
                                <asp:TextBox ID="fnac" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" placeholder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>
                                 <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="fnac" validationgroup="alta" errormessage="ESCRIBE LA FECHA DE NACIMIENTO" SetFocusOnError="True" />
                       </div>
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
                       <asp:RequiredFieldValidator id="RequiredFieldValidator8" validationgroup="alta" Text="Selecciona el Genero" InitialValue="0" ControlToValidate="listgenero" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
             </div>
            
             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">TELEFONO: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtTelefono" class="form-control" runat="server" type="Numbers" FilterType="Numbers" placeholder="TELEFONO" validationgroup="alta"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqtelefono" controltovalidate="txtTelefono" validationgroup="alta" errormessage="Escribe un Numero Telefonico" SetFocusOnError="True" />
                </div>
              </div>



             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">RFC: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtrfc" class="form-control" runat="server" type="text" validationgroup="alta" placeholder="RFC" Style="text-transform: uppercase" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtrfc" validationgroup="alta" errormessage="Escribe RFC" SetFocusOnError="True" />
                </div>
                <div class="col-sm-2" >
                       <asp:Button ID="BtnRFC" runat="server" validationgroup="alta1" style="background-color:Teal;" class="form-control" ForeColor="White" Text="Generar..." OnClick="RFC" Font-Bold="True" />
                </div>
              </div>
              
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">RAZON SOCIAL: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
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
                    <asp:DropDownList ID="perfil" class="form-control" runat="server" AutoPostBack="True" SetFocusOnError="True" Font-Bold="False" Font-Italic="False" OnSelectedIndexChanged="SinPerfil"></asp:DropDownList>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator6" validationgroup="alta" Text="SELECCIONA UN PERFIL" InitialValue="0" ControlToValidate="perfil" Runat="server" SetFocusOnError="True" />
                </div>
              </div>
          <!------------------------------------------------------------------------------- SIN PERFIL--------------------------------------------------------------------------------->
             
               <div runat="server" id="div_sinperfil">
                 <div class="row">
                    <h1>EXAMENES</h1>
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
               </div>
         <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->

           <br><br><br><br>
           <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">COMENTARIOS:</h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtcomentarios" TextMode="multiline" Columns="50" Rows="5" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="COMENTARIOS" Style="text-transform: uppercase"></asp:TextBox>
                </div>
               <div class="col-sm-2">
                    <h5 class="align-middle pull-right">IMPRIMIR COMENTARIOS:</h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="DropDownListComentarios" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="1">SI</asp:ListItem>
                      <asp:ListItem Value="2">NO</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="reqStatus" Text="Selecciona el Estatus" InitialValue="0" validationgroup="alta" ControlToValidate="DropDownListComentarios" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
            </div>


            <br><br>
            <div class="row" >
                <div class="col-md-2"></div>
                 <div class="col-sm-4" >
                       <asp:Button ID="btnprev" runat="server" validationgroup="alta" style="background-color:Teal;" class="form-control" ForeColor="White" Text="VISTA PREVIA" OnClick="Btnprevia" Font-Bold="True" />
                </div>
                <div class="col-sm-4" >
                       <asp:Button ID="btnguardar" runat="server" validationgroup="alta" style="background-color:Teal;" class="form-control" ForeColor="White" Text="GUARDAR" OnClick="BtnGuardar" Font-Bold="True" />
                </div>
                <div class="col-md-2" ></div>
            </div>
        </div>








      <!-------------------------------------------------------------- PREVISUALIZAR--------------------------------------------------------------------------------->
     <asp:Label ID="prev" runat="server" Text="" BorderColor="Black" Font-Bold="True" Font-Size="X-Large"></asp:Label>
     <div runat="server" id="div_visualizar" class="estilo_div" >
     <div>
        <table border="0" style="width: 870px">
            
            <tr>
                <td style="width: 18867px; height: 40px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/logoAMI.png" Height="67px" Width="244px" />
                </td>
                <td style="width: 578px; height: 40px">
                    <table style="width: 225px">
                        <tr>
                            <td>
                                <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <font face="arial"><strong><span style="font-size: 9pt">Folio:
                                            <asp:Label ID="lbfolio" runat="server" Font-Italic="True" Font-Bold="True" Font-Size="11pt"></asp:Label></span></strong></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <font face="arial"><span style="font-size: 9pt">Fecha:</span><asp:Label ID="lblFecha" runat="server" Font-Bold="True" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
             <tr>
                <td colspan="2">
                     <table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 100%">
                                <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Paciente:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbpaciente" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                        <td style="font-size: 12pt; height: 16px"><b><font face="arial"><span style="font-size: 9pt"> RFC:</span></font></b></td>
                                        <td style="font-size: 12pt; height: 16px"><font face="arial"><asp:Label ID="lblRFC" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Razon Social:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"> <font face="arial"><asp:Label ID="lbrazonsocial" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                        <td style="font-size: 12pt; height: 16px"><b><font face="arial"><span style="font-size: 9pt">Empresa:</span></font></b></td>
                                        <td style="font-size: 12pt; height: 16px"><font face="arial"><asp:Label ID="lbempresa" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Perfil:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbperfil" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                       <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Fecha Alta</span></font></b></td>
                                       <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="labfechaalta" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt">Edad:</span></font></b></td>
                                        <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="lbedad" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                       <td style="height: 16px; width: 86px;"><b><font face="arial"><span style="font-size: 9pt"></span></font></b></td>
                                       <td style="height: 16px; width: 405px;"><font face="arial"><asp:Label ID="Label3" runat="server" Font-Size="9pt"></asp:Label></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                     </table>
                </td>
            </tr>
             <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lbexamen" runat="server" Text="" Font-Bold="true"  Font-Size="15pt"></asp:Label>
                </td>
            </tr>
        </table>
         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
     </div>
<!----------------------------------------------------------------- FIN DE PREVISUALIZAR-------------------------------------------------------------------------->
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