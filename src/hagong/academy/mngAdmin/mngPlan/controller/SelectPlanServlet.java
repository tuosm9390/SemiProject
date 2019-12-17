package hagong.academy.mngAdmin.mngPlan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngAdmin.mngPlan.model.service.PlanService;
import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;

@WebServlet("/alist.plan")
public class SelectPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPlanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Plan> list = new PlanService().selectPlan();
		
		String page = "";
		if(list != null) {
			page = "/viewAcademy/mngAdmin/mngPlan/viewPlan.jsp";
			request.setAttribute("list", list);
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
