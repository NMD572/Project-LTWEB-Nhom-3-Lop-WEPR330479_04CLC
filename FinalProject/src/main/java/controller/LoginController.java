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
		//fix: can than
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//fix: lay ra du lieu Member va if else trong ham nay
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		username = request.getParameter("username");
		password = request.getParameter("password");
		
		Member login = new Member();
		
		LoginDAO loginDAO = new LoginDAO();
		//fix: move to if(rs.equals("success")
		UserConstant.UserID=loginDAO.getUserID(username);
		LoginDAO.authenticateUser(login);
		
	
		
		if(password.equals(login.getPassword())) //If function returns success string then user will be rooted to Home page
        {
            request.setAttribute("userName", username); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")      
            request.getRequestDispatcher("/view/EditProfile.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        }
        else
        {
            request.setAttribute("errMessage", username); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
            request.getRequestDispatcher("/Register.jsp").forward(request, response);//forwarding the request
        }
	}

}
