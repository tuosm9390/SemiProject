package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;

@WebServlet("/adeleteClassroom.class")
public class DeleteClassroomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteClassroomServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deleteClr = request.getParameter("deleteClr");
		
		int result = new ClassService().deleteClassroom(deleteClr);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
