package hagong.academy.commonMenu.notice.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import hagong.academy.common.member.model.vo.Member;
import hagong.academy.commonMenu.notice.model.service.NoticeService;
import hagong.academy.commonMenu.notice.model.vo.Notice;
import hagong.academy.commonMenu.notice.model.vo.NoticeFile;
import hagong.common.RenameFilePolicy;


/**
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet("/ainsert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String title = request.getParameter("title");
//		int writer = Integer.parseInt(request.getParameter("writer"));
//		String date = request.getParameter("date");
//		String content = request.getParameter("content");
//		
//		System.out.println(title);
//
//		System.out.println(writer);
//
//		System.out.println(date);
//
//		System.out.println(content);
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String savePath = root + "uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new RenameFilePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
			}
			
			System.out.println("saveFiles : " + saveFiles);
			System.out.println("originFiles : " + originFiles);
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");
			
			System.out.println("multiTitle : " + multiTitle);
			System.out.println("multiContent : " + multiContent);
			
			Notice n = new Notice();
			n.setnTitle(multiTitle);
			n.setnContent(multiContent);
			n.setName(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserNo()));
			
			ArrayList<NoticeFile> fileList = new ArrayList<NoticeFile>();
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				NoticeFile nf = new NoticeFile();
				nf.setFilePath(savePath);
				nf.setOriginName(originFiles.get(i));
				nf.setChangeName(saveFiles.get(i));
				
				fileList.add(nf);
			}
			
			int result = new NoticeService().insertNotice(n, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/alist.no");
			}else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진 게시판 등록 실패!");
				request.getRequestDispatcher("viewAcademy/common/commonError.jsp").forward(request, response);
			}
		}

		
//		Date day = null;
//		
//		day = java.sql.Date.valueOf(date);
//		
//		System.out.println(day);
//		
//		Notice n = new Notice();
//		n.setnTitle(title);
//		n.setnAuthor(writer);
//		n.setnDate(day);
//		n.setnContent(content);
//		
//		int result = new NoticeService().insertNotice(n);
//		
//		String page = "";
//		if(result > 0) {
//			page = "alist.no";
//			response.sendRedirect(page);
//		}else {
//			//page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "공지사항 등록 실패");
//			request.getRequestDispatcher(page).forward(request, response);
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}













