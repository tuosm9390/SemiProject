package hagong.academy.commonMenu.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.notice.model.service.NoticeService;
import hagong.academy.commonMenu.notice.model.vo.Notice;
import hagong.academy.commonMenu.notice.model.vo.PageInfo;

/**
 * Servlet implementation class SelectNoticeListServlet
 */
@WebServlet("/alist.no")
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이징 처리 전
		
		//페이징 처리 후
		int currentPage;	//현재 페이지
		int limit;			//한 페이지에 몇 개 게시
		int maxPage;		//전체 마지막 페이지
		int startPage;		//시작 페이지
		int endPage;		//마지막 페이지
		
		//1페이지 부터 시작
		currentPage = 1;
		
		//전달 받은 페이지
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 몇개 목록
		limit = 10;
		
		//전체 목록 갯수 조회
		int listCount = new NoticeService().getListCount();
		
		System.out.println("listCount : " + listCount);
		
		//총 페이지 수 계산
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		//몇개 페이지 보여줌 (5개)
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 5 + 1;
		
		//마지막 페이지 수
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지 정보 담을 vo 객체 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Notice> list = new NoticeService().selectListWithPaging(currentPage, limit);
		
		String page = "";
		
		if(list != null) {
			page = "/viewAcademy/commonMenu/noticeList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "viewAcademy/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회 실패!");
		}
		
		System.out.println(list);
		
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











