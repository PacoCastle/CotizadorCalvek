<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Toxicologico.aspx.cs" Inherits="Examenes_Toxicologico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <br />
    <br />

    <div class="container">
        <h2>Toxicológico</h2>
        <div class="panel panel-default">
            <div class="panel-heading">
                Examen  Toxicológico
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">FECHA EXAMEN </label>
                        <asp:TextBox ID="txtToxFechaExamen" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" required="required" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">CRITERIOS </label>
                        <asp:TextBox ID="Tox_Criterios" runat="server" class="form-control" placeholder="Criterios"></asp:TextBox>

                    </div>
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">HALLAZGOS </label>
                        <asp:TextBox ID="Tox_Hallazgos" runat="server" class="form-control" placeholder="Hallazgos"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">RECOMENDACION </label>
                        <asp:TextBox ID="Tox_Recomedacion" runat="server" class="form-control" placeholder="Recomendacion"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">ANFETAMINAS </label>
                        <asp:DropDownList ID="ddlToxIdAnfetaminas" runat="server" CssClass="form-control" placeholder="Anfetaminas" DataValueField="ID_TOX" DataTextField="CAT_TOXICOS"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">COCAINA </label>
                        <asp:DropDownList ID="ddlToxIdCocaina" runat="server" CssClass="form-control" placeholder="Cocaina" DataValueField="ID_TOX" DataTextField="CAT_TOXICOS"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">MARIHUANA </label>
                        <asp:DropDownList ID="ddlToxIdMarihuana" runat="server" CssClass="form-control" placeholder="Marihuana" DataValueField="ID_TOX" DataTextField="CAT_TOXICOS"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">OPIACEOS </label>
                        <asp:DropDownList ID="ddlToxIdOpiaceos" runat="server" CssClass="form-control" placeholder="Apiaceos" DataValueField="ID_TOX" DataTextField="CAT_TOXICOS"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">METANFETAMINA </label>
                        <asp:DropDownList ID="ddlToxIsMetanfetamina" runat="server" CssClass="form-control" placeholder="Metanfetamina" DataValueField="ID_TOX" DataTextField="CAT_TOXICOS"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">RESULTADO </label>
                        <asp:TextBox ID="Tox_Resultado" runat="server" class="form-control" placeholder="Resultado" required="required"></asp:TextBox>
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
                <div class="form-row pull-right">
                    <br />
                    <div class="col-md-12 mb-6">
                        <asp:Button ID="btnGuardar" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Guardar" ClientIDMode="Static" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
   <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.numeric.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>

</asp:Content>

