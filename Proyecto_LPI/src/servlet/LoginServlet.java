package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import interfaces.LoginInterfarce;
import mante.LoginModelo;
import modelos.login;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginInterfarce dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
        dao = daoFactory.getEmpleado();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellido");
		String correo = request.getParameter("email");
		String usuario = request.getParameter("username");
		String contraseña = request.getParameter("password");
		
		login login = new login( nombre,  apellidos, correo, usuario, contraseña);
		
		LoginModelo loginModelo = new LoginModelo();
		int value = loginModelo.crearLogin(login);
		if(value == 1) {
			  response.sendRedirect("login.jsp");
		}else {
			request.setAttribute("mensaje", "Error usuario ya esta en uso");
			request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
		}
		
	}
	
}
	

