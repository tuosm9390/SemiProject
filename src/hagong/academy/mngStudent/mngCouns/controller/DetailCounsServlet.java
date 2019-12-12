package hagong.academy.mngStudent.mngCouns.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngCouns.model.service.CounselingService;
import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

/**
 * Servlet implementation class DetailCounsServlet
 */
@WebServlet("/detail.couns")
public class DetailCounsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailCounsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전달 값 확인
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		//상담일지값 가져오기
		ArrayList<MemberCouns> detailCounsList = new CounselingService().detailCouns(userNo);
		
		
		String page = "";
		if(detailCounsList != null) {
			page = "viewAcademy/mngStudent/mngCouns/counsDetail.jsp";
			request.setAttribute("detailCounsList", detailCounsList);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "상담일지조회실패!");
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
