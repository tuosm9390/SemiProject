package hagong.academy.common.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.common.member.model.service.MemberService;

/**
 * Servlet implementation class SelectAllStaffServlet
 */
@WebServlet("/allStaff.cm")
public class SelectAllStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllStaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalStaff = new MemberService().allStaff();
		int totalStudent = new MemberService().allStudent();
		
		System.out.println(totalStaff + ", " + totalStudent);
		
		String page = "";
		if(totalStaff > 0) {
			page = "viewAcademy/main.jsp";
			request.getSession().setAttribute("totalStaff", new Integer(totalStaff));
			request.getSession().setAttribute("totalStudent", new Integer(totalStudent));
		}else {
			System.out.println("총 직원 수 조회 실패");
			
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
