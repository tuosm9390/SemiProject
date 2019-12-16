package hagong.academy.mngStudent.mngBlack.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngCouns.model.service.CounselingService;

/**
 * Servlet implementation class DeleteBlacklistServlet
 */
@WebServlet("/deletedetail.black")
public class DeleteBlacklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBlacklistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int couNo = Integer.parseInt(request.getParameter("couNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));

		
		int result = new CounselingService().deleteCouns(couNo);
		
		
		String page = "";
		if(result > 0 ) {
			page = request.getContextPath() + "/detail.black?num=" + userNo;
			response.sendRedirect(page);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "블랙리스트 삭제 실패!");
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
