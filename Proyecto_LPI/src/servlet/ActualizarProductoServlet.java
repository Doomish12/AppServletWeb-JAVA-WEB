package servlet;


import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mante.ActualizarProductoDAO;

@WebServlet("/ActualizarProductoServlet")
@MultipartConfig(maxFileSize = 16177215) // Tamaño máximo de la imagen (en bytes) (15MB)
public class ActualizarProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        Part imagenPart = request.getPart("imagen");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        
        InputStream imagenInputStream = null;
        if (imagenPart != null) {
            imagenInputStream = imagenPart.getInputStream();
        }

        boolean success = ActualizarProductoDAO.actualizarProducto(id, nombre, imagenInputStream, descripcion, precio,cantidad);

        if (success) {
            response.sendRedirect("AdminProductos.jsp"); // Redireccionar a una página de lista de productos
        } else {
            // Manejar el caso en el que no se pudo actualizar el producto
            response.sendRedirect("editarProducto.jsp?id=" + id);
        }
    }
}
