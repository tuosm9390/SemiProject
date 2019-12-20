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
 * Servlet implementation class UpdateCalendarServlet
 */
@WebServlet("/aupdate.cal")
public class UpdateCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int cno =Integer.parseInt( request.getParameter("cno"));
		System.out.println("cno = " +cno);
		String start = request.getParameter("start");
		String end = request.getParameter("end");
	    String title = request.getParameter("title");
	    String type = request.getParameter("type");
	    String content = request.getParameter("content");
	    String backgroundColor = request.getParameter("backgroundColor");
	 
	    if(type.equals("상담")) {
	    	type = "COUNS";
	    }else if(type.equals("학원일정")) {
	    	type = "EVENT";
	    }else if(type.equals("개인일정")) {
	    	type = "PER";
	    }else {
	    	type = "ETC";
	    }
	    
	    Calendar c = new Calendar();
	    c.setCno(cno);
	    c.setStart(start);
	    c.setEnd(end);
	    c.setTitle(title);
	    c.setType(type);
	    c.setContent(content);
	    
	    
		
		
		int result = new CalendarService().updateCal(c);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
