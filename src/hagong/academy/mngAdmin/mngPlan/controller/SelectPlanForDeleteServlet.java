package hagong.academy.mngAdmin.mngPlan.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngAdmin.mngPlan.model.service.PlanService;
import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;

@WebServlet("/alistForDelete.plan")
public class SelectPlanForDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectPlanForDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String deleteTitle = request.getParameter("title");
		
		int result = new PlanService().deletePlan(deleteTitle);
		
		response.getWriter().print(result);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
