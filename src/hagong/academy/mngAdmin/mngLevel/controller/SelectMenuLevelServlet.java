package hagong.academy.mngAdmin.mngLevel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngAdmin.mngLevel.model.service.MngLevelService;
import hagong.academy.mngAdmin.mngLevel.model.vo.MngLevel;

/**
 * Servlet implementation class SelectMenuLevelServlet
 */
@WebServlet("/aselect.level")
public class SelectMenuLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMenuLevelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<MngLevel> list = new ArrayList<MngLevel>();
		
		list =	new MngLevelService().selectMngLevel();
		
		String page = "";
		
		if(list != null) {
			page = "viewAcademy/main.jsp";
			
			request.getSession().setAttribute("list", list);
			
		}else {
			page = "/hagong/viewAcademy/common/commonError.jsp";
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
