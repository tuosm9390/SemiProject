package hagong.academy.mngClass.mngClassList.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.service.ClassService;
import hagong.academy.mngClass.mngClassList.model.vo.Class;

@WebServlet("/aupdate.class")
public class UpdateClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clsNo = request.getParameter("hidden");
		String classTitle = request.getParameter("classTitle"); System.out.println("classTitle : " + classTitle);
		String numOfClass = request.getParameter("numOfClass"); System.out.println("numOfClass : " + numOfClass);
		String classroom = request.getParameter("classroom"); System.out.println("classroom : " + classroom);
		String tuition = request.getParameter("money"); System.out.println("tuition : " + tuition);
		String cntOfClass = request.getParameter("cntOfClass");
		
		Class c = new Class();
		
		c.setClsNo(Integer.parseInt(clsNo));
		c.setClsName(classTitle);
		c.setClsMax(Integer.parseInt(numOfClass));
		c.setClrNo(Integer.parseInt(classroom));
		c.setTuition(Integer.parseInt(tuition));
		c.setCntOfClass(Integer.parseInt(cntOfClass));
		
		int result = new ClassService().updateClass(c);
		
		String page = "";
		if(result > 0) {
			System.out.println("성공");
			page = "alistClassList.class";
			response.sendRedirect(page);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "updateClassFailed");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
