package hagong.academy.mngStudent.mngBlack.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngStudent.mngBlack.model.service.BlacklistService;
import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

/**
 * Servlet implementation class SelectDetailListServlet
 */
@WebServlet("/selectOne.black")
public class SelectDetailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDetailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status = Integer.parseInt(request.getParameter("status"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		System.out.println("status : " + status);
		System.out.println("userNo : " + userNo);
		
		ArrayList<MemberCouns> detailBlacklist = new BlacklistService().selectOneBlacklist(userNo);
		
		MemberCouns detailOne = new MemberCouns();
		
		detailOne = detailBlacklist.get(status);
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		new Gson().toJson(detailOne, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
