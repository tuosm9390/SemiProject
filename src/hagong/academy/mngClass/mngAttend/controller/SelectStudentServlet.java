package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;
import hagong.academy.mngStudent.mngPurchase.model.service.PurchaseService;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;


@WebServlet("/alistStudent.attend")
public class SelectStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectStudentServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM");
		String today = dayFormat.format(System.currentTimeMillis());
		String[] todayArr = today.split("-");
		String startDay = new PurchaseService().selectStartDay();
		String[] startDayArr = startDay.split("-");
		
		int endYear = Integer.parseInt(todayArr[0]);
		int endMonth = Integer.parseInt(todayArr[1]);
		int startYear = Integer.parseInt(startDayArr[0]);
		int startMonth = Integer.parseInt(startDayArr[1]);
		int curYear = Integer.parseInt(request.getParameter("year"));
		int curMonth = Integer.parseInt(request.getParameter("month"));
		
		SelectDate selectDate = new SelectDate();
		selectDate.setEndYear(endYear); selectDate.setEndMonth(endMonth);
		selectDate.setStartYear(startYear); selectDate.setStartMonth(startMonth);
		selectDate.setSelectYear(curYear); selectDate.setSelectMonth(curMonth);
		
		String classNum = request.getParameter("classNum");
		
		ArrayList<HashMap<String, Object>> list = new AttendService().selectStudent(classNum);   
		
		String page = "";
		if(list != null) {
			page = "alistAttend.attend";
			request.setAttribute("selectDate", selectDate);
			request.setAttribute("studentList", list);
			request.setAttribute("classNum", classNum);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			System.out.println("강좌를 듣는 학생 리스트 조회 실패!");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
