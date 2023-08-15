<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' media='screen' href='css/register.css'>

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

<header class="header">
        <div class="contenedor">
        <div class="icono">
               <a  href="Principal.jsp"> <img src="img/Logo.png"  width="120px" height="120px"></a>
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
                                <i class="fa-regular fa-bookmark"></i> Marcap�ginas</a></li>
           
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
   

        
  
      


    </div> <!--DIV PRINCIPAL CONTENEDOR-->
    </header>





<main class="flex-register">
    <div class="register-container">
    
     <img class="num2" src="img/Register.gif" width="400px" height="400px">
    
    
      
        <form action="LoginServlet" method="post" name="registrarse" id="registro-exito">
          <h2 class="num1">Registrate</h2>
            <div class="mb-3">
                <label for="first-name" class="form-label num3">Nombre:</label>
                <input type="text" class="form-control num3" id="nombre" name="nombre" required>
            </div>
            <div class="mb-3">
                <label for="last-name" class="form-label num4">Apellidos:</label>
                <input type="text" class="form-control num4" id="apellido" name="apellido" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label num5">Correo:</label>
                <input type="email" class="form-control num5" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label num6">Usuario:</label>
                <input type="text" class="form-control num6" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label num7">Contrase�a:</label>
                <input type="password" class="form-control num7" id="password" name="password" minlength="6" required>
            </div>
            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input num8" id="terms" name="check" required>
                <label class="form-check-label num8" for="terms " style=" display:block;">He le�do y acepto los T�rminos y condiciones y las Pol�ticas de privacidad.</label>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary num9"  id="boton" >Registrarse</button>
            </div>
    
            <p class="texto-error">
				<%
					String resultado = (String)request.getAttribute("mensaje");
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
    
    
    
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  document.getElementById('registro-exito').addEventListener('submit', function(event) {
    event.preventDefault(); // Evitar el env�o autom�tico del formulario

    // Validar los campos del formulario
    var nombre = document.getElementById('nombre').value;
    var apellido = document.getElementById('apellido').value;
    var email = document.getElementById('email').value;
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    var terms = document.getElementById('terms').checked;

    if (nombre === '' || apellido === '' || email === '' || username === '' || password === '' || !terms) {
      // Mostrar un mensaje de error si alg�n campo est� vac�o o los t�rminos no est�n aceptados
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Por favor, completa todos los campos y acepta los t�rminos.',
        showCancelButton: false,
        showConfirmButton: true,
      });
    } else {
      // Mostrar la alerta de �xito si todos los campos est�n completos y los t�rminos est�n aceptados
      Swal.fire({
        icon: 'success',
        title: 'Se registr� correctamente',
        showCancelButton: false,
        showConfirmButton: true,
      }).then((result) => {
        if (result.isConfirmed) {
          // Enviar manualmente el formulario
          document.getElementById('registro-exito').submit();
        }
      });
    }
  });
