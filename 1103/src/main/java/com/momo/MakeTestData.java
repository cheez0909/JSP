package com.momo;

import java.sql.SQLException;

// 테스트데이터는 서버가 필요하지 않음
public class MakeTestData extends DBConnection{

	public void insert() {
		String sql = "insert into board values(SEQ_BOARD_NUM.NEXTVAL, SEQ_BOARD_NUM.NEXTVAL||'오늘은 11월 15일입니다', SEQ_BOARD_NUM.NEXTVAL||'오늘은 11월 15일입니다', 'dani', sysdate, 0)";
		int res;
		try {
			pstmt = con.prepareStatement(sql);
			// 파라미터 세팅
			
			res = pstmt.executeUpdate();
			// 입력설정
			System.out.println(res + "건 입력되었습니다.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		MakeTestData make = new MakeTestData();
		for(int i=0; i<100; i++) {
			make.insert();
		}
	}
}
