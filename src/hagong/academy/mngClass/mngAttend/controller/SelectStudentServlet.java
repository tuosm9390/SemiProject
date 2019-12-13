package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;


@WebServlet("/alistStudent.attend")
public class SelectStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectStudentServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classNum = request.getParameter("classNum");
		
		ArrayList<HashMap<String, Object>> list = new AttendService().selectStudent(classNum);
		
		
		
		String page = "";
		if(list != null) {
			page = "alistAttend.attend";
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
