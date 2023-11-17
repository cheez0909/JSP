package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.DBConnection;
import com.momo.DBConnectionPool;
import com.momo.dto.BoardDTO;
import com.momo.dto.Criteria;

// DBConnectionPool : 톰캣에서 제공해주는 기능을 사용하며 커넥션풀이라는 공간에 커넥션 객체를 미리
// 생성해놓고 사용
public class BoardDAO extends DBConnection{

	public BoardDAO() {
		super();
	}
	
	
	// 내가 쓴 글 조회하기
	public List<BoardDTO> getList(String id){
		List<BoardDTO> list = new ArrayList<>();
		try {
		String sql = "SELECT *\r\n"
				+ "FROM BOARD\r\n"
				+ "WHERE ID=?";
		
		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				list.add(dto);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/*
	 * 
	 * 리스트 조회 후 변환
	 * + 페이징 처리
	 * return
	 * 
	 * */
	// 리스트 조회하는 메서드
	public List<BoardDTO> getList(Criteria cri){
		List<BoardDTO> list = new ArrayList<>();
//		String sql = "SELECT *\r\n"
//				+ "FROM BOARD\r\n";
		
		// 페이징 처리하기
		String sql = "select *\r\n"
				+ "from (select rownum rnum, b.*\r\n"
				+ "        from  (  -- 최신순으로 조회\r\n"
				+ "                select *\r\n"
				+ "                from board\r\n"
				+ "                order by num desc) b\r\n"
				+ "        )\r\n"
				+ "where rnum between ? and ?";
		try {
		
			pstmt = con.prepareStatement(sql);
			// 시작번호 = 끝번호 - (페이지당게시물수 -1)
			pstmt.setInt(1, cri.getStartNo());
			// 끝번호 = 페이지번호 * 페이지당게시물수
			pstmt.setInt(2, cri.getEndNo());
			
			// 페이지 객체를 생성해야함
			// 페이지 
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				list.add(dto);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 1건을 조회하는 메서드
	public BoardDTO getOne(String num) {
	
		BoardDTO dto = new BoardDTO();
		
		try {
			
		String sql = "SELECT *\r\n"
				+ "FROM board\r\n"
				+ "WHERE NUM=?";
				
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setNum(rs.getString("num"));
			dto.setPostdate(rs.getString("postdate"));
			dto.setVisitcount(rs.getString("visitcount"));
		}
		
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return dto;
	}
	
	
	//public static void main(String[] args) {
	//	BoardDAO dao = new BoardDAO();
	//	System.out.print(dao.getList("test"));
	//}
	
	
	// 조회수 증가 쿼리짜기
	// 업데이트 쿼리 짜기 update
	// 조회수를 반환하자!! -> int타입으로....
	// 실행된 건수가 반환됨.....
	// 화면이 열렸을때 실행되어야 함 -> 디테일 컨트롤러로
	public int visitCount(String num) {
		BoardDTO dto = new BoardDTO();
		int res=0;
		try {
			
		String sql = "update board\r\n"
				+ "set visitcount = visitcount + 1\r\n"
				+ "where num = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, num);
		res = pstmt.executeUpdate();
		// System.out.println(res + "건이 실행되었습니다.");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}	return res;
	} 
	
	// 삭제하는 메서드 만들기
	public int deleteBoard(String num) {
		BoardDTO dto = new BoardDTO();
		int res=0;
		try {
			
		String sql = "delete board\r\n"
				+ "where num=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, num);
		res = pstmt.executeUpdate();
		// System.out.println(res + "건이 실행되었습니다.");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}	return res;
	}
	
	
	
	// 작성하는 메서드 만들기
	public int write(String title, String content, String id) {
		BoardDTO dto = new BoardDTO();
		
		int res=0;
		try {
			
		String sql = "insert into board (num, title, content, id) \r\n"
				+ "values (SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, id);
		res = pstmt.executeUpdate();
		
		System.out.println(res + "건이 실행되었습니다.");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}	return res;
	}
	
	
	
	/*
	 * 게시글의 총 건수를 조회 후 반환
	 * return 게시글의 총 건수
	 * 
	 */
	public int getTotalCnt() {
		int res = 0;
		String sql = "select count(*)\r\n"
				+ "from board";
		
		try {
			pstmt = con.prepareStatement(sql);
			//rs = stmtl.executeQuery(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
				//System.out.println(res);
			}
			
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	
	//public static void main(String[] args) {
	//	BoardDAO dao = new BoardDAO();
	//	int i=0;
	//	while(i!=10) {
	//		dao.write("제목", "내용");
	//		i++;
	//	}
	//}
}
