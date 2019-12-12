package hagong.academy.mngStaff.controller;

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

import hagong.academy.mngStaff.model.vo.Staff;
import hagong.common.RenameFilePolicy;

@WebServlet("/ainsert.staff")
public class InsertStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertStaffServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new RenameFilePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				if(name.contains("img")) {
					saveFiles.add("img" + multiRequest.getFilesystemName(name));
				} else if(name.contains("pay")) {
					saveFiles.add("pay" + multiRequest.getFilesystemName(name));
				} else if(name.contains("doc")) {
					saveFiles.add("doc" + multiRequest.getFilesystemName(name));
				}
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
		
			String userId = multiRequest.getParameter("userId");
			String userPwd = multiRequest.getParameter("userPwd");
			java.sql.Date birth = java.sql.Date.valueOf(multiRequest.getParameter("birth"));
			String phone = multiRequest.getParameter("tel1") + multiRequest.getParameter("tel2") + multiRequest.getParameter("tel3");
			String dept = multiRequest.getParameter("subject");
			String email = multiRequest.getParameter("email");
			String address = multiRequest.getParameter("address");
			//부서명 부분부터 고쳐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			Staff staff = new Staff();
			staff.setUserId(userId);
			staff.setUserPwd(userPwd);
			staff.setBirth(birth);
			staff.setPhone(phone);
			staff.setDept(dept);
			staff.setEmail(email);
			staff.setAddress(address);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
