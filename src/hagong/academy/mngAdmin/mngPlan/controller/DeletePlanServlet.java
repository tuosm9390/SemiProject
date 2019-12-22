package hagong.academy.mngAdmin.mngPlan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/adelete.plan")
public class DeletePlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeletePlanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkedMonth = (String) request.getParameter("checkedMonth");
		String[] arr = checkedMonth.split(", ");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
