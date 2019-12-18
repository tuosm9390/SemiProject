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

@WebServlet("/alist.plan")
public class SelectPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPlanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HashMap<String, Object> hmap = new PlanService().selectPlan();
		
		ArrayList<String> title = (ArrayList<String>) hmap.get("title");
		ArrayList<ArrayList<Plan>> content = (ArrayList<ArrayList<Plan>>) hmap.get("content");
		
		String page = "";
		if(hmap != null) {
			page = "/viewAcademy/mngAdmin/mngPlan/viewPlan.jsp";
			request.setAttribute("title", title);
			request.setAttribute("content", content);
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
