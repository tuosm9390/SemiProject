package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;
import hagong.academy.mngClass.mngAttend.model.vo.ClassSubject;

@WebServlet("/searchClass.attend")
public class SearchClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchClassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectCondition = request.getParameter("selectCondition");
		String searchWord = request.getParameter("searchWord");
		
		System.out.println(selectCondition + ", " + searchWord);
		
		ArrayList<ClassSubject> list = new AttendService().searchClass(selectCondition, searchWord);
		
		String page = "";
		if(list != null) {
			page = "/viewAcademy/mngClass/mngAttend/attendList.jsp";
			request.setAttribute("list", list);
		}else {
			System.out.println("검색어로 강좌 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
