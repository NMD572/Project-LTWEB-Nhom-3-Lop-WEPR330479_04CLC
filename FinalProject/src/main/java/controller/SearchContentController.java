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


@WebServlet("/SearchContentController")
public class SearchContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchContentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentDAO dbContent = new ContentDAO();
		List<Content> contents = new ArrayList<Content>();
		try {
			//Xu ly chuoi search
			String search = request.getParameter("searchString");
			if(search=="")
				search=" ";								//Tranh truong hop de null thi se gay ra loi khi thuc hien truy van sql
			//offset(phan tu bat dau) se mac dinh la 0 vi dong dau tien trong mysql se co index=0
			int offset=0;
			int listContentSize=0;
			//Neu la admin thi se load 10 content dau trong tat ca content cua user
			if(UserConstant.UserID==UserConstant.adminID)
			{
				contents = dbContent.searchAllContent(search,offset,ContentConstant.limitContent);
				//Dung selec count(*) ... de dem so luong content cua toan bo User
				listContentSize=dbContent.countContentsForSearch(search);
			}
			//Neu la user thi se load 10 content dau tien cua nguoi nay
			else
			{
				contents = dbContent.searchContentForMember(UserConstant.UserID,search,offset,ContentConstant.limitContent);
				listContentSize=dbContent.countContentsForSearchForMember(search,UserConstant.UserID);
			}
			//Khi search content thi mac dinh quay tro ve trang 1
			int currentPage=1;
			request.setAttribute("currentPage", currentPage);
			//Tra ve danh sach content va maxPage
			request.setAttribute("listContent", contents);
			//Xu ly maxPage va gui maxPage ve cho form Viewcontent
			int maxPage=handleMaxPage(listContentSize);
			request.setAttribute("maxPage", maxPage);
			//Tra ve chuoi search input de khi load len the input trong form
			request.setAttribute("searchContent", request.getParameter("searchString"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//Tra ve reponse message tu deletecontentcontroller (neu co)
		String responseMessage=(String) request.getAttribute("responseMessage");
		if(responseMessage!="")
			request.setAttribute("responseMessage", responseMessage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view.tiles");
		dispatcher.forward(request, response);
	}
	private int handleMaxPage(int listContentSize)
	{
		int maxPage=0;
		maxPage+=listContentSize/10;
		if(listContentSize%10!=0)		//Xu ly truong hop thua ra (11,21,...) thi maxPage tang len 1
		{
			maxPage++;
		}
		return maxPage;
	}

}
