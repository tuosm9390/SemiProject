package hagong.academy.mngStaff.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStaff.model.dao.InsertStaffDao;
import hagong.academy.mngStaff.model.dao.StaffDao;
import hagong.academy.mngStaff.model.vo.Staff;
import hagong.academy.mngStaff.model.vo.StaffDetail;
import hagong.academy.mngStaff.model.vo.StaffFile;

public class StaffService { 

	public ArrayList<Staff> staffList(int curPage, int limit) {
		Connection con = getConnection();
		ArrayList<Staff> staffList = new StaffDao().staffList(con, curPage, limit);
		close(con);
		System.out.println(staffList);
		return staffList;
	}

	public ArrayList<StaffDetail> staffDetail(int userNo) {
		Connection con = getConnection();
		ArrayList<StaffDetail> staffDetail = new StaffDao().staffDetail(con, userNo);
		close(con);
		return staffDetail;
	}

	public int deleteStaff(int staffNo) {
		Connection con = getConnection();
		int result = new StaffDao().deleteStaff(con, staffNo);
		close(con);
		return result;
	}

	public int updateStaff(Staff staff, ArrayList<StaffFile> fileList, ArrayList<Integer> deleteFile) {
		Connection con = getConnection();
		int result = 1;
		
		int result1 = new StaffDao().updateStaffInfo(con, staff);
		if(result1 > 0) {
			commit(con);
			if(fileList != null) {
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setUserNo(staff.getUserNo());
				}
			}
			
			int result2 =  new StaffDao().updateStaffSubInfo(con, staff);
			if(result2 > 0) {
				commit(con);
				
				if(fileList != null) {
					int result3 = new StaffDao().insertFile(con, fileList);
					if(result3 > 0) {
						commit(con);
						
						for(int i = 0; i < fileList.size(); i++) {
							if(!fileList.get(i).getFileType().equals("PROFILE")) {
								int fileNo = new StaffDao().selectFileNo(con, fileList.get(i));
								fileList.get(i).setFileNo(fileNo);
								int result4 = new StaffDao().insertStaffFile(con, fileList.get(i));
								if(result4 > 0) {
									commit(con);
								} else {
									rollback(con);
									result = 0;
								}
							} else {
								int profileCnt = new StaffDao().selectProfileCnt(con, staff.getUserNo());
								if(profileCnt > 1) {
									int fileNo = new StaffDao().selectFileNo(con, fileList.get(i));
									int result5 = new StaffDao().updateOldProfile(con, fileNo, staff.getUserNo());
									if(result5 > 0) {
										commit(con);
									} else {
										rollback(con);
										result = 0;
									}
								}
							}
						}
					} else {
						rollback(con);
						result = 0;
					}
				}
			} else {
				rollback(con);
				result = 0;
			}
		} else {
			rollback(con);
			result = 0;
		}
		
		int delResult = 1;
		if(deleteFile != null) {
			for(int i = 0; i < deleteFile.size(); i++) {
				delResult = new StaffDao().deleteFile(con, staff.getUserNo(), deleteFile.get(i));
			}
			if(delResult > 0) {
				commit(con);
			} else {
				rollback(con);
				delResult = 0;
			}
		}
		
		if(result > 0 && delResult > 0) {
			result = 1;
		} else {
			result = 0;
		}
		close(con);
		return result;
	}

	public ArrayList<Staff> staffListById(int curPage, int limit) {
		Connection con = getConnection();
		ArrayList<Staff> staffList = new StaffDao().staffListById(con, curPage, limit);
		close(con);
		return staffList;
	}

	public ArrayList<Staff> staffListBySub(int curPage, int limit) {
		Connection con = getConnection();
		ArrayList<Staff> staffList = new StaffDao().staffListBySub(con, curPage, limit);
		close(con);
		return staffList;
	}

	public ArrayList<Staff> staffListByDay(int curPage, int limit) {
		Connection con = getConnection();
		ArrayList<Staff> staffList = new StaffDao().staffListByDay(con, curPage, limit);
		close(con);
		return staffList;
	}

	public int countStaff() {
		Connection con = getConnection();
		int listCnt = new StaffDao().countStaff(con);
		close(con);
		return listCnt;
	}

}
