package hagong.academy.commonMenu.info.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.commonMenu.info.model.dao.UserDao;
import hagong.academy.commonMenu.info.model.vo.UserDetail;
import hagong.academy.mngStaff.model.dao.StaffDao;
import hagong.academy.mngStaff.model.vo.StaffFile;

public class UserService {

	public ArrayList<UserDetail> userDetail(int userNo) {
		Connection con = getConnection();
		ArrayList<UserDetail> userDetail = new UserDao().userDetail(con, userNo);
		close(con);
		return userDetail;
	}

	public int updateUser(UserDetail user, ArrayList<StaffFile> fileList) {
		Connection con = getConnection();
		int result = 1;
		
		int result1 = new UserDao().updateUserInfo(con, user);
		if(result1 > 0) {
			commit(con);
			if(fileList != null) {
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setUserNo(user.getUserNo());
				}
			}
				
			if(fileList != null) {
				int result2 = new UserDao().insertFile(con, fileList);
				if(result2 > 0) {
					commit(con);
					
					for(int i = 0; i < fileList.size(); i++) {
						if(!fileList.get(i).getFileType().equals("PROFILE")) {
							int fileNo = new UserDao().selectFileNo(con, fileList.get(i));
							fileList.get(i).setFileNo(fileNo);
							int result3 = new UserDao().insertStaffFile(con, fileList.get(i));
							if(result3 > 0) {
								commit(con);
							} else {
								rollback(con);
								result = 0;
							}
						} else {
							int profileCnt = new UserDao().selectProfileCnt(con, user.getUserNo());
							if(profileCnt > 1) {
								int fileNo = new UserDao().selectFileNo(con, fileList.get(i));
								int result4 = new UserDao().updateOldProfile(con, fileNo, user.getUserNo());
								if(result4 > 0) {
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
		
		close(con);
		return result;
	}

}
