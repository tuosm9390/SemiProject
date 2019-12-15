package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Class;

@WebServlet("/alistClassList.class")
public class SelectClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectClassListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Class> list = new ClassService().selectClassList();
		
		String page = "";
		if(list != null) {
			page = "viewAcademy/mngClass/mngClassList/classList.jsp";
			request.setAttribute("list", list);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "selectClassListFailed");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
