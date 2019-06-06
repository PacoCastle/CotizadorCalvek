<%@ Page Title="" Language="C#" MasterPageFile="~/HelpMasterPage.master" AutoEventWireup="true" CodeFile="HelpRemisiones.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        $(function () {
            $("#accordion").accordion({
                heightStyle: "content"
            });
            $("#accordion").accordion({
                collapsible: true
            });
        });
  </script>

<div id="accordion">
  <h3>Acerca de...</h3>
  <div>
    <p>
          La herramienta de reporteo de Remisiones se implementó con la finalidad de tener un mejor control y automatización en la notificación del estatus de remisiones de cada asesor.
          Al mismo tiempo muestra con carácter informativo los montos totales que se tiene por plaza y su antigüedad, así como el tipo de negociación.
      </p>
       <p>
          La pantalla cuenta con 2 pestañas;
      </p>
    <ul>
      <li>General</li>
      <li>Detalles</li>
    </ul>
    <p>
          La pestaña general muestra por rango de fecha, negociación y plaza las remisiones que tienen un saldo pendiente por cubrir.  
    </p>
     <p>
          <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/Help/helpImg1.jpg" />
    </p>
  </div>   
  <h3>Descripción Detalles</h3>
  <div>
      <p>
           En la pantalla default Detalles se encuentran todos los movimientos agrupados por plaza. Para visualizar los movimientos basta con dar al link marcado de color azul con el nombre de la plaza y con ello se despliega el detalle por documento.
       </p>
       <p>
          <asp:Image ID="Image3" runat="server" ImageUrl="~/Imagenes/Help/helpImg3.jpg" />
        </p>
      <p>
            Al elegir el tipo de documento para pasar al siguiente nivel se despliegan los detalles, por plaza, documento y asesor, mostrando los montos acumulados por rango de días.
       </p>
       <p>
          <asp:Image ID="Image4" runat="server" ImageUrl="~/Imagenes/Help/helpImg4.jpg" />
        </p>
       <p>
            Dependiendo de la elección anterior ahora vamos a ver el detalle a nivel cliente
       </p>
       <p>
          <asp:Image ID="Image5" runat="server" ImageUrl="~/Imagenes/Help/helpImg5.jpg" />
        </p>
       <p>
            Finalmente, al dar Clic al cliente deseado se muestran los detalles por Sucursal, Folio, Pedido, Monto y Estatus.
       </p>
       <p>
          <asp:Image ID="Image6" runat="server" ImageUrl="~/Imagenes/Help/helpImg6.jpg" />
        </p>
    
  </div>   
   <h3>Funcionalidad Detalles</h3>
  <div>
      <p>
           Al llegar a los Detalles de la Remisión por cliente podemos ver un botón para modificar y un botón adicional para ver detalles del folio e historial.
       </p>
       <p>
          <asp:Image ID="Image7" runat="server" ImageUrl="~/Imagenes/Help/helpImg7.jpg" />
        </p>
      <p>
            La columna estatus indica por partida como es que se ha dado seguimiento a la remisión.
       </p>
       <p>
          La columna estatus indica por partida como es que se ha dado seguimiento a la remisión.
        </p>
      <p>
          Al dar clic al botón cometarios en esta pantalla podemos ver el historial de estatus que tiene la partida, así como las partidas contenidas en el folio. Observar siguiente imagen;
        </p>
       <p>
          <asp:Image ID="Image8" runat="server" ImageUrl="~/Imagenes/Help/helpImg8.jpg" />
        </p>
       <p>
            Para regresar al panel principal dar clic en el botón cerrar.
       </p>
       <p>
          El botón para modificar sirve para hacer cambio de estatus por partida, en este se despliega una lista de justificaciones y se puede adicionalmente agregar un comentario como nota, mismo que será visible en el historial. 
        </p>
       <p>
          Una vez que se elige la justificación y se agrega el comentario podemos darle en Actualizar para confirmar o Cancelar para Cerrar el modo edición.
        </p>
        <p>
          <asp:Image ID="Image9" runat="server" ImageUrl="~/Imagenes/Help/helpImg9.jpg" />
        </p>
      <p>
          Adicionalmente es posible hacer una busqueda rapida que puede ser por el Id o Descripción del Cliente y/o por folio. Este menu se encuentra en la parte superior de la pantalla y funciona de la siguiente manera;
      </p>
        <p>
          <asp:Image ID="Image10" runat="server" ImageUrl="~/Imagenes/Help/helpImg10.jpg" />
        </p>
  </div>
    <h3>Descripcion Estatus</h3>
  <div>
      <p>
           A continuación de describen los tipos de Estatus, descripción, acción y vigencia.
       </p>
      <p>
           Pendiente: Cuenta con menos de 31 días.
       </p>
       <ul>
            <li>Acción; Cuando se rebase los 31 días pasa a Reportada.</li>
            <li>Vigencia: 7 días naturales.</li>
        </ul>
      <p>
           Reportada: Rebaso los 31 o 45 días.
       </p>
       <ul>
            <li>Acción; Aplicar una justificación. Si se encuentra en Reportada y no se aplica justificación pasa a Vencida.</li>
            <li>Vigencia: 7 días naturales.</li>
        </ul>
       <p>
           Vencida: Se cumplió la fecha de vencimiento otorgada.
       </p>
       <ul>
            <li>Acción; El administrador determina si aplica retención.</li>
        </ul>
      <p>
          Por facturar: Se notifica a administración que la remisión esta lista para ser facturada. 
       </p>
       <p>
          Sin orden de compra: Se justifica que no se ha atendido porque no existe una orden de compra. 
       </p>
        <p>
          Requisición en camino: El cliente indica que expedirá la requisición pero aún no se cuenta con la misma.
       </p>
       <p>
          Cambio de personal: Por movimiento de personal se tiene problema para la resolución de la remisión.
       </p>

       <ul>
            <li>Acción; Se asigna una fecha de vencimiento automática, si el administrador rechaza la justificación pasa a finiquitada. Puede ser aceptada pero con una fecha menor a la aplicada por sistema. Si se rebasa la fecha otorgada pasa a Vencida.</li>
           <li>Vigencia: 30 días naturales.</li>
        </ul>
      <p>
          Urgencia: El material salió urgente como remisión y no se ha logrado recuperar.
       </p>
       <ul>
           <li>Vigencia: 4 días naturales.</li>
        </ul>
      <p>
          Pruebas: El cliente solicita el material para pruebas y se le otorga a modo remisión.
       </p>
       <ul>
           <li>Vigencia: 7 días naturales.</li>
        </ul>
       <p>
          Aceptado: La justificación que indica el asesor es aceptada.
       </p>
       <ul>
           <li>Vigencia: Determinada por el administrador.</li>
        </ul>
      <p>
          Negociación autorizada: Se autoriza una fecha abierta para la salida del material.
       </p>
       <ul>
           <li>Vigencia: Abierta.</li>
        </ul>
      <p>
          Pendiente de finiquito: No se realiza el proceso de devolución hasta saldar la remisión.
       </p>
        <p>
          Finiquitado: Se genera la devolución de materiales y se aplica la retención correspondiente.
       </p>
  </div>
    <h3>Notificaciones Automaticas</h3>
  <div>
      <p>
           El sistema notifica vía e-mail en los siguientes casos;
       </p>
      <p>
           MAYORES A 31 DIAS; El correo contiene el total de movimientos por asesor que rebasan los 31 días.
       </p>
      <p>
           MAYORES A 45 DIAS; El correo contiene el total de movimientos por asesor que rebasan los 31 días.
       </p>
      <p>
           REMISIONES POR VENCER: 2 días naturales llegará un correo notificando las partidas que tienen por vencer.
       </p>
       <p>
           REMISIONES VENCIDAS: Una vez que se rebaso la fecha asignada llega el compilado de partidas vencidas.
       </p>
      <p>
           REMISION MODIFICADA: Si se aplicó una justificación o cambio de estatus y el administrador dio respuesta a la misma, se notifica al asesor a través de un correo.
       </p>
  </div>
</div>

</asp:Content>

