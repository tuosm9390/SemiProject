package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;

@WebServlet("/aupdateAttend.attend")
public class UpdateAttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateAttendServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attStatus = request.getParameter("selectAttend");
		String checkedPersonArr = request.getParameter("checkedPersonString");
		String classNum = request.getParameter("classNum");
		
		System.out.println("attStatus : " + attStatus);
		System.out.println("classNum : " + classNum);
		
		String checkedPerson = checkedPersonArr.replaceAll("'", "");
		
		String[] students = checkedPerson.split(",");
		
		for(int i=0; i<students.length; i++) {
			System.out.println("students[" + i + "] : " + students[i]);
		}
		
		int result = new AttendService().updateAttend(classNum, attStatus, students);
		
		String page = "";
		if(result > 0) {
			page = "alistStudent.attend";
			request.setAttribute("classNum", classNum);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			System.out.println("출결정보 업데이트 실패");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
