<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamenGral.aspx.cs" Inherits="Examenes_ExamenGral" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <link type="text/css" href="<%=Page.ResolveUrl("~/scriptsJS/ExamenesCss/table.css")%>" rel="stylesheet" />
    <asp:HiddenField ID="hdnIdComplexion" runat="server" ClientIDMode="Static" />

    <br />
    <br />
    <br />

    <style>
        .className {
            background: url(../Imagenes/editar_25.png) no-repeat 0 0;
        }

        .SubmitButton {
            background: url(../Imagenes/editar_25.png) no-repeat;
            cursor: pointer;
            width: 25px;
            height: 25px;
            border: none;
        }

        .cuadrado {
            width: 100px;
            height: 100px;
            border: 3px solid #555;
        }

        form input[type="text"]:required:valid {
            border: 1px solid green;
        }
        /*caso contrario, el color sera rojo*/
        form input[type="text"]:required:invalid {
            border: 1px solid red;
        }

        form input[type="date"]:required:valid {
            border: 1px solid green;
        }
        /*caso contrario, el color sera rojo*/
        form input[type="date"]:required:invalid {
            border: 1px solid red;
        }
    </style>
    <input type="hidden" id="IdAptitud" value="<%=IdAptitud%>" />
    <input type="hidden" id="idComplexion" runat="server" />
    <asp:HiddenField ID="hdnDate" ClientIDMode="Static" runat="server" />


    <div class="container">

        <br />
        <div id="examenMedico" runat="server">
            <div class="bs-example">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-5">
                                    <img src="../Imagenes/logoAMI.PNG" class="img-rounded" alt="Cinque Terre">
                                </div>

                                <div class="col-sm-5">
                                    <asp:Label ID="lblExamen" runat="server" class="control-label text-center">EXAMEN MEDICO</asp:Label>
                                </div>
                                <div class="col-sm-2">
                                    <asp:Label ID="lblFecha" runat="server" class="control-label text-center">Fecha:</asp:Label>
                                    <br />
                                    <asp:RadioButtonList ID="rblOpciones" runat="server" CssClass="format-control" CellSpacing="10" CellPadding="10" ClientIDMode="Static">
                                        <%-- <asp:ListItem Text=" INGRESO" Value="1" Selected="True" />
                                        <asp:ListItem Text=" PERIODICO" Value="2" />
                                        <asp:ListItem Text=" EGRESO" Value="3" />--%>
                                    </asp:RadioButtonList>


                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-1">
                                    <label class="control-label" for="inputSuccess">EMPRESA:</label>
                                </div>
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtEmpresa" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bs-example">
                <div class="panel-group" id="accordion">
                    <%--  Datos Personales--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="card-link">DATOS PERSONALES</a>
                            </h4>
                        </div>

                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">NOMBRE:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtNombre" class="form-control" runat="server" type="text" ValidationGroup="papeleta" placeholder="Nombres" required="required" MaxLength="100" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtPaterno" class="form-control" runat="server" type="text" ValidationGroup="papeleta" placeholder="Paterno" required="required" MaxLength="100" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtMaterno" class="form-control" runat="server" type="text" ValidationGroup="papeleta" placeholder="Materno" MaxLength="100" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">EDAD:</label>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:TextBox ID="txtEdad" class="form-control" runat="server" ClientIDMode="Static" ReadOnly="true" Text="0"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">Sexo:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlSexo" CssClass="form-control" runat="server" ClientIDMode="Static" Enabled="false"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label">LUGAR DE NACIMIENTO:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtLugarNac" CssClass="form-control" runat="server" ClientIDMode="Static" MaxLength="255" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label">FECHA DE NACIMIENTO:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control" ClientIDMode="Static" PlaceHolder="dd/mm/aaaa" required="required" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">ESTADO CIVIL:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlEstadoCivil" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ESCOLARIDAD:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlEscolaridad" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">TELEFONO:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtTelefono" class="form-control  phone_with_ddd" runat="server" MaxLength="20" placeholder="(55) 5555-5555" ClientIDMode="Static" required="required"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">DIRECCIÓN:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtDirec" class="form-control" runat="server" type="text" MaxLength="255" ClientIDMode="Static" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">NACIONALIDAD:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-control" ClientIDMode="Static" required="required"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Historia Laboral--%>
                    <div class="panel panel-default" id="HistoriaLaboral">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">HISTORIA LABORAL</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PUESTO SOLICITADO:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtPuestoSol" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">AREA:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtArea" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ULTIMO EMPLEO:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtHlUltimoEmpleo" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">PUESTO:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtPuesto1" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">FACTOR DE RIESGO:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txHltFactorRiesgo" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ANTIGUEDAD:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtHlAntiguedad" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ULTIMO EMPLEO:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtHlUltimoEmpleotwo" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">PUESTO:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtPuesto2" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">FACTOR DE RIESGO:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtHlFactorRiesgotwo" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ANTIGUEDAD:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtHlAntiguedadtwo" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-10">
                                        <label class="control-label" for="inputSuccess">ANTECEDENTES DE ACCIDENTES LABORAL / ENFERMEDADES PROFESIONALES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList ID="rblHlAntecedentes" runat="server" CssClass="format-control">
                                            <asp:ListItem Text="Si" Value="1" />
                                            <asp:ListItem Text="No" Value="0" Selected="True" />
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">ESPECIFICAR:</label>
                                    </div>
                                    <div class="col-sm-11">
                                        <asp:TextBox ID="txtHlEspeciales" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Historia Laboral Periodico--%>
                    <div class="panel panel-default" id="historialLaboralPeriodico" style="display: none">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapsePeridico">HISTORIA LABORAL</a>
                            </h4>
                        </div>
                        <div id="collapsePeridico" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PUESTO ACTUAL:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtHLPPuestoActual" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">AREA:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtHLPArea" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ANTIGUEDAD DE PUESTO:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtHLPAntiguedadPuesto" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ANTIGUEDAD EN AREA:</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtHLPAntiguedadArea" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">FACTOR DE RIESGO:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtHLPFactorRiesgo" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-10">
                                        <label class="control-label" for="inputSuccess">ANTECEDENTES DE ACCIDENTES LABORAL / ENFERMEDADES PROFESIONALES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList ID="rblHLPAntecedentesAcc" runat="server" CssClass="format-control">
                                            <asp:ListItem Text="Si" Value="1" />
                                            <asp:ListItem Text="No" Value="0" Selected="True" />
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">ESPECIFICAR:</label>
                                    </div>
                                    <div class="col-sm-11">
                                        <asp:TextBox ID="txtHLPEspecificar" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- ANTECEDENTES HEREDO-FAMILIARES--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">ANTECEDENTES HEREDO-FAMILIARES</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">DIABETES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAHFDiabetes" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">HTA:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAHTAHeredo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">EPILEPSIA</label>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:DropDownList ID="ddlAHFEpilepsia" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CARDIOPATIA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAHFCardio" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">RENALES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAHFRenalesHeredo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">ASMA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAHFAsma" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">CANCER</label>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:DropDownList ID="ddlAHFCancer" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">MENTALES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAHFMentales" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">OTRAS:</label>
                                    </div>
                                    <div class="col-sm-11">
                                        <asp:TextBox ID="txtAHFOtras" class="form-control" runat="server" type="text" ValidationGroup="papeleta"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--ANTECEDENTES NO PATOLOGICOS Y TOXICOMANIAS--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFor">ANTECEDENTES PERSONALES NO PATOLOGICOS Y TOXICOMANIAS</a>
                            </h4>
                        </div>
                        <div id="collapseFor" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ALCOHOLISMO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTAlcoholismo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">EDAD DE COMIENZO</label>
                                    </div>

                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTEdadComienzo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">FRECUENCIA:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTFrecuencia" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">¿SUSPENDIDO?</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTAlcoholSusp" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">TIEMPO SUSPENDIDO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtAPTAlcoholTiempoSusp" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">TABAQUISMO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTTabaquismo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">EDAD DE COMIENZO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTEdadComienzoTwo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">FRECUENCIA:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTFrecuenciatwo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">¿SUSPENDIDO?</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTTabaqSusp" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">TIEMPO SUSPENDIDO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--  <asp:DropDownList ID="ddlAPTTabaqTiempoSusp" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtAPTTabaqTiempoSusp" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CIGARROS/DÍA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtAPTTabaTiempoSusp" runat="server" CssClass="form-control numeric" MaxLength="4"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">DROGAS ESTIMULANTES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTDrogas" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ESPECIFIQUE</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtAPTDrogasEspec" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ULTIMO CONSUMO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtAPTUltimoConsumo" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label pull-left " for="inputSuccess">EJERCICIO:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTEjercicio" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ESPECIFIQUE</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtAPTEjercicioEsp" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">FRECUENCIA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--  <asp:DropDownList ID="ddlAPTFrecuenciaTree" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtAPTFrecuenciaTree" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label pull-left " for="inputSuccess">ALIMENTACION:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddlAPTAlimentacion" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">GRUPO Y RH</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddlAPTGrupoRh" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label pull-left " for="inputSuccess">TATUAJES:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAPTTatuajes" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label pull-left " for="inputSuccess">ESPECIFIQUE:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtAPTTatuajesEsp" class="form-control" runat="server" type="text" ValidationGroup="papeleta"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label pull-left " for="inputSuccess">TX. MEDICO ACTUAL:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtAPTMedicoActual" class="form-control" runat="server" type="text" ValidationGroup="papeleta" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <%--ANTECEDENTES PATOLOGICOS--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">ANTECEDENTES PERSONALES PATOLOGICOS</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label>DIABETES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList ID="RdlAPDiabetes" runat="server" RepeatDirection="Horizontal">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label>TIFOIDEA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblAPTifoidea" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">RENALES:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblAPRenales" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">HERNIAS:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblAPHernias" runat="server" CssClass="" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">H T A</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblAPHTA" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">ASMA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--            <asp:DropDownList ID="ddlAPAsma" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblAPAsma" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">EPILEPSIA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPEpilepsia" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">HEMORROIDES:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPHemorroides" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">CANCER</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPCancer" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">ALERGIAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPAlergias" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">VERTIGO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPVertigo" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">TRAUMATISMOS CRANEALES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPTraumaCraneales" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">CARDIOPATIAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPCardipatias" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">PAROTIDITIS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPParatiditis" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">DESMAYOS:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPDesmayos" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>

                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">BRONQUITIS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPBronquitis" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">DERMATITIS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPDermatitis" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>

                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">FRACTURAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPFracturas" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">GINECOLOGICOS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPGinecologicos" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>

                                    <div class="col-sm-2">
                                        <label for="inputSuccess">PAT.C.VERTEBRAL</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPPatCVertebral" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">NEUMONIAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPNeumonias" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">VARICES</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPVarices" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">CIRUGIAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPCirugias" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">ENF. TRANS. SEXUAL</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPEnfTransSex" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>

                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">TUBERCULOSIS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPTuberculosis" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">HEPATITIS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPHepatitis" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">TRANSFUSIONES:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPTransfuciones" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">ENDOCRINOPATIAS:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPEndocrino" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">EXANTEMATICAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPExantematicas" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputSuccess">PSIQUIATRICAS</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" ID="ddlAPPsiquiatricas" runat="server" DataTextField="CAT_NOPATTOXI" DataValueField="ID_NOPAT">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">OTRAS</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtAPOtrasPato" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">Especifique</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtAPEspecificacion" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--ANTECEDENTES GINECOLOGICOS--%>
                    <div class="panel panel-default" id="PanelAntecedentesGinecol">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix" id="collapseGinecol">ANTECEDENTES GINECOLOGICOS</a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">MENARCA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGMenarca" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">I.V.S</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGIvs" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">V.S.A</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGVsa" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">FUM</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<asp:TextBox ID="txtAGFum" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                        <%--  <asp:TextBox ID="txtAGFum" runat="server" CssClass="form-control" ClientIDMode="Static" PlaceHolder="dd/mm/aaaa" type="date"></asp:TextBox>--%>
                                        <asp:TextBox ID="txtAGFum" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">RITMO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtAGRitmo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">M.P.F</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGMpf" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">D.O.C.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--    <asp:TextBox ID="txtAGDoc" runat="server" CssClass="form-control" PlaceHolder="dd/mm/aaaa" type="date"></asp:TextBox>--%>
                                        <asp:TextBox ID="txtAGDoc" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>

                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">GESTA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGGesta" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">PARTO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGParto" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CESAREA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGCesarea" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">ABORTO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlAGAborto" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">F.U.P / F.U.C</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<asp:TextBox ID="txtAGFup" runat="server" CssClass="form-control" MaxLength="250" PlaceHolder="dd/mm/aaaa" type="date"></asp:TextBox>--%>
                                        <asp:TextBox ID="txtAGFup" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--ANTECEDENTES REPRODUCTIVOS--%>
                    <div class="panel panel-default" id="PanelAtecedentesRepro" style="display: none">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen" id="collapseRepro">ANTECEDENTES REPRODUCTIVOS</a>
                            </h4>
                        </div>
                        <div id="collapseSixteen" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">I.V.S</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtARIvs" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CIRCUNCICIÓN</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlARCircuncision" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">V.S.A</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddlARVsa" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">D.O.C. PROSTATA</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtARProstata" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">M.P.F</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlARMPF" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--INMUNIZACIONES--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseForteen">INMUNIZACIONES.</a>
                            </h4>
                        </div>
                        <div id="collapseForteen" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">RUBEOLA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--  <asp:DropDownList ID="ddlIRubeola" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtIRubeola" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">SARAMPION</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%-- <asp:DropDownList ID="ddlISarampeon" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtISarampeon" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">TOXOIDE TETANICO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--                 <asp:DropDownList ID="ddlITexoideTetanico" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtITexoideTetanico" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">NEUMOCOCO</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--                                        <asp:DropDownList ID="ddlINeumococo" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtINeumococo" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">INFLUENZA</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--                                        <asp:DropDownList ID="ddlIIfluenza" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtIInfluenza" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">HEPATITIS B</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--  <asp:DropDownList ID="ddlIHepatitsB" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtIHepatisB" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">OTRA</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtIOtra" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">PROXIMA DOSIS:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtIProximaDosis" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--SOMATOMETRÍA / SIGNOS VITALES--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">SOMATOMETRÍA / SIGNOS VITALES</a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">TA / mmHg</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtTa" runat="server" MaxLength="50" CssClass="form-control " required="required" ClientIDMode="Static" novalidate="true"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">F.C. / min</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtFcMIn" runat="server" MaxLength="50" CssClass="form-control " required="required" novalidate="true" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">F.R/ min</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtFrMin" runat="server" CssClass="form-control " MaxLength="50" required="required" novalidate="true" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">T°</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtT" runat="server" CssClass="form-control " MaxLength="50" required="required" novalidate="true" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">PESO / Kg</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtPesoKg" runat="server" MaxLength="6" CssClass="form-control numericDec" ClientIDMode="Static" onkeyup="calculoIMC();" required="required" novalidate="true"></asp:TextBox>
                                        <%--<input id="txtPesoKg" runat="server" type="text" class="form-control"  onkeyup="EmptyInputs(this);"  />--%>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">TALLA/ CM </label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtTallaCm" runat="server" MaxLength="6" CssClass="form-control numericDec" ClientIDMode="Static" onkeyup="calculoIMC();" required="required" novalidate="true"></asp:TextBox>
                                        <%--<input id="txtTallaCm" runat="server" type="text" class="form-control" onkeyup="EmptyInputs(this);"   />--%>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">IMC</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtImc" runat="server" CssClass="form-control" MaxLength="4" ReadOnly="true" ClientIDMode="Static" step="0.01"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="IMPRESIÓN DIAGNOSTICAinputSuccess">COMPLEXION</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%-- <asp:TextBox ID="txtComplexion" runat="server" CssClass="form-control" MaxLength="250" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>--%>
                                        <asp:DropDownList ID="ddlComplexion" runat="server" CssClass="form-control" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <%--  <select name="ddlComplexion" id="ddlComplexion" class="form-control" runat="server">
                                           
                                        </select>--%>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">PER.CINTURA/cm:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtCintura" runat="server" MaxLength="6" CssClass="form-control numericDec" ClientIDMode="Static" onkeyup="calculoCinturaCadera();" novalidate="true"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">PER.CADERA/cm:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtCadera" runat="server" MaxLength="6" CssClass="form-control numericDec" ClientIDMode="Static" onkeyup="calculoCinturaCadera();" novalidate="true"></asp:TextBox>
                                    </div>

                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">INDICE.CIN/CAD:</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtCinCad" runat="server" CssClass="form-control numericDec" MaxLength="4" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--AGUDEZA VISUAL--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseEight">AGUDEZA VISUAL</a>
                            </h4>
                        </div>
                        <div id="collapseEight" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">VISION LEJANA O.D.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlVisionLejana" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">O.I</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlLejanaOi" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">VISION CERCANA O.D.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlVisionCercana" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">O.I.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlCercanaOI" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2 text-center">
                                        <label class="control-label " for="inputSuccess">REFLEJOS</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtReflejos" runat="server" CssClass="form-control" MaxLength="250" Text="Presentes y Normoreflexicos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">LEJANA CORREGIDA O.D.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlCorregida" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">O.I.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="DDLCorregidaOi" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2 text-center">
                                        <label class="control-label" for="inputSuccess">TEST DE ISHIHARA</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtDaltomismo" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CERCANA CORREGIDA O.D.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlCercanaCorregida" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label" for="inputSuccess">O.I.</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddlCercanaCorregidaOi" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2 text-center">
                                        <label class="control-label" for="inputSuccess">CAMPIMETRIA</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtCampimtria" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--EXPLORACION FISICA GENEREAL--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseNine">EXPLORACION FISICA GENERAL</a>
                            </h4>
                        </div>
                        <div id="collapseNine" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">NEUROLOGICO</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFNeuro" runat="server" CssClass="form-control" MaxLength="250" Text="Alerta, orientado en tiempo, lugar y espacio. Lenguaje y marcha normal."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">CABEZA</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFCraneo" runat="server" CssClass="form-control" MaxLength="250" Text="Cráneo normocéfalo, con adecuada implantación de cabello."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PIEL Y FANERAS</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFPielyFaneras" runat="server" CssClass="form-control" MaxLength="250" Text="Sin datos de palidez, cianosis, sin tatuajes, sin perforaciones."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">OIDOS</label>
                                    </div>
                                    <div class="col-sm-1 ">
                                        <label class="control-label" for="inputSuccess">C.A.D</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtEFOidos" runat="server" CssClass="form-control" MaxLength="250" Text="Permeable, MT integra, cono luminoso"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1 ">
                                        <label class="control-label" for="inputSuccess">C.A.I</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtEFCai" runat="server" CssClass="form-control" MaxLength="250" Text="Permeable, MT integra, cono luminoso" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">OJOS</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFOjos" runat="server" CssClass="form-control" MaxLength="250" Text="Pupilas isocóricas, fondo de ojo sin datos patológicos, sin estrabismo o nistagmus¨, sin pterigión."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">BOCA</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddlEFBoca" runat="server" CssClass="form-control" DataTextField="CAT_BOCA" DataValueField="ID_BOCA" ClientIDMode="Static"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtEFBoca" runat="server" CssClass="form-control" MaxLength="50" Text="Centrada, dentadura completa"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">NARIZ</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFNariz" runat="server" CssClass="form-control" MaxLength="250" Text="Alineada, septum alineado, sin datos patológicos. "></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">FARINGE</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFFaringe" runat="server" CssClass="form-control" MaxLength="250" Text="Sin datos patológicos."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">CUELLO</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFCuello" runat="server" CssClass="form-control" MaxLength="250" Text="Corto , Traquea central, sin presencia de masas, no se palpan adenomegalias"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">TORAX</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFTorax" runat="server" CssClass="form-control" MaxLength="250" Text="Mesomórfico,  movimientos de amplexión y amplexación normales, sin deformidades."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">CORAZON</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFCorazon" runat="server" CssClass="form-control" MaxLength="250" Text="Precordio  sin datos de soplos o ruidos agregados, Rs cardiacos ritmicos. "></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">CAMPOS PULMONARES</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFCamposPulmonares" runat="server" CssClass="form-control" MaxLength="250" Text="Bien ventilados, sin ruidos agregados"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ABDOMEN</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFAbdomen" runat="server" CssClass="form-control" MaxLength="250" Text="Globoso, blando, depresible, peristalsis presente, no se palpan visceromegalias, , sin datos de abultamientos/hernias."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">GENITOURINARIO</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFGen" runat="server" CssClass="form-control" MaxLength="250" Text="Giordano Negativo."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">COLUMNA VERTEBRAL</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFColumnaVer" runat="server" CssClass="form-control" MaxLength="250" Text="Clínicamente alineada,  sin datos de Radiculopatías"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">TEST DE ADAM(escoliosis)</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtTestAdam" runat="server" CssClass="form-control" MaxLength="250" Text="negativo."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">Ms SUPERIORES</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEFSuperiores" runat="server" CssClass="form-control" MaxLength="250" Text="Integros, fuerza y sensiblidad conservada, sin datos de artrosis, sin datos de radiculopatia, arcos de movilidad normales"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">FUERZA MUSCULAR DANIELS:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtFuerzaMuscularDaniels" runat="server" CssClass="form-control" MaxLength="250" Text="5 de 5"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">Ms INFERIORES</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtInferiores" runat="server" CssClass="form-control" MaxLength="250" Text="Íntegros, sensibilidad conservada, sin radiculopatías, ROTs presentes y normales, pulsos presentes."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">FUERZA MUSCULAR DANIELS:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtFuerzaMuscularDanielsInf" runat="server" CssClass="form-control" MaxLength="250" Text="5 de 5"></asp:TextBox>
                                    </div>
                                </div>

                                <%-- <div class="row">
                                    <div class="col-sm-3 ">
                                        <label class="control-label" for="inputSuccess">FUERZA MUSCULAR DANIELS:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" MaxLength="250" Text="5 de 5"></asp:TextBox>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">CIRCULACIÓN VENOSA</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtEFCirculacion" runat="server" CssClass="form-control" MaxLength="250" Text="Sin varices"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ARCO DE MOVILIDAD</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtEFArcoMovilidad" runat="server" CssClass="form-control" MaxLength="250" Text="Presentes, normales."></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PRUEBA DE FINKELSTEIN</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFPruebaFinke" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">TONO MUSCULAR</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtEFTonoMuscular" runat="server" CssClass="form-control" MaxLength="250" Text="Normal."></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">SIGNO DE TINEL</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFSignoTinel" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">COORDINACION</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtCoordinacion" runat="server" CssClass="form-control" MaxLength="250" Text="Normal."></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PRUEBA DE PHANEL</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFPruebaPhanel" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">TEST DE ROMBERG</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFRomberg" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PRUEBA DE LASEGUE</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFPruebaLasage" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">SIGNO DE BRAGARD:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFSignoBraggard" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PRESENCIA DE QUISTE SINOVIAL:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlEFPresenciaQuiste" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ESPECIFICAR:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtEFEspecificar" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--IMPRESION DIAGNOSTICA--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTen">IMPRESIÓN DIAGNOSTICA</a>
                            </h4>
                        </div>
                        <div id="collapseTen" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">ESTADO NUTRICIONAL:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtENEstadoNutricional" runat="server" CssClass="form-control" MaxLength="250" ClientIDMode="Static"></asp:TextBox>
                                        <%--<asp:DropDownList ID="ddlENEstadoNutricional" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">AGUDEZA VISUAL:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlIDAgudezaNormal" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">SALUD BUCAL:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtIDSaludBucal" runat="server" CssClass="form-control" MaxLength="250" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label" for="inputSuccess">PRESION ARTERIAL:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="dllIDPresionArt" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <br />
                                    <div class="col-sm-12">
                                        <asp:TextBox ID="txtIDComentarios" runat="server" TextMode="MultiLine" Height="51px" CssClass="form-control text-center" Text="Sin otros datos patológicos al momento del estudio."></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--APTITUD SEGÚN HALLAZGOS CLÍNICOS--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">APTITUD SEGÚN HALLAZGOS CLÍNICOS</a>
                            </h4>
                        </div>
                        <div id="collapseEleven" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label text-left" for="inputSuccess">Cumple con los requerimientos de la salud para el puesto propuesto</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<div class="cuadrado" id="IdHallazgo0" style="cursor: pointer">
                                        </div>--%>
                                        <asp:RadioButton ID="rdbASHCBueno" runat="server" GroupName="ASHC" Checked="true" />
                                        <%-- <asp:RadioButtonList RepeatDirection="Horizontal" ID="RadioButtonList1" runat="server">
                                        </asp:RadioButtonList>--%>
                                    </div>
                                    <div class="col-sm-2 text-left">
                                        <label class="control-label" for="inputSuccess">Cumple con los requerimientos de la salud para el puesto propuesto,CONDICIONADO a seguimiento médico específico</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<div class="cuadrado" id="IdHallazgo1" style="cursor: pointer">
                                        </div>--%>
                                        <asp:RadioButton ID="rdbASHCRegular" runat="server" GroupName="ASHC" />
                                    </div>
                                    <div class="col-sm-2 text-left">
                                        <label class="control-label" for="inputSuccess">NO CUMPLE con los requerimientos de salud para el puesto propuesto</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<div class="cuadrado" id="IdHallazgo2" style="cursor: pointer">
                                        </div>--%>
                                        <asp:RadioButton ID="rdbASHCMalo" runat="server" GroupName="ASHC" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--RECOMENDACIONES--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">RECOMENDACIONES</a>
                            </h4>
                        </div>
                        <div id="collapseTwelve" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:TextBox ID="txtASHCRecomencaciones" runat="server" TextMode="MultiLine" Height="70px" CssClass="form-control text-center" placeholder="Recomendaciones"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--VALORACIÓN MÉDICA Y VISUAL ANUAL.--%>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen">VALORACIÓN MÉDICA Y VISUAL ANUAL.</a>
                            </h4>
                        </div>
                        <div id="collapseThirteen" class="panel-collapse collapse ShowPestaña">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">Realizó EM:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <%--<asp:TextBox ID="txtRRealizoEM" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>--%>
                                        <asp:DropDownList ID="ddlRRealizoEM" runat="server" CssClass="form-control" required="required" OnSelectedIndexChanged="ddlRRealizoEM_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">REVISÓ EM:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <%-- <asp:TextBox ID="txtRRevisoEM" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox>--%>
                                        <asp:DropDownList ID="ddlRRevisoEM" runat="server" CssClass="form-control" required="required" OnSelectedIndexChanged="ddlRRevisoEM_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CED. PROF.:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtRCedProf" runat="server" CssClass="form-control numeric" MaxLength="100" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="inputSuccess">CED. PROF.:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtRCedProftwo" runat="server" CssClass="form-control numeric" MaxLength="100" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-6">
                                        <asp:Image ID="imgFirmaRealizo" runat="server" CssClass="rounded center-block" Height="100" Width="100" Visible="false" />
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Image ID="imgFirmaReviso" runat="server" CssClass="rounded center-block" Height="100" Width="100" Visible="false" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row pull-right">
        <div class="col-sm-12">
            <asp:Button ID="btnGuardar" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Text="Guardar" OnClick="btnGuardar_Click" ClientIDMode="Static" />
            <asp:Button ID="btnReporte" runat="server" class="form-control" BackColor="#007bff" ForeColor="White" Visible="false" Text="Reporte" OnClick="btnReporte_Click" />


        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" runat="server">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <p>This is a small modal.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/sweetalert.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.numeric.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>

    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7/dist/polyfill.min.js"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.mask.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jqBootstrapValidation.js")%>"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>



        $(document).ready(function () {

            $("#ddlEFBoca").change(function () {
                var textBoca = $("#ddlEFBoca option:selected").text();
                $("#txtIDSaludBucal").val(textBoca);
            });

            $("#btnGuardar").click(function (e) {
                var valComplexicon = $("#ddlComplexion").val();
                validaCamposVacios();

            });
        });

        $("#txtFechaNac").focusout(function () {
            var fechaNac = String($(this).val());

            if (fechaNac.length == 10) {
                var values = fechaNac.split("-");
                var dia = values[2];
                var mes = values[1];
                var ano = values[0];
                var fecha_hoy = new Date();
                var ahora_ano = fecha_hoy.getYear();
                var ahora_mes = fecha_hoy.getMonth() + 1;
                var edad = (ahora_ano + 1900) - ano;
                var ahora_dia = fecha_hoy.getDate();

                if (ahora_mes < mes) {
                    edad--;
                }
                if ((mes == ahora_mes) && (ahora_dia)) {
                    edad--;
                }
                $("#txtEdad").val(edad);
            }
        });

    </script>



</asp:Content>

