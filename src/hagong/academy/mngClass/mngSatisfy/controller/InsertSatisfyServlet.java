package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Class;
import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

/**
 * Servlet implementation class InsertSatisfyServlet
 */
@WebServlet("/ainsert.satis")
public class InsertSatisfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertSatisfyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");

		int limit = 10;
		int currentPage = 1;
		String page = "";
		if (type.equals("insertForm")) {
			//만족도 등록 버튼 클릭 시 처리할 로직
			ArrayList<SatisfyInfo> blist = new SatisfyService().selectBenList();
			ArrayList<Class> clist = new ClassService().selectClassList(currentPage, limit);
			if (blist != null) {
				page = "viewAcademy/mngClass/mngSatisfy/addSatisfaction.jsp";
				request.setAttribute("blist", blist);
				request.setAttribute("clist", clist);
			} else {
				page = "/viewAcademy/common/commonError.jsp";
			}
			request.getRequestDispatcher(page).forward(request, response);

		} else {
			//등록하기 버튼 클릭 시 처리할 로직
			String title = request.getParameter("title");
			String target = request.getParameter("target");
			
			java.sql.Date start = java.sql.Date.valueOf(request.getParameter("start"));
			java.sql.Date end = java.sql.Date.valueOf(request.getParameter("end"));
			
			int benNo = Integer.parseInt(request.getParameter("benefit"));
			
			String[] questionNum = request.getParameterValues("questionNum");
			
			String[] answerNum = request.getParameterValues("answerNum");
			
			String[] qrr = request.getParameterValues("question");
			
			String[] arr = request.getParameterValues("answer");
			
			SatisfyInfo si = new SatisfyInfo();
			si.setSatTitle(title);
			si.setTarget(target);
			si.setStart(start);
			si.setEnd(end);
			si.setBenNo(benNo);
			
			int result = new SatisfyService().insertSatis(si, qrr, arr, questionNum, answerNum);
			
			if(result > 0) {
				page = "alist.satis";
				response.sendRedirect(page);
			} else {
				page = "/viewAcademy/common/commonError.jsp";
				request.setAttribute("errorCode", "insertSatisFail");
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
