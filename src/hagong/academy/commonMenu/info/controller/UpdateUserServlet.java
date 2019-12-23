package hagong.academy.commonMenu.info.controller;

import java.io.File;
import static hagong.wrapper.LoginWrapper.*;
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

import hagong.academy.commonMenu.info.model.service.UserService;
import hagong.academy.commonMenu.info.model.vo.UserDetail;
import hagong.academy.mngStaff.model.vo.StaffFile;
import hagong.common.RenameFilePolicy;
import hagong.wrapper.LoginWrapper;

@WebServlet("/aupdate.ps")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateUserServlet() {
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
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String userPwd = getSha512(multiRequest.getParameter("userPwd"));
			String phone = multiRequest.getParameter("tel1") + "-" + multiRequest.getParameter("tel2") + "-" + multiRequest.getParameter("tel3");
			String email = multiRequest.getParameter("email");
			String address = multiRequest.getParameter("address");

			UserDetail user = new UserDetail();
			user.setUserNo(userNo);
			user.setUserPwd(userPwd);
			user.setPhone(phone);
			user.setEmail(email);
			user.setAddress(address);
			
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
				
				if(staffFile.getOriginName() != null) {
					fileList.add(staffFile);
				}
			}
			
			if(fileList.size() == 0) {
				fileList = null;
			}
					
			int result = new UserService().updateUser(user, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/adetail.ps?type=view&no=" + user.getUserNo());
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("errorCode", "updateUserFail");
				request.getRequestDispatcher("viewAcademy/common/commonError.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
