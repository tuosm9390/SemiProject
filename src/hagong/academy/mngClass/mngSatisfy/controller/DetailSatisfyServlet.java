package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

@WebServlet("/adetail.satis")
public class DetailSatisfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailSatisfyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int satNo = Integer.parseInt(request.getParameter("satNo"));
		String type = request.getParameter("type");

		ArrayList<HashMap<String, Object>> list = new SatisfyService().selectSatis(satNo);
		System.out.println("list : " + list);
		ArrayList<SatisfyInfo> blist = new SatisfyService().selectBenList();

		String page = "";
		if (list != null) {
			if (type.equals("detail")) {
				page = "/viewAcademy/mngClass/mngSatisfy/satisfactionDetail.jsp";
				request.setAttribute("list", list);
			} else {
				page = "/viewAcademy/mngClass/mngSatisfy/updateSatisfaction.jsp";
				request.setAttribute("list", list);
				request.setAttribute("blist", blist);
			}
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "selectSatisfyFail");
		}

		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
