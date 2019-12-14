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

	public ArrayList<Staff> staffList() {
		Connection con = getConnection();
		ArrayList<Staff> staffList = new StaffDao().staffList(con);
		close(con);
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
		int result = 0;
		
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
				result = 1;
				
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
									result = 1;
								} else {
									rollback(con);
									result = 0;
								}
							}
						}
					} else {
						rollback(con);
					}
				}
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
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

}
