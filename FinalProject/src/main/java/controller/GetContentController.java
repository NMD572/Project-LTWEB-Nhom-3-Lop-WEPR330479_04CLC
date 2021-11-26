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
 * Servlet implementation class GetContentController
 */
@WebServlet("/GetContentController")
public class GetContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ContentDAO contentDAO=new ContentDAO();       

    public GetContentController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int UserID=UserConstant.UserID;
		int id = Integer.parseInt(request.getParameter("id"));
		Content ct = new Content(id);						//tạo 1 object Content với id lấy từ bảng view, lấy những thuộc tính title, brief, content từ object
		ct = contentDAO.selectContentInfo(id);
		request.setAttribute("existContent",ct);			//gán giá trị của content vừa xử lý để sử dụng ở form Edit Content
		request.getSession().setAttribute("responseMessage", "");
		RequestDispatcher dispatcher =request.getRequestDispatcher("add.tiles");
		dispatcher.forward(request, response);				//điều hướng lại về phía Edit Content
	}

}
