<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Perfiles.aspx.cs" Inherits="Catalogos_Perfiles_ModificaPerfiles" Title="PERFILES" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <script type="text/javascript">
          function ShowPopup() {
            $("#btnShowPopup").click();
          }

           function modal_ver() {
            $("#btnver").click();
          }
            function modal_editar() {
            $("#btneditar").click();
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

            .header{
	            color: white;
	            position: relative;
	            top: expression(this.offsetParent.scrollTop - 2);
	            background-color: teal;
	            font-weight: bold;
	            font-size: 12px;
                text-align:center;
            }
             .tr1{
	            color: black;
	            position: relative;
	            top: expression(this.offsetParent.scrollTop - 2);
	            background-color: Gainsboro;
	            font-weight: lighter;
	            font-size: 10px;
                text-align:center;
            }
             .tr2{
	            color: black;
	            position: relative;
	            top: expression(this.offsetParent.scrollTop - 2);
	            background-color: white;
	            font-weight: lighter;
	            font-size: 10px;
                text-align:center;
            }
        </style>

     <asp:sqldatasource
        id="SqlDataSource1"
        runat="server"
        connectionstring="<%$ ConnectionStrings:cotizadorCS %>"
        selectcommand="SELECT id_perfil, EMPRESA2, Perf_Descripcion from TU_PER_CAT_PERFILES ORDER BY Perf_Descripcion ASC">
      </asp:sqldatasource>

    <div class="container">
        <h1>PERFILES</h1>
         <asp:GridView ID="GridView1" runat="server" DataKeyNames="id_perfil" EnableViewState="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="20">
    
        <Columns>
            <asp:BoundField DataField="id_perfil" HeaderText="ID PERFIL" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            <HeaderStyle CssClass="GridHeader"/>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>


            <asp:TemplateField HeaderText="NOMBRE PERFIL" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
             <HeaderStyle CssClass="GridHeader" />
            <ItemTemplate>
                    <asp:Label runat="server" Text='<%# String.Format("{0}-{1}", Eval("EMPRESA2"), Eval("Perf_Descripcion"))%>' ForeColor="Black" />
            </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="VER" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            <HeaderStyle CssClass="GridHeader" />
            <ItemTemplate>
                <asp:LinkButton ID="lkbver" Text="ver" runat="server" onclick="Mver" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
            </ItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            

            <asp:HyperLinkField text="editar" HeaderText="EDITAR" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                NavigateUrl="~/Catalogos/Perfiles/editar_perfil.aspx" DataNavigateUrlFields="id_perfil" DataNavigateUrlFormatString="~/Catalogos/Perfiles/editar_perfil.aspx?id_perfil={0}">
             <HeaderStyle CssClass="GridHeader" />

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:HyperLinkField>

           <%--<asp:TemplateField HeaderText="ELIMINAR" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            <HeaderStyle CssClass="GridHeader" />
            <ItemTemplate>
               <asp:LinkButton ID="lkbeliminar" Text="eliminar" runat="server" onclick="Meliminar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
            </ItemTemplate>
            </asp:TemplateField>--%>

        </Columns>

             <PagerSettings PageButtonCount="20" />

    </asp:GridView>
                            
    </div>




     <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> Launch demo modal</button>
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


    <button type="button" style="display: none;" id="btnver" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal_ver"> Launch demo modal</button>
     <div id="myModal_ver" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <asp:Label ID="labver_titulo" runat="server" Text=""></asp:Label></h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                     <tr class="header">
                         <th style="text-align: center" colspan="2"><asp:Label ID="labver_header" runat="server" Text="" ForeColor="White"></asp:Label></th>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right" class="col-sm-2">ASESOR:</td>
                         <td class="col-sm-4"  style="text-align: center"><asp:Label ID="labver_asesor" runat="server" Text="" ForeColor="Black"></asp:Label> </td>
                     </tr>
                     <tr class="tr1">
                         <td style="text-align: right">FECHA DE ALTA:</td>
                         <td style="text-align: center"><asp:Label ID="labver_fechaalta" runat="server" Text="" ForeColor="Black"></asp:Label> </td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">RAZON SOCIAL:</td>
                         <td style="text-align: center"><asp:Label ID="labver_cliente" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                      <tr class="tr1">
                         <td style="text-align: right">EMPRESA:</td>
                         <td style="text-align: center"><asp:Label ID="labver_empresa" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">NOMBRE DEL CONTACTO:</td>
                         <td style="text-align: center"><asp:Label ID="labver_contacto" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr1">
                         <td style="text-align: right">EMAIL:</td>
                         <td style="text-align: center"><asp:Label ID="labver_email" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">TELEFONO:</td>
                         <td style="text-align: center"><asp:Label ID="labver_telefono" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr1">
                         <td style="text-align: right">PUESTO DEL CONTACTO:</td>
                         <td style="text-align: center"><asp:Label ID="labver_puesto" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                        

                     <tr class="tr2">
                         <td style="text-align: right">NOMBRE DEL PERFIL:</td>
                         <td style="text-align: center"><asp:Label ID="labver_nombreperfil" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                   
                     <tr class="tr1">
                         <td style="text-align: right">PROYECTO:</td>
                         <td style="text-align: center"><asp:Label ID="labver_proyecto" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">T.E ELECTRONICA:</td>
                         <td style="text-align: center"><asp:Label ID="labver_teelectronica" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr1">
                         <td style="text-align: right">T.E FISICA:</td>
                         <td style="text-align: center"><asp:Label ID="labver_tefisica" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">FORMA DE ENTREGA:</td>
                         <td style="text-align: center"><asp:Label ID="labver_eexpediente" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr1">
                         <td style="text-align: right">TIPO EXAMEN:</td>
                         <td style="text-align: center"><asp:Label ID="labver_tipoexamen" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">GENERO:</td>
                         <td style="text-align: center"><asp:Label ID="labver_genero" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                      <tr class="tr1">
                         <td style="text-align: right">TIPO DE PERFIL:</td>
                         <td style="text-align: center"><asp:Label ID="labver_tperfil" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr2">
                         <td style="text-align: right">FORMATO DE REPORTE:</td>
                         <td style="text-align: center"><asp:Label ID="labver_freporte" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>
                     <tr class="tr1">
                         <td style="text-align: right">ESTATUS:</td>
                         <td style="text-align: center"><asp:Label ID="labver_estatus" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>

                     <tr class="tr2">
                         <td style="text-align: right">CONTENIDO:</td>
                         <td style="text-align: center"><asp:Label ID="labver_examenes" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>

                      <tr class="tr1">
                         <td style="text-align: right">COMENTARIOS:</td>
                         <td style="text-align: center"><asp:Label ID="lbcomentarios" runat="server" Text="" ForeColor="Black"></asp:Label></td>
                     </tr>

                         <tr class="tr2">
                         <th style="text-align: center" colspan="2"> <button style="background-color:teal;" type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button></th>
                         </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>







    <button type="button" style="display: none;" id="btneditar" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalEditar"> Launch demo modal</button>
     <div id="myModalEditar" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <asp:Label ID="labeditar_titulo" runat="server" Text=""></asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="labeditar" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>