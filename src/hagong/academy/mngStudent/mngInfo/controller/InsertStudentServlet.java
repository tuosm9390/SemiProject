package hagong.academy.mngStudent.mngInfo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;
import hagong.academy.mngStudent.mngInfo.model.vo.StudentProfile;
import hagong.common.RenameFilePolicy;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("root : " + root);
			String savePath = root + "uploadFiles/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new RenameFilePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();

			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				System.out.println("name : " + name);

				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}

			System.out.println("saveFiles : " + saveFiles);
			System.out.println("originFiles : " + originFiles);

			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");

			System.out.println("multiTitle : " + multiTitle);
			System.out.println("multiContent : " + multiContent);
			
			

			String userName = multiRequest.getParameter("userName"); // 학생이름
			String userId = multiRequest.getParameter("userId"); // 학생아이디
			String userPwd = multiRequest.getParameter("userPwd"); // 학생비밀번호
			java.sql.Date birth = java.sql.Date.valueOf(multiRequest.getParameter("birth")); // 생년월일
			String tel1 = multiRequest.getParameter("tel1");
			String tel2 = multiRequest.getParameter("tel2");
			String tel3 = multiRequest.getParameter("tel3");
			String phone = tel1 + "-" + tel2 + "-" + tel3; // 전화번호
			String address = multiRequest.getParameter("address"); // 주소
			String email = multiRequest.getParameter("email"); // 이메일
			int refNo = Integer.parseInt(multiRequest.getParameter("refNo")); // 학부모유저번호
			System.out.println("refNo : " + refNo);
			String refName = multiRequest.getParameter("refName"); // 학부모이름
			String refId = multiRequest.getParameter("refId"); // 학부모아이디
			String reftel1 = multiRequest.getParameter("reftel1");
			String reftel2 = multiRequest.getParameter("reftel2");
			String reftel3 = multiRequest.getParameter("reftel3");
			String refPhone = reftel1 + "-" + reftel2 + "-" + reftel3; // 학부모전화번호
			String inflowPath = multiRequest.getParameter("inflowPath"); // 유입경로
			String school = multiRequest.getParameter("school"); // 학교
			int grade = Integer.parseInt(multiRequest.getParameter("grade")); // 학년
			String track = multiRequest.getParameter("track"); // 계열
			String college = multiRequest.getParameter("college"); // 희망대학
			String major = multiRequest.getParameter("major"); // 희망학과
			String status = multiRequest.getParameter("status"); // 재원여부
			String userType = multiRequest.getParameter("userType"); // 유저타입

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

			if(refNo == 0) {
				int refresult = new StudentService().insertParent(s);
				
				if(refresult > 0) {
					// 학부모 번호 찾기
					int	refUno = new StudentService().findUserNo(refId);
					s.setRefUno(refUno);
				}
			} else {
				s.setRefUno(refNo);
			}
			System.out.println("s.getRefUno : " + s.getRefUno());
			
			ArrayList<StudentProfile> fileList = new ArrayList<StudentProfile>();
			
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				StudentProfile profile = new StudentProfile();
				profile.setFilePath(savePath);
				profile.setOriginName(originFiles.get(i));
				profile.setChangeName(saveFiles.get(i));

				fileList.add(profile);
			}

			System.out.println(s.toString());
			int result = new StudentService().insertMember(s, fileList);

			String page = "";
			if (result > 0) {
				System.out.println("학생 정보 등록 성공!");
				response.sendRedirect(request.getContextPath() + "/alist.info");
			} else {
				System.out.println("학생 정보 등록 실패!");
				for (int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));

					failedFile.delete();
				}
				page = "/viewAcademy/common/commonError.jsp";
				request.setAttribute("errorCode", "insertStudentFail");
				request.getRequestDispatcher(page).forward(request, response);
			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
