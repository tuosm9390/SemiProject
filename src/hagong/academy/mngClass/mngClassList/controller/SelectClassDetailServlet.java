package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Class;


@WebServlet("/adetail.class")
public class SelectClassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectClassDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clsNo = request.getParameter("num");
		System.out.println("clsNo : " + clsNo);
		
		Class classDetail = new ClassService().selectOneClass(clsNo);
		
		System.out.println("classDetail : " + classDetail);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(classDetail, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
