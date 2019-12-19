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
		System.out.println("satNo : " + satNo);
		String title = request.getParameter("title");
		System.out.println("title : " + title);
		String target = request.getParameter("target");
		System.out.println("target : " + target);
		
		java.sql.Date start = java.sql.Date.valueOf(request.getParameter("start"));
		System.out.println("start : " + start);
		java.sql.Date end = java.sql.Date.valueOf(request.getParameter("end"));
		System.out.println("end : " + end);
		
		int benNo = Integer.parseInt(request.getParameter("benefit"));
		System.out.println("benNo : " + benNo);
		
		String[] questionNum = request.getParameterValues("questionNum");
		String question = "";
		if(questionNum != null) {
			for(int i = 0; i < questionNum.length; i++) {
				if (i == 0) {
					question += questionNum[i];
				} else {
					question += ", " + questionNum[i];
				}
			}
		}
		System.out.println("question : " + question);
		
		String[] answerNum = request.getParameterValues("answerNum");
		String answer = "";
		if(answerNum != null) {
			for(int i = 0; i < answerNum.length; i++) {
				if (i == 0) {
					answer += answerNum[i];
				} else {
					answer += ", " + answerNum[i];
				}
			}
		}
		System.out.println("answer : " + answer);
		
		String[] qrr = request.getParameterValues("question");
		String q = "";
		if (qrr != null) {
			for(int i = 0; i < qrr.length; i++) {
				if (i == 0) {
					q += qrr[i];
				} else {
					q += ", " + qrr[i];
				}
			}
		}
		System.out.println("q : " + q);
		
		String[] arr = request.getParameterValues("answer");
		String a = "";
		if (arr != null) {
			for(int i = 0; i < arr.length; i++) {
				if (i == 0) {
					a += arr[i];
				} else {
					a += ", " + arr[i];
				}
			}
		}
		System.out.println("a : " + a);
		
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
