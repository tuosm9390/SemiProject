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
 * Servlet implementation class CounsListServlet
 */
@WebServlet("/alist.couns")
public class CounsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("접속 테스트");
		
		//전체 학생들의 정보를 상담정보와 같이 어레이리스트에 담아 저장
		ArrayList<MemberCouns> counsList = new CounselingService().counsList();
		
		System.out.println(counsList);
		
		ArrayList<MemberCouns> counsCountList = new CounselingService().selectCount(counsList);
		
		System.out.println(counsCountList);
		
		ArrayList<MemberCouns> allCounsList = new CounselingService().selectRecentDate(counsCountList);
		
		allCounsList = new CounselingService().selectUserInfo(allCounsList);
		
		System.out.println(allCounsList);
		
		//성공 실패 실행  작성
		String page = "";
		if(counsList != null) {
			page = "viewAcademy/mngStudent/mngCouns/counsList.jsp";
			
			request.setAttribute("allCounsList", allCounsList);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "삼담페이지 조회실패");
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
