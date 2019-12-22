package hagong.academy.mngAdmin.mngStatus.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import hagong.academy.mngAdmin.mngStatus.model.service.MngStatusService;
import hagong.academy.mngAdmin.mngStatus.model.vo.MngStatus;

/**
 * Servlet implementation class SelectMngStatusServlet
 */
@WebServlet("/adetail.status")
public class SelectMngStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMngStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		ArrayList<MngStatus> list = new ArrayList<>();
		
		list = new MngStatusService().selectList();
		
		String page ="";
		
	
	
		

		if(list != null) {
			page = "viewAcademy/mngAdmin/mngStatus/viewStatus.jsp";
			request.getSession().setAttribute("list", list); 
			response.sendRedirect(page);
		}else {
			page = "/hagong/viewAcademy/common/commonError.jsp";
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
