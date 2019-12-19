package hagong.client.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngClassList.model.vo.Class;
import hagong.client.common.model.service.CommonService;

@WebServlet("/clistClass.cm")
public class SelectClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
		
		ArrayList<Class> list = new CommonService().selectClass(userNo);
		
		System.out.println(list);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
