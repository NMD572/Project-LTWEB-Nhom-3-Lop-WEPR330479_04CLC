package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.ContentConstant;
import constant.UserConstant;
import dao.ContentDAO;
import model.Content;

/**
 * Servlet implementation class SearchContentController
 */
@WebServlet("/SearchContentController")
public class SearchContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchContentController() {
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
		// TODO Auto-generated method stub
		ContentDAO dbContent = new ContentDAO();
		String search = request.getParameter("searchString");
		if(search.length()==0)
			search=" ";
		try {
		List<Content> contents = new ArrayList<Content>();
		if(UserConstant.UserID==ContentConstant.adminID)
			contents = dbContent.searchAllContent(search);
		else
			contents = dbContent.searchContentForMember(UserConstant.UserID,search);
		request.setAttribute("listContent", contents);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view.tiles");
		dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
