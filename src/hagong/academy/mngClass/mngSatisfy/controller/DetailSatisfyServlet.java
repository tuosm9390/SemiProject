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

@WebServlet("/adetail.satis")
public class DetailSatisfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailSatisfyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int satNo = Integer.parseInt(request.getParameter("satNo"));

		ArrayList<HashMap<String, Object>> list = new SatisfyService().selectSatis(satNo);

		String page = "";
		if (list != null) {
			page = "/viewAcademy/mngClass/mngSatisfy/satisfactionDetail.jsp";
			request.setAttribute("list", list);
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "selectSatisfyDetailFail");
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
