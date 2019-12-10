package hagong.academy.mngClass.mngCS.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngCS.model.service.CounselingService;
import hagong.academy.mngClass.mngCS.model.vo.MemberCouns;

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
		
		//상담관련 학생들의 정보를 어레이리스트에 담아 저장
		ArrayList<MemberCouns> counsList = new CounselingService().counsList();
		
		//성공 실패 실행  작성
		String page = "";
		if(counsList != null) {
			page = "viewAcademy/mngClass/mngCS/CSlist.jsp";
			request.setAttribute("counsList", counsList);
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
