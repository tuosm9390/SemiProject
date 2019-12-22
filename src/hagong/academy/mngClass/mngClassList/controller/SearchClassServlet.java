package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.vo.Class;
import hagong.academy.mngStudent.mngCouns.model.vo.PageInfo;
import hagong.academy.mngClass.mngClassList.model.service.ClassService;

@WebServlet(name = "SearchClassServlet2", urlPatterns = { "/searchClass.class" })
public class SearchClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String selectCondition = request.getParameter("selectCondition");
		String searchWord = request.getParameter("searchWord");
		
		ArrayList<Class> list = new ClassService().searchClass(selectCondition, searchWord);
		System.out.println("SearchClassList의 list : " + list);
		
		String page = "";
		if(list != null) {
			page = "/viewAcademy/mngClass/mngClassList/classList.jsp";
			request.setAttribute("list", list);
		}else {
			System.out.println("검색어로 강좌 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
