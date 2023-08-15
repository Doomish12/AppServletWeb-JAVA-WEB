<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' media='screen' href='css/Administrador.css'>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
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
</head>

<body>
<main class="flex-login">
    <div class="login-container">
        <form action="ServletAdmin" method="post" name="login" >
            <img src="img/Logo.png"  width="120px" height="120px">
            <h2 class="text-center mb-4 num1 bold">ADMIN PANEL</h2>
            <div class="mb-3 ">
                <label for="username" class="form-label bold">Usuario:</label>
                <input type="text" class="form-control num3" id="username" name="usuario" required>
            </div>
            <div class="mb-3 ">
                <label for="password" class="form-label bold">Contraseña:</label>
                <input type="password" class="form-control num4" id="password" name="clave" required>
            </div>
            <div class="d-grid gap-2 ">
                <input type="hidden" name="action" value="login"> <!-- Se agrega el campo oculto con el valor de la acción -->
                <input type="submit" class="btn btn-primary num5" id="boton" name="accion" value="Iniciar Sesion">
            </div>
            <p class="texto-error">
                <%
                    String resultado = (String) request.getAttribute("mensaje");
                    String mensaje = "";
                    if (resultado != null) {
                        mensaje = resultado;
                    }
                %>
                <%=mensaje %>
            </p>
        </form>
    </div>
</main>
<!--ANIMACIONES DE SCROLL-->
<script src="https://unpkg.com/scrollreveal"></script>
<!--ANIMACIONES DE SCROLL-->
<script>
  ScrollReveal({ 
     // reset: true,
      distance: '50px',
      duration: 2500,
      delay:400
  });
  ScrollReveal().reveal('.num1', { delay: 100 , origin: "top", interval:1000});
  ScrollReveal().reveal('.num2', { delay: 120 , origin: "bottom", interval:1000});
  ScrollReveal().reveal('.num3', { delay: 190 , origin: "top", interval:1000});
  ScrollReveal().reveal('.num4', { delay: 250 , origin: "bottom", interval:1500});
  ScrollReveal().reveal('.num5', { delay: 1000 , origin: "bottom", interval:2000});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/1ece75081f.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script type="text/javascript">
jQuery(function($) {
    $("form[name='login']").validate({
        rules: {
            usuario: {
                required: true,
            },
            clave: {
                required: true,
            },
        },
        messages: {
            usuario: {
                required: "Por favor, introduzca su usuario",
            },
            clave: {
                required: "Por favor, introduzca su contraseña",
            }
        }
    });
});
</script>
</body>
</html>
