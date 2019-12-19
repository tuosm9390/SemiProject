package hagong.academy.mngAdmin.mngPlan.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngAdmin.mngPlan.model.service.PlanService;
import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;

@WebServlet("/alistByYear.plan")
public class SelectPlanByYearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPlanByYearServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String year = request.getParameter("year");
		
		HashMap<String, Object> hmap = new PlanService().selectByYear(year);
		System.out.println(hmap);
		/*
		 * ArrayList<String> title = (ArrayList<String>) hmap.get("title");
		 * System.out.println("title : " + title); ArrayList<ArrayList<Plan>> content =
		 * (ArrayList<ArrayList<Plan>>) hmap.get("content");
		 * System.out.println("content : " + content);
		 */
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(hmap, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
