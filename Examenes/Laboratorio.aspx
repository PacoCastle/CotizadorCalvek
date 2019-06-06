<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Laboratorio.aspx.cs" Inherits="Examenes_Laboratorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <br />
    <br />

    <div class="container">
        <h2>Laboratorio</h2>
        <div class="panel panel-default">
            <div class="panel-heading">
                Examen de Laboratorio
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">FECHA EXAMEN </label>
                        <asp:TextBox ID="txtLabFechaExamen" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" required="required" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">ERIT </label>
                        <asp:TextBox ID="txtLab_Erit" runat="server" class="form-control autoCompleteNumberDec" placeholder="ERIT" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">HB </label>
                        <asp:TextBox ID="txtLab_Hb" runat="server" class="form-control autoCompleteNumberDec" placeholder="HB" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">HCTO </label>
                        <asp:TextBox ID="txtLab_Hcto" runat="server" class="form-control autoCompleteNumberDec" placeholder="HCTO" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">PLQ </label>
                        <asp:TextBox ID="txtLab_Plq" runat="server" class="form-control numeric" placeholder="PLQ" MaxLength="6"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">LEU </label>
                        <asp:TextBox ID="txtLab_Leu" runat="server" class="form-control autoCompleteNumberDec" placeholder="LEU" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">GLUCOSA </label>
                        <asp:TextBox ID="txtLab_Glucosa" runat="server" class="form-control numeric" placeholder="GLUCOSA" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">UREA </label>
                        <asp:TextBox ID="txtLab_Urea" runat="server" class="form-control" placeholder="UREA" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">NITROGENO </label>
                        <asp:TextBox ID="txtLab_Nitrogeno" runat="server" class="form-control autoCompleteNumberDec" placeholder="NITROGENO" MaxLength="6"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">CREATININA </label>
                        <asp:TextBox ID="txtLab_Creatinina" runat="server" class="form-control autoCompleteNumberDec" placeholder="CREATININA" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">BUN CREATININA </label>
                        <asp:TextBox ID="txtLab_Bun_Creatinina" runat="server" class="form-control autoCompleteNumberDec" placeholder="BUN CREATININA" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">ACIDO URICO </label>
                        <asp:TextBox ID="txtLab_AcidoUrico" runat="server" class="form-control autoCompleteNumberDec" placeholder="ACIDO URICO" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">COLESTEROL </label>
                        <asp:TextBox ID="txtLab_Colesterol" runat="server" class="form-control numeric" placeholder="COLESTEROL" MaxLength="6"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">TRIGLICERIDOS </label>
                        <asp:TextBox ID="txtLab_Trigliceridos" runat="server" class="form-control numeric" placeholder="TRIGLICERIDOS" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">HDL </label>
                        <asp:TextBox ID="txtLab_Hdl" runat="server" class="form-control numeric" placeholder="HDL"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">LDL </label>
                        <asp:TextBox ID="txtLab_Ldl" runat="server" class="form-control autoCompleteNumberDec" placeholder="LDL" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">VLDL </label>
                        <asp:TextBox ID="txtLab_Vldl" runat="server" class="form-control autoCompleteNumberDec" placeholder="VLDL" MaxLength="6"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">ATEROGENICO </label>
                        <asp:TextBox ID="txtLab_Aterogenico" runat="server" class="form-control autoCompleteNumberDec" placeholder="ATEROGENICO" MaxLength="6"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">AST TGO </label>
                        <asp:TextBox ID="txtLab_AstTgo" runat="server" class="form-control numeric" placeholder="AST TGO"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">ALT/TGP </label>
                        <asp:TextBox ID="txtLab_AltTgp" runat="server" class="form-control numeric" placeholder="ALT/TGP"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">BILIRRUBINA </label>
                        <asp:TextBox ID="txtLab_Bilirrubina" runat="server" class="form-control autoCompleteNumberDec" placeholder="ATEROGENICO" MaxLength="6"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 md-12">
                        <label class="control-label" for="inputSuccess">CALCIO </label>
                        <asp:TextBox ID="txtLab_Calcio" runat="server" class="form-control autoCompleteNumberDec" placeholder="CALCIO" MaxLength="6"></asp:TextBox>
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
                <div class="col-md-12 mb-12">
                    <asp:Button ID="btnGuardar" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Guardar" ClientIDMode="Static" OnClick="btnGuardar_Click" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.numeric.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>

</asp:Content>

