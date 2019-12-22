package hagong.academy.commonMenu.calendar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.calendar.model.service.CalendarService;

/**
 * Servlet implementation class DelteCalendarServlet
 */
@WebServlet("/adelete.cal")
public class DelteCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelteCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno =Integer.parseInt( request.getParameter("cno"));

		
		int result = new CalendarService().deleteCal(cno);
		
		if(result > 0) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
