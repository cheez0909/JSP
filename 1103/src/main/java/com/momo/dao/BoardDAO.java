package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.DBConnection;
import com.momo.DBConnectionPool;
import com.momo.dto.BoardDTO;

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
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 리스트 조회하는 메서드
	public List<BoardDTO> getList(){
		List<BoardDTO> list = new ArrayList<>();
		try {
		String sql = "SELECT *\r\n"
				+ "FROM BOARD\r\n";
		
			stmtl = con.createStatement();
			rs = stmtl.executeQuery(sql);
			
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
			close();
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
		close();
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
	
	//public static void main(String[] args) {
	//	BoardDAO dao = new BoardDAO();
	//	int i=0;
	//	while(i!=10) {
	//		dao.write("제목", "내용");
	//		i++;
	//	}
	//}
}
