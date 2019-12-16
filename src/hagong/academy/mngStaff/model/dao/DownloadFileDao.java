package hagong.academy.mngStaff.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import hagong.academy.mngStaff.model.vo.StaffFile;
import static hagong.common.JDBCTemplate.*;

public class DownloadFileDao {
	
	private Properties prop = new Properties();
	
	public DownloadFileDao() {
		String fileName = DownloadFileDao.class.getResource("/sql/staff/file-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public StaffFile downloadFile(Connection con, int fileNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		StaffFile file = null;
		
		String query = prop.getProperty("downloadFile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fileNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				file = new StaffFile();
				file.setUserNo(rset.getInt("USER_NO"));
				file.setFileNo(rset.getInt("FILE_NO"));
				file.setFileType(rset.getString("FILE_TYPE"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setFileStatus(rset.getString("FILE_STATUS"));
				file.setUploadDate(rset.getDate("UPLOAD_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return file;
	}
	
}
