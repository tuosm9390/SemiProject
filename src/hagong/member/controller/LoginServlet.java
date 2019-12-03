package hagong.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.member.model.service.MemberService;
import hagong.member.model.vo.Member;
import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class LoginServlet
 */
@Log4j2
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		log.debug("memberId : " + memberId + ", password : " + password);
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPwd(password);
		
		Member loginMember = new MemberService().loginCheck(m);
	
		String page = "";
		
		if(loginMember != null) {
			request.getSession().setAttribute("loginMember", loginMember);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else {
			System.out.println("로그인 실패!");
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
