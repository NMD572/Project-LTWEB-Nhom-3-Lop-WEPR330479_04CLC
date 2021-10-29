package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import dao.*;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/view/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       String username;
       String password;
       String repassword;
       String email;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
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
		username = request.getParameter("username");
		password = request.getParameter("password");
		repassword=request.getParameter("repassword");
		email = request.getParameter("email");
		Member regis = new Member();
		regis.setUsername(username);
		regis.setPassword(password);
		regis.setEmail(email);
		RegisterDAO registerDAO = new RegisterDAO();
		if(password.equals(repassword)) {
			registerDAO.InsertMember(regis);
			response.sendRedirect("Login.jsp");
		}
		else response.sendRedirect("Register.jsp");
		
		
		
		
   
	}

}
