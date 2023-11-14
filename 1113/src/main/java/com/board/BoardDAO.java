package com.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConnectionPool{

	/*
	 * DB로부터 리스트를 조회 후 반환
	 * 
	 */
	
	public List<BoardDTO> getList() {
		// 쿼리 정의
		String sql = "select * from board";
		List<BoardDTO> list = new ArrayList<>();
		try {
			// 인파라미터를 설정할 수 있으므로 쿼리 실행 전 sql 문장을 세팅합니다.
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 다음 행이 있는 지 확인
			// why? 처음엔 타이틀 부분을 바라보고 있음!
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString(1));
				// 컬럼이름으로 가져올 경우 결과집합의 타이틀로 가져옴 / 타이틀명 변경했을 경우 유의
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString(5));
				dto.setVisitcount(rs.getString(6));
				list.add(dto);
			}
			close();
		} catch (SQLException e) {
			System.out.println("쿼리를 실행할 수 없습니다.");
			e.printStackTrace();
		} return list;
	}
}
