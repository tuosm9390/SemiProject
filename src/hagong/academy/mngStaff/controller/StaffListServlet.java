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
import hagong.academy.mngStaff.model.vo.PageInfo;

@WebServlet("/alist.staff")
public class StaffListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public StaffListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int curPage, limit, btnCnt, maxPage, startPage, endPage;
		
		curPage = 1;
		if(request.getParameter("page") != null) {
			curPage = Integer.parseInt(request.getParameter("page"));
		}
		
		limit = 10; btnCnt = 5;
		int listCnt = new StaffService().countStaff();
		maxPage = (int) ((double) listCnt / limit + 0.9);
		startPage = (((int) ((double) curPage / btnCnt + 0.8)) - 1) * btnCnt + 1; 
		endPage = startPage + btnCnt - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCnt, limit, btnCnt, curPage, maxPage, startPage, endPage);
		String how = request.getParameter("how");
		
		ArrayList<Staff> staffList = null;
		if(how.equals("uName")) {
			staffList = new StaffService().staffList(curPage, limit);
		} else if(how.equals("uId")) {
			staffList = new StaffService().staffListById(curPage, limit);
		} else if(how.equals("subject")) {
			staffList = new StaffService().staffListBySub(curPage, limit);
		} else if(how.equals("inDay")) {
			staffList = new StaffService().staffListByDay(curPage, limit);
		}
		
		String page = "";
		if(staffList != null) {
			page = "viewAcademy/mngStaff/staffList.jsp";
			request.setAttribute("staffList", staffList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("selectedFilter", how);
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
