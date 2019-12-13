package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;
import hagong.academy.mngClass.mngAttend.model.vo.Attendance;

@WebServlet("/aupdateAttendReason.attend")
public class UpdateAttendReasonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateAttendReasonServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classNum = request.getParameter("classNum");
		String date = request.getParameter("date");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String content = request.getParameter("content");
		
		System.out.println("content : " + content);

		int result = new AttendService().updateAttendReason(classNum, date, userNo, content);   
		
		String page = "";
		if(result > 0) {
			response.getWriter().print(result);
		}else {
			System.out.println("실패..");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
