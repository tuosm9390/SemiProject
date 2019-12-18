package hagong.academy.mngAdmin.mngPlan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngAdmin.mngPlan.model.service.PlanService;

@WebServlet("/ainsert.plan")
public class InsertPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");	System.out.println("title : " + title);
		String one = request.getParameter("one");
		String two = request.getParameter("two");
		String three = request.getParameter("three");
		String four = request.getParameter("four");
		String five = request.getParameter("five");
		String six = request.getParameter("six");
		String seven = request.getParameter("seven");
		String eight = request.getParameter("eight");
		String nine = request.getParameter("nine");
		String ten = request.getParameter("ten");
		String eleven = request.getParameter("eleven");
		String twelve = request.getParameter("twelve");
		
		ArrayList<String> content = new ArrayList<String>();
		content.add(one);
		content.add(two);
		content.add(three);
		content.add(four);
		content.add(five);
		content.add(six);
		content.add(seven);
		content.add(eight);
		content.add(nine);
		content.add(ten);
		content.add(eleven);
		content.add(twelve);
		
		int result = new PlanService().insertPlan(title, content);
		
		String page = "";
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
