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
 * Servlet implementation class SelectStudentInfoServlet
 */
@WebServlet("/aupdatedetail.info")
public class SelectStudentInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStudentInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		Student s = new StudentService().selectStudentInfo(userId);
		
		String page = "";
		if(s != null) {
			page = "/viewAcademy/mngStudent/mngInfo/updateStudent.jsp";
			request.setAttribute("s", s);
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "selectStudentInfoFail");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
