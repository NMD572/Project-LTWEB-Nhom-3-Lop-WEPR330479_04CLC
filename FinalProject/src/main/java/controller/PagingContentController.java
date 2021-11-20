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

import dao.ContentDAO;
import constant.UserConstant;
import constant.ContentConstant;
import model.Content;

/**
 * Servlet implementation class PagingContentController
 */
@WebServlet(urlPatterns = {"/PagingContentController"})
public class PagingContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PagingContentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentDAO dbContent = new ContentDAO();
		List<Content> contents = new ArrayList<Content>();
		int numberOfPage = Integer.parseInt(request.getParameter("numberOfPage"));
		String search = request.getParameter("searchContent");
		//String search=null;
		int offset=(numberOfPage-1)*(ContentConstant.limitContent);
		request.setAttribute("currentPage", numberOfPage);
		//request.setAttribute("maxPage", maxPage);
		int listcontentsize=0;
		if(search == null)
		{
			if(UserConstant.UserID==ContentConstant.adminID)
			{
				contents = dbContent.getAllContent(offset,ContentConstant.limitContent);
				listcontentsize=dbContent.countContents();
				//System.out.println(listcontentsize);
			}
			else
			{
				contents = dbContent.getContentForMember(UserConstant.UserID,offset,ContentConstant.limitContent);
				listcontentsize=dbContent.countContentsForMember(UserConstant.UserID);
				//System.out.println(listcontentsize);
			}
		}
		else
		{
			if(UserConstant.UserID==ContentConstant.adminID)
			{
				contents = dbContent.searchAllContent(search,offset,ContentConstant.limitContent);
				listcontentsize=dbContent.countContentsForSearch(search);
			}
			else
			{
				contents = dbContent.searchContentForMember(UserConstant.UserID,search,offset,ContentConstant.limitContent);
				listcontentsize=dbContent.countContentsForSearchForMember(search,UserConstant.UserID);
			}
			request.setAttribute("searchContent", search);
		}
		request.setAttribute("listContent", contents);
		int maxPage=handleMaxPage(listcontentsize);
		request.setAttribute("maxPage", maxPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view.tiles");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private int handleMaxPage(int listcontentsize)
	{
		int maxPage=0;
		maxPage+=listcontentsize/10;
		if(listcontentsize%10!=0)		//Xu ly truong hop thua ra
		{
			maxPage++;
		}
		return maxPage;
	}

}
