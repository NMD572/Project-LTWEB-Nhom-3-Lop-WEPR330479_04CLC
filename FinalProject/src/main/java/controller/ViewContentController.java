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
		if(UserConstant.UserID==ContentConstant.adminID)
			contents = dbContent.getAllContent();
		else
			contents = dbContent.getContentForMember(UserConstant.UserID);
		request.setAttribute("listContent", contents);
		RequestDispatcher dispatcher =request.getRequestDispatcher("view.tiles");
		dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
