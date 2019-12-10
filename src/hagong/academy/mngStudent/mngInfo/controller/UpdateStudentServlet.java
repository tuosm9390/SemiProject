package hagong.academy.mngStudent.mngInfo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;

/**
 * Servlet implementation class UpdateStudentServlet
 */
@WebServlet("/aupdate.info")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String birth = request.getParameter("birth");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + tel2 + tel3;								//전화번호
		String school = request.getParameter("school");					//학교
		int grade = Integer.parseInt(request.getParameter("grade"));	//학년
		String track = request.getParameter("track");					//계열
		int refUno = Integer.parseInt(request.getParameter("refUno"));	//학부모회원번호
		String refName = request.getParameter("refName");				//학부모이름
		String refId = request.getParameter("refId");					//학부모아이디
		String reftel1 = request.getParameter("reftel1");
		String reftel2 = request.getParameter("reftel2");
		String reftel3 = request.getParameter("reftel3");
		String refPhone = reftel1 + reftel2 + reftel3;					//학부모전화번호
		String college = request.getParameter("college");				//희망대학
		String major = request.getParameter("major");					//희망학과
		String address = request.getParameter("address");				//주소
		String email = request.getParameter("email");					//이메일
		
		Student s = new Student();
		
		s.setUserId(userId);
		s.setName(userName);
		s.setBirth(birth);
		s.setPhone(phone);
		s.setSchool(school);
		s.setGrade(grade);
		s.setTrack(track);
		s.setRefUno(refUno);
		s.setRefName(refName);
		s.setRefId(refId);
		s.setRefPhone(refPhone);
		s.setCollege(college);
		s.setMajor(major);
		s.setAddress(address);
		s.setEmail(email);
		
		int result = new StudentService().updateStudent(s);
		
		if(result > 0) {
			
		} else {
			
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
