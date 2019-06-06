<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="impresion_papeleta.aspx.cs" Inherits="Catalogos_Pacientes_impresion_papeleta" Title="PERFILES" %>
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
    </style>
  
    <div class="container">
        <asp:Panel ID="panelPDF" runat="server"> </asp:Panel>
        <h1>Papeleta</h1>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">PACIENTE: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtpaciente" class="form-control" runat="server" type="text" ReadOnly="True"></asp:TextBox>
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">RFC: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtrfc" class="form-control" runat="server" type="text" ReadOnly="True"></asp:TextBox>
                </div>
            </div>
            

              <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Empresa: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtempresa" class="form-control" runat="server" type="text" ReadOnly="True"></asp:TextBox>
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Perfil: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtperfil" class="form-control" runat="server" type="text" ReadOnly="True"></asp:TextBox>
                </div>
            </div>

             <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Fecha Alta: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtfechaAlta" class="form-control" runat="server" type="text" ReadOnly="True"></asp:TextBox>
                </div>

                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Folio: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="labfolio" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>

            

               
               <div class="row">
               <h1>EXAMENES</h1>
               <div class="form-group">
                   <div class="col-sm-12">

                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="100%" Font-Size="XX-Small" HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                           <AlternatingRowStyle BackColor="#CCCCCC" />
                           <Columns>
                               <asp:TemplateField HeaderText="ID EXAMEN">
                                   <EditItemTemplate>
                                       <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID_EXAMEN") %>'></asp:TextBox>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_EXAMEN") %>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small" CssClass="GridHeader" />
                                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:TemplateField>


                               <asp:TemplateField HeaderText="NOMBRE EXAMEN">
                                   <EditItemTemplate>
                                       <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NOMBRE_EXAMEN") %>'></asp:TextBox>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("NOMBRE_EXAMEN") %>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small" CssClass="GridHeader" />
                                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:TemplateField>



                               <asp:TemplateField HeaderText="PERFIL">
                                   <EditItemTemplate>
                                       <asp:CheckBox ID="CheckBox1" runat="server" disabled="disabled" BorderColor="Lime" BorderStyle="None" Font-Bold="True" />
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:CheckBox ID="CheckBox1" runat="server" disabled="disabled" BorderColor="Lime" BorderStyle="None" Font-Bold="True" />
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small" CssClass="GridHeader" />
                                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:TemplateField>


                           </Columns>
                           <FooterStyle BackColor="#CCCC99" />
                           <HeaderStyle BackColor="Teal" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                           <RowStyle BackColor="#ffffff" />
                           <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                           <SortedAscendingCellStyle BackColor="#FBFBF2" />
                           <SortedAscendingHeaderStyle BackColor="#848384" />
                           <SortedDescendingCellStyle BackColor="#EAEAD3" />
                           <SortedDescendingHeaderStyle BackColor="#575357" />
                       </asp:GridView>
                   </div>
               </div>
               </div>
              
                    
            <div class="row" >
                <div class="col-md-4"></div>
                <div class="col-sm-4" >
                       <asp:Button ID="btnpapeleta" runat="server" validationgroup="alta" style="background-color:GreenYellow;" class="form-control" ForeColor="black" Text="IMPRIMIR" OnClick="Alta_Papeleta"/>
                </div>
                <div class="col-md-4" ></div>
            </div>
             

            

        </div>

     <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> Launch demo modalaunch demo modal</button>
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

