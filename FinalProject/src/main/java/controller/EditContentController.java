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
import java.sql.SQLException;

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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.sendRedirect("add.tiles");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String brief = request.getParameter("brief");
		String content = request.getParameter("content");
		Content configuredContent = new Content(id,title, brief, content);
		request.setAttribute("existContent",configuredContent);

		if (title.length() < 1 || brief.length() < 1 || content.length() <1)
		{
			redirectForm("responseMessage","Invalid data",request,response);
		}
		else if (title.length() < 10 || title.length() > 200)
		{
			redirectForm("responseMessage","The title must contain from 10 to 200 characters",request,response);
		}
		else if (brief.length() < 30 || brief.length() > 150)
		{
			redirectForm("responseMessage", "The brief must contain from 30 to 150 characters",request,response);
		}
		else if (content.length() < 50 || content.length() > 1000)
		{
			redirectForm("responseMessage","The content must contain from 50 to 1000 characters",request,response);
		}
		else
		{


			if (contentDAO.checkAvailableContent(configuredContent))
			{
				redirectForm("responseMessage","This content is already used",request,response);
			}
			else {
				boolean check;
				try
				{
					check = contentDAO.UpdateContent(configuredContent);
					if (check)
					{
						redirectForm("responseMessage", "Edit Content Successfully", request, response);
					} else
					{
						redirectForm("responseMessage", "Edit Content Unsuccessfully", request, response);
					}
				} catch (SQLException e)
				{
					e.printStackTrace();
					redirectForm("responseMessage", "Error", request, response);
				}

			}
		}
	}
	
	protected void redirectForm(String messageAtrribute, String message, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.getSession().setAttribute(messageAtrribute, message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("add.tiles");
		dispatcher.forward(request, response);
	}

}
