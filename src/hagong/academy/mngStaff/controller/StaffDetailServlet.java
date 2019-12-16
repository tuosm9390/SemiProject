package hagong.academy.mngStaff.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStaff.model.service.StaffService;
import hagong.academy.mngStaff.model.vo.StaffDetail;

@WebServlet("/adetail.staff")
public class StaffDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public StaffDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		int userNo = Integer.parseInt(request.getParameter("no"));
		ArrayList<StaffDetail> staffDetail = new StaffService().staffDetail(userNo);
		
		String page = "";
		if(staffDetail != null && type.equals("view")) {
			page = "viewAcademy/mngStaff/staffDetail.jsp";
			request.setAttribute("staffDetail", staffDetail);
		} else if(staffDetail != null && type.equals("modify")) {
			page = "viewAcademy/mngStaff/updateStaff.jsp";
			request.setAttribute("staffDetail", staffDetail);
		} else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "staffDetailFail");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
