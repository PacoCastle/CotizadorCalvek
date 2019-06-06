<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Resumen.aspx.cs" Inherits="Examenes_Resumen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <div class="container">
        <h1>Resumen</h1>
        <div class="panel panel-default">
            <div class="panel-body">
                <h4 class="text-center">REPORTE DE EXAMEN MEDICO</h4>
                <div class="row">
                    <div class="col-sm-3">
                        <label class="control-label" for="inputSuccess">NOMBRE DEL CANDIDATO:</label>
                    </div>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtNombreCompleto" class="form-control" runat="server" type="text" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">SEXO:</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtSexo" CssClass="form-control" runat="server" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">EDAD:</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtEdad" class="form-control" runat="server" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">EMPRESA:</label>
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtEmpresa" class="form-control" runat="server" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">FECHA:</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtFecha" CssClass="form-control" runat="server" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <label class="control-label" for="inputSuccess">TIPO DE EXAMEN:</label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtTipoExamen" class="form-control" runat="server" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <label class="control-label" for="inputSuccess">PUESTO ASPIRANTE:</label>
                    </div>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPuesto" class="form-control" runat="server" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <h5 class="text-center">SIGNOS VITALES</h5>
                <div class="row">
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">TA / mmHg</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtTa" runat="server" MaxLength="50" CssClass="form-control " ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">F.C. / min</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtFcMIn" runat="server" MaxLength="50" CssClass="form-control " ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">F.R/ min</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtFrMin" runat="server" CssClass="form-control " MaxLength="50" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">T°</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtT" runat="server" CssClass="form-control " MaxLength="50" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">PESO / Kg</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtPesoKg" runat="server" MaxLength="6" CssClass="form-control" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">TALLA/ CM </label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtTallaCm" runat="server" MaxLength="6" CssClass="form-control" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="inputSuccess">IMC</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtImc" runat="server" CssClass="form-control" MaxLength="4" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <label class="control-label" for="IMPRESIÓN DIAGNOSTICAinputSuccess">COMPLEXION</label>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtComplexion" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                        <label class="control-label" for="inputSuccess">EXAMEN MEDICO: </label>
                        <asp:TextBox ID="txtExamenMedico" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">AUDIOMETRIA: </label>
                        <asp:TextBox ID="txtAudiometria" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                        <label class="control-label" for="inputSuccess">ESPIROMETRIA: </label>
                        <asp:TextBox ID="txtEspirometria" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                        <label class="control-label" for="inputSuccess">LABORATORIOS: </label>
                        <asp:TextBox ID="txtLaboratorio" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                        <label class="control-label" for="inputSuccess">RADIOGRAFIA: </label>
                        <asp:TextBox ID="txtRadiografias" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">EXAMEN TOXICOLOGICO: </label>
                        <asp:TextBox ID="txtToxicologico" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">OTROS: </label>
                        <asp:TextBox ID="txtComentarioOtros" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                         <h4 class="text-center">DICTAMEN DE APTITUD</h4>
                        <asp:TextBox ID="txtAptitud" runat="server" class="form-control" ReadOnly="true" TextMode="MultiLine" ></asp:TextBox>                        
                    </div>
                </div>
               <div class="form-row">
                   <label class="control-label" for="inputSuccess">OBSERVACIONES / COMENTARIOS / RECOMENDACIONES: </label>
                    <div class="col-md-12 mb-12">
                         <asp:TextBox ID="txtComentariosExamenMedico" runat="server" class="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <p class="text-center">ESPIROMETRIA, AUDIOMETRIA,  EXAMEN MEDICO Y VISUAL ANUAL</p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <asp:Image ID="imgFirmaRealizo" runat="server" CssClass="rounded center-block" Height="100" Width="100" Visible="false" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">Realizó EM:</label>
                        <asp:DropDownList ID="ddlRRealizoEM" runat="server" CssClass="form-control" required="required" AutoPostBack="true" OnSelectedIndexChanged="ddlRRealizoEM_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">CED. PROF.:</label>
                        <asp:TextBox ID="txtRCedProf" runat="server" CssClass="form-control numeric" MaxLength="100" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row pull-right">
                    <br />
                    <div class="col-md-12 mb-6">
                        <asp:Button ID="btnGuardar" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Guardar" ClientIDMode="Static" OnClick="btnGuardar_Click" />
                    </div>
                </div>
                <div class="form-row pull-right">
                    <br />
                    <div class="col-md-12 mb-6">
                        <asp:Button ID="btnReporte" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Generar" ClientIDMode="Static" OnClick="btnReporte_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
</asp:Content>

