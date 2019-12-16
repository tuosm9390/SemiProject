package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

/**
 * Servlet implementation class SatisfyListServlet
 */
@WebServlet("/alist.satis")
public class SatisfyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SatisfyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SatisfyInfo> list = new SatisfyService().selectList();
		
		String page = "";
		if(list != null) {
			page = "/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "selectSatisfyListFail");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
