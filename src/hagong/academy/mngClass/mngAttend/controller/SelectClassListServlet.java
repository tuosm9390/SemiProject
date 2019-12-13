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

@WebServlet("/classlist.attend")
public class SelectClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectClassListServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ClassSubject> list = new ArrayList<ClassSubject>();
		
		list = new AttendService().selectClassList();
		
		String page = "";
		if(list != null) {
			page = "/viewAcademy/mngClass/mngAttend/attendList.jsp";   
			request.setAttribute("list", list);
		}else {
			System.out.println("강좌 리스트 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
