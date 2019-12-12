package hagong.academy.mngStaff.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStaff.model.dao.StaffDao;
import hagong.academy.mngStaff.model.vo.Staff;
import hagong.academy.mngStaff.model.vo.StaffFile;
import static hagong.common.JDBCTemplate.*;

public class StaffService {

	public int insertStaff(Staff staff, ArrayList<StaffFile> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new StaffDao().insertStaffInfo(con, staff);
		if(result1 > 0) {
			commit(con);
			int staffNo = new StaffDao().selectStaffNo(con, staff);
			staff.setUserNo(staffNo);
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setUserNo(staffNo);
			}
			
			int result2 =  new StaffDao().insertStaffSubInfo(con, staff);
			if(result2 > 0) {
				commit(con);
				
				int result3 = new StaffDao().insertFile(con, fileList);
				if(result3 > 0) {
					commit(con);
					
					for(int i = 0; i < fileList.size(); i++) {
						if(fileList.get(i).getFileType().equals("PROFILE")) {
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
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
