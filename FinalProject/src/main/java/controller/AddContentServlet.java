package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDAO;
import model.Content;

/**
 * Servlet implementation class AddContentServlet
 */
@WebServlet(urlPatterns = {"/AddContentServlet"})
public class AddContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ContentDAO contentDAO;    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContentServlet() {
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
		String title = request.getParameter("title");
		String brief = request.getParameter("brief");
		String content = request.getParameter("content");
		Content newct = new Content(title,brief,content);
		ContentDAO.InsertContent(newct);
		response.sendRedirect("content-form.jsp");
	}

}
