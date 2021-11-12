package controller;

import constant.UserConstant;
import dao.ContentDAO;
import model.Content;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AddContentServlet
 */
@WebServlet(urlPatterns = {"/EditContentController"})
public class EditContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ContentDAO contentDAO=new ContentDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditContentController() {
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
//		String title = request.getParameter("title");
//		String brief = request.getParameter("brief");
//		String content = request.getParameter("content");
//		Content newct = new Content(title,brief,content,UserID);
//		ContentDAO.InsertContent(newct);

//		response.sendRedirect("/view/EditContent.jsp");

		//Lay duoc ID cua content
		int id = Integer.parseInt(request.getParameter("id"));

		ContentDAO dbcontent = new ContentDAO();
		Content ct = new Content(id);

		System.out.println("UserID:= " + UserID);
		System.out.println("ContentID:= " + ct.getId());

		ct = contentDAO.selectContentInfo(id);
		System.out.println("title:= " + ct.getTitle());
		System.out.println("brief:= " + ct.getBrief());
		System.out.println("content:= " + ct.getContent());

		request.setAttribute("contentEdit",ct);

		RequestDispatcher dispatcher =request.getRequestDispatcher("edit.tiles");
		dispatcher.forward(request, response);
	}

}
