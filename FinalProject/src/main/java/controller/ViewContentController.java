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
		//Khi load view content thi mac dinh quay tro ve trang 1, 
		//va offset(phan tu bat dau) se mac dinh la 0 vi dong dau tien trong mysql se co index=0
		int currentPage=1;
		int offset=0;
		//Gui currentPage ve form Viewcontent de in ra so trang va tinh toan stt trong bang content
		request.setAttribute("currentPage", currentPage);
		int listContentSize=0;
		//Neu la admin thi se load 10 content dau trong tat ca content cua user
		if(UserConstant.UserID==UserConstant.adminID)
		{
			contents = dbContent.getAllContent(offset,ContentConstant.limitContent);
			//Dung selec count(*) ... de dem so luong content cua toan bo User
			listContentSize=dbContent.countContents();
		}
		//Neu la user thi se load 10 content dau tien cua nguoi nay
		else
		{
			contents = dbContent.getContentForMember(UserConstant.UserID,offset,ContentConstant.limitContent);
			listContentSize=dbContent.countContentsForMember(UserConstant.UserID);
		}
		request.setAttribute("listContent", contents);
		//Xu ly maxPage va gui maxPage ve cho form Viewcontent
		int maxPage=handleMaxPage(listContentSize);
		request.setAttribute("maxPage", maxPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
