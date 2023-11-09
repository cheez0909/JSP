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
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//public static void main(String[] args) {
	//	BoardDAO dao = new BoardDAO();
	//	System.out.print(dao.getList("test"));
	//}
}
