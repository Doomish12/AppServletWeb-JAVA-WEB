package servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mante.CarritoCompras;
import sun.security.krb5.internal.crypto.crc32;
import org.json.JSONObject;





@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void updateCartQuantity(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String productIdParam = request.getParameter("productId");

        if (productIdParam != null && !productIdParam.isEmpty()) {
            int productId = Integer.parseInt(productIdParam);

            // Obtener el carrito de la sesión
            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

            // Verificar si el carrito existe
            if (cart != null) {
                // Verificar si se ha seleccionado el botón de disminuir cantidad
                if (request.getParameter("decreaseQuantity") != null) {
                    int cantidadActual = CarritoCompras.getCantidadProducto(productId);

                    // Verificar si la cantidad actual es mayor a 1
                    if (cantidadActual > 1) {
                        int nuevaCantidad = cantidadActual - 1;
                        double precioProducto = CarritoCompras.getPrecioProducto(productId);
                        double nuevoPrecio = precioProducto / cantidadActual * nuevaCantidad;

                        CarritoCompras.actualizarCantidadProducto(productId, nuevaCantidad);
                        CarritoCompras.actualizarPrecioProducto(productId, nuevoPrecio);
                    } else {
                        // Eliminar el producto si la cantidad es 1 o menos
                        CarritoCompras.eliminarProducto(productId);
                        cart.remove(productId);
                        session.setAttribute("cart", cart);
                    }
                }

                // Verificar si se ha seleccionado el botón de aumentar cantidad
                if (request.getParameter("increaseQuantity") != null) {
                    int cantidadActual = CarritoCompras.getCantidadProducto(productId);
                    if (cantidadActual >= 1) {
                        int nuevaCantidad = cantidadActual + 1;
                        double precioProducto = CarritoCompras.getPrecioProducto(productId);
                        double nuevoPrecio = precioProducto / cantidadActual * nuevaCantidad;

                        CarritoCompras.actualizarCantidadProducto(productId, nuevaCantidad);
                        CarritoCompras.actualizarPrecioProducto(productId, nuevoPrecio);
                    }
                }

                // Reiniciar el valor de cartTotal
                double cartTotal = 0.0;

                // Calcular el valor actualizado de cartTotal
                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                    int productos = entry.getKey();
                    int quantity = entry.getValue();
                    double productPrice = CarritoCompras.getPrecioProducto(productos);
                    double productTotal = productPrice * quantity;
                    cartTotal += productTotal;
                }
                cartTotal = Math.round(cartTotal * 100.0) / 100.0;

                session.setAttribute("cartTotal", cartTotal);
                
                
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
    	
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        // Verificar si el carrito existe en la sesión
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        // Obtener el total del carrito de la sesión
        Double cartTotal = (Double) session.getAttribute("cartTotal");

        // Verificar si el total del carrito es nulo
        if (cartTotal == null) {
            cartTotal = 0.0;
        }

        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("addToCart_")) {
                int productId = Integer.parseInt(paramName.substring("addToCart_".length()));

                // Obtener la cantidad seleccionada para el producto
                int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));

                // Verificar si el producto ya está en el carrito
                if (cart.containsKey(productId)) {
                    // Mostrar mensaje de alerta indicando que el producto ya está en el carrito
                    String message = "El producto ya está en el carrito.";
                    String script = "alert('" + message + "');";
                    response.getWriter().println("<script>" + script + "</script>");
                } else {
                    // Si el producto no está en el carrito, agregar un nuevo producto
                    cart.put(productId, quantity);

                    // Insertar el producto en la tabla "carrito"
                    double precio = 0.0; // Valor predeterminado en caso de que no se proporcione el parámetro "precio"
                    String precioParam = request.getParameter("precio_" + productId);
                    String nombrePro = request.getParameter("nombre_" + productId);
                    String imagenPro = request.getParameter("image_" + productId);
                    if (precioParam != null && !precioParam.isEmpty()) {
                        precio = Double.parseDouble(precioParam);
                    }
                    CarritoCompras.insertarProducto(productId, quantity, imagenPro, nombrePro, precio);
                   
                    // Actualizar el total del carrito
                    cartTotal += quantity * precio;
                    session.setAttribute("cartTotal", cartTotal);
                }
                
                
            }
       
        }

        
        updateCartQuantity(request);

        // Redireccionar a la página del carrito
        response.sendRedirect("listarProductos.jsp");
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int removeProductId = Integer.parseInt(request.getParameter("removeProductId"));

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart != null) {
            // Verificar si el producto está en el carrito
            if (cart.containsKey(removeProductId)) {
                // Obtener la cantidad actual del producto
                int currentQuantity = cart.get(removeProductId);

                if (currentQuantity >= 1) {
                    // Obtener el precio del producto a eliminar
                    double precioProducto = CarritoCompras.getPrecioProducto(removeProductId);

                    // Calcular el subtotal del producto a eliminar
                    double subtotalProducto = precioProducto * currentQuantity;

                    // Actualizar el cartTotal
                    double cartTotal = 0.0;
                    Object cartTotalAttribute = session.getAttribute("cartTotal");
                    if (cartTotalAttribute != null) {
                        cartTotal = (double) cartTotalAttribute;
                    }
                    cartTotal -= subtotalProducto;
                    session.setAttribute("cartTotal", cartTotal);

                    // Remover el producto del carrito
                    cart.remove(removeProductId);
                    CarritoCompras.eliminarProducto(removeProductId);

                    JSONObject responseData = new JSONObject();
                    responseData.put("success", true);
                    responseData.put("message", "Producto eliminado del carrito");
                    responseData.put("cartTotal", cartTotal);

                    // Set the content type and write the response
                    response.setContentType("application/json");
                    response.getWriter().write(responseData.toString());
                    
                }
            }
        }
    }


}
  


