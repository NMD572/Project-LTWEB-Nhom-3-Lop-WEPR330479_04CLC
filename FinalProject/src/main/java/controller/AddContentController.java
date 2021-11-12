package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDAO;
import model.Content;

import constant.UserConstant;
/**
 * Servlet implementation class AddContentServlet
 */
@WebServlet(urlPatterns = {"/AddContentController"})
public class AddContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ContentDAO contentDAO=new ContentDAO();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContentController() {
        super();
    	this.contentDAO = new ContentDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int UserID=UserConstant.UserID;
		String title = request.getParameter("title");
		String brief = request.getParameter("brief");
		String content = request.getParameter("content");
		Content newct = new Content(title,brief,content,UserID);
		contentDAO.InsertContent(newct);
		response.sendRedirect("add.tiles");
	}

}
