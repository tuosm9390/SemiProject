package hagong.academy.mngClass.mngSatisfy.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngClass.mngSatisfy.model.dao.SatisfyDao;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;
import hagong.academy.mngStudent.mngBlack.model.dao.BlacklistDao;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
import hagong.academy.mngStudent.mngInfo.model.dao.StudentDao;

public class SatisfyService {

	public ArrayList<SatisfyInfo> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<SatisfyInfo> list = new SatisfyDao().selectList(con, currentPage, limit);

		close(con);

		return list;
	}

	public ArrayList<SatisfyInfo> selectBenList() {
		Connection con = getConnection();
		ArrayList<SatisfyInfo> blist = new SatisfyDao().selectBenList(con);

		close(con);

		return blist;
	}

	public ArrayList<HashMap<String, Object>> selectSatis(int satNo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new SatisfyDao().selectSatis(con, satNo);

		close(con);

		return list;
	}

	public int insertBen(SatisfyInfo si) {
		Connection con = getConnection();
		int result = new SatisfyDao().insertBen(con, si);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteBen(int benNo) {
		Connection con = getConnection();
		int result = new SatisfyDao().deleteBen(con, benNo);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int insertSatis(SatisfyInfo si, String[] qrr, String[] arr, String[] questionNum, String[] answerNum) {
		Connection con = getConnection();
		int result = new SatisfyDao().insertSatis(con, si);

		if (result > 0) {
			commit(con);
			// 입력한 설문 번호 뽑아오기
			int selectSatNo = new SatisfyDao().selectSatNo(con, si);
			// 설문문항 입력
			int qresult = 0;
			for (int i = 0; i < qrr.length; i++) {
				qresult = new SatisfyDao().insertQue(con, qrr[i], selectSatNo);

				if (qresult > 0) {
					commit(con);
					// 문항의 번호 뽑아옴
					int selectQueNo = new SatisfyDao().selectQueNo(con, qrr[i], selectSatNo);
					// 답변목록 입력
					int aresult = 0;
					for (int j = 0; j < arr.length; j++) {
						if (questionNum[i].equals(answerNum[j])) {
							aresult = new SatisfyDao().insertAns(con, arr[j], selectQueNo, selectSatNo);
							if (aresult > 0) {
								commit(con);
							} else {
								rollback(con);
								break;
							}
						}
					}
				} else {
					rollback(con);
					break;
				}
			}
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int updateSatis(SatisfyInfo si, String[] qrr, String[] arr, String[] questionNum, String[] answerNum) {
		Connection con = getConnection();

		int result = new SatisfyDao().updateSatis(con, si);
		if (result > 0) {
			commit(con);
			int ansdel = new SatisfyDao().deleteans(con, si);
			if (ansdel > 0) {
				commit(con);
				int quedel = new SatisfyDao().deleteque(con, si);
				if (quedel > 0) {
					commit(con);
					int qresult = 0;
					for (int i = 0; i < qrr.length; i++) {
						qresult = new SatisfyDao().insertQue(con, qrr[i], si.getSatNo());

						if (qresult > 0) {
							commit(con);
							// 문항의 번호 뽑아옴
							int selectQueNo = new SatisfyDao().selectQueNo(con, qrr[i], si.getSatNo());
							// 답변목록 입력
							int aresult = 0;
							for (int j = 0; j < arr.length; j++) {
								if (questionNum[i].equals(answerNum[j])) {
									aresult = new SatisfyDao().insertAns(con, arr[j], selectQueNo, si.getSatNo());
									if (aresult > 0) {
										commit(con);
									} else {
										rollback(con);
										break;
									}
								}
							}
						} else {
							rollback(con);
							break;
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

	public int listCount() {
		Connection con = getConnection();

		int listCount = new SatisfyDao().listCount(con);

		close(con);

		return listCount;
	}

	public ArrayList<SatisfyInfo> selectList(int currentPage, int limit, String searchCondition, String srchCnt) {
		Connection con = getConnection();
		ArrayList<SatisfyInfo> list = new SatisfyDao().selectList(con, currentPage, limit, searchCondition, srchCnt);

		close(con);

		return list;
	}

	public int deleteSatis(int satNo) {
		Connection con = getConnection();
		int result = 0;
		int ansdel = new SatisfyDao().deleteans(con, satNo);
		if (ansdel > 0) {
			commit(con);
			int quedel = new SatisfyDao().deleteque(con, satNo);
			if (quedel > 0) {
				commit(con);
				result = new SatisfyDao().deleteSatis(con, satNo);
				if (result > 0) {
					commit(con);
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
