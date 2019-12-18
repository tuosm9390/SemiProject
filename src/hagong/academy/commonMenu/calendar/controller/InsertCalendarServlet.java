package hagong.academy.commonMenu.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.calendar.model.service.CalendarService;
import hagong.academy.commonMenu.calendar.model.vo.Calendar;





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
	
		String exstart = request.getParameter("start");
		String exend = request.getParameter("end");
		int uno = Integer.parseInt(request.getParameter("uno"));
	    String title = request.getParameter("title");
	    String type = request.getParameter("type");
	    String content = request.getParameter("content");
	    String backgroundColor = request.getParameter("backgroundColor");
	 
		java.sql.Date start = null;
		java.sql.Date end = null;
	  
		start = java.sql.Date.valueOf(exstart);
		end = java.sql.Date.valueOf(exend);
		
	    if(type.equals("상담")) {
	    	type = "COUNS";
	    }else if(type.equals("학원일정")) {
	    	type = "EVENT";
	    }else if(type.equals("개인일정")) {
	    	type = "PER";
	    }else {
	    	type = "ETC";
	    }
	    
	    System.out.println("start : " + exstart );
	    System.out.println("end : " + exend);
	    System.out.println("title : " + title);
	 
	    System.out.println("type : " + type);
	    System.out.println("content : " + content);
	    System.out.println("uno : " + uno);
	    System.out.println("backgroundColor : " + backgroundColor);
	  
	    Calendar cal = new Calendar();
	    
	    cal.setTitle(title);
	    cal.setType(type);
	    cal.setContent(content);
	    cal.setUno(uno);
	    cal.setStart(start);
	    cal.setEnd(end);
	
	    
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
