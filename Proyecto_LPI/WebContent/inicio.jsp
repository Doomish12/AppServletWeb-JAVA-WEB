<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel='stylesheet' type='text/css' media='screen' href='css/inicio.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Epilogue&display=swap" rel="stylesheet">
<style>
	.under{
		text-decoration: none;
	}
</style>
  </head>
  
  <body onload="showArticle(1)" >
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
                 <a class="under" href="listarProductos.jsp">  <img src="img/libros_1.jpg" width="200px" height="150px">
             <p class="p-libro">Ver todos los libros</p></a>
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

<!--CARRUSEL-->

<div class="color-carru">

<div id="carouselExampleFade" class="carousel slide carousel-fade" >
  <div class="carousel-inner">
    <div class="carousel-item active">

<div class="carru-con num1">
    <div class="img-carru">
      <img src="img/carrusel_2.jpeg" class="d-block w-100 carru" alt="...">
    </div>

      <div class="cotenido-carru">
          <h2>Editorial Alma</h2>
          <p>Sentimos pasión por los libros, por<br>ello, cada obra que publicamos es<br>una experiencia única con la que<br>deleitarse. ¡Elige la tuya!</p>
          <button>Descubir más</button>
      </div>
    </div>
  </div>



    <div class="carousel-item">
      <div class="carru-con">
        <div class="img-carru">
          <img src="img/carrusel_3.jpeg" class="d-block w-100 carru" alt="...">
        </div>
    
          <div class="cotenido-carru">
            <h2>Stefan Zweig</h2>
              <p>La obra del autor austríaco se <br>suma a nuestra colección de <br>clásicos.</p>
              <button>Descubir más</button>
          </div>
        </div>

    </div>
    <div class="carousel-item">
      <div class="carru-con">
        <div class="img-carru">
          <img src="img/carrusel_1.jpeg" class="d-block w-100 carru" alt="...">
        </div>
    
          <div class="cotenido-carru">
            <h2>Ingenio y diversión</h2>
              <p>Nuestros juegos y enigmas son el <br>regalo perfecto para las mentes<br>que necesitan desafíos. Elige
              <br>entre una gran variedad de<br>pasatiempos de lógica y juegos de<br>ingenio para ejercitar la mente.
              
              </p>
              <button>Descubir más</button>
          </div>
        </div>
    </div>
  </div>


  <button class="carousel-control-prev flechas" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon tamaño " aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next flechas" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon tamaño" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>

</div>
</div>

<!--AQUI ACABA CARRUSEL-->


<!--Contenido-->

<main>

  
<div class="cotenido-article">
  
      <div class="novedades aut num2">
        <h1>Novedades</h1>
        <p>Nuestros últimos lanzamientos para que disfrutes de la lectura que más te gusta.</p>
       </div>
       
<div class="num3">   
<div class="botones-novedades">
        <button onclick="showArticle(1)" class="activeButton" >Clásicos ilustrados</button>
        <button onclick="showArticle(2)">Pensamiento ilustrado</button>
        <button onclick="showArticle(3)">Ingenio</button>
        <button onclick="showArticle(4)">Infantil</button>
</div>

      <div id="article1" class="article ">

<div class="mover-grid">

    <article>
        <img src="img/clasico_1.jpeg" alt="Imagen 1" width="200px" height="300px">
        <p>Veinticuatro horas en la <br>vida de una mujer</p>
       
        <div class="article-autores">
          <img src="img/autor_1.jpeg" width="20px" height="20px">
          <h3>Stefan Zweig</h3>
       
        </div>


    </article>

    <article>
      <img src="img/clasico_2.jpeg" alt="Imagen 1" width="200px" height="300px">
      <p>La leyenda de Sleepy <br>Hollow y Rip Van Winkle</p>

      <div class="article-autores">
        <img src="img/autor_2.png" width="20px" height="20px">
        <h3>Washington Irving</h3>
     
      </div>
  </article>

  <article>
    <img src="img/clasico_3.jpeg" alt="Imagen 1" width="200px" height="300px">
    <p>Arséne Lupin.Laa aguja<br>hueca</p>

     <div class="article-autores">
        <img src="img/autor_3.jpeg" width="20px" height="20px">
        <h3>Maurice Leblanc</h3>
      </div>
