package hagong.academy.mngStaff.controller;

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

import hagong.academy.mngStaff.model.service.InsertStaffService;
import hagong.academy.mngStaff.model.vo.Staff;
import hagong.academy.mngStaff.model.vo.StaffFile;
import hagong.common.RenameFilePolicy;

@WebServlet("/ainsert.staff")
public class InsertStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public InsertStaffServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 100;

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
			String name = multiRequest.getParameter("userName");
			String userPwd = multiRequest.getParameter("userPwd");
			java.sql.Date birth = java.sql.Date.valueOf(multiRequest.getParameter("birth"));
			String phone = multiRequest.getParameter("tel1") + "-" + multiRequest.getParameter("tel2") + "-" + multiRequest.getParameter("tel3");
			String dept = multiRequest.getParameter("subject");
			String email = multiRequest.getParameter("email");
			String address = multiRequest.getParameter("address");

			Staff staff = new Staff();
			staff.setUserId(userId);
			staff.setName(name);
			staff.setUserPwd(userPwd);
			staff.setBirth(birth);
			staff.setPhone(phone);
			staff.setDept(dept);
			staff.setEmail(email);
			staff.setAddress(address);
			
			ArrayList<StaffFile> fileList = new ArrayList<StaffFile>();
			
			for(int i = 0; i < originFiles.size(); i++) {
				StaffFile staffFile = new StaffFile();
				staffFile.setOriginName(originFiles.get(i));
				staffFile.setFilePath(savePath);
				
				String type = saveFiles.get(i).substring(0, 3);
				String saveName = saveFiles.get(i).substring(3);
				staffFile.setChangeName(saveName);
				if(type.equals("img")) {
					staffFile.setFileType("PROFILE");
				} else if(type.equals("doc")) {
					staffFile.setFileType("DOC");
				} else if(type.equals("pay")) {
					staffFile.setFileType("ASSIGN");
				}
				
				fileList.add(staffFile);
			}
			
			int result = new InsertStaffService().insertStaff(staff, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/alist.staff");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("errorCode", "insertStaffFail");
				request.getRequestDispatcher("viewAcademy/common/commonError.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
