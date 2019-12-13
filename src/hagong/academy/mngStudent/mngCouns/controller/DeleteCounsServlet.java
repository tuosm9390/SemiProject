package hagong.academy.mngStudent.mngCouns.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngCouns.model.service.CounselingService;
import hagong.academy.mngStudent.mngCouns.model.vo.Counseling;

/**
 * Servlet implementation class DeleteCounsServlet
 */
@WebServlet("/deletedetail.couns")
public class DeleteCounsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCounsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int couNo = Integer.parseInt(request.getParameter("couNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));

		
		int result = new CounselingService().deleteCouns(couNo);
		
		
		String page = "";
		if(result > 0 ) {
			page = request.getContextPath() + "/detail.couns?userNo=" + userNo;
			response.sendRedirect(page);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "상담일지 삭제실패!");
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
