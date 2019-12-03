package hagong.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper{

	public LoginWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		
		if(key != null && key.equals("userPwd")) {	//문자열 비교 시 앞에 꼭 null이 아니면서 라는 조건을 넣어줘야 함(&&는 뒤에꺼는 실행 안하니까)
			
			value = getSha512(super.getParameter("userPwd")); //key가 userPwd일 때 암호화.
		
		}else {
			
			value = super.getParameter(key); //원래 가지고 있는 값을 리턴하라
		
		}
		
		return value;
	}
	
	//암호화 해주는 메소드
	public static String getSha512(String pwd) {
		String encPwd = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512"); 
			//Digest = 평문을 가지고 암호화를 했을 때 암호화가 된 문장을 부르는 명칭
			//SHA-512 : 단방향 해쉬 암호화 알고리즘 방식
			
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			//생성된 암호화 문장(byte배열) 을 String으로 바꿔주어, 그걸 문자열 방식으로 리턴하는거 (64방식)^^ 뭔말인지 모르겠삼
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPwd;
	}

}
