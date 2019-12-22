package hagong.academy.mngStudent.mngInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;

/**
 * Servlet implementation class SearchScoreServlet
 */
@WebServlet("/searchscore.info")
public class SearchScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchScoreServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("condition");
		String op = request.getParameter("op");
		String userId = request.getParameter("userId");
		
		ArrayList<Student> list = null;
		JSONArray result = new JSONArray();
		JSONObject scoreList = null;
		
		if(condition.equals("0")) {
			list = new StudentService().searchAllScore(userId);
			
			for(Student s : list) {
				scoreList = new JSONObject();
				scoreList.put("ROW_NUM", s.getScoreNo());
				scoreList.put("SCO_TYPE", URLEncoder.encode(s.getScoType(), "UTF-8"));
				scoreList.put("YEAR", s.getYear());
				scoreList.put("TERM", s.getTerm());
				scoreList.put("SUB_ID", URLEncoder.encode(s.getSubName(), "UTF-8"));
				scoreList.put("SCORE", s.getSubscore());
				
				result.add(scoreList);
			}
		} else {
			list = new StudentService().searchScore(condition, op, userId);
			
			for(Student s : list) {	
				scoreList = new JSONObject();
				scoreList.put("ROW_NUM", s.getScoreNo());
				scoreList.put("SCO_TYPE", URLEncoder.encode(s.getScoType(), "UTF-8"));
				scoreList.put("YEAR", s.getYear());
				scoreList.put("TERM", s.getTerm());
				scoreList.put("SUB_ID", URLEncoder.encode(s.getSubName(), "UTF-8"));
				scoreList.put("SCORE", s.getSubscore());
				
				result.add(scoreList);
			}
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
