package hagong.academy.commonMenu.notice.model.dao;

import static hagong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.commonMenu.notice.model.vo.Notice;

public class NoticeDao {

	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> selectList(Connection con) {

		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		stmt = con.createStatement();
		rset = stmt.executeQuery(query);
		
		list = new ArrayList<>();
		
		while(rset.next()) {
			Notice n = new Notice();
			n.setNno(rset.getInt("NOT_NO"));
			n.setnTitle(rset.getString("NOT_TITLE"));
			n.setnContent(rset.getString("NOT_CONTENT"));
			n.setnAuthor(rset.getString("AUTHOR"));
			n.setnCount(rset.getInt("COUNT"));
			n.setnDate(rset.getDate("NOT_DATE"));
			
			list.add(n);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertNotice(Connection con, Notice n) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnAuthor());
			pstmt.setDate(4, n.getnDate());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}













