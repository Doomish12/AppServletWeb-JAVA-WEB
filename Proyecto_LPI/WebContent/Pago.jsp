<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="mante.CarritoDAO" %>
<%@ page import="modelos.CarritoItem" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proceso de Pago</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <link rel='stylesheet' type='text/css' media='screen' href='css/inicio.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Epilogue&display=swap" rel="stylesheet">

<style>
  main {
   max-width: 1400px;
   display: flex;
   margin:auto;
   align-items: center;
   gap:15px;
   margin-top: 160px;
  }
  
   .header-row {
    background-color: #333333; /* Color de fondo gris medio oscuro */
    color: white; /* Color de texto blanco */
  }
  
  .generar-compra {
    background-color: #f2f2f2; /* Color de fondo gris claro */
  }
  .sty{
  	margin-right: 150px;


  	color: white;
  	font-weight: bold;
  }
  .inpu{
  	font-weight: bold;
  	color:black;
  }
  .font{
  	font-weight: bold;
  }
  .conte-pag{
 	margin-top: 30px;
  }
    .credit-card-image {
    background-image: url("img/CrediCart.png");
    background-repeat: no-repeat;
    background-size: contain;
    background-position: right center;
    padding-right: 40px; 
  }
 .form-control::placeholder {
  font-size: 14px; 
}
.cvv{
	display: inline-block;
  background-color: black;
  color: white;
  border-radius: 50%;
  font-weight: bold;
  width: 20px; 
  text-align: center;
}
.altura{
	height: 80px;
}
.hide-calendar .ui-datepicker-calendar {
  display: none;
}

</style>
</head>
<body>

    <header class="header">
        <div class="contenedor">
        <div class="icono">
           <a  href="inicio.jsp"> <img src="img/Logo.png"  width="120px" height="120px"></a>
        </div>

        <div class="menu">

            <div class="dropdown">
                <a class="btn  dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Libros
                </a>

         

                <ul class="dropdown-menu">
        <div class="libros-interno">          
             <div>
                  <li><a class="dropdown-item" href="#">
                    <i class="fa-solid fa-book-open"></i> Clasicos</a></li>

                  <li><a class="dropdown-item" href="#">
                    <i class="fa-regular fa-bookmark"></i> Ingenio</a></li>
                  <li><a class="dropdown-item" href="#">
                    <i class="fa-solid fa-book-open-reader" style="color: #000000;"></i> Creatividad</a></li>
                  <li><a class="dropdown-item" href="#">
                    <i class="fa-solid fa-circle-check fa-beat-fade" style="color: #d10000;"></i> Novedades</a></li>
            </div>

             <div class="img-libro">
                <img src="img/libros_1.jpg" width="200px" height="150px">
                <p class="p-libro">Ver todos los libros</p>
            </div>
            
        </div>
            </ul>
          

              </div>

              <div class="dropdown">
                <a class="btn  dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Infantil
                </a>
              
                <ul class="dropdown-menu">
                    <div class="libros-interno">          
                        <div>
                             <li><a class="dropdown-item" href="#">
                               <i class="fa-solid fa-book-open"></i> Literatura</a></li>
           
                             <li><a class="dropdown-item" href="#">
                                <i class="fa-solid fa-swatchbook"></i> actividades</a></li>
                             <li><a class="dropdown-item" href="#">
                               <i class="fa-solid fa-circle-check fa-beat-fade" style="color: #d10000;"></i> Novedades</a></li>
                       </div>
           
                        <div class="img-libro">
                           <img src="img/infatil_1.jpg" width="200px" height="150px">
                           <p class="p-libro">Ver todo</p>
                       </div>
                       
                   </div>
                </ul>
              </div>

              <div class="dropdown">
                <a class="btn  dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Objetos literarios
                </a>
              
                <ul class="dropdown-menu">
                    <div class="libros-interno">          
                        <div>
                             <li><a class="dropdown-item" href="#">
                                <i class="fa-regular fa-bookmark"></i> Marcapáginas</a></li>
           
                             <li><a class="dropdown-item" href="#">
                                <i class="fa-solid fa-puzzle-piece"></i> Puzzles</a></li>
                             <li><a class="dropdown-item" href="#">
                                <i class="fa-solid fa-book-bookmark"></i> Libretas literarias</a></li>
                       </div>
           
                        <div class="img-libro">
                           <img src="img/objetos_1.jpg" width="200px" height="150px">
                           <p class="p-libro">Ver todos los objetos literarios</p>
                       </div>
                       
                   </div>
                </ul>
              </div>

              <div class="dropdown">
 <!--QUITAR FONDO Y BORDER-->   <a class="btn  dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Autores
                </a>
              
                <ul class="dropdown-menu">
                    <div class="libros-interno">          
                        <div class="img-centro">
                             <li><a class="dropdown-item" href="#">
                                <img src="img/au_1.png" width="45px" height="45px"> H.P.Lovecraft</a></li>
           
                             <li><a class="dropdown-item" href="#">
                                <img src="img/au_2.png" width="45px" height="45px"> Jane Austen</a></li>
                             <li><a class="dropdown-item" href="#">
                                <img src="img/au_3.png" width="45px" height="45px"> Edgar Allan Poe</a></li>
                       </div>
           
                        <div class="img-libro">
                           <img src="img/autores_1.jpg" width="200px" height="150px">
                           <p class="p-libro">Ver todos los autores</p>
                       </div>
                       
                   </div>
                </ul>
              </div>
        </div>
   

        
  
          <div class="login">
		    		<!-- Boton usuario -->
            <div class="btn-group">
            <a class="btn btn btn-danger dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Cerrar Sesión
          </a>

         <ul class="dropdown-menu sesion">
              <li class="dropdown-item"><img   src="img/usuario.png" width="100px" height="100px" ></li>
              <li><a class="dropdown-item" href="#">${usuario}</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="Principal.jsp">Salir</a></li>
        </ul>
      </div>
              <!-- Boton usuario -->
        </div>


    </div> <!--DIV PRINCIPAL CONTENEDOR-->
    </header>


