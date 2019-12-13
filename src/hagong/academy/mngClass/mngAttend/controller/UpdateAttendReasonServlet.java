package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;

/**
 * Servlet implementation class UpdateAttendReasonServlet
 */
@WebServlet("/aupdateAttendReason.attend")
public class UpdateAttendReasonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAttendReasonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String userNo = request.getParameter("userNo");
		
		int result = new AttendService().updateAttendReason(date, userNo);
		
		/*
		 * JSONObject result = new JSONObject();
		 * 
		 * result.put("reason", URLEncoder.encode(reason, "UTF-8"));
		 * 
		 * response.setContentType("application/json"); PrintWriter out =
		 * response.getWriter();
		 * 
		 * out.print(result.toJSONString());
		 * 
		 * out.flush(); out.close();
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
