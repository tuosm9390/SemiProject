package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Classroom;

@WebServlet("/ainsertClr.class")
public class InsertClassroomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertClassroomServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clrName = request.getParameter("clrName");
		String capacity = request.getParameter("capacity");
		
		Classroom cr = new Classroom();
		cr.setClrName(clrName);
		cr.setCapacity(Integer.parseInt(capacity));
		
		int result = new ClassService().insertClassroom(cr);
		
		response.getWriter().print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
