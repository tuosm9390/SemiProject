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
 * Servlet implementation class InsertScoreServlet
 */
@WebServlet("/ascore.info")
public class InsertScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String type = request.getParameter("type");
		int year = Integer.parseInt(request.getParameter("year"));
		int term = Integer.parseInt(request.getParameter("term"));
		int sub1 = Integer.parseInt(request.getParameter("sub1"));
		int sub2 = Integer.parseInt(request.getParameter("sub2"));
		int sub3 = Integer.parseInt(request.getParameter("sub3"));
		
		Student s = new Student();
		
		s.setUserId(userId);
		s.setScoType(type);
		s.setYear(year);
		s.setTerm(term);
		s.setSub1score(sub1);
		s.setSub2score(sub2);
		s.setSub3score(sub3);
		
		int userNo = new StudentService().findUserNo(userId);
		System.out.println("userNo : " + userNo);
		s.setUserNo(userNo);
		int result = new StudentService().insertScore(s);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
