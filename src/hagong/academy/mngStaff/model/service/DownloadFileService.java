package hagong.academy.mngStaff.model.service;

import java.sql.Connection;

import hagong.academy.mngStaff.model.dao.DownloadFileDao;
import hagong.academy.mngStaff.model.vo.StaffFile;
import static hagong.common.JDBCTemplate.*;

public class DownloadFileService { 

	public StaffFile downloadFile(int fileNo) {
		Connection con = getConnection();
		StaffFile file = new DownloadFileDao().downloadFile(con, fileNo);
		close(con);
		return file;
	}

}
