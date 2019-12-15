package hagong.academy.mngAdmin.mngLevel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngAdmin.mngLevel.model.service.MngLevelService;

/**
 * Servlet implementation class UpdateDefaultMenuLevelServlet
 */
@WebServlet("/aupdateDefault.level")
public class UpdateDefaultMenuLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDefaultMenuLevelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = new MngLevelService().updateDefaultMngLevel();
		
		String page = "";
		
		if(result > 0 ) {
			page = "aselect.level";
			response.sendRedirect(page);
			
		}else {
			page = "errorPage.jsp";
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
