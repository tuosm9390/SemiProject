package hagong.academy.mngClass.mngCS.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngCS.model.service.CSService;
import hagong.academy.mngClass.mngCS.model.vo.CSStudent;

/**
 * Servlet implementation class DetailCSStudentServlet
 */
@WebServlet("/adetail.cs")
public class DetailCSStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailCSStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clsNo = Integer.parseInt(request.getParameter("clsNo"));
		
		HashMap<String, Object> hmap = new CSService().detailCSStudent(clsNo);
		ArrayList<CSStudent> allStudent = new CSService().allStudent(clsNo);
		

		
		String page = "";
		if(hmap != null) {
			ArrayList<CSStudent> csslist = (ArrayList<CSStudent>) hmap.get("csslist");
			CSStudent csInfo = (CSStudent) hmap.get("csInfo");
			
			page = "viewAcademy/mngClass/mngCS/enrollCS.jsp";
			request.setAttribute("allStudent", allStudent);
			request.setAttribute("csslist", csslist);
			request.setAttribute("csInfo", csInfo);
		}else {
			page = "viewAcademy.common/commonError.jsp";
			request.setAttribute("msg", "수강생등록 상세페이지 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
