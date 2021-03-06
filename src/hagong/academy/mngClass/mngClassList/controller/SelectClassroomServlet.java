package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Classroom;

@WebServlet("/alistClr.class")
public class SelectClassroomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectClassroomServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Classroom> list = new ClassService().selectClassroom();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
