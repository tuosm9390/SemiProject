package hagong.academy.mngStudent.mngInfo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;

/**
 * Servlet implementation class DetailStudentServlet
 */
@WebServlet("/adetail.info")
public class DetailStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		Student s = new StudentService().selectStudent(userId);
		
		if(s != null) {
			System.out.println("학생 정보 조회 성공");
			request.setAttribute("s", s);
		} else {
			System.out.println("학생 정보 조회 실패");
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
