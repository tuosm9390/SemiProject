package hagong.academy.commonMenu.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


import hagong.academy.commonMenu.calendar.model.service.CalendarService;
import hagong.academy.commonMenu.calendar.model.vo.Calendar;

/**
 * Servlet implementation class SelectCalendarServlet
 */
@WebServlet("/aselect.cal")
public class SelectCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectCalendarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int uno = Integer.parseInt(request.getParameter("uno"));
		System.out.println("asdddddddddddddddddddddddddd");
		ArrayList<Calendar> list = new ArrayList<>();
		
		list = new CalendarService().selectCal(uno);
		
		if (list != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
		
			new com.google.gson.Gson().toJson(list,response.getWriter());
			
		} else {
			response.getWriter().print("fail");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
