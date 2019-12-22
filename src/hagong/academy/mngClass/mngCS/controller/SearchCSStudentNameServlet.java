package hagong.academy.mngClass.mngCS.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngClass.mngCS.model.service.CSService;
import hagong.academy.mngClass.mngCS.model.vo.CSStudent;

/**
 * Servlet implementation class SearchCSStudentNameServlet
 */
@WebServlet("/srchName.cs")
public class SearchCSStudentNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCSStudentNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int clsNo = Integer.parseInt(request.getParameter("clsNo"));
		ArrayList<CSStudent> srchStu = new CSService().srchByName2(name, clsNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		new Gson().toJson(srchStu, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
