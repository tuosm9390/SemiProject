package hagong.academy.mngStudent.mngBlack.controller;

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
 * Servlet implementation class UpdateBlacklistServlet
 */
@WebServlet("/update.black")
public class UpdateBlacklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBlacklistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정할 상담내용 가져오기
		int couNo = Integer.parseInt(request.getParameter("couNo"));
		String title = request.getParameter("title");
		String date = request.getParameter("from");
		String category = request.getParameter("consCategory");
		String consreq = request.getParameter("consreq");
		String consres = request.getParameter("consres");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String couBlack = request.getParameter("isblack");
		System.out.println("couBlack : " + couBlack);
		if(couBlack == null) {
			couBlack = "N";
		}
		
		java.sql.Date day = null;
		
		if(date != "") {
			day = java.sql.Date.valueOf(date);
		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Counseling couns = new Counseling();
		
		couns.setCouNo(couNo);
		couns.setCouTitle(title);
		couns.setCouDate(day);
		couns.setCouType(category);
		couns.setCouContent(consreq);
		couns.setCouAction(consres);
		couns.setCouBlack(couBlack);
		
		int result = new CounselingService().updateCounsDetail(couns);
		
		
		String page = "";
		if(result > 0 ) {
			page = request.getContextPath() + "/detail.black?num=" + userNo;
			response.sendRedirect(page);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "블랙리스트 수정실패!");
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
