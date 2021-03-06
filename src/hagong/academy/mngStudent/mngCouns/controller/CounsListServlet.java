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
import hagong.academy.mngStudent.mngCouns.model.vo.PageInfo;

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
		//검색관련 값 받아오기
		String searchCondition = request.getParameter("searchCondition");
		String srchCnt = request.getParameter("srchCnt");

		
		
		//System.out.println("접속 테스트");
		
		//전체 학생들의 정보를 상담정보와 같이 어레이리스트에 담아 저장
		ArrayList<MemberCouns> counsList = null;
		if((searchCondition == null || srchCnt == null) || (searchCondition.equals("null") || srchCnt.equals("null"))) {
			//전체 학생조회
			counsList = new CounselingService().counsList();			
		}else {
			//검색할 학생 조회
			counsList = new CounselingService().srchList(searchCondition, srchCnt);
		}
		
		//System.out.println(counsList);
		//상담횟수 받아서 저장
		ArrayList<MemberCouns> counsCountList = new CounselingService().selectCount(counsList);
		
		//System.out.println(counsCountList);
		
		//최근 상담일자 받아서 저장
		ArrayList<MemberCouns> allCounsList = new CounselingService().selectRecentDate(counsCountList);
		
		//최종적으로 넘겨줄 상담학생 정보
		allCounsList = new CounselingService().selectUserInfo(allCounsList);
		
		//System.out.println(allCounsList);
		
		//----------------------------------------------------------------------------------------------------
		
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
		int listCount = counsList.size();
		//총 페이지 수 계산
		//예를들면 목록 수가 126개이면 페이지는 13페이지가 필요함
		//짜투리 목록이 최소 1개일 때, 1페이지가 추가되는 로직 작성
		maxPage = (int) ((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여 줄 시작 페이지 수 (10개씩 보여지게 할 경우)
		//아래 쪽 페이지 수가 10개씩 보여지게 한다면
		//1, 11, 21, 31...
		startPage = (((int)((double) currentPage / 5 + 0.8)) - 1) * 5 + 1;
		//startPage = currentPage;
		
		//목록 아래 쪽에 보여질 마지막 페이지 수 
		endPage = startPage + 5 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지 정보를 담을 vo 객체 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		//페이징 처리를 완료한 최종적으로 전달할 학생정보
		ArrayList<MemberCouns> pagingCounsList = new ArrayList<MemberCouns>();
		
		
		
		for(int i = startRow-1; i < endRow; i++) {
			if(i >= allCounsList.size()) {
				break;
			}else {
				pagingCounsList.add(allCounsList.get(i));		
			}
			
		}
		
		//----------------------------------------------------------------------------------------------------

		//성공 실패 실행  작성
		String page = "";
		if(allCounsList != null) {
			page = "viewAcademy/mngStudent/mngCouns/counsList.jsp";
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("srchCnt", srchCnt);
			request.setAttribute("pi", pi);
			request.setAttribute("allCounsList", pagingCounsList);
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
