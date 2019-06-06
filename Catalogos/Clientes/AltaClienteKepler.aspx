<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaClienteKepler.aspx.cs" Inherits="Catalogos_Productos_AltaClienteKepler" Title="Alta Cliente En Kepler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
    <div class="container">
        <h1>Alta Cliente</h1>
        <div class="form-group">
            <strong><span style="color: #008080;">Datos del RFC</span></strong>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-2">
                        <h5 class="align-middle pull-right">RFC: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtRFC" class="form-control" runat="server" required="required" type="text" MaxLength="13" pattern="^[a-zA-Z0-9]*$" title="Ingrese 13 letras y/o Números" onkeyup="javascript:this.value=this.value.toUpperCase();">
                        </asp:TextBox>
                    </div>
                   <%-- <div class="col-sm-2">
                        <asp:Button ID="btnValidaRFC" runat="server" Text="Validar" class="form-control" OnClick="btnValidaRFC_Click" Visible="False" />
                    </div>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Nombre Completo: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNombreCompleto" class="form-control" runat="server" required="required" type="text" MaxLength="60"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <strong><span style="color: #008080;">Datos Generales</span></strong>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Calle: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCalle" class="form-control" runat="server" required="required" type="text" MaxLength="35">
                    </asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Número: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNumeroInt" class="form-control" runat="server" required="required" type="text" MaxLength="5"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Colonia: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtColonia" class="form-control" runat="server" required="required" type="text" MaxLength="40"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Población: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPoblacion" class="form-control" runat="server" type="text" MaxLength="40"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">CP: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCP" class="form-control" runat="server" required="required" type="text" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Telefóno: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtTelefono" class="form-control" runat="server" required="required" type="text" MaxLength="14"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Telefóno 2: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtTelefono2" class="form-control" runat="server" required="required" type="tel" MaxLength="14"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Email: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server" required="required" type="email" MaxLength="60"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <strong><span style="color: #008080;">Información Adicional</span></strong>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Vendedor: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstVendedor" runat="server" class="form-control" required="required" DataSourceID="odsVendedor" DataTextField="vendedor" DataValueField="cveVendedor" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsVendedor" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboVendedorKeplerTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Limite Crédito: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtLimiteCredito" class="form-control" runat="server" required="required" type="number" step="0.01" maxleght="15" pattern="^\d+(?:\.\d{1,2})?$" title="Solo pueden utilizarce 2 decimales"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Plazo: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPlazo" class="form-control" runat="server" required="required" type="text" MaxLength="4"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Descuento: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtDescuento" class="form-control" runat="server" type="text" MaxLength="4"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Descuento2: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtDescuento2" class="form-control" runat="server" type="text" MaxLength="4"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <strong><span class="align-middle pull-right" style="color: #008080;">Datos Fiscales</span></strong>
                </div>
                <div class="col-sm-2">
                    <asp:CheckBox ID="chkDatosFiscales" runat="server" class="align-middle pull-left" Text="Mismos Datos" OnCheckedChanged="chkDatosFiscales_CheckedChanged" AutoPostBack="true" />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Calle: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCalleFiscales" class="form-control" runat="server" required="required" type="text" MaxLength="35">
                    </asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Número: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNumeroIntFiscales" class="form-control" runat="server" required="required" type="text" MaxLength="5"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Colonia: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtColoniaFiscales" class="form-control" runat="server" required="required" type="text" MaxLength="40"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Población: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPoblacionFiscales" class="form-control" runat="server" type="text" MaxLength="40"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">CP: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCPFiscales" class="form-control" runat="server" required="required" type="text" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Método de pago: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstMetodoPago" runat="server" class="form-control" required="required" DataSourceID="odsMetodoPago" DataTextField="metodoPago" DataValueField="cveMetodoPago" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsMetodoPago" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboMetodoPagoKeplerTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Cuenta de Pago: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCuentaPagoFiscales" class="form-control" runat="server" required="required" type="text" MaxLength="18"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Uso del comprobante: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstUsoComprobante" runat="server" class="form-control" required="required" DataSourceID="odsUsoComprobante" DataTextField="usoComprobante" DataValueField="cveUsoComprobante" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsUsoComprobante" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboUsoComprobanteTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" class="form-control" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click1" class="form-control" />
                    <asp:SqlDataSource ID="sdsInsertaCliente" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                        InsertCommand="Set_InsertaClienteKepler" InsertCommandType="StoredProcedure" OnInserted="sdsInsertaProducto_Inserted">
                        <InsertParameters>
                            <asp:Parameter Name="nombre_comp" Type="String" Size="60" />
                            <asp:Parameter Name="calle" Type="String" Size="35" />
                            <asp:Parameter Name="num" Type="String" Size="5" />
                            <asp:Parameter Name="colonia" Type="String" Size="40" />
                            <asp:Parameter Name="poblacion" Type="String" Size="40" />
                            <asp:Parameter Name="telefono1" Type="String" Size="14" />
                            <asp:Parameter Name="telefono2" Type="String" Size="14" />
                            <asp:Parameter Name="rfc" Type="String" Size="13" />
                            <asp:Parameter Name="correo" Type="String" Size="60" />
                            <asp:Parameter Name="vendedor" Type="String" Size="5" />
                            <asp:Parameter Name="lim_credito" Type="Decimal" />
                            <asp:Parameter Name="plazo" Type="String" Size="4" />
                            <asp:Parameter Name="descuentos" Type="String" Size="4" />
                            <asp:Parameter Name="descuentos2" Type="String" Size="4" />
                            <asp:Parameter Name="cp" Type="String" Size="10" />
                            <asp:Parameter Name="calleFiscal" Type="String" Size="60" />
                            <asp:Parameter Name="numFiscal" Type="String" Size="10" />
                            <asp:Parameter Name="coloniaFiscal" Type="String" Size="60" />
                            <asp:Parameter Name="poblacionFiscal" Type="String" Size="60" />
                            <asp:Parameter Name="cpFiscal" Type="String" Size="10" />
                            <asp:Parameter Name="metodoPago" Type="String" Size="10" />
                            <asp:Parameter Name="cuentaPago" Type="String" Size="18" />
                            <asp:Parameter Name="usoComprobante" Type="String" Size="8" />
                            <asp:Parameter Name="idUsuario" Type="Int32" />
                            <asp:Parameter Direction="InputOutput" Name="resultado" Type="String" Size="50" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
        data-toggle="modal" data-target="#myModal">
        Launch demo modal</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

