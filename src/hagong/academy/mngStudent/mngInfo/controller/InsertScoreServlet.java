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
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int year = Integer.parseInt(request.getParameter("year"));
		int term = Integer.parseInt(request.getParameter("term"));
		String subName = request.getParameter("subName");
		int subScore = Integer.parseInt(request.getParameter("subScore"));
		
		Student s = new Student();
		
		s.setUserId(userId);
		s.setName(name);
		s.setScoType(type);
		s.setYear(year);
		s.setTerm(term);
		s.setSubName(subName);
		s.setSubscore(subScore);
		
		int userNo = new StudentService().findUserNo(userId);
		s.setUserNo(userNo);
		int result = new StudentService().insertScore(s);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect("/hagong/adetail.info?userId=" + s.getUserId());
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "insertScoreFail");
			request.getRequestDispatcher(page).forward(request, response);
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
