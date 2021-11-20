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
import model.Content;
import constant.UserConstant;
import constant.ContentConstant;
@WebServlet("/ViewContentController")
public class ViewContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ViewContentController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentDAO dbContent = new ContentDAO();
		try {
		List<Content> contents = new ArrayList<Content>();
		//Khi load view content thi mac dinh quay tro ve trang 1
		int currentPage=1;
		int offset=0;
		request.setAttribute("currentPage", currentPage);
		int listcontentsize=0;
		//Xu ly maxPage
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
		request.setAttribute("listContent", contents);
		int maxPage=handleMaxPage(listcontentsize);
		request.setAttribute("maxPage", maxPage);
		RequestDispatcher dispatcher =request.getRequestDispatcher("view.tiles");
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
