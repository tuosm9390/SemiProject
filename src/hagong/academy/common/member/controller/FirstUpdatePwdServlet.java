package hagong.academy.common.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hagong.academy.common.member.model.service.MemberService;
import hagong.academy.common.member.model.vo.Member;

/**
 * Servlet implementation class FirstUpdatePwdServlet
 */
@WebServlet("/firstUpdate.cm")
public class FirstUpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstUpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setUserId(userId);
		m.setEmail(email);
		
		Member requestMember = new MemberService().loginCheck2(m);
		
		//mail server 설정
		String host = "smtp.naver.com";
		String user = "ansfls@naver.com";
		String password = "";
		
		//메일 받을 주소
		String to_email = requestMember.getEmail();
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		
		//인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i=0; i<10; i++) {
			int rIndex = rnd.nextInt(3);
			switch(rIndex) {
			case 0 : temp.append((char) ((int) (rnd.nextInt(26)) + 97)); break;
			case 1 : temp.append((char) ((int) (rnd.nextInt(26)) + 65)); break;
			case 2 : temp.append((rnd.nextInt(10))); break;
			}
		}
		String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        //email 전송
        try {
        	MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "HAGONG"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
		
			//메일 제목
            msg.setSubject("안녕하세요 하공 인증 메일입니다.");
            //메일 내용
            msg.setText("인증 번호는 : "+ temp + "입니다.");
            
            Transport.send(msg);
            System.out.println("이메일 전송");
        
        } catch (MessagingException e) {
			e.printStackTrace();
		}
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
        //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
        request.setAttribute("id", userId);
        request.getRequestDispatcher("/viewAcademy/common/newPwd1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
