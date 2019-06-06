<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminDoctores.aspx.cs" Inherits="Catalogos_Doctores_AdminDoctores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
    <div class="container">
        <h2>Doctores</h2>

        <div class="panel panel-default">
            <div class="panel-heading">
                Busqueda Doctores
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-10 mb-10">
                        <asp:TextBox ID="txtNombreBuscar" runat="server" CssClass="form-control" placeholder="Busqueda de Doctor"></asp:TextBox>
                    </div>
                    <div class="col-md-2 mb-2">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="form-control" BackColor="#007bff" ForeColor="White" Text="Buscar" OnClick="btnBuscar_Click" UseSubmitBehavior="false" />
                    </div>

                </div>

                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <br />
                        <asp:GridView ID="gvDoctores" runat="server"
                            CssClass="table table-bordered table-hover"
                            EmptyDataText="No se encontraron doctores"
                            AutoGenerateColumns="False"
                            GridLines="None"
                            ClientIDMode="Static"
                            OnRowCommand="gvDoctores_RowCommand">

                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditar" runat="server" CssClass="form-control" ToolTip="Editar Registro" Text="Editar" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ClientIDMode="Static" UseSubmitBehavior="false" BackColor="#ffa200" ForeColor="White" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID_DOCTOR" HeaderText="ID" />
                                <asp:BoundField DataField="DOC_NOMBRE" HeaderText="Nombre 1" />
                                <asp:BoundField DataField="DOC_NOMBRE_2" HeaderText="Nombre 2" />
                                <asp:BoundField DataField="DOC_APELLIDO_PATERNO" HeaderText="Apellido Paterno" />
                                <asp:BoundField DataField="DOC_APELLIDO_MATERNO" HeaderText="Apellido Materno" />
                                <asp:BoundField DataField="DOC_CEDULA_PROFESIONAL" HeaderText="Cedula Profesional" />
                                <asp:TemplateField HeaderText="Imagen">
                                    <ItemTemplate>
                                        <img src='<%# Eval("DOC_URL_FIRMA") %>' height="100" width="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnDOC_URL_FIRMA" runat="server" Value='<%#Eval("DOC_URL_FIRMA") %>' />
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
                Doctores
            </div>
            <div class="panel-body">

                <asp:Panel ID="pnlForm" runat="server" Visible="true">

                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">PRIMER NOMBRE </label>
                            <asp:TextBox ID="txtDocNombre" runat="server" class="form-control" placeholder="Primer Nombre" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">SEGUNDO NOMBRE </label>
                            <asp:TextBox ID="txtDocNombre2" runat="server" class="form-control" placeholder="Segundo Nombre"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">APELLIDO PATERNO </label>
                            <asp:TextBox ID="txtDocApellido" runat="server" class="form-control" placeholder="Paterno" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">APELLIDO MATERNO </label>
                            <asp:TextBox ID="txtDocApellido2" runat="server" class="form-control" placeholder="Materno"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">CEDULA PROFESIONAL </label>
                            <asp:TextBox ID="txtDocCedulaProfesional" runat="server" CssClass="form-control" ClientIDMode="Static" PlaceHolder="Número de Cedula" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label class="control-label" for="inputSuccess">FIRMA</label>
                            <asp:Image ID="imgDocFirma" runat="server" CssClass="form-control" ClientIDMode="Static" required="required" Visible="false" Height="100" Width="100" />
                            <asp:FileUpload ID="fuDocFirma" runat="server" CssClass="form-control" ClientIDMode="Static" />
                            <asp:Label class="control-label" for="inputSuccess" ID="lblEstatusCarga" runat="server"></asp:Label>
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

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    
</asp:Content>

