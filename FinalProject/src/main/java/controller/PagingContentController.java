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

@WebServlet(urlPatterns = {"/PagingContentController"})
public class PagingContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PagingContentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentDAO dbContent = new ContentDAO();
		List<Content> contents = new ArrayList<Content>();
		try 
		{
			//Lay ra so trang can xu ly
			int numberOfPage = Integer.parseInt(request.getParameter(ContentConstant.numberOfPage));
			//Lay ra noi dung search. Neu khong co thi bien search se = null
			String search = request.getParameter(ContentConstant.searchContent);
			//Tinh toan offset=(so trang - 1) * 10(co dinh).
			int offset=(numberOfPage-1)*(ContentConstant.limitContent);
			
			int listContentSize=0;
			//Neu khong co chuoi search
			if(search == null)
			{
				//Neu la admin, lay toan bo content cua tat ca cac User
				if(UserConstant.UserID==UserConstant.adminID)
				{
					contents = dbContent.getAllContent(offset,ContentConstant.limitContent);
					//Dung selec count(*) ... de dem so luong content cua toan bo User
					listContentSize=dbContent.countContents();
				}
				//Neu khong phai la admin, thi kiem content theo UserID
				else
				{
					contents = dbContent.getContentForMember(UserConstant.UserID,offset,ContentConstant.limitContent);
					listContentSize=dbContent.countContentsForMember(UserConstant.UserID);
				}
			}
			//Neu co chuoi search
			else
			{
				//Neu la admin thi kiem content theo chuoi search
				if(UserConstant.UserID==UserConstant.adminID)
				{
					contents = dbContent.searchAllContent(search,offset,ContentConstant.limitContent);
					listContentSize=dbContent.countContentsForSearch(search);
				}
				//Neu khong phai la admin thi kiem content theo chuoi search va UserID
				else
				{
					contents = dbContent.searchContentForMember(UserConstant.UserID,search,offset,ContentConstant.limitContent);
					listContentSize=dbContent.countContentsForSearchForMember(search,UserConstant.UserID);
				}
				//Vi co chuoi search nen ta can gui lai cho form ViewContent de hien thi len
				request.setAttribute(ContentConstant.searchContent, search);
			}
			//Gui lai currentPage ve cho form ViewContent de cap nhat gia tri
			request.setAttribute(ContentConstant.currentPage, numberOfPage);
			//Tra ve danh sach content va maxPage
			request.setAttribute(ContentConstant.listContent, contents);
			int maxPage=handleMaxPage(listContentSize);
			request.setAttribute(ContentConstant.maxPage, maxPage);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		request.setAttribute(ContentConstant.paging, true);
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
