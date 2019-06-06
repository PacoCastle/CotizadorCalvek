<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ayudaproyecto.aspx.cs" Inherits="Proyectos_ayudaproyecto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #999999;
            text-align: center;
            font-size: x-small;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            width: 99%;
        }
        .auto-style3 {
            width: 146px;
        }
        .auto-style4 {
            text-align: right;
            color: #666666;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style5 {
            color: #333333;
            font-size: x-small;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style6 {
            text-align: justify;
        }
        .auto-style7 {
            color: #333333;
            font-size: small;
            font-family: Arial, Helvetica, sans-serif;
            text-align: justify;
        }
        .auto-style8 {
            color: #000066;
        }
        .auto-style10 {
            font-size: small;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style11 {
            color: #333333;
            font-size: small;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style12 {
            color: #000066;
            font-size: small;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style13 {
            text-align: justify;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style14 {
            color: #666666;
            font-size: x-small;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style15 {
            font-size: x-small;
        }
        .auto-style16 {
            color: #FF0000;
        }
        .auto-style17 {
            color: #FF3300;
        }
    </style>
</head>
<body style="width: 500px; height: 500px;"  >
    <form id="form1" runat="server">
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">
                    <asp:Image ID="Image1" runat="server" Height="52px" ImageUrl="~/Imagenes/caidaCalvek.JPG" Width="133px" />
                </td>
                <td class="auto-style4"><strong>Operación Proyectos</strong></td>
            </tr>
        </table>
        <p class="auto-style1">
        <a Name="fin">Ayuda para Usuarios... </a><hr />
        <div class="auto-style1">
            <a href="#fin">Fin de la herramienta</a>&nbsp; I&nbsp; <a href="#busqueda">Búsqueda de Proyecto</a> |&nbsp; <a href="#modif">Modificacion de Partida</a>&nbsp; | <a href="#inserta">Insertar Partidas</a> </div>
        <p class="auto-style6">
            &nbsp;</p>
        <p class="auto-style6">
            <span class="auto-style12"><a Name="fin"><strong>Fin</strong></a><strong> de la herramienta</strong></span><br class="auto-style11" />
            <span class="auto-style11">El cátalogo de la herramienta Kepler requiere mayor funcionalidad, por lo que se desarrolla una aplicacion alterna, para poder manipular la informacion a través de SICK.</span></p>
        <p class="auto-style7">
            En esta herramienta, se podrá modificar dicho catalogo, siempre y cuando se cumplan las siguientes condiciones:</p>
        <p class="auto-style6">
            <span class="auto-style11">1) El proyecto tenga una alta en sistema Kepler.</span><br class="auto-style11" />
            <span class="auto-style11">2) La partida no se encuentre facturada.</span></p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <p class="auto-style6" align="center">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="291px" ImageUrl="~/Imagenes/proykep.PNG" Width="489px" />
        </p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <table class="auto-style2">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <a href="#inicio"><asp:ImageButton ID="ImageButton8" runat="server" Height="42px" ImageUrl="~/Imagenes/home.PNG" style="text-align: right" Width="45px" />
                    <span class="auto-style14">inicio</span></a></td>
            </tr>
        </table>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
        <p class="auto-style6" align="center">
            &nbsp;</p>
    
 
    <p class="auto-style6">
        <span class="auto-style8"><a Name="busqueda"><span class="auto-style10"><strong>Búsqueda</strong></span></a><span class="auto-style10"><strong> de Proyectos</strong></span></span><br class="auto-style5" />
        <span class="auto-style11">En esta seccion podrá seleccionar y buscar los proyectos de acuerdo a su identificador que asigna el área de Soporte Técnico, para cada plaza utilizan los siguientes clasificaciones:</span></p>
    <p class="auto-style6">
        <span class="auto-style11">XS --&gt; Proyecto o Servicio de San Luis Potosí</span><br class="auto-style11" />
        <span class="auto-style11">ZC --&gt; Proyecto o Servicio de Celaya</span><br class="auto-style11" />
        <span class="auto-style11">ZQ --&gt; Proyecto o Servicio de Queretaro</span><br class="auto-style11" />
        <span class="auto-style11">ZI --&gt; Proyecto o Servicio de Irapuato</span></p>

        <p class="auto-style13">
            En la siguiente pantalla se debera colocar el codigo a buscar:</p>
        <p class="auto-style6">
            <asp:ImageButton ID="ImageButton2" runat="server" Height="121px" ImageUrl="~/Imagenes/busqproy.PNG" Width="489px" />
        </p>
 
        <p class="auto-style13">
            Si el proyecto es localizado, mostrara el detalle de las partidas existente en el catálogo (puede solo tener al alta del proyecto).
            <br />
            <br />
            Al no localizar ninguna información de lo solicitado, no mostrara nada en la pantalla.</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            <table class="auto-style2">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><a href="#inicio">
                        <asp:ImageButton ID="ImageButton9" runat="server" Height="42px" ImageUrl="~/Imagenes/home.PNG" style="text-align: right" Width="45px" />
                        <span class="auto-style14">inicio</span></a></td>
                </tr>
            </table>
        </p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
    <p class="auto-style13">
            <span class="auto-style8"><a Name="modif"><span class="auto-style10"><strong>Modificación de Partidas.</strong></span></a></span><span class="auto-style11"><br />
            </span>Aqui se podran realizar 2 tipos de cambios principalmente:<br />
&nbsp;<br />
            1. Modificar la descripcion de la factura por partida, se admiten 5 renglones máximos, y cada renglon pueden describir hasta 35 caracteres, el valor del importe y el Iva.<br />
            <br />
            2. Eliminar una partida.</p>
        <p class="auto-style13">
            Recordemos que estos cambios, se podrán realizar siempre que no se haya facturado la(s) partida(s).</p>
        <p class="auto-style13">
            Una vez realizada la búsqueda del proyecto e identificando correctamente la sucursal del proyecto a modificar -<span class="auto-style15"><em>casi todos los proyectos se encuentran registrados en Calvek SA y Calvek Bajio o Calvel Centro, ya que en SA se registran algunos gastos o pagos a Proveedores</em></span>-, aparecerá la siguiente informacion:</p>
        <p class="auto-style13">
            <asp:ImageButton ID="ImageButton3" runat="server" Height="151px" ImageUrl="~/Imagenes/busproyec.PNG" Width="488px" />
        </p>
        <p class="auto-style13">
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Imagenes/busqproy_detalle.PNG" Width="493px" />
        </p>
        <p class="auto-style13">
            Se pueden realizar 2 tareas principales con la informacíón que se muestra.
        </p>
        <p class="auto-style13">
            1.<span class="auto-style16"><strong>Modificar</strong></span> algun concepto o renglon, o bien modificar el importe de la partida, incluso el IVA, ya que en algunos casos, los cliente no factura con Iva (extranjeros).</p>
        <p class="auto-style13">
            2. <span class="auto-style17"><strong>Eliminar</strong></span> una o varias partidas, simplmente, seleccionando la opcion. Una vez generada esta accion, no se podrá recuperar la informacion y se debera capturar de nueva cuenta.</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            <table class="auto-style2">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><a href="#inicio">
                        <asp:ImageButton ID="ImageButton10" runat="server" Height="42px" ImageUrl="~/Imagenes/home.PNG" style="text-align: right" Width="45px" />
                        <span class="auto-style14">inicio</span></a></td>
                </tr>
            </table>
        </p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
        <p class="auto-style13">
            &nbsp;</p>
 
        <p class="auto-style13">
            <span class="auto-style8"><span class="auto-style10"><strong><a Name="inserta">Insertar Partidas</a></strong></span></span><br />
            Varios proyectos solo se aperturan para poder solicitar el mateiral, y en varios de ellos no se cuenta con la orden de compra en el momento de la creación del mismo.</p>
    <p class="auto-style13">
        Cuando se va a facturar alguna parcialidad o totalidad del mismo, se deben adicionar estas partidas. En esta sección se podrá realizar la tarea.</p>
    <p class="auto-style13">
        Se podrá definir</p>
    <p class="auto-style13">
        <strong>Tipo de partida</strong>. Existen 3 tipos, 1 Proyecto , 2 Ampliacion y 3 Garantia --&gt; esta etiquetas son las que salen en la factura, normalmente hemos usado, el&nbsp; valor 1 y 2.</p>

        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Imagenes/partidaadicionproy.PNG" Width="489px" />
        <p class="auto-style10">
            y la partida quedara anexada en el proyecto, como se aprecia a continuacion:</p>
        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Imagenes/partidaadicionproyanexada.PNG" Width="491px" />
        <p class="auto-style10">
            y en Kepler tambien aparece, lista para facturarse:</p>
        <p>
            <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Imagenes/proykeppart.PNG" Width="478px" />
        </p>
        <p>
            &nbsp;</p>
        <table class="auto-style2">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td><a href="#inicio">
                    <asp:ImageButton ID="ImageButton11" runat="server" Height="42px" ImageUrl="~/Imagenes/home.PNG" style="text-align: right" Width="45px" />
                    <span class="auto-style14">inicio</span></a></td>
            </tr>
        </table>
    </form>
 
        </body>
</html>
