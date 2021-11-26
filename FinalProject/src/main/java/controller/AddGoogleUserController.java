package controller;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.UserConstant;
import model.*;
import dao.*;

/**
 * Servlet implementation class AddGoogleUserController
 */
@WebServlet("/AddGoogleUserController")
public class AddGoogleUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoogleUserController() {
        super();
        // TODO Auto-generated constructor stub
        
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String userName;
	     String passWord;
	     String email;
		userName = request.getParameter("username");
		passWord = request.getParameter("password");
		email = request.getParameter("email");
		
		Member regis = new Member();
		regis.setUsername(userName);
		regis.setPassword(passWord);
		regis.setEmail(email);
		LoginDAO loginDAO = new LoginDAO();
		try {
		if(!RegisterDAO.checkEmail(email)) {
			RegisterDAO.InsertMember(regis);
			UserConstant.UserID=loginDAO.getUserID(email);
			request.setAttribute("id", loginDAO.getUserID(email));
			response.sendRedirect("ViewContentController");
		}
		else {
			UserConstant.UserID=loginDAO.getUserID(email);
			request.setAttribute("id", loginDAO.getUserID(email));
			response.sendRedirect("ViewContentController");
			
		}
		}
		catch (SQLException e) {
			 //TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
