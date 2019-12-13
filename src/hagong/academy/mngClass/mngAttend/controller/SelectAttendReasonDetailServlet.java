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

@WebServlet("/aselectAttendReasonDetail.attend")
public class SelectAttendReasonDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAttendReasonDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classNum = request.getParameter("classNum");
		String date = request.getParameter("date");
		String userNo = request.getParameter("userNo");
		
		String reason = new AttendService().selectAttendReason(classNum, date, userNo);  
		
		JSONObject result = new JSONObject();
		
		result.put("reason", URLEncoder.encode(reason, "UTF-8"));		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		out.print(result.toJSONString());
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
