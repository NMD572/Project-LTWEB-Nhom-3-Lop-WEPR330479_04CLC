package controller;

import constant.ContentConstant;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/DeleteContentController"})
public class DeleteContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ContentDAO contentDAO=new ContentDAO();
    public DeleteContentController() {
        super();
    	this.contentDAO = new ContentDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
			boolean check;
			try
			{
				check = contentDAO.DeleteContent(id);
				if (check)
				{
					reloadViewPage("responseMessage","Delete Content Successfully",request,response);

				}
				else
				{
					reloadViewPage("responseMessage","Delete Content Unsuccessfully",request,response);
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
	}


	public void reloadViewPage(String messageAtrribute, String message, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String search = request.getParameter("searchString");
		request.setAttribute(messageAtrribute, message);
		if(search=="")
		{
			//Chuyen huong ve viewcontentcontroller
			request.getRequestDispatcher("ViewContentController").forward(request, response);
		}
		else
		{
			//chuyen huong ve searchcontentcontroller
			request.setAttribute("searchString", search);
			request.getRequestDispatcher("SearchContentController").forward(request, response);
		}
	}
}
