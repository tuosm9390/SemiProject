package hagong.academy.mngClass.mngCS.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngCS.model.service.CSService;

/**
 * Servlet implementation class InsertClassStudentServlet
 */
@WebServlet("/insert.cs")
public class InsertClassStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertClassStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stuArr = request.getParameter("stuArr");
		String stuAll = request.getParameter("stuAll");
		int clsNo = Integer.parseInt(request.getParameter("clsNo"));
		int resultInsert = 0;
		int resultDelete = 0;
		
		if(!stuArr.equals("first")) {
			String[] stuArr2 = stuArr.split(",");
			int[] stuNo = new int[stuArr2.length];
			for(int i = 0; i < stuArr2.length; i++) {
				stuNo[i] = Integer.parseInt(stuArr2[i]);
			}
			resultInsert = new CSService().insertCS(clsNo, stuNo);
			if(resultInsert > 0) {
				resultDelete = 1;				
			}
		}
		if(!stuAll.equals("second")) {
			String[] stuAll2 = stuAll.split(",");
			int[] stuAllNo = new int[stuAll2.length];
			
			for(int i = 0; i < stuAll2.length; i++) {
				stuAllNo[i] = Integer.parseInt(stuAll2[i]);
			}			
			resultDelete = new CSService().deleteCS(clsNo, stuAllNo);
			if(resultDelete > 0) {
				resultInsert = 1;				
			}
		}
		
		
		
		int result = 0;
		
		if(resultInsert > 0 && resultDelete > 0) {
			result = 1;
		}
		
		String page = "";
		if(result > 0) {
			page = request.getContextPath() + "/adetail.cs?clsNo=" + clsNo;
			response.sendRedirect(page);
		}else {
			System.out.println("에러발생...");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
