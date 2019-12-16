package hagong.academy.mngStaff.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStaff.model.service.StaffService;

@WebServlet("/adelete.staff")
public class DeleteStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DeleteStaffServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int staffNo = Integer.parseInt(request.getParameter("no"));
		int result = new StaffService().deleteStaff(staffNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/alist.staff");
		} else {
			request.setAttribute("errorCode", "staffDeleteError");
			request.getRequestDispatcher("viewAcademy/common/commonError.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
