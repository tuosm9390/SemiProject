package hagong.academy.mngStudent.mngInfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchScoreServlet
 */
@WebServlet("/searchscore.info")
public class SearchScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchScoreServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("condition");
		String op = request.getParameter("op");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append(", condition : " + condition);
		response.getWriter().append(", op : " + op);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
