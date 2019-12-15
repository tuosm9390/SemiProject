package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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
		
		JSONObject result = new JSONObject();

		result.put("clsNo", classDetail.getClsNo());
		result.put("subName", URLEncoder.encode(classDetail.getSubName(), "UTF-8"));
		result.put("clsName", URLEncoder.encode(classDetail.getClsName(), "UTF-8"));
		result.put("name", URLEncoder.encode(classDetail.getName(), "UTF-8"));
		result.put("clsStudent", URLEncoder.encode(classDetail.getClsStudent(), "UTF-8"));
		result.put("clsMax", classDetail.getClsMax());
		result.put("clsStart", classDetail.getClsStart());
		result.put("clsEnd", classDetail.getClsEnd());
		result.put("clsTime", URLEncoder.encode(classDetail.getClsTime(), "UTF-8"));
		result.put("tuition", classDetail.getTuition());
		
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
