package hagong.academy.mngStaff.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStaff.model.service.StaffService;
import hagong.academy.mngStaff.model.vo.Staff;

@WebServlet("/alist.staff")
public class StaffListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StaffListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Staff> staffList = new StaffService().staffList();
		
		String page = "";
		if(staffList != null) {
			page = "viewAcademy/mngStaff/staffList.jsp";
			request.setAttribute("staffList", staffList);
		} else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "staffListFail");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
