package hagong.academy.mngStaff.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStaff.model.service.DownloadFileService;
import hagong.academy.mngStaff.model.vo.StaffFile;

@WebServlet("/down.staff")
public class DownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DownloadFileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fileNo = Integer.parseInt(request.getParameter("no"));
		
		StaffFile file = new DownloadFileService().downloadFile(fileNo);
		BufferedInputStream bif = null;
		ServletOutputStream downOut = null;
		
		downOut = response.getOutputStream();
		
		File downFile = new File(file.getFilePath() + file.getChangeName());
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(file.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) downFile.length()); 
		FileInputStream fis = new FileInputStream(downFile);
		bif = new BufferedInputStream(fis);
		
		int readBytes = 0;
		while((readBytes = bif.read()) != -1) {
			downOut.write(readBytes);
		}
		
		downOut.close();
		bif.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
