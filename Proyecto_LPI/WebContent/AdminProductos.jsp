<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.*" %>

<%
    // Configura los detalles de conexión a la base de datos
    String DB_URL = "jdbc:mysql://localhost/libreria?useSSL=false&useTimezone=tsrue&serverTimezone=UTC";
    String DB_USER = "root";
    String DB_PASSWORD = "MySQL123$";

    // Establece la conexión con la base de datos
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        // Consulta los productos de la base de datos
        stmt = conn.createStatement();
        String sql = "SELECT * FROM productos";
        rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Productos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Estilos personalizados -->
    <!-- LETRA -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Epilogue&display=swap" rel="stylesheet">

<!-- LETRA -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" /> 
    <style>
        body {
            background-color: #f8f9fa;
          font-family: 'Quicksand', sans-serif;
        }
        .container {
            padding-top: 50px;
            padding-bottom: 50px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .animated-item {
            visibility: hidden;
        }
        /*LISTADO PRODUCTOS */

.modal-centro{
	z-index: 1051;
}
.modal-body{
text-align: center;
padding: 20px;
}
.modal-body img{
margin-bottom: 20px;

}
.modal-body h1{
	font-size: 20px;
	font-weight: bold;
}
.modal-body h2{
	font-size: 15px;
}
.centro{
	width: 80px;
}
.form2{
	display: flex;
	justify-content: center;
	padding: 20px;
}
    </style>
</head>

<body>

<!-- PERMITE QUE LOS USUARIOS QUE NO TIENEN CUENTA LOS REDIRIGA EL LOGIN -->
    <%
        String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        %>
      <style>
        .container {
            display: none;
        }
    </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Solo los Administradores tienen acceso a esta página'
        }).then(function() {
            window.location.href = "Administrador.jsp";
        });
        </script>
        <%
    } 
    %>
    

<!-- -->
    <div class="container">
        <h1 class="text-center">Listado de Productos</h1>
         <a  href="agregarProducto.jsp" class="btn btn-primary boton-produc">Agregar Producto</a>
        
        <div class="table-responsive">
       
            <table class="table table-striped table-hover" id="tblProductos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Imagen</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Acciones</th>
                  
                    </tr>
                </thead>
                <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td><%= rs.getString("descripcion") %></td>
                        <td>
                            <img src="data:image/jpeg;base64,<%= org.apache.commons.codec.binary.Base64.encodeBase64String(rs.getBytes("imagen")) %>"
                                width="100">
                        </td>
                        <td>S/ <%= rs.getDouble("precio") %></td>
                   		<td><%= rs.getInt("cantidad") %></td>
                        <td>
                        <!-- Botón de editar -->
<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#editModal<%= rs.getInt("id") %>">Editar</button>

<!-- Modal de edición -->
<div class="modal fade" id="editModal<%= rs.getInt("id") %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Editar Producto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <!-- Formulario de edición -->
        <form action="ActualizarProductoServlet" method="post" enctype="multipart/form-data">
          <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
          
          <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" value="<%= rs.getString("nombre") %>" required>
          </div>
          
          <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción</label>
            <textarea class="form-control" id="descripcion" name="descripcion" required><%= rs.getString("descripcion") %></textarea>
          </div>
          
          <div class="mb-3">
            <label for="imagen" class="form-label">Imagen</label>
            <input type="file" class="form-control" id="imagen" name="imagen"  onchange="mostrarNombreArchivo(this)">
   
          </div>
          
          <div class="mb-3">
            <label for="precio" class="form-label">Precio</label>
            <input type="number" class="form-control" id="precio" name="precio" step="0.01" value="<%= rs.getDouble("precio") %>" required>
          </div>
          
            <div class="mb-3">
            <label for="cantidad" class="form-label">Cantidad</label>
            <input type="number" class="form-control" id="cantidad" name="cantidad" step="1" value="<%= rs.getInt("cantidad") %>" required>
          </div>
	<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#successModal<%= rs.getInt("id") %>" data-bs-dismiss="modal">Guardar</button>
		

      </div>
    </div>
  </div>
</div> 
<!-- Modal -->
<div class="modal fade modal-centro" id="successModal<%= rs.getInt("id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body">
        <img src="img/correcto.png" width="100px" height="100px">
        <h1>Success!</h1>
        <h2>El Producto se Actualizo exitosamente</h2>
      </div>
 <div class="form2">
        <button class="btn btn-primary centro" type="submit">OK</button>
</div>
    </div>
  </div>
</div>

      </form>
                 
 
                 
                 
                 
                      <!-- Botón de eliminar -->
<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#confirmModal<%= rs.getInt("id") %>">Eliminar</button>

<!-- Modal de confirmación de eliminación -->
<div class="modal fade" id="confirmModal<%= rs.getInt("id") %>" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmModalLabel">Confirmar eliminación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>¿Estás seguro de eliminar este producto?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminar<%= rs.getInt("id") %>" data-bs-dismiss="modal">Eliminar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade modal-centro" id="eliminar<%= rs.getInt("id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body">
        <img src="img/correcto.png" width="100px" height="100px">
        <h1>Success!</h1>
        <h2>El Producto se eliminó exitosamente</h2>
      </div>
      
      <form class="form2" action="AgregarProductoServlet" method="post" enctype="multipart/form-data">
        <!-- Resto de los campos del formulario -->
        <!-- Botón de eliminar -->
        <input type="hidden" name="tipo" value="eliminar">
        <input type="hidden" name="codigo" value="<%= rs.getInt("id") %>">
        <button class="btn btn-primary centro" type="submit">OK</button>
      </form>
    </div>
  </div>
</div>

                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.13.4/i18n/Spanish.json"></script>
    
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.4/date-1.4.1/r-2.4.1/sp-2.1.2/datatables.min.js"></script>

    <!-- Bootstrap JS -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Animate.css -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.js"></script>
    <!-- Custom JS -->
    <script>

    function mostrarNombreArchivo(input) {
        if (input.files.length > 0) {
          input.nextElementSibling.textContent = input.files[0].name;
        } else {
          input.nextElementSibling.textContent = "Seleccionar archivo";
        }
      }

        // Animar elementos al aparecer en la pantalla
        document.addEventListener('DOMContentLoaded', function(event) {
            var animatedItems = document.querySelectorAll('.animated-item');
            for (var i = 0; i < animatedItems.length; i++) {
                var animatedItem = animatedItems[i];
                animateCSS(animatedItem, 'fadeIn');
            }
        });

        // Función para aplicar animaciones de Animate.css a los elementos
        function animateCSS(element, animationName, callback) {
            element.classList.add('animated', animationName);

            function handleAnimationEnd() {
                element.classList.remove('animated', animationName);
                element.removeEventListener('animationend', handleAnimationEnd);

                if (typeof callback === 'function') {
                    callback();
                }
            }

            element.addEventListener('animationend', handleAnimationEnd);
        }
        
    
    </script>
    
    <script type="text/javascript">

	$(document).ready(function () {
		$('#tblProductos').DataTable(
				{
				    language: {
				    	  url: "https://cdn.datatables.net/plug-ins/1.13.4/i18n/Spanish.json"
				    }
				  });
		
	});
</script>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Cierra la conexión, el statement y el result set
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
