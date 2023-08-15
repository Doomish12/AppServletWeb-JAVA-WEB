<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="java.util.Map" %>

<%
    // Configura los detalles de conexión a la base de datos
    String DB_URL = "jdbc:mysql://localhost/Login?useSSL=false&useTimezone=tarue&serverTimezone=UTC";
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
    <title>Lista de Productos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/listadoProductos.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Epilogue&display=swap" rel="stylesheet">

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
   

        
   		<!-- Boton usuario -->
      <div class="login-grid">
      
     
      <img   src="img/usuario.png" width="60px" height="60px" >
     
     
        <a class="btn btn-primary" href="login.jsp" role="button">Iniciar Sesión</a>
      
      </div>


    </div> <!--DIV PRINCIPAL CONTENEDOR-->
    </header>


<div class="img-productos"> 

  <img src="img/carrusel_2.jpeg"  >
</div>
		
<main id="main-section">
 <div class="autores">
	<h1>Autores</h1>
	<div class="grid-autores">
	<p><img src="img/au_1.png" width="20px" height="20px"> Edgar Allan Poe</p>
	<p><img src="img/au_2.png" width="20px" height="20px"> H.P. Lovecraft</p>	
	<p><img src="img/au_3.png" width="20px" height="20px"> Jane Austen</p>	
	<p><img src="img/au_ilu_1.png" width="20px" height="20px"> Albert Casasín</p>	
	<p><img src="img/au_ilu_2.jpeg" width="20px" height="20px"> Alexandre Dumas </p>	
	<p><img src="img/autor_5.jpeg" width="20px" height="20px"> Andy Thomas</p>
	<p><img src="img/au_ilu_4.png" width="20px" height="20px"> Bram Stoker</p>
	<p><img src="img/autor_2.png" width="20px" height="20px"> Charles Perrault</p>
	</div>					 
</div>
    <section >
        <div class="contenedor-d">

 <section class="section-true">
	<form class="form-true" autocomplete="off" >
		<div class="contenedor-estilos">
            <input  type="text" id="searchInput" class="search-input" placeholder="Buscar producto...">
    </div>
	</form>
</section>
            <form class="contenedor-items" action="CarritoServlet" method="POST" >
            
                <% while (rs.next()) { %>
                <div class="item">
                    <article>
                        <p class="titulo-item"><%= rs.getString("nombre") %></p>
                        <img  src="data:image/jpeg;base64,<%
                            // Obtiene la imagen de la base de datos y la muestra
                            Blob blob = rs.getBlob("imagen");
                            if (blob != null) {
                                InputStream inputStream = blob.getBinaryStream();
                                int fileLength = (int) blob.length();
                                byte[] imageBytes = new byte[fileLength];
                                inputStream.read(imageBytes, 0, fileLength);
                                inputStream.close();
                                out.print(Base64.encodeBase64String(imageBytes));
                            }
                        %>" width="100%" height="130px" style="border-radius: 5px;">
                        <span><%= rs.getString("descripcion") %></span>
                        <span class="precio-item">S/<%= rs.getDouble("precio") %></span>

                        <!-- Campos del formulario con nombres únicos -->
                        <input type="hidden" name="productId_<%= rs.getInt("id") %>" value="<%= rs.getInt("id") %>">
                        <input class="productos-inputs" type="number" name="quantity_<%= rs.getInt("id") %>" value="1">
                        <button type="submit" name="addToCart_<%= rs.getInt("id") %>" class="btn btn-success productos-inputs" onclick="mensaje()">Agregar al carrito</button>
                       
                       
                    </article>
                </div>
                <% } %>
            </form>
        </div>
    </section>

    <section>
     <aside class="carrito">
     <div class="carrito-titulo">
  <h2>Carrito de Compras</h2>
  </div>
  <% double cartTotal = 0.0;
    Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
    if (cart != null && !cart.isEmpty()) {
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            int productId = entry.getKey();
            int quantity = entry.getValue();

            String getProductSQL = "SELECT * FROM productos WHERE id = " + productId;
            ResultSet productRS = stmt.executeQuery(getProductSQL);
            if (productRS.next()) {
                String productName = productRS.getString("nombre");
                double productPrice = productRS.getDouble("precio");
                double productTotal = productPrice * quantity;
                cartTotal += productTotal;
                // Obtiene la imagen del producto y la muestra
                Blob productBlob = productRS.getBlob("imagen");
                String base64Image = "";
                if (productBlob != null) {
                    InputStream inputStream = productBlob.getBinaryStream();
                    int fileLength = (int) productBlob.length();
                    byte[] imageBytes = new byte[fileLength];
                    inputStream.read(imageBytes, 0, fileLength);
                    inputStream.close();
                    base64Image = Base64.encodeBase64String(imageBytes);
                }
    %>
    <div class="item fondo-off">
        <form action="CarritoServlet" method="GET">
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="data:image/jpeg;base64,<%= base64Image %>" width="177px" height="270px"></td>
                        <td><%= productName %></td>
                        <td><%= quantity %></td>
                        <td>S/<%= productPrice %></td>
                        <td>
                            <input type="hidden" name="removeProductId" value="<%= productId %>">
                            <button type="submit" name="removeProduct" class="btn btn-danger " onclick="mensaje2()"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <% }
        }
    } else { %>
    <p>El carrito de compras está vacío</p>
    <% } %>
  <div class="campo-total">
    <div class="total-pa">
    <p>Total:</p>
    <p>S/<%= cartTotal %></p>
    </div>
     <div class="pagar-car">
  <h2>Pagar</h2>
  <i class="fa-solid fa-bag-shopping"></i>
  </div>
    </div>
    
</aside>
      
    </section>
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
 





<script src="https://kit.fontawesome.com/1ece75081f.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 <script src="https://kit.fontawesome.com/1ece75081f.js" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<script>


function mensaje(){
		alert("Producto Agregado al carrito")
	}

	function mensaje2(){
		alert("Producto Eliminado del carrito")
	}

    $(document).ready(function () {
        $("#searchInput").on("input", function () {
            var searchTerm = $(this).val().toLowerCase();
            $(".item").each(function () {
                var title = $(this).find(".titulo-item").text().toLowerCase();
                if (title.includes(searchTerm)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });

        $("form").submit(function () {
            $(".carrito").show();
        });

        if ($(".carrito .item").length > 0) {
            $(".carrito").show();
        }
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