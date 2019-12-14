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
		
		String checkedPerson = checkedPersonArr.replaceAll("'", "");
		
		String[] students = checkedPerson.split(",");
		
		for(int i=0; i<students.length; i++) {
			System.out.println(students[i]);
		}
		
		int result = new AttendService().updateAttend(attStatus, students);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
