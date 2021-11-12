package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import model.*;
import dao.*;
import constant.UserConstant;

/**
 * Servlet implementation class EditUserController
 */
@WebServlet("/EditUserController")
public class EditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String firstname;
	private String lastname;
	
	private String phone;
	private String description;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserController() {
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
		firstname = request.getParameter("firstname");
		lastname = request.getParameter("lastname");
		
		phone = request.getParameter("phone");
		description=request.getParameter("description");
		Member edit = new Member();
		edit.setFirstName(firstname);
		edit.setLastName(lastname);
		edit.setPhone(phone);
		
		edit.setDescription(description);
		edit.setId(UserConstant.UserID);
		RegisterDAO editDAO=new RegisterDAO();
		try {
			if(editDAO.UpdateMember(edit)) {
				response.sendRedirect("editprofile.tiles");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		
	}

}
