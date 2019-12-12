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
 * Servlet implementation class InsertCounsServlet
 */
@WebServlet("/insert.couns")
public class InsertCounsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCounsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상담내용 값 가져오기
		String cTitle = request.getParameter("cTitle");
		String date = request.getParameter("from");
		String category = request.getParameter("consCategory");
		String counsName = request.getParameter("counsName");
		String name = request.getParameter("name");
		String consreq = request.getParameter("consreq");
		String consres = request.getParameter("consres");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int counsUserNo = Integer.parseInt(request.getParameter("counsUserNo"));

		
		java.sql.Date day = null;
		
		if(date != "") {
			day = java.sql.Date.valueOf(date);
		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Counseling couns = new Counseling();
		couns.setCouTitle(cTitle);
		couns.setCouDate(day);
		couns.setCouType(category);
		couns.setCouUserNo(counsUserNo);
		couns.setUserNo(userNo);
		couns.setCouContent(consreq);
		couns.setCouAction(consres);
		
		int result = new CounselingService().insertCouns(couns);
		
		
		
		
		String page = "";
		if(result > 0) {
			page = "viewAcademy/mngStudent/mngCouns/counsList.jsp";
			
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "상담등록실패!");
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
