package hagong.academy.commonMenu.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.notice.model.service.NoticeService;

/**
 * Servlet implementation class DeleteNoticeServlet
 */
@WebServlet("/adelete.no")
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nno = request.getParameter("nno");
		
		
		System.out.println("nno" + nno);
		
		int result = new NoticeService().deleteNotice(nno);
		
		
		
		String page = "";
		if(result > 0) {
			System.out.println("success");
			response.sendRedirect("/hagong/alist.no?currentPage=1");
		}else {
			//page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


















