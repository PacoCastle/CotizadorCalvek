<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Radiologia.aspx.cs" Inherits="Examenes_Radiologia" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
    <style>
        textarea {
            resize: none;
        }
    </style>
    <div class="container">
        <h2>Radiología</h2>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label class="control-label" for="inputSuccess">FECHA EXAMEN </label>
                        <asp:TextBox ID="txtRadFechaExamen" runat="server" CssClass="form-control datepicker" ClientIDMode="Static" PlaceHolder="dd/mm/yyyy" required="required" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <br />
                    <br />
                    <br />
                    <div class="col-md-12 mb-12">
                        <asp:Repeater ID="rep" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-3 mb-3">
                                        <asp:Image ID="imgRadiologia" runat="server" CssClass="center-block img-thumbnail" ImageUrl='<%# Container.DataItem %>' />
                                        <hr style="color: #0056b2;" />
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-3 mb-3">
                                            <asp:FileUpload ID="fuRadiologia" runat="server" CssClass="form-control" ClientIDMode="Static" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <label class="control-label" for="inputSuccess">INTERPRETACION</label>
                        <asp:TextBox ID="txtInterpretacion" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="row pull-right">
            <br />
            <div class="col-md-12 mb-12">
                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" BackColor="#007bff" ForeColor="White" CssClass="form-control" Text="Guardar" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <div class="loader">
        <div class="icono">
        </div>
    </div>
     <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/jquery.numeric.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/ValidacionControles.js")%>"></script>
   <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/sweetalert.min.js")%>"></script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/ExamenesJs/Alert.js")%>"></script>
    <script>
        $(document).ready(function () {
            window.onsubmit = function (event) {
                PageLoadStart();
            }
        });
    </script>
</asp:Content>