</article>

<article>
  <img src="img/clasico_4.jpeg" alt="Imagen 1" width="200px" height="300px">
  <p>Relatos para amantes de<br>la lectura</p>

  
  <div class="article-autores">
    <img>
    <h3>Varios Autores</h3>
  </div>
</article>

<article>
  <img src="img/clasico_5.jpeg" alt="Imagen 1" width="200px" height="300px">
  <p>Orlando Virginia<br>Woolf</p>

  
  <div class="article-autores">
    <img src="img/autor_5.jpeg" width="20px" height="20px">
    <h3>Virgina Woolf</h3>
  </div>
</article>

</div>
      </div>
</div>     
<!--AQUI EMPIEZA EL SEGUNDO BLOQUE ARTICLE-->


      <div id="article2" class="article">
        <div class="mover-grid">

          <article>
              <img src="img/ilustrado_1.jpeg" alt="Imagen 1" width="200px" height="300px">
              <p>Así habló Zaratustra</p>
             
              <div class="article-autores">
                <img src="img/au_ilu_1.png" width="20px" height="20px">
                <h3>Friedrich Nietzsche</h3>
             
              </div>
      
      
          </article>
      
          <article>
            <img src="img/ilustrado_2.jpeg" alt="Imagen 1" width="200px" height="300px">
            <p>Sobre la ira y la serenidad</p>
      
            <div class="article-autores">
              <img src="img/au_ilu_2.jpeg" width="20px" height="20px">
              <h3>Seneca</h3>
           
            </div>
        </article>
      
        <article>
          <img src="img/ilustrado_3.jpeg" alt="Imagen 1" width="200px" height="300px">
          <p>Mis ideas y vision del mundo</p>
      
           <div class="article-autores">
              <img src="img/au_ilu_3.png" width="20px" height="20px">
              <h3>Albert Einstein</h3>
            </div>
      </article>
      
      <article>
        <img src="img/ilustrado_4.jpeg" alt="Imagen 1" width="200px" height="300px">
        <p>BUSHIDO El Código samurai</p>
      
        
        <div class="article-autores">
          <img src="img/au_ilu_4.png" width="20px" height="20px">
          <h3>Inazo Nitobe</h3>
        </div>
      </article>
      
      <article>
        <img src="img/ilustrado_5.jpeg" alt="Imagen 1" width="200px" height="300px">
        <p>Somos parte de la tierra</p>
      
        
        <div class="article-autores">
          <img >
          <h3>Varios autores</h3>
        </div>
      </article>
      
      </div>
      
 
      </div>

<!--AQUI COMIENZA EL ARTICLE 3-->

      <div id="article3" class="article">
        <div class="mover-grid">

          <article>
              <img src="img/ingenio_1.jpeg" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
              <p>El ahorcado y otros juegos</p>
             
        
          </article>
      
          <article>
            <img src="img/ingenio_2.jpeg" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
            <p>Antiguo Egipto</p>
        </article>
      
        <article>
          <img src="img/ingenio_3.jpeg" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
          <p>Juegos de ingenio para<br>estimular tu agudeza</p>
      </article>
      
      <article>
        <img src="img/ingenio_4.jpeg" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
            <p>Juegos para ser más<br>imaginativos</p>
      </article>
      
      <article>
        <img src="img/ingenio_5.jpeg" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
        <p>Memoria express</p>
      </article>
      
      </div>
      
      </div>

<!--AQUI COMIENZA ARTICLE 4-->


      <div id="article4" class="article">
        <div class="mover-grid">

          <article>
              <img src="img/infa_1.png" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
              <p>Canción de Navidad (Ya <br>leo a)</p>
             
        
          </article>
      
          <article>
            <img src="img/infa_2.png" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
            <p>Ana de Tejas Verdes (Ya <br>leo a)</p>
        </article>
      
        <article>
          <img src="img/infa_3.png" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
          <p>La vuelta al mundo en 80 <br>días (Ya leo a)</p>
      </article>
      
      <article>
        <img src="img/infa_4.png" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
            <p>Pinocho (Ya leo a)<br>GEPPETTO </p>
      </article>
      
      <article>
        <img src="img/infa_5.jpeg" alt="Imagen 1" width="200px" height="200px" style="object-fit: cover;">
        <p>Juegos de lógica (Good <br>vibes)</p>
      </article>
      
      </div>
      </div>

