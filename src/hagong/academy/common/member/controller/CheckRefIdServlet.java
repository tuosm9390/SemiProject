package hagong.academy.common.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.common.member.model.service.IdService;
import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;

@WebServlet("/refIdCheck.cm")
public class CheckRefIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckRefIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refId = request.getParameter("refId");
		
		int check = new IdService().refIdCheck(refId);
		//부모타입의 아이디가 있을 때
		if(check > 0) {
			ArrayList<Student> list = new StudentService().refIdCheck(refId, check);
			System.out.println("list : " + list);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		} else {
			//아이디가 없거나 다른 타입의 아이디가 존재 할 때
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(check, response.getWriter());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
