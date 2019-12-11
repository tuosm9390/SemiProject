package hagong.academy.common.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.common.member.model.service.IdService;

@WebServlet("/idCheck.cm")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		int result = new IdService().idCheck(userId);
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.append("fail");
		} else {
			out.append("success");
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