<main>
    
<div class="container">
  <h2 class="font">Carrito</h2>
  <table class="table">
    <thead>
      <tr class="header-row">
      	<th>ID</th>
        <th>Imagen</th>
        <th>Nombre</th>
        <th>Cantidad</th>
        <th>Precio</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
    
    <% 
    // Instanciar la clase CarritoDAO
    CarritoDAO carritoDAO = new CarritoDAO();
    List<CarritoItem> carritoItems = carritoDAO.getCarritoItems();
    
    double totalPagar = 0; // Variable para almacenar la suma total
    
    for (CarritoItem item : carritoItems) {
        int id = item.getId();
        int productId = item.getProductId();
        Blob imagen = item.getImagen();
        String nombre = item.getNombre();
        int cantidad = item.getCantidad();
        double precio = item.getPrecio();
        
        totalPagar += precio; // Sumar el precio al totalPagar
    %>
    
        <tr>
          <td><%= productId %></td>
          <td><img src="data:image/jpeg;base64, <%= new String(imagen.getBytes(1, (int) imagen.length()), "UTF-8") %>" width="100" height="100"></td>
          <td><%= nombre %></td>
          <td><%= cantidad %></td>
          <td><%= precio %></td>
          <td>
    <form action="PagoServlet" method="GET" class="remove-product-form">
        <input type="hidden" name="removeProductId" value="<%= productId %>">
        <button type="button" name="removeProduct" class="btn btn-danger remove-product" onclick="eliminarProducto(<%= productId %>)">
            <i class="fas fa-trash"></i> 
        </button>
    </form>
          </td>
        </tr>
    
    <% 
    }
    %>
      
    </tbody>
  </table>
</div>

<% if (session.getAttribute("Eliminado") != null && (boolean) session.getAttribute("Eliminado")) { %>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        // Muestra el mensaje de éxito utilizando SweetAlert2
        Swal.fire({
            icon: 'success',
            title: 'Se eliminó el producto del carrito exitosamente!',
            timer: 2000
        });
        <% session.removeAttribute("Eliminado"); %>
    </script>
<% } %>



<div class="generar-compra bg-dark p-4 rounded sty" style="width: 400px;">
<div class="conte-pag">
  <div style="color: white;">
    <h4 class="mb-3">Generar Compra</h4>
  </div>  
  <div class="form-group">
    <label for="total-pagar">Total a Pagar:</label>
    <input type="text" class="form-control text-center inpu" id="total-pagar" value="S/<%= totalPagar %>" readonly>
  </div>
  <div form-group>
    <button class="btn btn-info btn-block sty " data-toggle="modal" data-target="#modal-pago">Generar Pago</button>
     
  </div> 
  

  
  </div>
