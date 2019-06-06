<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Interpretacion.aspx.cs" Inherits="Examenes_Interpretacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <div class="container">
        <h2>Interpretación</h2>
        <div class="panel panel-default">
            <div class="panel-heading">
                Examen de Interpretación
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                      <%--  <label class="control-label" for="inputSuccess">AUDIOMETRIA </label>--%>
                        <asp:LinkButton ID="lnkAudio" runat="server" CssClass="control-label" OnClick="lnkAudio_Click" Text="AUDIOMETRIA"></asp:LinkButton>
                        <asp:TextBox ID="txtAudiometria" runat="server" class="form-control" placeholder="Audiometria" MaxLength="250" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIOS: </label>
                        <asp:TextBox ID="txtAudiometriaComent" runat="server" class="form-control" placeholder="Comentarios Audiometria" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                        <asp:LinkButton ID="lnkEspiro" runat="server" OnClick="lnkEspiro_Click" Text="ESPIROMETRIA"></asp:LinkButton>
             <%--           <label class="control-label" for="inputSuccess">ESPIROMETRIA </label>--%>
                        <asp:TextBox ID="txtEspirometria" runat="server" class="form-control" placeholder="ESPIROMETRIA" MaxLength="250" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIOS: </label>
                        <asp:TextBox ID="txtEspiroComent" runat="server" class="form-control" placeholder="Comentarios Espirometria" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                       <%-- <label class="control-label" for="inputSuccess">RADIOGRAFIAS </label>--%>
                        <asp:LinkButton ID="lnkRadio" runat="server" OnClick="lnkRadio_Click" Text="RADIOGRAFIAS"></asp:LinkButton>
                        <asp:TextBox ID="txtRadiografias" runat="server" class="form-control" placeholder="RADIOGRAFIAS" MaxLength="250" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIOS: </label>
                        <asp:TextBox ID="txtRadioComent" runat="server" class="form-control" placeholder="Comentarios Radiografias" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
                     <%--   <label class="control-label" for="inputSuccess">EXAMEN MEDICO </label>--%>
                        <asp:LinkButton ID="lnkExamenMedico" runat="server" OnClick="lnkExamenMedico_Click" Text="EXAMEN MEDICO"></asp:LinkButton>
                        <asp:TextBox ID="txtExamenMedico" runat="server" class="form-control" placeholder="EXAMEN MEDICO" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIOS: </label>
                        <asp:TextBox ID="txtExamenComent" runat="server" class="form-control" placeholder="Comentarios Examen Medico" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-6">
<%--                        <label class="control-label" for="inputSuccess">LABORATORIO </label>--%>
                        <asp:LinkButton ID="lnkLaboratorio" runat="server" OnClick="lnkLaboratorio_Click" Text="LABORATORIO"></asp:LinkButton>
                        <asp:TextBox ID="txtLaboratorio" runat="server" class="form-control" placeholder="LABORATORIO" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIOS: </label>
                        <asp:TextBox ID="txtLaboratorioComent" runat="server" class="form-control" placeholder="Comentarios Laboratorio" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <%--<label class="control-label" for="inputSuccess">EXAMEN TOXICOLOGICO: </label>--%>
                        <asp:LinkButton ID="lnkExamenToxicologico" runat="server" OnClick="lnkExamenToxicologico_Click" Text="EXAMEN TOXICOLOGICO"></asp:LinkButton>
                        <asp:TextBox ID="txtToxicologico" runat="server" class="form-control" placeholder="EXAMEN TOXICOLOGICO" MaxLength="250" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIOS: </label>
                        <asp:TextBox ID="txtToxicologicoComent" runat="server" class="form-control" placeholder="Comentarios Toxicologico" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">OTROS: </label>
                        <asp:TextBox ID="txtComentarioOtros" runat="server" class="form-control" placeholder="Comentarios Otros" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
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
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <asp:Image ID="imgFirmaRealizo" runat="server" CssClass="rounded center-block" Height="100" Width="100" Visible="false" />
                    </div>
                </div>
            </div>
            <div class="form-row pull-right">
                <br />
                <div class="col-md-12 mb-6">
                    <asp:Button ID="btnGuardar" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Guardar" ClientIDMode="Static" OnClick="btnGuardar_Click" />
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
</asp:Content>

