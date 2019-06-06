<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaProductoKepler.aspx.cs" Inherits="Catalogos_Productos_AltaProductoKepler" Title="Alta Producto En Kepler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var limit = 40;
            $('textarea[id$=txtDescripcionProducto]').keyup(function () {
                var len = $(this).val().length;
                if (len > limit) {
                    this.value = this.value.substring(0, limit);
                }
                $('#charLeft').text(limit - len + " characters left");
            });
        });
    </script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/scriptsJS/AltaProductoKepler.js")%>"></script>
    <div class="container">
        <h1>Alta Producto</h1>
        <div class="form-group">
            <strong><span style="color: #008080;">Datos</span></strong>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Tipo de Producto:</h5>
                </div>
                <div class="col-sm-4">
                    <asp:RadioButtonList ID="rbtTipoProducto" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbtTipoProducto_SelectedIndexChanged">
                        <asp:ListItem class="radio-inline" Value="0" Text="Interno" Selected="True"></asp:ListItem>
                        <asp:ListItem class="radio-inline" Value="1" Text="Externo"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Clave de Producto: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtClaveProducto" class="form-control" runat="server" required="required" type="text" MaxLength="18" pattern="[/:+0-9a-zA-Z_.-]{3,}" title="Mínimo 3 caractéres Alfanuméricos" onkeyup="javascript:this.value=this.value.toUpperCase();"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Descripción: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtDescripcionProducto" class="form-control" runat="server" required="required" type="text" MaxLength="40"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Marca: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstMarcaKepler" class="form-control" runat="server" required="required" DataSourceID="odsMarcaProductoKepler" DataTextField="marca" DataValueField="claveMarca" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsMarcaProductoKepler" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboMarcaProductoKeplerTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Moneda: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstMoneda" class="form-control" runat="server" required="required" DataTextField="claveUnidadMedida" DataValueField="claveUnidadMedida">
                        <asp:ListItem Value="0">--</asp:ListItem>
                        <asp:ListItem Enabled="False">DLLS </asp:ListItem>
                        <asp:ListItem>PESOS</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-group" id="divPrecioLista" runat="server">
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Precio: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPrecioLista" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group" id="divCosto" runat="server">
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Costo: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:RadioButton ID="rdbCostoIgual" RepeatLayout="Flow" runat="server" AutoPostBack="True" Checked="true" Text="Mismo costo en todas las plazas" OnCheckedChanged="rdbCostoIgual_CheckedChanged" />
                    <asp:TextBox ID="txtCostoIgual" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico"> </asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-4">
                    <asp:RadioButton ID="rdbCostoDiferente" RepeatLayout="Flow" runat="server" AutoPostBack="True" Text="Ingresar Costo por sucursal" OnCheckedChanged="rdbCostoDiferente_CheckedChanged" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="Label1" runat="server" Text="Querétaro"></asp:Label>
                            <asp:TextBox ID="txtCostoQueretaro" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico" Enabled="False"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label2" runat="server" Text="Marques"></asp:Label>
                            <asp:TextBox ID="txtCostoMarques" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico" Enabled="False"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="Celaya"></asp:Label>
                            <asp:TextBox ID="txtCostoCelaya" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group" id="divRentabilidad" runat="server">
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Rentabilidad: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:RadioButton ID="rdbRentabilidadIgual" RepeatLayout="Flow" runat="server" AutoPostBack="True" Checked="true" Text="Misma rentabilidad en todas las plazas" OnCheckedChanged="rdbRentabilidadIgual_CheckedChanged" />
                    <asp:TextBox ID="txtRentabilidadIgual" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-4">
                    <asp:RadioButton ID="rdbRentabilidadDiferente" RepeatLayout="Flow" runat="server" AutoPostBack="True" Text="Ingresar Rentabilidad por sucursal" OnCheckedChanged="rdbRentabilidadDiferente_CheckedChanged" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="Label4" runat="server" Text="Querétaro"></asp:Label>
                            <asp:TextBox ID="txtRentabilidadQueretaro" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico" Enabled="False"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label5" runat="server" Text="Marques"></asp:Label>
                            <asp:TextBox ID="txtRentabilidadMarques" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico" Enabled="False"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="Celaya"></asp:Label>
                            <asp:TextBox ID="txtRentabilidadCelaya" class="form-control" runat="server" required="required" pattern="^\d+(\.\d{1,2})?$" title="Valor Numérico" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Aplica Rango:</h5>
                </div>
                <div class="col-sm-4">
                    <asp:RadioButtonList ID="rbtRango" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
                        <asp:ListItem  class="radio-inline" Value="0" Text="No" Selected="True"></asp:ListItem>
                        <asp:ListItem  class="radio-inline" Value="1" Text="Si"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Unidad de Medida: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstUnidadMedidaKepler" runat="server" class="form-control" required="required" DataSourceID="odsUnidadMedidaKepler" DataTextField="UnidadMedida" DataValueField="claveUnidadMedida" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsUnidadMedidaKepler" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboUnidadMedidaKeplerTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Clave SAT: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtProductoCFDI" runat="server" class="form-control" required="required"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <h5 class="align-middle pull-right">Unidad SAT: <span class="form-required" title="Este campo es obligatorio.">*</span></h5>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="lstUnidadMedidaCFDIKepler" runat="server" class="form-control" required="required" DataSourceID="odsUnidadMedidaCFDIKepler" DataTextField="unidadMedidaCFDI" DataValueField="cveUnidadMedidaCFDI" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsUnidadMedidaCFDIKepler" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ConsultasConKeplerTableAdapters.get_comboUnidadMedidaCFDIKeplerTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-4">
                    <asp:Button ID="btnLimpiar" runat="server" class="form-control" Text="Limpiar" OnClick="btnLimpiar_Click" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btnGuardar" runat="server" class="form-control" Text="Guardar" OnClick="btnGuardar_Click1" />
                    <asp:SqlDataSource ID="sdsInsertaProducto" runat="server" ConnectionString="<%$ ConnectionStrings:cotizadorCS %>"
                        InsertCommand="set_insertaProductosKepler" InsertCommandType="StoredProcedure" OnInserted="sdsInsertaProducto_Inserted">
                        <SelectParameters>
                            <asp:Parameter Name="strClave" Type="String" />
                            <asp:Parameter Name="strDescripcion" Type="String" />
                            <asp:Parameter Name="strClaveMarca" Type="String" />
                            <asp:Parameter Name="strClaveUnidadMedida" Type="String" />
                            <asp:Parameter Name="strClaveMoneda" Type="String" />
                            <asp:Parameter Name="PrecioVenta" Type="Decimal" />
                            <asp:Parameter Name="cveProductoCFDI" Type="String" />
                            <asp:Parameter Name="cveUnidadMedidaCFDI" Type="String" />
                            <asp:Parameter Name="intUsuarioIdAlta" Type="Int32" />
                            <asp:Parameter DefaultValue="" Direction="InputOutput" Name="resultado" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="strClave" Type="String" />
                            <asp:Parameter Name="strDescripcion" Type="String" />
                            <asp:Parameter Name="strClaveMarca" Type="String" />
                            <asp:Parameter Name="strClaveUnidadMedida" Type="String" />
                            <asp:Parameter Name="strClaveMoneda" Type="String" />
                            <asp:Parameter Name="PrecioVenta" Type="Decimal" />
                            <asp:Parameter Name="cveProductoCFDI" Type="String" />
                            <asp:Parameter Name="cveUnidadMedidaCFDI" Type="String" />
                            <asp:Parameter Name="intUsuarioIdAlta" Type="Int32" />
                            <asp:Parameter Name="intTipoProducto" Type="Int32" />
                            <asp:Parameter Name="intAplicaRango" Type="Int32" />
                            <asp:Parameter Name="costoQueretaro" Type="Decimal" />
                            <asp:Parameter Name="costoMarques" Type="Decimal" />
                            <asp:Parameter Name="costoCelaya" Type="Decimal" />
                            <asp:Parameter Name="rentabilidadQueretaro" Type="Decimal" />
                            <asp:Parameter Name="rentabilidadMarques" Type="Decimal" />
                            <asp:Parameter Name="rentabilidadCelaya" Type="Decimal" />
                            <asp:Parameter Direction="Output" Name="resultado" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
        data-toggle="modal" data-target="#myModal">
        Launch demo modal
    </button>
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

