<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DatosGenerales.aspx.cs" Inherits="Examenes_DatosGenerales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />

    <link type="text/css" href="<%=Page.ResolveUrl("~/scriptsJS/ExamenesCss/table.css")%>" rel="stylesheet" />
    <div class="container">
        <h2>Datos Generales</h2>

        <div class="panel panel-default">
            <div class="panel-heading">
                Busqueda Empleados
            </div>
            <div class="panel-body">
                <div id="InputsSearch">
                    <div class="form-row">
                        <div class="col-md-2 mb-2">
                            <asp:TextBox ID="txtId" runat="server" CssClass="form-control numeric" placeholder="Id Paciente" ClientIDMode="Static"></asp:TextBox>
                        </div>
                        <div class="col-md-4 mb-4">
                            <asp:TextBox ID="txtNombreBuscar" runat="server" CssClass="form-control" placeholder="Nombre de Paciente"></asp:TextBox>
                        </div>
                        <div class="col-md-4 mb-4">
                            <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control" placeholder="Apellido Paterno"></asp:TextBox>
                        </div>
                        <div class="col-md-2 mb-2">
                            <div id="imgFecha">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" placeholder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-row pull-center">
                        <div class="col-md-4 mb-4">
                        </div>
                        <div class="col-md-2 mb-2">
                            <br />
                            <asp:Button ID="btnBuscar" runat="server" CssClass="form-control" BackColor="#007bff" ForeColor="White" Text="Buscar" OnClick="btnBuscar_Click" UseSubmitBehavior="false" ClientIDMode="Static" />
                        </div>
                        <div class="col-md-2 mb-2">
                            <br />
                            <asp:Button ID="btnLimpiar" runat="server" CssClass="form-control" BackColor="#929693" ForeColor="White" Text="Limpiar" UseSubmitBehavior="false" ClientIDMode="Static" OnClick="btnLimpiar_Click" />
                        </div>
                        <div class="col-md-4 mb-4">
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <br />
                        <asp:GridView ID="GridView1" runat="server"
                            CssClass="table table-bordered table-hover tablesorter"
                            EmptyDataText="No se encontraron clientes"
                            AutoGenerateColumns="false"
                            GridLines="None"
                            ClientIDMode="Static"
                            PageSize="20"
                            AllowPaging="true"
                            OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            DataKeyNames="DG_ID_ESTATUS" >

                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditar" runat="server" CssClass="form-control" ToolTip="Editar Registro" Text="Editar" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ClientIDMode="Static" UseSubmitBehavior="false" BackColor="#ffa200" ForeColor="White" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Estatus">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlEstatus" runat="server" CssClass="form-control" required="required" DataTextField="CAT_ESTATUS" DataValueField="ID_ESTATUS" ></asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="DG_ESTATUS" HeaderText="Estatus" />
                                <asp:BoundField DataField="ID_DG" HeaderText="ID" />
                                <asp:BoundField DataField="DG_NOMBRE" HeaderText="Nombre 1" SortExpression="DG_NOMBRE" />
                                <asp:BoundField DataField="DG_NOMBRE_2" HeaderText="Nombre 2" />
                                <asp:BoundField DataField="DG_APELLIDO_PATERNO" HeaderText="Apellido Paterno" />
                                <asp:BoundField DataField="DG_APELLIDO_MATERNO" HeaderText="Apellido Materno" />
                                <asp:BoundField DataField="DG_FECHA_NACIMIENTO" HeaderText="Fecha de Nacimiento" />


                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Examenes">
                                    <ItemTemplate>
                                        <%-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Imagenes/editar_25.png" ToolTip="Agregar Examen" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ClientIDMode="Static" />--%>
                                        <asp:LinkButton ID="lnkExamenGral" runat="server" Text="Examen General" Font-Size="Small" CommandName="ExamenGral" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkInterpretacion" runat="server" Text="Interpretacion" Font-Size="Small" CommandName="Interpretacion" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkToxicologico" runat="server" Text="Toxicologico" Font-Size="Small" CommandName="Toxicologico" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkLaboratorio" runat="server" Text="Laboratorio" Font-Size="Small" CommandName="Laboratorio" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkAudiometria" runat="server" Text="Audiometria" Font-Size="Small" CommandName="Audiometria" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkEspirometria" runat="server" Text="Espirometria" Font-Size="Small" CommandName="Espirometria" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkRadiologia" runat="server" Text="Radiologia" Font-Size="Small" CommandName="Radiologia" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                        <asp:LinkButton ID="LinkResumen" runat="server" Text="Resumen" Font-Size="Small" CommandName="Resumen" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                Pacientes
            </div>
            <div class="panel-body">

                <asp:Panel ID="pnlForm" runat="server" Visible="true">
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">PRIMER NOMBRE </label>
                            <asp:TextBox ID="txtDgNombre" runat="server" class="form-control" placeholder="Primer Nombre" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">SEGUNDO NOMBRE </label>
                            <asp:TextBox ID="txtDgNombre2" runat="server" class="form-control" placeholder="Primer Nombre"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">APELLIDO PATERNO </label>
                            <asp:TextBox ID="txtDgApellidoP" runat="server" class="form-control" placeholder="Paterno" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">APELLIDO MATERNO </label>
                            <asp:TextBox ID="txtDgApellidoM" runat="server" class="form-control" placeholder="Materno" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">FECHA DE NACIMIENTO </label>
                            <asp:TextBox ID="txtDgFechaNac" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" required="required" autocomplete="off"></asp:TextBox>

                            <%-- <input type="text" id="txtDgFechaNac" runat="server" CssClass="form-control datepicker" PlaceHolder="dd/mm/yyyy" required="required" />--%>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">SEXO</label>
                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control" placeholder="Masculino" DataTextField="CAT_SEX" DataValueField="ID_SEX" required="required"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">EMPRESA</label>
                            <asp:DropDownList ID="ddlEmpresa" runat="server" CssClass="form-control">
                                <asp:ListItem Text="PHRAC INTERNATIONAL S DE RL DE CV" Value="0185" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">ESTATUS</label>
                            <asp:DropDownList ID="ddlEstatus" runat="server" CssClass="form-control" Enabled="false" DataTextField="CAT_ESTATUS" DataValueField="ID_ESTATUS">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-row pull-right">
                        <br />
                        <div class="col-md-12 mb-6">
                            <asp:Button ID="btnGuardar" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Guardar" ClientIDMode="Static" OnClick="btnGuardar_Click" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>


    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/sweetalert.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.numeric.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
    <%--    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/HeaderGridView/jquery.tablesorter.js")%>"></script>--%>


    <script>
        $(document).ready(function () {
            $('#imgBtnEditar').submit(function () {
                $("input[type='submit']", this)
                  .val("Please Wait...")
                  .attr('disabled', 'disabled');
                return true;
            });

            $("#txtId").blur(function () {
                var idPaciente = $(this).val();
                if (idPaciente.length > 0) {
                    if (parseInt(idPaciente) <= 0) {
                        $(this).val("");
                    }
                }
            });
        });





    </script>
</asp:Content>

