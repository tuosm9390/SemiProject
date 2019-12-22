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
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
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

	public ArrayList<SatisfyInfo> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SatisfyInfo> list = null;

		String query = prop.getProperty("selectList");

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				SatisfyInfo si = new SatisfyInfo();

				si.setRowNum(rset.getInt("RNUM"));
				si.setSatNo(rset.getInt("SAT_NO"));
				si.setSatTitle(rset.getString("SAT_TITLE"));
				si.setStart(rset.getDate("SAT_START"));
				si.setEnd(rset.getDate("SAT_END"));
				si.setTarget(rset.getString("TARGET"));
				si.setStatus(rset.getString("STATUS"));

				list.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public ArrayList<SatisfyInfo> selectBenList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<SatisfyInfo> blist = null;

		String query = prop.getProperty("selectBenList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			blist = new ArrayList<>();

			while (rset.next()) {
				SatisfyInfo si = new SatisfyInfo();

				si.setBenNo(rset.getInt("BEN_NO"));
				if (rset.getString("CONDITION").equals("SAMESUB")) {
					si.setBenCondition("현재");
				} else {
					si.setBenCondition("다음");
				}
				if (rset.getString("BEN_TYPE").equals("TUITION")) {
					si.setBenType("수강료");
				} else {
					si.setBenType("기타");
				}
				si.setBenRate(rset.getDouble("BEN_RATE"));
				si.setToday(rset.getDate("SYSDATE"));

				blist.add(si);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return blist;
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
			while (rset.next()) {
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
				if (si.getBenCondition().equals("SAMESUB")) {
					hmap.put("benCondition", "현재");
				} else {
					hmap.put("benCondition", "다음");
				}
				if (si.getBenType().equals("TUITION")) {
					hmap.put("benType", "수강료");
				}
				hmap.put("benRate", (int) (Math.floor(si.getBenRate() * 100)) + "%");
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

	public int insertBen(Connection con, SatisfyInfo si) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBen");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, si.getBenCondition());
			pstmt.setString(2, si.getBenType());
			pstmt.setDouble(3, si.getBenRate());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteBen(Connection con, int benNo) {
		System.out.println("삭제Dao");
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteBen");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, benNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertSatis(Connection con, SatisfyInfo si) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertSatis");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, si.getSatTitle());
			pstmt.setDate(2, si.getStart());
			pstmt.setDate(3, si.getEnd());
			pstmt.setString(4, si.getTarget());
			pstmt.setInt(5, si.getBenNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 받아올 설문번호 뽑기
	public int selectSatNo(Connection con, SatisfyInfo si) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int satNo = 0;

		String query = prop.getProperty("selectSatNo");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, si.getSatTitle());
			pstmt.setString(2, si.getTarget());
			pstmt.setInt(3, si.getBenNo());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				satNo = rset.getInt("SAT_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return satNo;
	}

	public int insertQue(Connection con, String que, int selectSatNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertQue");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, que);
			pstmt.setInt(2, selectSatNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectQueNo(Connection con, String qrr, int selectSatNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int queNo = 0;

		String query = prop.getProperty("selectQueNo");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, qrr);
			pstmt.setInt(2, selectSatNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				queNo = rset.getInt("QUE_NO");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return queNo;
	}

	public int insertAns(Connection con, String arr, int selectQueNo, int selectSatNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("inserAns");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, selectQueNo);
			pstmt.setInt(2, selectSatNo);
			pstmt.setString(3, arr);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateSatis(Connection con, SatisfyInfo si) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateSatis");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, si.getSatTitle());
			pstmt.setDate(2, si.getStart());
			pstmt.setDate(3, si.getEnd());
			pstmt.setString(4, si.getTarget());
			pstmt.setInt(5, si.getBenNo());
			pstmt.setInt(6, si.getSatNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteque(Connection con, SatisfyInfo si) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteque");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, si.getSatNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteans(Connection con, SatisfyInfo si) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteans");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, si.getSatNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int listCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("listCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<SatisfyInfo> selectList(Connection con, int currentPage, int limit, String searchCondition,
			String srchCnt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SatisfyInfo> list = null;

		// 조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = "";

		if (searchCondition.equals("className")) {
			query = prop.getProperty("selectListByClassName");
		} else {
			query = prop.getProperty("selectListByStatus");
		}

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, srchCnt);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rset.next()) {
				SatisfyInfo si = new SatisfyInfo();

				si.setRowNum(rset.getInt("RNUM"));
				si.setSatNo(rset.getInt("SAT_NO"));
				si.setSatTitle(rset.getString("SAT_TITLE"));
				si.setStart(rset.getDate("SAT_START"));
				si.setEnd(rset.getDate("SAT_END"));
				si.setTarget(rset.getString("TARGET"));
				si.setStatus(rset.getString("STATUS"));

				list.add(si);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int deleteSatis(Connection con, int satNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteSatis");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, satNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteans(Connection con, int satNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteans");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, satNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteque(Connection con, int satNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteque");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, satNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
