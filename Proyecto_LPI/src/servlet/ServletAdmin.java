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
        String contrase�a = request.getParameter("clave");
        
        ModeloAdmin modelo = new ModeloAdmin();
        admin admin = modelo.iniciarSesion(usuario, contrase�a);

        if (admin == null) {
            request.setAttribute("mensaje", "Error nombre de usuario y/o clave");
            request.getRequestDispatcher("Administrador.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            
            // Generar un token de autenticaci�n (opcional)
            String token = generarToken(); // Implementar este m�todo seg�n tus necesidades
            
            // Guardar el token en la sesi�n (opcional)
            session.setAttribute("token", token);

            response.sendRedirect("AdminProductos.jsp");
        }
    }
    
    // M�todo para generar un token de autenticaci�n �nico
    private String generarToken() {
        // Implementa la generaci�n del token seg�n tus necesidades
        // Puede ser un UUID, un token cifrado, un token con informaci�n adicional, etc.
        return "TOKEN_GENERADO";
    }
}
