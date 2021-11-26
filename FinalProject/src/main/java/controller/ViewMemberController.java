package controller;

import java.io.IOException;
import model.*;
import dao.*;
import constant.UserConstant;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewMemberController
 */
@WebServlet("/ViewMemberController")
public class ViewMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMemberController() {
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
		
		
		int idmember =UserConstant.UserID;
		
		Member member = new Member();
		try {
			RegisterDAO.GetMember(idmember, member);
			request.setAttribute("viewemail", member.getEmail());
			request.setAttribute("viewfname", member.getFirstName());
			request.setAttribute("viewlname", member.getLastName());
			request.setAttribute("viewphone", member.getPhone());
			request.setAttribute("viewdes", member.getDescription());
			RequestDispatcher dispatcher =request.getRequestDispatcher("editprofile.tiles");
			dispatcher.forward(request, response);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
