package hagong.academy.mngStudent.mngInfo.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;

/**
 * Servlet implementation class InsertStudentServlet
 */
@WebServlet("/ainsert.info")
public class InsertStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");				//학생이름
		String userId = request.getParameter("userId");					//학생아이디
		String userPwd = request.getParameter("userPwd");				//학생비밀번호
		java.sql.Date birth = java.sql.Date.valueOf(request.getParameter("birth"));					//생년월일
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + tel2 + tel3;								//전화번호
		String address = request.getParameter("address");				//주소
		String email = request.getParameter("email");					//이메일
		String refUno = request.getParameter("refUno");
		String refName = request.getParameter("refName");				//학부모이름
		String refId = request.getParameter("refId");					//학부모아이디
		String reftel1 = request.getParameter("reftel1");
		String reftel2 = request.getParameter("reftel2");
		String reftel3 = request.getParameter("reftel3");
		String refPhone = reftel1 + reftel2 + reftel3;					//학부모전화번호
		String inflowPath = request.getParameter("inflowPath");			//유입경로
		String school = request.getParameter("school");					//학교
		int grade = Integer.parseInt(request.getParameter("grade"));	//학년
		String track = request.getParameter("track");					//계열
		String college = request.getParameter("college");				//희망대학
		String major = request.getParameter("major");					//희망학과
		String status = request.getParameter("status");					//재원여부
		String userType = request.getParameter("userType");				//유저타입
		
		Student s = new Student();
		
		s.setUserId(userId);
		s.setName(userName);
		s.setUserPwd(userPwd);
		s.setBirth(birth);
		s.setPhone(phone);
		s.setSchool(school);
		s.setGrade(grade);
		s.setTrack(track);
		s.setAddress(address);
		s.setEmail(email);
		s.setRefName(refName);
		s.setRefId(refId);
		s.setRefPhone(refPhone);
		s.setCollege(college);
		s.setMajor(major);
		s.setInflowPath(inflowPath);
		s.setStatus(status);
		s.setUserType(userType);
		
		System.out.println(s.toString());
		int result = new StudentService().insertStudent(s);
		
		if(result > 0) {
			System.out.println("학생 정보 등록 성공!");
		} else {
			System.out.println("학생 정보 등록 실패!");
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