</div>


<!-- Modal de Pago -->
<div class="modal fade ancho" id="modal-pago" tabindex="-1" role="dialog" aria-labelledby="modal-pago-label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" style="max-width: 400px;" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modal-pago-label">Datos de Tarjeta de Crédito</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="PagoServlet" method="post" id="pagoForm" novalidate>
          <div class="form-group">
            <label for="tarjeta-nombre">Nombre en la Tarjeta:</label>
            <input type="text" class="form-control" id="tarjeta-nombre" placeholder="Ingrese el nombre del propietario">
          </div>

          <div class="form-group">
            <label for="tarjeta-numero">Número de Tarjeta:</label>
            <div class="input-group">
              <input type="text" class="form-control credit-card-image" id="tarjeta-numero" placeholder="Ingrese el número de tarjeta" minlength="19" maxlength="19" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="tarjeta-vencimiento">Fecha de Vencimiento:</label>
              <input type="text" class="form-control" id="tarjeta-vencimiento" placeholder="MM/AA" minlength="5" maxlength="5" required>
            </div>
            <div class="form-group col-md-6">
              <label for="tarjeta-cvv">CVV <span class="cvv">?</span></label>
              <input type="text" class="form-control" id="tarjeta-cvv" placeholder="código (CVV)" minlength="3" maxlength="3">
            </div>
          </div>
      </div>
      <div class="modal-footer d-flex justify-content-center align-items-center altura">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Realizar Pago</button>
      </div>
    </form>
  </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  document.getElementById('pagoForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Evitar el envío automático del formulario

    var nombre = document.getElementById('tarjeta-nombre').value;
    var targeta = document.getElementById('tarjeta-numero').value;
    var vence = document.getElementById('tarjeta-vencimiento').value;
    var cvv = document.getElementById('tarjeta-cvv').value;

    if (nombre === '' || targeta === '' || vence === '' || cvv === '') {
      // Mostrar un mensaje de error si algún campo está vacío
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Por favor, completa todos los campos correctamente.',
        showCancelButton: false,
        showConfirmButton: true,
      });
    } else {
      Swal.fire({
        icon: 'success',
        title: 'Pago realizado exitosamente',
        showCancelButton: false,
        showConfirmButton: true,
      }).then((result) => {
        if (result.isConfirmed) {
          // Enviar manualmente el formulario
          document.getElementById('pagoForm').submit();
        }
      });
    }
  });
</script>





<script>

  
  function eliminarProducto(productId) {
	    Swal.fire({
	        icon: 'warning',
	        title: '¿Estás seguro de que deseas eliminar este producto?',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Sí, eliminar',
	        cancelButtonText: 'Cancelar'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            var form = document.querySelector("form.remove-product-form input[name='removeProductId'][value='" + productId + "']").parentNode;
	            form.action = "PagoServlet?removeProductId=" + productId;
	            form.submit();
	        }
	    });
	}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://kit.fontawesome.com/1ece75081f.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>


<script>



$(function() {
	  $("#tarjeta-vencimiento").datepicker({
	    dateFormat: 'mm/yy',
	    changeMonth: true,
	    changeYear: true,
	    showButtonPanel: true,
	    onChangeMonthYear: function(year, month, inst) {
	      $(this).val($.datepicker.formatDate('mm/yy', new Date(year, month - 1, 1)));
	    },
	    beforeShow: function(input, inst) {
	      inst.dpDiv.addClass('hide-calendar');
	    }
	  });
	});

</script>
<script>
  // Obtener el campo de entrada
  const tarjetaNumeroInput = document.getElementById('tarjeta-numero');

  // Escuchar el evento de entrada
  tarjetaNumeroInput.addEventListener('input', (event) => {
    // Obtener el valor actual del campo de entrada
    let tarjetaNumero = event.target.value;

    // Eliminar cualquier guión existente
    tarjetaNumero = tarjetaNumero.replace(/-/g, '');

    // Agregar guiones cada 4 dígitos
    tarjetaNumero = tarjetaNumero.replace(/(.{4})/g, '$1-');

    // Eliminar el guión adicional al final si existe
    tarjetaNumero = tarjetaNumero.replace(/-$/, '');

    // Actualizar el valor del campo de entrada
    event.target.value = tarjetaNumero;
  });
</script>

</body>
</html>

