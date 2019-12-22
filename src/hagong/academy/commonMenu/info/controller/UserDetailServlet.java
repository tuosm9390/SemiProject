package hagong.academy.commonMenu.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.info.model.service.UserService;
import hagong.academy.commonMenu.info.model.vo.UserDetail;
import hagong.academy.mngStaff.model.service.StaffService;
import hagong.academy.mngStaff.model.vo.StaffDetail;

@WebServlet("/adetail.ps")
public class UserDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		int userNo = Integer.parseInt(request.getParameter("no"));
		ArrayList<UserDetail> userDetail = new UserService().userDetail(userNo);
		System.out.println(userDetail);
		String page = "";
		if(userDetail != null && type.equals("view") && userDetail.get(0).getUserNo() == userNo) {
			page = "viewAcademy/commonMenu/viewUserInfo.jsp";
			request.setAttribute("userDetail", userDetail);
		} else if(userDetail != null && type.equals("modify") && userDetail.get(0).getUserNo() == userNo) {
			page = "viewAcademy/commonMenu/updateUserInfo.jsp";
			request.setAttribute("userDetail", userDetail);
		} else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "userDetailFail");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
