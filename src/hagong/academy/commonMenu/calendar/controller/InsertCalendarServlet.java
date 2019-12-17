package hagong.academy.commonMenu.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.search.DateTerm;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.calendar.model.service.CalendarService;
import hagong.academy.commonMenu.calendar.model.vo.Calendar;



/**
 * Servlet implementation class InsertCalendarServlet
 */
@WebServlet("/ainsert.cal")
public class InsertCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("11111111111111111111111");
	    Date start = Date.valueOf(request.getParameter("start"));
	    Date end = Date.valueOf(request.getParameter("end"));
	    String title = request.getParameter("title");
	    String allDay = request.getParameter("allDay");
	    String bgColor = request.getParameter("bgColor");
	    String type = request.getParameter("type");
	    String content = request.getParameter("content");
	    int uno = Integer.parseInt(request.getParameter("uno"));
	   System.out.println(title);
		
		Calendar cal = new Calendar();
		cal.setStart(start);
		cal.setEnd(end);
		cal.setTitle(title);
		cal.setAllDay(allDay);
		cal.setBgColor(bgColor);
		cal.setType(type);
		cal.setContent(content);
		cal.setUno(uno);
	
		
		int result = new CalendarService().insertCal(cal);
		
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