</div> <!--CONTENEDOR PRINCIPAL ARTICLE-->

<!--AQUI COMIENZA GENEROS-->

<div class="genero-principal">

  <div class="contenedor-generos">

    <div id="espacio"></div>
    <div class="novedades num2">
      <h1>Géneros</h1>
      <p>Géneros y temáticas para los que buscan una buena historia.</p>
     </div>


        <div class="mover-grid gene-tem num5">

          <article>
              <img src="img/genero_1.jpeg" alt="Imagen 1" width="350px" height="250px" style="object-fit: cover;">
              <p>Terror</p>
          </article>
      
          <article>
            <img src="img/genero_2.jpeg" alt="Imagen 1" width="350px" height="250px"  style="object-fit: cover;">
            <p>Romántico</p>
        </article>
      
        <article>
          <img src="img/genero_3.jpeg" alt="Imagen 1" width="350px" height="250px" style="object-fit: cover;">
          <p>Policiaca</p>
      </article>
      

      
      </div>
  </div>
</div> <!--AQUI ACABA GENEROS-->

<!--AQUI COMIENZA AUTORES-->

<div class="autores-principal">

  <div class="contenedor-generos ">

    <div id="espacio"></div>
    <div class="novedades aut num2">
      <h1>Autores</h1>
      <p>Descubre el universo de los autores más destacados de la literatura clásica.</p>
     </div>


        <div class="mover-grid gene-tem num5">

          <article class="aut-1">
              <img src="img/au_1.png" alt="Imagen 1" width="350px" height="320px" style="object-fit: cover;">
      
              <div class="article-autores autores-esp">
                <h3>H.P. LoveCraft</h3>
              </div>
          </article>
      
          <article class="aut-2">
            <img class="img-aut" src="img/au_3.png" alt="Imagen 1" width="350px" height="320px"  style="object-fit: cover;">
            <div class="article-autores autores-esp">
              <h3>Edgar Allan Poe</h3>
            </div>
        </article>
      
        <article class="aut-3">
          <img src="img/au_2.png" alt="Imagen 1" width="350px" height="320px" style="object-fit: cover;">
          <div class="article-autores autores-esp">
            <h3>Jane Austen</h3>
          </div>
      </article>

      </div>
  </div>



  <div class="contenedor-generos nuevo-blog">

    <div id="espacio"></div>
    <div class="novedades aut num2">
      <h1>Nuestro blog</h1>
      <p>Lecturas cortas sobre el maravilloso mundo de los libros</p>
     </div>


        <div class="mover-grid gene-tem num5">

          <article class="blog">
              <img src="img/blog_1.png" alt="Imagen 1" width="350px" height="250px" style="object-fit: cover;">
              <p>20/04/2023</p>

              <h2>Sant Jordi 2023</h2>

              <p>Este 23 de abril celebramos la fiesta de los lectores.</p>
          </article>
      
          <article class="blog">
            <img src="img/blog_2.jpg" alt="Imagen 1" width="350px" height="250px"  style="object-fit: cover;">
            <p>23/12/2022</p>

            <h2>Lima y Madrid celebran los <br>100 clásicos de Alma</h2>
           
            <p>Este mes hemos celebrado los 100 títulos de la<br> 
              colección con nuestra comunidad de <br>bookstagrammers.</p>
        </article class="blog">
      
        <article class="blog">
          <img src="img/blog_3.jpg" alt="Imagen 1" width="350px" height="250px" style="object-fit: cover;">
          <p>9/12/2022</p>
         <h2>100 clásicos... por ahora</h2>
          <p>Celebramos que la colección Alma Clásicos Ilustrados <br>llega a los 100 títulos</p>
      </article>
      

      
      </div>
  </div>
 
