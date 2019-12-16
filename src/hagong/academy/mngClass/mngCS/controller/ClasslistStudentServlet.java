package hagong.academy.mngClass.mngCS.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngCS.model.service.CSService;
import hagong.academy.mngClass.mngCS.model.vo.CS;
import hagong.academy.mngStudent.mngBlack.model.service.BlacklistService;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
import hagong.academy.mngStudent.mngCouns.model.vo.PageInfo;

/**
 * Servlet implementation class ClasslistStudentServlet
 */
@WebServlet("/alist.cs")
public class ClasslistStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClasslistStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//페이징 처리 후
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표시될 페이지의 시작할 페이지
		int endPage;		//한 번에 표시될 페이지의 마지막 페이지
		
		//게시판은 1페이지부터 시작함
		currentPage = 1;
		
		//전달받은 페이지 추출
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;

		
		//전체 목록 갯수 조회
		int listCount = new BlacklistService().listCount();
		
		//System.out.println("listCount : " + listCount);
				
		//		System.out.println("listCount : " + listCount);
		
		//총 페이지 수 계산
		//예를들면 목록 수가 126개이면 페이지는 13페이지가 필요함
		//짜투리 목록이 최소 1개일 때, 1페이지가 추가되는 로직 작성
		maxPage = (int) ((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여 줄 시작 페이지 수 (10개씩 보여지게 할 경우)
		//아래 쪽 페이지 수가 10개씩 보여지게 한다면
		//1, 11, 21, 31...
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		//목록 아래 쪽에 보여질 마지막 페이지 수 
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지 정보를 담을 vo 객체 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		//검색 결과값 받아오기
		//검색관련 값 받아오기
		String searchCondition = request.getParameter("searchCondition");
		String srchCnt = request.getParameter("searchStudent");
		
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("srchCnt : " + srchCnt);
		
		//검색기능인지 아닌지 판별하여 값가져오기
		ArrayList<CS> cslist = null;
		if((searchCondition == null || srchCnt == null) || (searchCondition.equals("null") || srchCnt.equals("null"))) {
			 cslist = new CSService().selectCSlistWithPaging(currentPage, limit);			
		}else {
			//cslist = new BlacklistService().searchBlacklistWithPaging(currentPage, limit, searchCondition, srchCnt);			
		}
		
		
		String page = "";
		if(cslist != null) {
			page = "viewAcademy/mngClass/mngCS/CSlist.jsp";
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("srchCnt", srchCnt);
			request.setAttribute("cslist", cslist);
			request.setAttribute("pi", pi);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "수강생등록 강좌정보 조회 실패");
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
