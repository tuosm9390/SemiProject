package hagong.academy.commonMenu.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.commonMenu.info.model.service.UserService;

@WebServlet("/acheck.ps")
public class CheckPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckPwdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestPwd = request.getParameter("userPwd");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userPwd = new UserService().checkPwd(userNo);
		
		if(requestPwd.equals(userPwd)) {
			response.getWriter().print("success");
		} else {
			response.getWriter().print("fail");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
