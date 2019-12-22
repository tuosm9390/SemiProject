package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Class;

@WebServlet("/ainsert.class")
public class InsertClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertClassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("selectSubject");
		String teacher = request.getParameter("selectTeacher");
		String classTitle = request.getParameter("classTitle");
		String clsStudent = request.getParameter("selectStudent");
		String numOfClass = request.getParameter("numOfClass"); 
		String s = request.getParameter("startDate"); 
		String e = request.getParameter("endDate"); 
		String[] dayArr = request.getParameterValues("day"); 
		String day = "";
		for(int k=0; k<dayArr.length; k++) {
			if(k != dayArr.length-1) {
				day += dayArr[k] + ",";
			}else {
				day += dayArr[k];
			}
		}
		String classroom = request.getParameter("classroom");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String tuition = request.getParameter("money");
		String cntOfClass = request.getParameter("cntOfClass");
		
		java.sql.Date startDate=java.sql.Date.valueOf(s);
		java.sql.Date endDate=java.sql.Date.valueOf(e);
		String classTime = startTime + "~" + endTime;
		
		Class c = new Class();
		c.setSubId(subject);
		c.setUserNo(Integer.parseInt(teacher));
		c.setClsName(classTitle);
		c.setClsStudent(clsStudent);
		c.setClsMax(Integer.parseInt(numOfClass));
		c.setClsStart(startDate);
		c.setClsEnd(endDate);
		c.setClsDay(day);
		c.setClrNo(Integer.parseInt(classroom));
		c.setClsTime(classTime);
		c.setTuition(Integer.parseInt(tuition));
		c.setCntOfClass(Integer.parseInt(cntOfClass));
		
		int result = new ClassService().insertClass(c);
		
		String page = "";
		if(result > 0) {
			page = "alistClassList.class";
			response.sendRedirect(page);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "insertClassFailed");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request, response);
	}

}
