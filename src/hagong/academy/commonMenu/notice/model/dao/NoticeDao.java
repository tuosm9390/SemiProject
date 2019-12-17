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

import hagong.academy.commonMenu.notice.model.service.NoticeService;
import hagong.academy.commonMenu.notice.model.vo.Notice;
import hagong.academy.commonMenu.notice.model.vo.NoticeFile;

public class NoticeDao {

	private Properties prop = new Properties();
	
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
		
		try {
		stmt = con.createStatement();
		rset = stmt.executeQuery(query);
		
		list = new ArrayList<>();
		
		while(rset.next()) {
			Notice n = new Notice();
			n.setNno(rset.getInt("NOT_NO"));
			n.setnTitle(rset.getString("NOT_TITLE"));
			n.setnContent(rset.getString("NOT_CONTENT"));
			n.setName(rset.getString("NAME"));
			n.setnCount(rset.getInt("COUNT"));
			n.setnDate(rset.getDate("NOT_DATE"));
			
			list.add(n);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}

	public int insertNotice(Connection con, ArrayList<NoticeFile> fileList) {

		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileList.getnTitle());
			pstmt.setString(4, fileList.getnContent());
			pstmt.setInt(2, fileList.getnAuthor());
			pstmt.setDate(3, fileList.getnDate());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Notice selectOne(Connection con, int num) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				
				n.setNno(rset.getInt("NOT_NO"));
				n.setnTitle(rset.getString("NOT_TITLE"));
				n.setnContent(rset.getString("NOT_CONTENT"));
				n.setName(rset.getString("NAME"));
				n.setnCount(rset.getInt("COUNT"));
				n.setnDate(rset.getDate("NOT_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return n;
	}

	public int updateCount(Connection con, int nno) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			pstmt.setInt(2, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection con, Notice n) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3, n.getNno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteNotice(Connection con, String nno) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<Notice> selectListWithPaging(Connection con, int currentPage, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setNno(rset.getInt("NOT_NO"));
				n.setnTitle(rset.getString("NOT_TITLE"));
				n.setName(rset.getString("NAME"));
				n.setnDate(rset.getDate("NOT_DATE"));
				n.setnCount(rset.getInt("COUNT"));
				n.setImportant(rset.getString("IMPORTANT"));
				n.setnContent(rset.getString("NOT_CONTENT"));
				n.setStatus(rset.getString("NOT_STATUS"));
				
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectCurrval(Connection con) {

		
		
		return 0;
	}

	

}

























