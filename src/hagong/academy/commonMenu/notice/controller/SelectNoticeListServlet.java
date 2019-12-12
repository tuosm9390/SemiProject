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
		ArrayList<Notice> list = new NoticeService().selectList();
		
		String page = "";
		
		if(list != null) {
			page = "/viewAcademy/commonMenu/noticeList.jsp";
			request.setAttribute("list", list);
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
