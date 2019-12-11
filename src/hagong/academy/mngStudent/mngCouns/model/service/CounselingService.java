package hagong.academy.mngStudent.mngCouns.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStudent.mngCouns.model.dao.CounselingDao;
import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

public class CounselingService {
	
	//USER_ID 그룹화해서 전체 학생리스트 가져오는 서비스
	public ArrayList<MemberCouns> counsList() {
		Connection con = getConnection();
		ArrayList<MemberCouns> counsList = new CounselingDao().counsList(con);
		
		close(con);
		
		return counsList;
	}
	
	//상담횟수 가져오는 서비스
	public ArrayList<MemberCouns> selectCount(ArrayList<MemberCouns> counsList) {
		Connection con = getConnection();
		
		ArrayList<MemberCouns> counsCountList = new CounselingDao().selectCount(con, counsList);
		
		
		close(con);
		
		return counsCountList;
	}

	//최근 상담일자 가져오는 서비스
	public ArrayList<MemberCouns> selectRecentDate(ArrayList<MemberCouns> counsCountList) {
		Connection con = getConnection();
		
		for(int i = 0; i < counsCountList.size(); i++) {
			String userId = counsCountList.get(i).getUserId();
			
			MemberCouns mc = new CounselingDao().selectRecentDate(con,userId);
			
			counsCountList.get(i).setCouDate(mc.getCouDate());
		}
		
		close(con);
		
		return counsCountList;
	}
	
	//상담학생 이름 가져오는 서비스
	public ArrayList<MemberCouns> selectUserInfo(ArrayList<MemberCouns> allCounsList) {
		Connection con = getConnection();
		
		for(int i = 0; i < allCounsList.size(); i++) {
			String userId = allCounsList.get(i).getUserId();
			
			MemberCouns mc = new CounselingDao().selectUserInfo(con,userId);
			
			allCounsList.get(i).setName(mc.getName());
		}
		
		close(con);
		
		
		
		return allCounsList;
	}

}

















