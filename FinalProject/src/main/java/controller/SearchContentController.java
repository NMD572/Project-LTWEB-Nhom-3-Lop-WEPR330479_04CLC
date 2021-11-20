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
		//Khi load view content thi mac dinh quay tro ve trang 1
		int offset=0;
		//Xu ly maxPage
		int listcontentsize=0;
		if(UserConstant.UserID==ContentConstant.adminID)
		{
			contents = dbContent.searchAllContent(search,offset,ContentConstant.limitContent);
			listcontentsize=dbContent.countContentsForSearch(search);
			System.out.println(listcontentsize);
		}
		else
		{
			contents = dbContent.searchContentForMember(UserConstant.UserID,search,offset,ContentConstant.limitContent);
			listcontentsize=dbContent.countContentsForSearchForMember(search,UserConstant.UserID);
			System.out.println(listcontentsize);
		}
		//Tra ve current page
		int currentPage=1;
		request.setAttribute("currentPage", currentPage);
		//Tra ve danh sach content va maxPage
		request.setAttribute("listContent", contents);
		int maxPage=handleMaxPage(listcontentsize);
		request.setAttribute("maxPage", maxPage);
		//Tra ve chuoi search input
		request.setAttribute("searchContent", request.getParameter("searchString"));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("view.tiles");
		dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
