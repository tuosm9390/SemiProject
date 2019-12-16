package hagong.academy.mngClass.mngSatisfy.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static hagong.common.JDBCTemplate.*;

import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;
import hagong.academy.mngStudent.mngInfo.model.dao.StudentDao;

public class SatisfyDao {
	private Properties prop = new Properties();

	public SatisfyDao() {
		String fileName = StudentDao.class.getResource("/sql/class/satis-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<SatisfyInfo> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<SatisfyInfo> list = null;

		String query = prop.getProperty("selectList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				SatisfyInfo si = new SatisfyInfo();
				
				si.setRowNum(rset.getInt("ROW_NUM"));
				si.setSatNo(rset.getInt("SAT_NO"));
				si.setSatTitle(rset.getString("SAT_TITLE"));
				si.setStart(rset.getDate("SAT_START"));
				si.setEnd(rset.getDate("SAT_END"));
				si.setTarget(rset.getString("TARGET"));
				
				list.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectSatis(Connection con, int satNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectSatis");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, satNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				SatisfyInfo si = new SatisfyInfo();
				si.setSatNo(rset.getInt("SAT_NO"));
				si.setSatTitle(rset.getString("SAT_TITLE"));
				si.setStart(rset.getDate("SAT_START"));
				si.setEnd(rset.getDate("SAT_END"));
				si.setTarget(rset.getString("TARGET"));
				si.setBenNo(rset.getInt("BEN_NO"));
				si.setBenCondition(rset.getString("CONDITION"));
				si.setBenType(rset.getString("BEN_TYPE"));
				si.setBenRate(rset.getDouble("BEN_RATE"));
				si.setQueNo(rset.getInt("QUE_NO"));
				si.setQueContent(rset.getString("QUE_CONTENT"));
				si.setAnsNo(rset.getInt("ANS_NO"));
				si.setAnsContent(rset.getString("ANS_CONTENT"));
				
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
				hmap.put("satNo", si.getSatNo());
				hmap.put("satTitle", si.getSatTitle());
				hmap.put("start", si.getStart());
				hmap.put("end", si.getEnd());
				hmap.put("target", si.getTarget());
				hmap.put("benNo", si.getBenNo());
				if(si.getBenCondition().equals("SAMESUB")) {
					hmap.put("benCondition", "현재");
				} else {
					hmap.put("benCondition", "다음");
				}
				if(si.getBenType().equals("TUITION")) {
					hmap.put("benType", "수강료");
				}
				hmap.put("benRate", (int)(Math.floor(si.getBenRate() * 100)) + "%");
				hmap.put("queNo", si.getQueNo());
				hmap.put("queContent", si.getQueContent());
				hmap.put("ansNo", si.getAnsNo());
				hmap.put("ansContent", si.getAnsContent());
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
}