</script>

    
    
    
    
    
    
    
    
    <footer class="footer">

      <div>
          <img src="img/Logo.png" width="150px" height="150px">
          <p>En Editorial Alma trabajamos para<br>
            deleitar y sorprender a los grandes<br>
            lectores y desafiar a las mentes<br>
            inquietas de todas las edades.<br>
            Descubre nuestras l�neas<br>
            editoriales: cl�sicos Ilustrados,<br>
            ingenio, creatividad, infantil y<br>
            objetos literarios.
          </p>

          <p class="color-fo">S�guenos en las redes</p>

          <div class="iconos-fo">
             <div class="estilo-redes"> <img src="img/faceb.svg" > </div>
             <div class="estilo-redes"> <img src="img/ig.svg"> </div>
             <div class="estilo-redes"> <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-tiktok" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                <path d="M21 7.917v4.034a9.948 9.948 0 0 1 -5 -1.951v4.5a6.5 6.5 0 1 1 -8 -6.326v4.326a2.5 2.5 0 1 0 4 2v-11.5h4.083a6.005 6.005 0 0 0 4.917 4.917z" />
              </svg></div>
          </div>
      </div>

      <div class="grid-footer mover-fo">
          <p class="color-fo">Productos</p>
          <a href="#">Libros</a>
          <a href="#">infatil</a>
          <a href="#">Objetos literarios</a>
          <a href="#">D�nde Comprar</a>
       
      </div>

      <div class="grid-footer mover-fo-1">
        <p class="color-fo">Sobre nosotros</p>
        <a href="#">Quienes Somos</a>
        <a href="#">Autores</a>
        <a href="#">Ilustradores</a>
        <a href="#">Distribuci�n</a>
        <a href="#">Blog</a>
        <a href="#">Prensa</a>
      </div>

      <div class="grid-footer mover-fo-2">
        <p class="color-fo">Informaci�n</p>
        <a href="#">Catalagos</a>
        <a href="#">Contacto</a>
        <a href="#">Colaboraciones</a>
        <a href="#">Politica de Privacidad</a>
        <a href="#">Politica de Cookies</a>
        <a href="#">Aviso Legal</a>
      </div>

      <div class="grid-footer">
        <p class="color-fo">Suscr�bete a nuestro bolet�n</p>

        <label><input class="input-fo" type="email" placeholder="Tu correo electr�nico"><a href="#"><svg id="rojo-con" xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-send" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
          <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
          <path d="M10 14l11 -11" />
          <path d="M21 3l-6.5 18a.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a.55 .55 0 0 1 0 -1l18 -6.5" />
        </svg></a></label>

        <label class="acepto"><input type="checkbox">  Acepto la <span class="color-rojo">Pol�tica de Privacidad</span> y quiero<br> recibir comunicaciones comerciales -</label>
     
        <div class="color-blanco">
            <p class="color-fo">INFORMACI�N B�SICA DEL TRATAMIENTO</p>

            <p><span class="color-fo">Responsable:</span> ANDERS PRODUCCIONES SL<br>
              <span class="color-fo">Finalidades:</span> Publicidad y prospecci�n<br>
              comercial ('Acciones comerciales')<br>
              <span class="color-fo">Derechos:</span> Puede acceder, rectificar, suprimir<br>
              sus datos, oponerse, retirar el consentimiento<br>
              y ejercer el resto de derechos previstos en<br>
               nuestra <span class="color-azu">'Pol�tica de Privacidad'</span>
            </p>
        </div>
      
      </div>
     
</footer>
    
    
    
    
    
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
  ScrollReveal().reveal('.num3', { delay: 190 , origin: "right", interval:1500});
  ScrollReveal().reveal('.num4', { delay: 250 , origin: "right", interval:1500});
  ScrollReveal().reveal('.num5', { delay: 300 , origin: "right", interval:1500});
  ScrollReveal().reveal('.num6', { delay: 350 , origin: "right", interval:1500});
  ScrollReveal().reveal('.num7', { delay: 400 , origin: "right", interval:1500});
  ScrollReveal().reveal('.num8', { delay: 450 , origin: "right", interval:1500});
  ScrollReveal().reveal('.num9', { delay: 2200 , origin: "right", interval:2000});
  

  //article 2
  </script>
    
    
    
    
    

    
    
    
    
    
    
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
     <script src="https://kit.fontawesome.com/1ece75081f.js" crossorigin="anonymous"></script>
    
     	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	
<script type="text/javascript">
	jQuery(function($) {
	    $("form[name='registrarse']").validate({
	      rules: {
	    	nombre : {
	    	        required: true,
	    	      },
	    	apellido : {
		    	        required: true,
		    	      },
		    email : {
			    	       required: true,
			    	      },	      
		     username : {
			    	        required: true,
			    	      },
			  password : {
				    	        required: true,
				    	      },	      
	 		check:{
	 				required: true
	 		},
	      },
			messages : {
				
				nombre: {
				    required: "Por favor, introduzca su nombre"
				  },
				  apellido: {
					    required: "Por favor, introduzca sus apellidos",
					  },
				  email: {
						    required: "Por favor, introduzca su correo",
						  },  
				username: {
				    required: "Por favor, introduzca un usuario"
				  },
				  password: {
					    required: "Por favor, introduzca una contrase�a",
					    minlength : "Minimo 6 caracteres"
					  },
				  check :{
					
					  required:   "Por favor, Selecione la casilla",
				  }
			}
	    });
	  });
	</script>
</body>
</html>