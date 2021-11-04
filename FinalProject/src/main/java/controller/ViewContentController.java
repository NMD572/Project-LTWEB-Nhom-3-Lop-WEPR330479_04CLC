package controller;

import java.io.IOException;

import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ViewContentDAO;

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
		ViewContentDAO dbContent = new ViewContentDAO();
		//fix: thay vi gui ve resultset thi se gui List<Content>
		ResultSet rs;
		try {
		rs = dbContent.getAllContent();
		request.setAttribute("rs", rs);
		request.getRequestDispatcher("view.tiles").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
