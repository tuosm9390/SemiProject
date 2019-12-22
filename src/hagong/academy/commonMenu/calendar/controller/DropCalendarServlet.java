package hagong.academy.commonMenu.calendar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.calendar.model.service.CalendarService;
import hagong.academy.commonMenu.calendar.model.vo.Calendar;

/**
 * Servlet implementation class DropCalendarServlet
 */
@WebServlet("/adrop.cal")
public class DropCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DropCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String exstart = request.getParameter("start");
		String exend = request.getParameter("end");
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		 String start = exstart.substring(0, 4)+"-"+exstart.substring(5,7)+"-"+exstart.substring(8,10)+" "+exstart.substring(11,13)+":"+exstart.substring(14,16);
		 String end = exend.substring(0, 4)+"-"+exend.substring(5,7)+"-"+exend.substring(8,10)+" "+exend.substring(11,13)+":"+exend.substring(14,16);
		 Calendar c = new Calendar();
		 c.setCno(cno);
		 c.setStart(start);
		 c.setEnd(end);
		 
		 int result = new CalendarService().dropCal(c);
		 
			if(result > 0) {
				System.out.println("result 성공 ? " + result);
				response.getWriter().print("success");
			}else {
				System.out.println("result 실패 ? " + result);
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
