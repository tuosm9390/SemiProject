package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;

/**
 * Servlet implementation class SatisfyResult
 */
@WebServlet("/aresult.satis")
public class SatisfyResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SatisfyResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int satNo = Integer.parseInt(request.getParameter("satNo"));
		System.out.println(satNo);
		
		ArrayList<HashMap<String, Object>> list = new SatisfyService().selectSatis(satNo);
		System.out.println("list : " + list);
		
		String page = "";
		if(list != null) {
			page = "viewAcademy/mngClass/mngSatisfy/satisfactionResult.jsp";
			request.setAttribute("list", list);
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "selectSatisfyResultFail");
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
