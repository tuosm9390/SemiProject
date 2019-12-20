package hagong.academy.commonMenu.notice.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.commonMenu.notice.model.service.NoticeService;
import hagong.academy.commonMenu.notice.model.vo.Notice;
 
/**
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet("/ainsert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		int writer = Integer.parseInt(request.getParameter("writer"));
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		
		System.out.println(title);

		System.out.println(writer);

		System.out.println(date);

		System.out.println(content);

		
		Date day = null;
		
		day = java.sql.Date.valueOf(date);
		
		System.out.println(day);
		
		Notice n = new Notice();
		n.setnTitle(title);
		n.setnAuthor(writer);
		n.setnDate(day);
		n.setnContent(content);
		
		int result = new NoticeService().insertNotice(n);
		
		String page = "";
		if(result > 0) {
			page = "alist.no";
			response.sendRedirect(page);
		}else {
			//page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패");
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













