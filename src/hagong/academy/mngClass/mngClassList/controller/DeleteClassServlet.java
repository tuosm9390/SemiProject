package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;

@WebServlet("/adelete.class")
public class DeleteClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteClassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clsNo = request.getParameter("num");
		
		int result = new ClassService().deleteClass(clsNo);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
