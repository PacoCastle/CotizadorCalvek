<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Espirometria.aspx.cs" Inherits="Examenes_Espirometria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
    <style>
        textarea {
            resize: none;
        }
    </style>
    <div class="container">
        <h2>Espirometria</h2>
        <div class="panel panel-default">
            <div class="panel-heading">
                Examen de Espirometria
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <asp:FileUpload ID="oFile" runat="server" accept="application/pdf" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                </div>
                <div class="row">
                    <br />
                    <br />
                    <br />
                    <div class="col-md-12 mb-12">
                        <asp:Image ID="imgExamenEspiro" runat="server" CssClass="center-block img-thumbnail" />
                        <hr style="color: #0056b2;" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <h4>REPETIBILIDAD</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">FVC</label>
                        <asp:TextBox ID="txtFvc1" runat="server" CssClass="form-control  fvc text-center" MaxLength="18" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess"></label>
                        <asp:TextBox ID="txtFvc2" runat="server" CssClass="form-control  fvc text-center" MaxLength="18" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess"></label>
                        <asp:TextBox ID="txtFvc3" runat="server" CssClass="form-control  fvc text-center" MaxLength="18" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                     <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess"></label>
                        <asp:TextBox ID="txtFVC" runat="server" CssClass="form-control  text-center only" MaxLength="18" BackColor="#eeeeee" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">FEV1</label>
                        <asp:TextBox ID="txtFev1" runat="server" CssClass="form-control   fve text-center" MaxLength="18" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess"></label>
                        <asp:TextBox ID="txtFev2" runat="server" CssClass="form-control  fve text-center" MaxLength="18" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess"></label>
                        <asp:TextBox ID="txtFev3" runat="server" CssClass="form-control  fve text-center" MaxLength="18" Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                     <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess"></label>
                        <asp:TextBox ID="txtFVE1" runat="server" CssClass="form-control  text-center only" MaxLength="18" BackColor="#eeeeee"  Text="0.00" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <hr style="color: #0056b2;" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">PICO MAXIMO </label>
                        <asp:DropDownList ID="ddlPico" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">FORMA TRIANGULAR </label>
                        <asp:DropDownList ID="ddlFormaTriangular" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">LIBRE ARTEFACTOS </label>
                        <asp:DropDownList ID="ddlLibreArtefactos" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">MESETA > 1 SEG >  </label>
                        <asp:DropDownList ID="ddlMeseta" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">TIEMPO > 4 SEG </label>
                        <asp:DropDownList ID="ddlTiempo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">REPETIBILIDAD FVC < 200 ML </label>
                        <asp:DropDownList ID="ddlRepetibilidadFvc200" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">REPETIBILIDAD FEV1 < 200 ML </label>
                        <asp:DropDownList ID="ddlRepetibilidadFev1" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">PRUEBAS ACEPTABLES   </label>
                        <asp:TextBox ID="txtPruebas" runat="server" CssClass="form-control numeric"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">
                            CALIDAD 
                        <asp:DropDownList ID="ddlCalidad" runat="server" CssClass="form-control"></asp:DropDownList>
                        </label>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">CRITERIOS PARA DX </label>
                        <asp:DropDownList ID="ddlCriterios" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">DIAGNOSTICO</label>
                        <asp:DropDownList ID="ddlDiagnostico" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDiagnostico_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">IMPRESIÓN DIAGNOSTICA</label>
                        <asp:TextBox ID="txtImpresiónDiagnostica" runat="server" CssClass="form-control textarea" TextMode="MultiLine" ReadOnly="true" AutoPostBack="True"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIO</label>
                        <asp:TextBox ID="txtImprecionComentario" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">RECOMENDACIONES</label>
                        <asp:TextBox ID="txtRecomendaciones" runat="server" CssClass="form-control textarea" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">COMENTARIO</label>
                        <asp:TextBox ID="txtRecomendacionesComentario" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">Realizó EM:</label>
                        <asp:DropDownList ID="ddlRRealizoEM" runat="server" CssClass="form-control" required="required" AutoPostBack="true" OnSelectedIndexChanged="ddlRRealizoEM_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess">CED. PROF.:</label>
                        <asp:TextBox ID="txtRCedProf" runat="server" CssClass="form-control numeric" MaxLength="100" ReadOnly="true"></asp:TextBox>
                    </div>

                </div>
                <div class="row pull-right">
                    <div class="col-md-12 mb-12" style="text-align: right">
                        <br />
                        <asp:Image ID="imgFirmaRealizo" runat="server" CssClass="rounded" Height="150" Width="300" Visible="false" />
                        <p>
                            <h3>
                                <asp:Label ID="lblDoctor" runat="server" CssClass=""></asp:Label></h3>
                        </p>
                        <p>
                            <h4>
                                <asp:Label ID="lblCedProf" runat="server" CssClass=""></asp:Label></h4>
                        </p>
                        <p>
                            <h5>
                                <asp:Label ID="lblCertificado" runat="server" CssClass=""></asp:Label></h5>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row pull-right">
            <br />
            <div class="col-md-12 mb-12">
                <asp:Button ID="btnConstruir" runat="server" OnClick="btnConstruir_Click" BackColor="#007bff" ForeColor="White" CssClass="form-control" Text="Guardar" ClientIDMode="Static" />
            </div>
        </div>
        <div class="row pull-right">
            <br />
            <div class="col-md-12 mb-6">
                <asp:Button ID="btnReporte" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Reporte" ClientIDMode="Static" OnClick="btnReporte_Click" />
            </div>
        </div>
    </div>
    <div class="loader">
        <div class="icono">
        </div>
    </div>


    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/sweetalert.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.number.js")%>"></script>
    <script>
        $(document).ready(function () {
            window.onsubmit = function (event) {
                PageLoadStart();
            }

            $(".text-center").number(true, 2);
            $(".fvc").keyup(function () {
                calculoFvc(this);
            });

            $(".fve").keyup(function () {
                calculoFVE1(this);
            });

            $(".text-center").blur(function () {
                if ($(this).val().indexOf(".") == -1 && $(this).val().length > 0)
                    $(this).val($(this).val() + ".00");
                if ($(this).val().length <= 0)
                    $(this).val("0.00");
               
            });
        });


        function calculoFvc(input) {
            var arrayNumber = [parseFloat($("#txtFvc1").val()), parseFloat($("#txtFvc2").val()), parseFloat($("#txtFvc3").val())];
            console.log(arrayConstructNumber(arrayNumber, 0));
           
        }

        function calculoFVE1(input) {
            var arrayNumber = [parseFloat($("#txtFev1").val()), parseFloat($("#txtFev2").val()), parseFloat($("#txtFev3").val())];
            console.log(arrayConstructNumber(arrayNumber, 1));
            
        }

        function arrayConstructNumber(arrayNumber,option) {
           
            var Count = 0;
            var array = arrayNumber.sort((a, b) => b - a)

            var Resta = (array[0] - array[1]);
            var Result = (Resta * 1000);

            console.log("Resutl:" + Result);
            if (option == 0) {
               
                $("#txtFVC").val(Result);
            }
            else if (option == 1) {
                
                $("#txtFVE1").val(Result);
            }
        }

    </script>
</asp:Content>

