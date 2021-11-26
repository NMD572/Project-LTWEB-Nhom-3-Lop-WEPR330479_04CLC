package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import dao.*;
import constant.UserConstant;
/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String email;
	private String passWord;
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
		email = request.getParameter("email");
		passWord = request.getParameter("password");
		UserConstant.UserID=0;
		Member login = new Member();
		login.setEmail(email);
		LoginDAO loginDAO = new LoginDAO();
		LoginDAO.authenticateUser(login);
		if(passWord.equals(login.getPassword())) //If function returns success string then user will be rooted to Home page
        {
            request.setAttribute("id", loginDAO.getUserID(email)); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            UserConstant.UserID=loginDAO.getUserID(email);
            
            
            response.sendRedirect("ViewContentController");
        }
        else
        {
            request.setAttribute("errMessage", email); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
  
            response.sendRedirect("register.tiles");
        }
	}

}
