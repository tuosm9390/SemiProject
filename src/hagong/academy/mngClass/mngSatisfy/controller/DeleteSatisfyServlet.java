package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;

/**
 * Servlet implementation class DeleteSatisfyServlet
 */
@WebServlet("/adelete.satis")
public class DeleteSatisfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSatisfyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int satNo = Integer.parseInt(request.getParameter("satNo"));
		
		int result = new SatisfyService().deleteSatis(satNo);

		String page = "";
		if(result > 0) {
			page = "alist.satis";
			response.sendRedirect(page);
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "deleteSatisfyFail");
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
