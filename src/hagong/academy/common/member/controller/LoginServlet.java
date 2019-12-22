package hagong.academy.common.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.common.member.model.service.MemberService;
import hagong.academy.common.member.model.vo.Member;

@WebServlet("/login.cm")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		
		System.out.println("password : " + password);
		
		if(!password.equals("xgAdWyrD3zFCBKj516AOFQPJq6D9RThkXeS/TMfiVVz+n/nQI2vzJ+0+kHhJqY300zDEvqVRAX1GW0wdm4C8sA==")) {
			//최초 로그인이 아닐 때
			System.out.println("최초로그인 아님..");
			Member requestMember = new Member();
			requestMember.setUserId(userId);
			requestMember.setUserPwd(password);
			
			Member loginUser = new MemberService().loginCheck(requestMember);
			
			System.out.println(loginUser);
			
			String page = "";
			
			if(loginUser != null) {
				request.getSession().setAttribute("loginUser", loginUser);
				response.sendRedirect(request.getContextPath()+"/viewAcademy/main.jsp");
			}else {
				page = "viewAcademy/common/commonError.jsp";
				request.setAttribute("errorCode", "loginFail");
				request.getRequestDispatcher(page).forward(request, response);
			}
			
		}else {		
			Member requestMember = new Member();
			requestMember.setUserId(userId);
			requestMember.setUserPwd(password);
			
			Member loginUser = new MemberService().loginCheck(requestMember);
			System.out.println(loginUser.getPhone());
			String page = "";
			
			if(loginUser != null) {
				request.setAttribute("loginUser", loginUser);
				page = "viewAcademy/common/newPwd1.jsp";
			}else {
				page = "viewAcademy/common/commonError.jsp";
				request.setAttribute("errorCode", "loginFail");			
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
