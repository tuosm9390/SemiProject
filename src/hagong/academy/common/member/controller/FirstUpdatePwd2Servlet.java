package hagong.academy.common.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hagong.academy.common.member.model.service.MemberService;
import hagong.academy.common.member.model.vo.Member;

@WebServlet("/firstUpdate2.cm")
public class FirstUpdatePwd2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FirstUpdatePwd2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		Member changePwdMember = new Member();
		changePwdMember.setUserId(userId);
		changePwdMember.setUserPwd(userPwd);
		
		int change = new MemberService().changePwd(changePwdMember);
		System.out.println("change : " + change);
		String page = "";
		if(change > 0) {
			JSONObject result = new JSONObject(); 
			
			result.put("changeResult", change);
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			out.print(result.toJSONString());
			
			out.flush();
			out.close();
			
		}else {
			page = "/viewAcademy/common/commonError.jsp";
			request.setAttribute("errorCode", "pwdUpdateFail");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
