<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Producto</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        /* Estilos personalizados */
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 50px 0;
        }
        .form-wrapper {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            animation: fade-in 0.8s ease-in-out;
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: #333333;
        }
        .form-group label {
            font-weight: bold;
            color: #333333;
        }
        .form-control-file {
            display: none;
        }
        .custom-file-upload {
            display: inline-block;
            padding: 10px 15px;
            cursor: pointer;
            background-color: #007bff;
            color: #ffffff;
            border-radius: 4px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .custom-file-upload:hover {
            background-color: #0069d9;
        }
        .custom-file-upload:active {
            background-color: #0056b3;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }
        .btn-primary:active {
            background-color: #0056b3;
            border-color: #004b9a;
        }
        label.error {
 	        color: red;
	        font-weight: bold;
	    }
    </style>
</head>

<body>




<!-- PERMITE la alerta y es llamado por el servlet -->
<%
    HttpSession sessionObj = request.getSession();
    if (session.getAttribute("productoAgregado") != null) {
        session.removeAttribute("productoAgregado");
%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Producto agregado exitosamente!',
            timer: 2000
            
        });
    </script>
<%
    }
%>


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
        <div class="form-wrapper">
            <h1 class="form-title">Agregar Producto</h1>
            <form name="admin" id="productForm" action="AgregarProductoServlet" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre del producto:</label>
                    <input type="text" id="nombre" name="nombre" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="imagen" class="form-label">Imagen del producto:</label>
                    <label for="fileInput" class="custom-file-upload">
                        Subir imagen
                    </label>
                    <input id="fileInput" type="file" name="imagen" accept="image/*" class="form-control-file" required>
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción del producto:</label>
                    <textarea id="descripcion" name="descripcion" class="form-control" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label">Precio:</label>
                    <input type="number" id="precio" name="precio" step="0.01" class="form-control" required>
                </div>
                  <div class="mb-3">
                    <label for="cantidad" class="form-label">Cantidad:</label>
                    <input type="number" id="cantidad" name="cantidad" step="1" class="form-control" required>
                </div>
                <div class="text-center">
                    <input type="submit" value="Agregar Producto" class="btn btn-primary">
                   <a class="btn btn-danger" href="http://localhost:8088/Proyecto_LPI/AdminProductos.jsp" role="button">Listar</a>
                </div>
                
 
            </form>

     
     
            
        </div>
       
        
    </div>


 







    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- jQuery Validation Plugin -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <!-- Custom JS -->
    <!-- ALERTAS SCRIPTS -->
       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
           
    <script>
    
	//crear alertas




    
    
        // Mostrar el nombre del archivo seleccionado en el input de imagen
        document.getElementById("fileInput").addEventListener("change", function(event) {
            const fileName = event.target.files[0].name;
            const label = document.querySelector(".custom-file-upload");
            label.textContent = "Archivo seleccionado: " + fileName;
        });

        // Validación del formulario utilizando jQuery Validation Plugin
        $(document).ready(function() {
            $("#productForm").validate({
                rules: {
                    nombre: {
                        required: true
                    },
                    imagen: {
                        required: true
                    },
                    descripcion: {
                        required: true
                    },
                    precio: {
                        required: true
                    },
                    cantidad:{
                    	required:true
                    }
                },
                messages: {
                    nombre: {
                        required: "Por favor, introduzca el nombre del producto"
                    },
                    imagen: {
                        required: "Por favor, seleccione la imagen del producto"
                    },
                    descripcion: {
                        required: "Por favor, ingrese la descripción del producto"
                    },
                    precio: {
                        required: "Por favor, ingrese el precio del producto"
                    },
                    cantidad:{
                    	required: "Por favor, ingrese una cantidad"
                    }
                }
            });
        });
    </script>
</body>
</html>
