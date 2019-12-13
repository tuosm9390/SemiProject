package hagong.academy.commonMenu.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.notice.model.service.NoticeService;
import hagong.academy.commonMenu.notice.model.vo.Notice;

/**
 * Servlet implementation class SelectOneNoticeList
 */
@WebServlet("/aselectone.no")
public class SelectOneNoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneNoticeList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		Notice n = new NoticeService().selectOne(num);
		
		String page = "";
		
		if(n != null) {
			page = "/viewAcademy/commonMenu/noticeDetail.jsp";
			request.setAttribute("n", n);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패!");
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




















