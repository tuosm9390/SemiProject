package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

/**
 * Servlet implementation class UpdateSatisfyServlet
 */
@WebServlet("/aupdate.satis")
public class UpdateSatisfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateSatisfyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int satNo = Integer.parseInt(request.getParameter("satNo"));
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
		si.setSatNo(satNo);
		si.setSatTitle(title);
		si.setTarget(target);
		si.setStart(start);
		si.setEnd(end);
		si.setBenNo(benNo);
		
		int result = new SatisfyService().updateSatis(si, qrr, arr, questionNum, answerNum);
		
		String page = "";
		if(result > 0) {
			page = "/adetail.satis?satNo=" + si.getSatNo() + "&type=detail";
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "updateSatisFail");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
