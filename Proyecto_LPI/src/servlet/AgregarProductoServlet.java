package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mante.AgregarProductoDAO;
import mante.EliminarProductoDAO;

@WebServlet("/AgregarProductoServlet")
@MultipartConfig(maxFileSize = 16177215) // Tamaño máximo de la imagen (en bytes) (15MB)
public class AgregarProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String tipo = request.getParameter("tipo");
        if (tipo != null && tipo.equals("eliminar")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            boolean success = EliminarProductoDAO.eliminarProducto(codigo);
            if (success) {
                response.sendRedirect("AdminProductos.jsp"); // Redireccionar a una página de lista de productos
            } else {
                // Manejar el caso en el que no se pudo eliminar el producto
                response.sendRedirect("AdminProductos.jsp");
            }
        } else {
            String nombre = request.getParameter("nombre");
            Part imagenPart = request.getPart("imagen");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            InputStream imagenInputStream = imagenPart.getInputStream();
            boolean success = AgregarProductoDAO.agregarProducto(nombre, imagenInputStream, descripcion, precio,cantidad);

            if (success) {
            	  HttpSession session = request.getSession();
            	    session.setAttribute("productoAgregado", true);
            	    response.sendRedirect("agregarProducto.jsp");
            } else {
                // Manejar el caso en el que no se insertó ningún registro en la base de datos
                response.sendRedirect("agregarProducto.jsp");
            }
        }
    }
    
    
    
}
