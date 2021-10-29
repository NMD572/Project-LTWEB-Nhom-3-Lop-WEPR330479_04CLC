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
 * Servlet implementation class LoginController
 */
@WebServlet("/view/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		
		Member login = new Member();
		login.setUsername(username);
		login.setPassword(password);
		LoginDAO loginDAO = new LoginDAO();
		String rs = loginDAO.authenticateUser(login);
		if(rs.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
        {
            request.setAttribute("userName", username); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            request.getRequestDispatcher("/Home.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        }
        else
        {
            request.setAttribute("errMessage", rs); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
            request.getRequestDispatcher("/Login.jsp").forward(request, response);//forwarding the request
        }
	}

}