</div><!--AQUI ACABA AUTORES Y BLOG-->

</main>

<footer class="footer">

      <div>
          <img src="img/Logo.png" width="150px" height="150px">
          <p>En Editorial Alma trabajamos para<br>
            deleitar y sorprender a los grandes<br>
            lectores y desafiar a las mentes<br>
            inquietas de todas las edades.<br>
            Descubre nuestras líneas<br>
            editoriales: clásicos Ilustrados,<br>
            ingenio, creatividad, infantil y<br>
            objetos literarios.
          </p>

          <p class="color-fo">Síguenos en las redes</p>

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
          <a href="#">Dónde Comprar</a>
       
      </div>

      <div class="grid-footer mover-fo-1">
        <p class="color-fo">Sobre nosotros</p>
        <a href="#">Quienes Somos</a>
        <a href="#">Autores</a>
        <a href="#">Ilustradores</a>
        <a href="#">Distribución</a>
        <a href="#">Blog</a>
        <a href="#">Prensa</a>
      </div>

      <div class="grid-footer mover-fo-2">
        <p class="color-fo">Información</p>
        <a href="#">Catalagos</a>
        <a href="#">Contacto</a>
        <a href="#">Colaboraciones</a>
        <a href="#">Politica de Privacidad</a>
        <a href="#">Politica de Cookies</a>
        <a href="#">Aviso Legal</a>
      </div>

      <div class="grid-footer">
        <p class="color-fo">Suscríbete a nuestro boletín</p>

        <label><input class="input-fo" type="email" placeholder="Tu correo electrónico"><a href="#"><svg id="rojo-con" xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-send" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
          <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
          <path d="M10 14l11 -11" />
          <path d="M21 3l-6.5 18a.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a.55 .55 0 0 1 0 -1l18 -6.5" />
        </svg></a></label>

        <label class="acepto"><input type="checkbox">  Acepto la <span class="color-rojo">Política de Privacidad</span> y quiero<br> recibir comunicaciones comerciales -</label>
     
        <div class="color-blanco">
            <p class="color-fo">INFORMACIÓN BÁSICA DEL TRATAMIENTO</p>

            <p><span class="color-fo">Responsable:</span> ANDERS PRODUCCIONES SL<br>
              <span class="color-fo">Finalidades:</span> Publicidad y prospección<br>
              comercial ('Acciones comerciales')<br>
              <span class="color-fo">Derechos:</span> Puede acceder, rectificar, suprimir<br>
              sus datos, oponerse, retirar el consentimiento<br>
              y ejercer el resto de derechos previstos en<br>
               nuestra <span class="color-azu">'Política de Privacidad'</span>
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
  ScrollReveal().reveal('.num1', { delay: 100 , origin: "top", interval:100});
  ScrollReveal().reveal('.num2', { delay: 100 , origin: "bottom", interval:100});
  ScrollReveal().reveal('.num3', { delay: 100 , origin: "bottom", interval:110});
  ScrollReveal().reveal('.num4', { delay: 100 , origin: "bottom", interval:100});
  ScrollReveal().reveal('.num5', { delay: 100 , origin: "bottom", interval:150});
  //article 2
  </script>




<script>

/*Carrusel */

setInterval(function() {
  $('.carousel').carousel('next');
}, 4000);

  /*Carrusel */
  var buttons = document.getElementsByTagName("button");
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", function() {
      // Remover la clase activeButton de todos los botones
      for (var j = 0; j < buttons.length; j++) {
        buttons[j].classList.remove("activeButton");
      }
      // Agregar la clase activeButton al botón seleccionado
      this.classList.add("activeButton");
    });
  }


function showArticle(articleNumber) {
  // Ocultar todos los artículos
  var articles = document.getElementsByClassName("article");
  for (var i = 0; i < articles.length; i++) {
    articles[i].style.display = "none";
  }
  
  // Mostrar el artículo seleccionado
  var selectedArticle = document.getElementById("article" + articleNumber);
  selectedArticle.style.display = "block";

  
}
buttons[0].classList.add("activeButton");

</script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/1ece75081f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>