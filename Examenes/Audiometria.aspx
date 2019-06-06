<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Audiometria.aspx.cs" Inherits="Examenes_Audiometria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
    <style>
        textarea {
            resize: none;
        }

        table tr {
            text-align: center;
        }
    </style>
    <asp:HiddenField ID="hdnHipoacusiaOD" runat="server" Value="0" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnHipoacusiaOI" runat="server" Value="0" ClientIDMode="Static" />
    <div class="container">
        <h2>Audiometria</h2>
        <div class="panel panel-default">
            <div class="panel-heading">
                Examen de Audiometria
            </div>
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <asp:FileUpload ID="oFile" runat="server" accept="application/pdf" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                </div>
                <div class="form-row">
                    <br />
                    <br />
                    <br />
                    <div class="col-md-12 mb-12">
                        <asp:Image ID="imgExamenAudio" runat="server" CssClass="center-block img-thumbnail" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-5 mb-5">
                        <table class="table text-center">
                            <thead>
                                <tr>
                                    <th scope="col">OIDO</th>
                                    <th scope="col">500 Hz</th>
                                    <th scope="col">1000 Hz</th>
                                    <th scope="col">2000 Hz</th>
                                    <th scope="col">3000 Hz</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">OD</th>
                                    <td>
                                        <asp:TextBox ID="txtOD500" runat="server" CssClass="form-control onlyNumbersNeg OD text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoOD();"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtOD1000" runat="server" CssClass="form-control onlyNumbersNeg OD text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoOD();"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtOD2000" runat="server" CssClass="form-control onlyNumbersNeg OD text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoOD();"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtOD3000" runat="server" CssClass="form-control onlyNumbersNeg OD text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoOD();"></asp:TextBox></td>

                                </tr>
                                <tr>
                                    <th scope="row" style="text-align: center">OI</th>
                                    <td>
                                        <asp:TextBox ID="txtOI500" runat="server" CssClass="form-control onlyNumbersNeg OI text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoID();"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtOI1000" runat="server" CssClass="form-control onlyNumbersNeg OI text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoID();"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtOI2000" runat="server" CssClass="form-control onlyNumbersNeg OI text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoID();"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtOI3000" runat="server" CssClass="form-control onlyNumbersNeg OI text-center" ClientIDMode="Static" onkeyup="calculoPerddaOidoID();"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-3 mb-3">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Perdida x Oido</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPerdidaOD" runat="server" CssClass="form-control only text-center" BackColor="#eeeeee" autocomplete="off" ClientIDMode="Static"></asp:TextBox></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPerdidaOI" runat="server" CssClass="form-control only text-center" BackColor="#eeeeee" autocomplete="off" ClientIDMode="Static"></asp:TextBox></td>
                                    <td>%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4 mb-4">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Hipoacusia Bilateral Combinada</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtHopoacuasia" runat="server" CssClass="form-control only text-center" Height="95px" Width="304px" BackColor="#eeeeee" autocomplete="off" ClientIDMode="Static"></asp:TextBox></td>

                                    <td>
                                        <br />
                                        <br />
                                        %</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-4 mb-4">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Faringe</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFaringe" runat="server" CssClass="form-control" Text="Sin datos patológicos"></asp:TextBox></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4 mb-4">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">CAD & MTD</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tbody>
                                <tr>
                                    <th scope="row">CAD</th>
                                    <td>
                                        <asp:TextBox ID="txtCad" runat="server" CssClass="form-control" Text=" permeable"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">MTD</th>
                                    <td>
                                        <asp:TextBox ID="txtMtd" runat="server" CssClass="form-control" Text="integra,aspeco normal"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4 mb-4">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">CAI & MTI</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">CAI</th>
                                    <td>
                                        <asp:TextBox ID="txtCai" runat="server" CssClass="form-control" Text="permeable"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">MTI</th>
                                    <td>
                                        <asp:TextBox ID="txtMti" runat="server" CssClass="form-control" Text="integra,aspecto normal"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <h3>DIAGNOSTICO OD</h3>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess" style="font-size: 13px">ETIOLÓGICO</label>
                        <asp:DropDownList ID="ddlDiagnostico" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDiagnostico_SelectedIndexChanged" ClientIDMode="Static" OnDataBound="ddlDiagnostico_DataBound"></asp:DropDownList>
                        <label class="control-label" for="inputSuccess" style="font-size: 13px">NOSOLÓGICO</label>
                        <asp:DropDownList ID="ddlDiagnostico2" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDiagnostico2_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>

                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <hr style="color: #0056b2;" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <h3>DETALLES OD</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <%--  <th scope="col">Detalles</th>--%>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                            <tbody>
                                <tr>
                                    <th scope="row">Descripción Audiométrica: </th>
                                    <td>
                                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control textarea" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Comentarios:</th>
                                    <td>
                                        <asp:TextBox ID="txtDescComent" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Impresión Diagnostica:</th>
                                    <td>
                                        <asp:TextBox ID="txtImpDiagnostica" runat="server" CssClass="form-control textarea" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Comentarios:</th>
                                    <td>
                                        <asp:TextBox ID="txtImpDiagnosticaComent" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Recomendaciones:</th>
                                    <td>
                                        <asp:TextBox ID="txtRecomendaciones" runat="server" CssClass="form-control textarea" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Comentarios:</th>
                                    <td>
                                        <asp:TextBox ID="txtRecomenComent" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                        <hr style="color: #0056b2;" />
                    </div>
                </div>
                 <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <h3>DIAGNOSTICO OI</h3>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <hr style="color: #0056b2;" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-6">
                        <label class="control-label" for="inputSuccess" style="font-size: 13px">ETIOLÓGICO</label>
                        <asp:DropDownList ID="ddlDiagnostico3" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDiagnostico3_SelectedIndexChanged" ClientIDMode="Static" DataValueField="ID_CAT_AUDIOMETRIA" DataTextField="CAT_AUDIOMETRIA_DESCRIPCION" OnDataBound="ddlDiagnostico3_DataBound"></asp:DropDownList>
                        <label class="control-label" for="inputSuccess" style="font-size: 13px">NOSOLÓGICO</label>
                        <asp:DropDownList ID="ddlDiagnostico4" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDiagnostico4_SelectedIndexChanged" ClientIDMode="Static" DataValueField="ID_CAT_AUDIOMETRIA" DataTextField="CAT_AUDIOMETRIA_DESCRIPCION"></asp:DropDownList>
                    </div>
                </div>
               
                <div class="form-row">
                    <div class="col-md-12 mb-12">
                        <h3>DETALLES OI</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <%--  <th scope="col">Detalles</th>--%>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                            <tbody>
                                <tr>
                                    <th scope="row">Descripción Audiométrica: </th>
                                    <td>
                                        <asp:TextBox ID="txtDescOI" runat="server" CssClass="form-control textarea" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Comentarios:</th>
                                    <td>
                                        <asp:TextBox ID="txtDescComentOI" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Impresión Diagnostica:</th>
                                    <td>
                                        <asp:TextBox ID="txtImpDiagnosticaOI" runat="server" CssClass="form-control textarea" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Comentarios:</th>
                                    <td>
                                        <asp:TextBox ID="txtImpDiagnosticaComentOI" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Recomendaciones:</th>
                                    <td>
                                        <asp:TextBox ID="txtRecomendacionesOI" runat="server" CssClass="form-control textarea" ReadOnly="true" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th scope="row">Comentarios:</th>
                                    <td>
                                        <asp:TextBox ID="txtRecomenComentOI" runat="server" CssClass="form-control textarea" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                        <hr style="color: #0056b2;" />
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
                    <div class="col-md-12 mb-12">
                    </div>
                </div>
                <div class="form-row pull-right">
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
            <div class="form-row pull-right">
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
    </div>
    <div class="loader">
        <div class="icono">
        </div>
    </div>




    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/sweetalert.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
    <script>
        $(document).ready(function () {
            window.onsubmit = function (event) {
                PageLoadStart();

            }

            $(".numeric").keydown(function () {

                calculoPerddaOidoOD();
                calculoPerddaOidoID();

            });

            $(".numeric").change(function () {
                if ($(this).val().length <= 0)
                    $(this).val(0);
            });

            calculoPerddaOidoOD();
            calculoPerddaOidoID();

            //var top = $("#ddlDiagnostico").offset().top;

            $("select").change(function () {
                //$('html,body').animate({
                //    scrollTop: $("#ddlDiagnostico").offset().top //$(this).attr("id").offset().top
                sessionStorage.setItem("controlSelect", $(this).offset().top);
                //}, 2000);
            });

            if (sessionStorage.getItem("controlSelect") != null) {
                $('html,body').animate({
                    scrollTop: sessionStorage.getItem("controlSelect") - 100 //$(this).attr("id").offset().top
                }, 2000);

            }



        });

        function calculoPerddaOidoOD() {
            var arrayCantidadOD = [1, parseInt($("#txtOD500").val()), parseInt($("#txtOD1000").val()), parseInt($("#txtOD2000").val()), parseInt($("#txtOD3000").val())];
            sumaCantidades(arrayCantidadOD);
        }

        function calculoPerddaOidoID(element) {

            var arrayCantidadOI = [2, parseInt($("#txtOI500").val()), parseInt($("#txtOI1000").val()), parseInt($("#txtOI2000").val()), parseInt($("#txtOI3000").val())];
            sumaCantidades(arrayCantidadOI);
        }

        function sumaCantidades(arrayCantidad) {

            var SumHz = 0
            var Perdida = 0;
            var oido = 0;
            var count = 0;

            arrayCantidad.forEach(function (element) {

                if (count == 0)
                    oido = element;
                else
                    SumHz += isNaN(element) ? 0 : element;
                count++;

            });
            console.log("Suma :" + SumHz);
            Perdida = parseFloat((SumHz / 4) * 0.8);

            switch (oido) {
                case 1:
                    $("#txtPerdidaOD").val(Perdida.toFixed(2));
                    $("#hdnHipoacusiaOD").val(Perdida * 7);
                    console.log(Perdida);
                    break;
                case 2:
                    $("#txtPerdidaOI").val(Perdida.toFixed(2));
                    $("#hdnHipoacusiaOI").val(Perdida * 7);
                    console.log(Perdida);
                    break;
                default:

            }
            Hipoacusia();
        }

        function Hipoacusia() {

            var PerdidOI = (isNaN(parseFloat($("#txtPerdidaOI").val())) ? 0 : parseFloat($("#txtPerdidaOI").val()));
            var PerdidaOD = (isNaN(parseFloat($("#txtPerdidaOD").val())) ? 0 : parseFloat($("#txtPerdidaOD").val()));

            var Indice1 = (parseFloat($("#hdnHipoacusiaOD").val()) + PerdidOI) / 8;
            var Indice2 = (parseFloat($("#hdnHipoacusiaOI").val()) + PerdidaOD) / 8;


            console.log("Perdida OD: " + PerdidaOD + " perdida OI :" + PerdidOI);
            console.log("indice 1: " + parseFloat($("#hdnHipoacusiaOD").val()) + " Indice 2 :" + parseInt($("#hdnHipoacusiaOI").val()));
            console.log("indice 1: " + Indice1 + " Indice 2 :" + Indice2);
            console.log("------------------------");
            if (Indice1 < Indice2)
                $("#txtHopoacuasia").val(Indice1.toFixed(2));
            else if (Indice2 < Indice1)
                $("#txtHopoacuasia").val(Indice2.toFixed(2));
            else if (Indice1 == Indice2)
                $("#txtHopoacuasia").val(Indice1.toFixed(2));

        }



    </script>

</asp:Content>

