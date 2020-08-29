# ISW_Implementacion_User_Story
Implementacion con Flutter de user story "Realizar pedido de lo que sea", Materia ISW

## Consigna
Implementar una User Story determinada usando un lenguaje de programación elegido por el grupo respetando un documento de reglas de estilo.

## Objetivo
Que el estudiante comprenda la implementación de una User Story como una porción transversal de funcionalidad que requiere la colaboración de un equipo multidisciplinario.

## Proposito
Familiarizarse con los conceptos de requerimientos ágiles y en particular con User Stories en conjunto con la aplicación de las actividades de SCM correspondientes.

## Entradas
Conceptos teóricos sobre el tema desarrollados en clase. Definición completa de las User Stories correspondientes al Trabajo Práctico 2 “Requerimientos Ágiles – User Stories y Estimaciones

## Salida
Implementación de la User Story correspondiente en un programa ejecutable.
Documento de estilo de código.

## Instrucciones
-        Seleccionar una User Story a implementar de entre las siguientes opciones:
Realizar Pedido a Comercio adherido (grupos pares) o Realizar un Pedido de "lo que sea" (grupos impares)
-        Seleccionar el conjunto de tecnologías para implementar la funcionalidad elegida.
-        Buscar y seleccionar un documento de buenas prácticas y/o reglas de estilo de código para el lenguaje de programación a utilizar.
-        Implementar la US siguiendo las reglas de estilo determinadas.

# User Story
## Realizar pedido de "lo que sea"
Como Solicitante quiero realizar un Pedido de “lo que sea” para recibir algo en mi
domicilio que no está disponible en los comercios adheridos
### Criterios de aceptacion
* Se debe indicar qué debe buscar el Cadete con un campo de texto.
* Se puede adjuntar opcionalmente una foto en formato JPG con un tamaño
máximo de 5 MB.
* Se debe indicar la dirección del comercio en forma textual (calle, número, ciudad
y referencia opcional en formato de texto) o seleccionando un punto en un mapa
interactivo de Google Maps.
* Se debe indicar la dirección de entrega (calle, número, ciudad y referencia
opcional en formato de texto). La ciudad podrá ser seleccionada de un listado de
Ciudades disponibles.
* Se debe seleccionar la forma de pago: Efectivo o Tarjeta VISA, en caso de haber
seleccionado pago en Efectivo el monto con el que va a pagar. En caso de seleccionar
Tarjeta VISA debe ingresar el número de la tarjeta, nombre y apellido del Titular, fecha
de vencimiento (MM/AAAA) y CVC.
* Debe ingresar cuando quiere recibirlo: “Lo antes posible” o una fecha/hora de
recepción).

### Pruebas de aceptacion
* Probar realizar un Pedido de “lo que sea” en efectivo “lo antes posible” (pasa)
* Probar realizar un Pedido de “lo que sea” con tarjeta “lo antes posible” (pasa)
* Probar realizar un Pedido de “lo que sea” programando la fecha/hora de entrega (pasa)
* Probar realizar un Pedido de “lo que sea” con una tarjeta inválida (falla)
* Probar realizar un Pedido de “lo que sea” con una tarjeta MasterCard (falla)
* Probar realizar un Pedido de “lo que sea” en efectivo sin indicar el monto a pagar (falla)
* Probar realizar un Pedido de “lo que sea” programando una fecha/hora de entrega no válida
(falla)
* Probar realizar un Pedido de “lo que sea” sin especificar qué buscar (falla)
* Probar realizar un Pedido de “lo que sea” adjuntando una foto (pasa)
* Probar realizar un Pedido de “lo que sea” sin indicar la dirección del comercio (falla)
* Probar realizar un Pedido de “lo que sea” seleccionando la dirección del comercio en el mapa
interactivo (pasa)
