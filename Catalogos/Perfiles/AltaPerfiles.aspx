<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaPerfiles.aspx.cs" Inherits="Catalogos_Perfiles_AltaPerfiles" Title="PERFILES" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
      <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
          }
        function Commentary() {
            $("#btncomentario").click();
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
  
    

      <asp:sqldatasource
        id="SqlDataSource1"
        runat="server"
        connectionstring="<%$ ConnectionStrings:KEPLER %>"
        selectcommand="SELECT ID_CTE, NOMBRE FROM TU_CG_CLIENTES order by NOMBRE;">
      </asp:sqldatasource>

      <asp:sqldatasource
        id="SqlDataSource2"
        runat="server"
        connectionstring="<%$ ConnectionStrings:KEPLER %>"
        selectcommand="select C2,C3 from KDUV order by C2">
      </asp:sqldatasource>

      

    <div class="container">



        <h1>ALTA DE PERFILES</h1>
        <div class="form-group">
            
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Asesor: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:DropDownList ID="lstAsesor" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="C3" DataValueField="C2" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator id="reqAsesor" Text="Selecciona un asesor" InitialValue="0" ControlToValidate="lstAsesor" Runat="server" SetFocusOnError="True" Font-Bold="False" Font-Italic="False" /> 
                </div>
            </div>
            

        </div>

         <div class="form-group">
                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Razon Social: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-5">
                    <asp:DropDownList ID="listcliente" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID_CTE"  AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator id="reqCliente" Text="Selecciona un Cliente" InitialValue="0" ControlToValidate="listcliente" Runat="server" SetFocusOnError="True" />
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Empresa: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtEmpresaPerfil" class="form-control" runat="server" type="text" placeholder="EMPRESA" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqempresa" controltovalidate="txtEmpresaPerfil" errormessage="Escribe el nombre de la empresa" SetFocusOnError="True" />
                </div>
                </div>

                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Contacto: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtContacto" class="form-control" runat="server" type="text" placeholder="CONTACTO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqcontacto" controltovalidate="txtContacto" errormessage="Escribe un nombre de contacto" SetFocusOnError="True" />
                </div>
                </div>

                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Email: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server" type="text" placeholder="example@dominio.com"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqemail" controltovalidate="txtEmail" errormessage="Escribe un Email" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Ingresa un email Valido"
                        SetFocusOnError="True"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$">
                </asp:RegularExpressionValidator>
                </div>
                </div>

             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Email 2: </h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtemail2" class="form-control" runat="server" type="text" placeholder="example@dominio.com"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ControlToValidate="txtemail2"
                        ErrorMessage="Ingresa un email Valido"
                        SetFocusOnError="True"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$">
                </asp:RegularExpressionValidator>
                </div>
                </div>

             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Email 3: </h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtemail3" class="form-control" runat="server" type="text" placeholder="example@dominio.com"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                        ControlToValidate="txtemail3"
                        ErrorMessage="Ingresa un email Valido"
                        SetFocusOnError="True"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$">
                </asp:RegularExpressionValidator>
                </div>
                </div>



                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Telefono: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtTelefono" class="form-control" runat="server" type="Numbers" FilterType="Numbers" placeholder="TELEFONO"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqtelefono" controltovalidate="txtTelefono" errormessage="Escribe un Numero Telefonico" SetFocusOnError="True" />
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Extension:</h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtextension" class="form-control" runat="server" type="Numbers" FilterType="Numbers" placeholder="EXTENSION"></asp:TextBox>
                </div>
                </div>

                 <div class="row">
                    <div class="col-sm-2">
                        <h5 class="align-middle pull-right">Puesto: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                    </div>
                     <div class="col-sm-10">
                    <asp:TextBox ID="txtpuesto" class="form-control" runat="server" type="text" placeholder="PUESTO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqpuesto" controltovalidate="txtpuesto" errormessage="Escribe el Puesto" SetFocusOnError="True" />
                    </div>
                  </div>

         </div>


          <div class="form-group">
                <div class="row">
                <h1>PERFIL</h1>
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Nombre: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNombrePerfil" class="form-control" runat="server" type="text" placeholder="NOMBRE PERFIL" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqnombre" controltovalidate="txtNombrePerfil" errormessage="Escribe un Nombre de Perfil" SetFocusOnError="True" />
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Tipo de Perfil: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="listatipoperfil" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="INGRESO">INGRESO</asp:ListItem>
                      <asp:ListItem Value="PERIODICO">PERIODICO</asp:ListItem>
                      <asp:ListItem Value="ESPECIAL">ESPECIAL</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator2" Text="Selecciona el Tipo de Perfil" InitialValue="0" ControlToValidate="listatipoperfil" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
                </div>


                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Proyecto: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtProyectoPerfil" class="form-control" runat="server" type="text" placeholder="PROYECTO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqproyecto" controltovalidate="txtProyectoPerfil" errormessage="Escribe el Nombre del Proyecto" SetFocusOnError="True" />
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Tipo Examen: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtTipoExamen" class="form-control" runat="server" type="text" placeholder="TIPO DE EXAMEN" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqtxtTipoExamen" controltovalidate="txtTipoExamen" errormessage="Escribe el Tipo de Examen" SetFocusOnError="True" />
                </div>
                </div>
                
                <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">T.E. ELECTRONICA: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="listaTEE" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="24 HORAS">24 HORAS</asp:ListItem>
                      <asp:ListItem Value="NO APLICA">NO APLICA</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator4" Text="Selecciona el Tiempo de Entrega Electronico" InitialValue="0" ControlToValidate="listaTEE" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>

                 <div class="col-sm-2">
                    <h5 class="align-middle pull-right">T.E. Fisico: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtTF" class="form-control" runat="server" type="text" placeholder="TIEMPO DE ENTEGA FISICO" Style="text-transform: uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" id="reqtxtTF" controltovalidate="txtTF" errormessage="Escribe el Tiempo de Entrega Fisico" SetFocusOnError="True" />
                </div>
                </div>


                <div class="row">
                  <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Forma de Entrega: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="listaformaentrega" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="FISICO">FISICO</asp:ListItem>
                      <asp:ListItem Value="ELECTRONICO">ELECTRONICO</asp:ListItem>
                      <asp:ListItem Value="AMBOS">AMBOS</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator5" Text="Selecciona la forma de Entrega" InitialValue="0" ControlToValidate="listaformaentrega" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
                
                 <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Formato de Reporte: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="listformatoreporte" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="REPORTE+EVALUACIONES">REPORTE+EVALUACIONES</asp:ListItem>
                      <asp:ListItem Value="REPORTE+CONCENTRADO+EVALUACIONES">REPORTE+CONCENTRADO+EVALUACIONES</asp:ListItem>
                      <asp:ListItem Value="SOLO REPORTE">SOLO REPORTE</asp:ListItem>
                      <asp:ListItem Value="SOLO CONCENTRADO">SOLO CONCENTRADO</asp:ListItem>
                      <asp:ListItem Value="SOLO EVALUACIONES">SOLO EVALUACIONES</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator6" Text="Selecciona el Formato de Reporte" InitialValue="0" ControlToValidate="listformatoreporte" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>

                </div>

                <div class="row">
                 <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Genero: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="listgenero" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="MASCULINO">MASCULINO</asp:ListItem>
                      <asp:ListItem Value="FEMENINO">FEMENINO</asp:ListItem>
                      <asp:ListItem Value="INDISTINTO">INDISTINTO</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator8" Text="Selecciona el Genero" InitialValue="0" ControlToValidate="listgenero" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Estatus: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                      <asp:DropDownList ID="DropDownListEstatus" class="form-control" runat="server">
                      <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                      <asp:ListItem Value="1">ACTIVADO</asp:ListItem>
                      <asp:ListItem Value="2">DESACTIVADO</asp:ListItem>
                      </asp:DropDownList>
                       <asp:RequiredFieldValidator id="reqStatus" Text="Selecciona el Estatus" InitialValue="0" ControlToValidate="DropDownListEstatus" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                </div>
                </div>
          </div>

               
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

               <div class="row">
                    <div class="col-sm-2">
                        <h5 class="align-middle pull-left">OTRO EXAMEN: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtagregar" class="form-control" runat="server" type="text" placeholder="OTRO EXAMEN" validationgroup="agregar" Style="text-transform: uppercase"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" validationgroup="agregar" controltovalidate="txtagregar" errormessage="AGREGA EL NOMBRE DEL EXAMEN" SetFocusOnError="True" />
                    </div>
                    <div class="col-sm-2">
                          <asp:Button ID="Button1" runat="server" validationgroup="agregar" style="background-color:teal;" class="form-control" ForeColor="White" Text="AGREGAR" OnClick="Agregar_Examen" Font-Size="Medium" />
                    </div>
               </div>


             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-left">COMENTARIOS:</h5>
                </div>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtcomentarios" TextMode="multiline" Columns="50" Rows="5" class="form-control" validationgroup="alta" runat="server" type="text" placeholder="COMENTARIOS" Style="text-transform: uppercase"></asp:TextBox>
                </div>
            </div>




               <div class="form-group"><br><br>
                    <div class="row">
                       <div class="col-sm-6">
                          <asp:Button ID="btnLimpiar" runat="server" style="background-color:teal;" class="form-control" ForeColor="White" Text="Limpiar" OnClick="btnLimpiar_Click" Font-Size="Medium" />
                       </div>
                       <div class="col-sm-6">
                       <asp:Button ID="btnGuardar" runat="server" style="background-color:teal;" class="form-control" ForeColor="White" Text="Guardar" OnClick="btnGuardar_Click1" Font-Size="Medium" />
                            
                       </div>
                   </div>
               </div>
        </div>

     <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
        data-toggle="modal" data-target="#myModal">
        Launch demo modalaunch demo modal</button>
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