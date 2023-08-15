package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mante.ModeloAdmin;
import modelos.admin;

@WebServlet("/ServletAdmin")
public class ServletAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("login".equals(action)) {
            iniciarSesion(request, response);
        }
    }
    
    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("clave");
        
        ModeloAdmin modelo = new ModeloAdmin();
        admin admin = modelo.iniciarSesion(usuario, contraseña);

        if (admin == null) {
            request.setAttribute("mensaje", "Error nombre de usuario y/o clave");
            request.getRequestDispatcher("Administrador.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            
            // Generar un token de autenticación (opcional)
            String token = generarToken(); // Implementar este método según tus necesidades
            
            // Guardar el token en la sesión (opcional)
            session.setAttribute("token", token);

            response.sendRedirect("AdminProductos.jsp");
        }
    }
    
    // Método para generar un token de autenticación único
    private String generarToken() {
        // Implementa la generación del token según tus necesidades
        // Puede ser un UUID, un token cifrado, un token con información adicional, etc.
        return "TOKEN_GENERADO";
    }
}
